package com.deccanrock.planovik.mandrill.request;

import java.util.List;

import com.deccanrock.planovik.mandrill.exception.RequestFailedException;
import com.deccanrock.planovik.mandrill.model.BaseMandrillRequest;
import com.deccanrock.planovik.mandrill.model.MandrillRequestWithQuery;
import com.deccanrock.planovik.mandrill.model.MandrillRequestWithUrl;
import com.deccanrock.planovik.mandrill.model.ServiceMethods;
import com.deccanrock.planovik.mandrill.model.response.BaseMandrillAnonymousListResponse;
import com.deccanrock.planovik.mandrill.model.response.urls.UrlListResponse;
import com.deccanrock.planovik.mandrill.model.response.urls.UrlResponse;
import com.fasterxml.jackson.core.type.TypeReference;

public class MandrillUrlsRequest {

    MandrillRESTRequest request;

    TypeReference<List<UrlResponse>> urlsListReference = new TypeReference<List<UrlResponse>>() {
    };

    public UrlListResponse getList(BaseMandrillRequest listRequest) throws RequestFailedException {
        UrlListResponse response = new UrlListResponse();
        response.setList(((BaseMandrillAnonymousListResponse<UrlResponse>) request.postRequest(listRequest, ServiceMethods.Urls.LIST, UrlListResponse.class, urlsListReference))
                .getList());
        return response;
    }

    public UrlListResponse doSearch(MandrillRequestWithQuery searchRequest) throws RequestFailedException {
        UrlListResponse response = new UrlListResponse();
        response.setList(((BaseMandrillAnonymousListResponse<UrlResponse>) request.postRequest(searchRequest, ServiceMethods.Urls.SEARCH, UrlListResponse.class, urlsListReference))
                .getList());
        return response;
    }

    public UrlListResponse getTimeSeries(MandrillRequestWithUrl seriesRequest) throws RequestFailedException {
        UrlListResponse response = new UrlListResponse();
        response.setList(((BaseMandrillAnonymousListResponse<UrlResponse>) request.postRequest(seriesRequest, ServiceMethods.Urls.TIME_SERIES, UrlListResponse.class,
                urlsListReference)).getList());
        return response;
    }

    public void setRequest(MandrillRESTRequest request) {
        this.request = request;
    }

}
