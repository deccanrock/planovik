package com.deccanrock.planovik.service.dao;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import com.deccanrock.planovik.entity.ItineraryEntity;

public interface IItneraryEntityDAO {
	
	List<String> GetItinList(String query) throws IOException, SQLException;
	ItineraryEntity CreateItinerary(ItineraryEntity itinerary) throws IOException, SQLException;
	ItineraryEntity GetItinerary(int itinum) throws IOException, SQLException;
	ItineraryEntity SaveItinerary(ItineraryEntity itinerary) throws IOException, SQLException;
	List<String> GetISOCurrList(String query) throws IOException, SQLException;
	List<String> GetCurrConvCodes(String query) throws IOException, SQLException;
}