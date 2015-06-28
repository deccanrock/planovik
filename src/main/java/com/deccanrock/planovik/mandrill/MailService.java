package com.deccanrock.planovik.mandrill;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import net.sf.ehcache.Element;

import org.apache.http.client.HttpClient;
import org.apache.http.impl.client.HttpClientBuilder;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.deccanrock.planovik.controller.AppController;
import com.deccanrock.planovik.controller.AppCtxtProv;
import com.deccanrock.planovik.mandrill.exception.RequestFailedException;
import com.deccanrock.planovik.mandrill.model.MandrillHtmlMessage;
import com.deccanrock.planovik.mandrill.model.MandrillMessage;
import com.deccanrock.planovik.mandrill.model.MandrillMessageRequest;
import com.deccanrock.planovik.mandrill.model.MandrillRecipient;
import com.deccanrock.planovik.mandrill.model.MandrillTemplatedMessageRequest;
import com.deccanrock.planovik.mandrill.model.MergeVar;
import com.deccanrock.planovik.mandrill.model.TemplateContent;
import com.deccanrock.planovik.mandrill.model.response.message.SendMessageResponse;
import com.deccanrock.planovik.mandrill.request.MandrillMessagesRequest;
import com.deccanrock.planovik.mandrill.request.MandrillRESTRequest;
import com.deccanrock.planovik.mandrill.util.MandrillConfiguration;
import com.deccanrock.planovik.service.utils.CacheService;
import com.fasterxml.jackson.databind.ObjectMapper;

public class MailService {
	
	private static MandrillRESTRequest request = new MandrillRESTRequest();
	private static MandrillConfiguration config = new MandrillConfiguration();
	private static MandrillMessagesRequest messagesRequest = new MandrillMessagesRequest();
	private static HttpClient client;
	private static ObjectMapper mapper = new ObjectMapper();
	private static Properties props = new Properties();
	private static final Logger logger = LoggerFactory.getLogger(AppController.class);	
	
	private static void beforeClass() {
		try {
			
			CacheService cs = (CacheService) AppCtxtProv.getApplicationContext().getBean("cacheservice");
			Element mailprop = cs.getCache().get("mandrill.properties");
			if (mailprop != null)
				props = (Properties)mailprop.getObjectValue();
			else {
					props.load(MailService.class.getClassLoader().getResourceAsStream("mandrill.properties"));
					cs.getCache().put(new Element("mandrill.properties", props));
			}
			} catch (IOException e) {
			logger.info ("mail service: " + "properties file not loaded");
		}
		config.setApiKey(props.getProperty("apiKey"));
		config.setApiVersion(props.getProperty("version"));
		config.setBaseURL(props.getProperty("baseURL"));
		request.setConfig(config);
		request.setObjectMapper(mapper);
		messagesRequest.setRequest(request);
	}
	
	private void before() {
		client = HttpClientBuilder.create().build();
		request.setHttpClient(client);
	}
	

	public void SendMessage(String from, String fromaddr, String to, String toaddr, String subject, String content) {
		beforeClass();
		this.before();
		MandrillMessageRequest mmr = new MandrillMessageRequest();
		MandrillHtmlMessage message = new MandrillHtmlMessage();
		Map<String, String> headers = new HashMap<String, String>();
		message.setFrom_email(fromaddr);
		message.setFrom_name(from);
		message.setHeaders(headers);
		message.setHtml(content);
		message.setSubject(subject);
		MandrillRecipient[] recipients = new MandrillRecipient[]{
										 new MandrillRecipient(to, toaddr)};
		message.setTo(recipients);
		message.setTrack_clicks(true);
		message.setTrack_opens(true);
		String[] tags = new String[]{"tag1", "tag2", "tag3"};
		message.setTags(tags);
		mmr.setMessage(message);
		
		try {
			SendMessageResponse response = messagesRequest.sendMessage(mmr);
		} catch (RequestFailedException e) {
			e.printStackTrace();
			logger.info("mail service: " + e.getMessage());
		}
	}
	
	public void SendTemplatedMessage(String from, String fromaddr, String to, String toaddr, String subject, String templatename) {
		beforeClass();
		this.before();
		MandrillTemplatedMessageRequest request = new MandrillTemplatedMessageRequest();
		MandrillMessage message = new MandrillMessage();
		Map<String, String> headers = new HashMap<String, String>();
		message.setFrom_email(fromaddr);
		message.setFrom_name(from);
		message.setHeaders(headers);
		message.setSubject(subject);
		MandrillRecipient[] recipients = new MandrillRecipient[]{
				 new MandrillRecipient(to, toaddr)};
		message.setTo(recipients);
		message.setTrack_clicks(true);
		message.setTrack_opens(true);
		String[] tags = new String[]{"tag1", "tag2", "tag3"};
		message.setTags(tags);
		request.setMessage(message);
		List<TemplateContent> content = new ArrayList<TemplateContent>();
		request.setTemplate_content(content);
		request.setTemplate_name(templatename);
        List<MergeVar> globalMergeVars = new ArrayList<MergeVar>();
        // Customize global Merge vars based on purpose of email
        globalMergeVars.add(new MergeVar("username", to));
        // globalMergeVars.add(new MergeVar("registration_url", "http://myserver.com/register?userid=bcribs"));
        message.setGlobal_merge_vars(globalMergeVars);

        try {
			messagesRequest.sendTemplatedMessage(request);
		} catch (RequestFailedException e) {
			e.printStackTrace();
			logger.info("mail service: " + e.getMessage());
		}
	}

}