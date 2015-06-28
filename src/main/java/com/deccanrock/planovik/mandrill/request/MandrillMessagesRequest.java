package com.deccanrock.planovik.mandrill.request;

import java.util.List;

import com.deccanrock.planovik.mandrill.model.MandrillMessageInfoRequest;
import com.deccanrock.planovik.mandrill.model.response.BaseMandrillResponse;
import com.deccanrock.planovik.mandrill.model.response.message.MessageInfoResponse;
import com.deccanrock.planovik.mandrill.exception.RequestFailedException;
import com.deccanrock.planovik.mandrill.model.MandrillMessageRequest;
import com.deccanrock.planovik.mandrill.model.MandrillTemplatedMessageRequest;
import com.deccanrock.planovik.mandrill.model.ServiceMethods;
import com.deccanrock.planovik.mandrill.model.response.BaseMandrillAnonymousListResponse;
import com.deccanrock.planovik.mandrill.model.response.message.MessageResponse;
import com.deccanrock.planovik.mandrill.model.response.message.SendMessageResponse;
import com.fasterxml.jackson.core.type.TypeReference;

/**
 * This class holds various functions for the Mandrill Messages API
 *
 * @author Brian Cribbs
 *
 */
public class MandrillMessagesRequest {

    MandrillRESTRequest request;
    TypeReference<List<MessageResponse>> messageResponseListReference = new TypeReference<List<MessageResponse>>() {
    };

    /**
     * Send a new transactional message through Mandrill
     *
     * @param messageRequest
     *            a populated @see com.cribstechnologies.clients.mandrill.model.MandrillMessageRequest
     * @throws RequestFailedException
     */
    public SendMessageResponse sendMessage(MandrillMessageRequest messageRequest) throws RequestFailedException {
        SendMessageResponse response = new SendMessageResponse();
        response.setList(((BaseMandrillAnonymousListResponse<MessageResponse>) request.postRequest(messageRequest, ServiceMethods.Messages.SEND, SendMessageResponse.class,
                messageResponseListReference)).getList());
        return response;
    }

    public SendMessageResponse sendTemplatedMessage(MandrillTemplatedMessageRequest templateMessage) throws RequestFailedException {
        SendMessageResponse response = new SendMessageResponse();
        response.setList(((BaseMandrillAnonymousListResponse<MessageResponse>) request.postRequest(templateMessage, ServiceMethods.Messages.SEND_TEMPLATE,
                SendMessageResponse.class, messageResponseListReference)).getList());
        return response;
    }

    public MessageInfoResponse getMessageInfo(MandrillMessageInfoRequest messageInfoRequest) throws RequestFailedException {
        MessageInfoResponse response = (MessageInfoResponse)request.postRequest(messageInfoRequest, ServiceMethods.Messages.INFO, MessageInfoResponse.class);
        return response;
    }

    public void setRequest(MandrillRESTRequest request) {
        this.request = request;
    }

}
