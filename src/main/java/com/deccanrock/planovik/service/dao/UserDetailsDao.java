package com.deccanrock.planovik.service.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

import javax.annotation.PostConstruct;
import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.support.JdbcDaoSupport;
import org.springframework.security.authentication.LockedException;
import org.springframework.stereotype.Repository;

import com.deccanrock.planovik.entity.UserLoginAttempts;

@Repository
public class UserDetailsDao extends JdbcDaoSupport implements IUserDetailsDao {

	private static final String SQL_USERS_UPDATE_LOCKED = "UPDATE plnvk_admin_users SET accountNonLocked = ? WHERE username = ?";
	private static final String SQL_USERS_COUNT = "SELECT count(*) FROM plnvk_admin_users WHERE username = ?";

	private static final String SQL_USER_ATTEMPTS_GET = "SELECT * FROM plnvk_admin_login_attempts WHERE username = ?";
	private static final String SQL_USER_ATTEMPTS_INSERT = "INSERT INTO plnvk_admin_login_attempts (USERNAME, ATTEMPTS, LASTMODIFIED) VALUES(?,?,?)";

	private static final String SQL_USER_ATTEMPTS_UPDATE_ATTEMPTS = "UPDATE plnvk_admin_login_attempts SET attempts = attempts + 1, lastmodified = ? WHERE username = ?";
	private static final String SQL_USER_ATTEMPTS_RESET_ATTEMPTS = "UPDATE plnvk_admin_login_attempts SET attempts = 0 WHERE username = ?";

	private static final int MAX_ATTEMPTS = 3;

	@Autowired
    @Qualifier("mainDataSource")
	private DataSource dataSource;

	@PostConstruct
	private void initialize() {
		setDataSource(dataSource);
	}

	@Override
	public void updateFailAttempts(String username) {

		UserLoginAttempts user = getUserAttempts(username);
		if (user == null) {
			if (isUserExists(username)) {
				// if no record, insert a new
				getJdbcTemplate().update(SQL_USER_ATTEMPTS_INSERT, new Object[] { username, 1, new Date() });
			}
		} else {

			if (isUserExists(username)) {
				// update attempts count, +1
				getJdbcTemplate().update(SQL_USER_ATTEMPTS_UPDATE_ATTEMPTS, new Object[] { new Date(), username });
			}

			if (user.getAttempts() + 1 >= MAX_ATTEMPTS) {
				// locked user
				getJdbcTemplate().update(SQL_USERS_UPDATE_LOCKED, new Object[] { false, username });
				// throw exception
				throw new LockedException("User Account is locked!");
			}

		}

	}

	@Override
	public UserLoginAttempts getUserAttempts(String username) {

		try {

			UserLoginAttempts userAttempts = getJdbcTemplate().queryForObject(SQL_USER_ATTEMPTS_GET,
					new Object[] { username }, new RowMapper<UserLoginAttempts>() {
						public UserLoginAttempts mapRow(ResultSet rs, int rowNum) throws SQLException {

							UserLoginAttempts user = new UserLoginAttempts();
							user.setId(rs.getInt("id"));
							user.setUsername(rs.getString("username"));
							user.setAttempts(rs.getInt("attempts"));
							user.setLastModified(rs.getDate("lastModified"));

							return user;
						}

					});
			return userAttempts;

		} catch (EmptyResultDataAccessException e) {
			return null;
		}

	}

	@Override
	public void resetFailAttempts(String username) {

		getJdbcTemplate().update(SQL_USER_ATTEMPTS_RESET_ATTEMPTS, new Object[] { username });

	}

	private boolean isUserExists(String username) {

		boolean result = false;

		int count = getJdbcTemplate().queryForObject(SQL_USERS_COUNT, new Object[] { username }, Integer.class);
		if (count > 0) {
			result = true;
		}

		return result;
	}

}