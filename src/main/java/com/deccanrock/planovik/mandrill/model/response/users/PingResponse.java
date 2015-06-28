package com.deccanrock.planovik.mandrill.model.response.users;

import com.deccanrock.planovik.mandrill.model.response.BaseMandrillResponse;
import com.fasterxml.jackson.annotation.JsonProperty;

public class PingResponse extends BaseMandrillResponse {

    @JsonProperty("PING")
    public String pingResponse;

    public String getPingResponse() {
        return pingResponse;
    }

    public void setPingResponse(String pingResponse) {
        this.pingResponse = pingResponse;
    }

}
