package com.deccanrock.planovik.mandrill.model.response.templates;

import com.deccanrock.planovik.mandrill.model.response.BaseMandrillResponse; /**
 * User: telrod
 * Date: 4/23/14
 */
public class TemplateRenderResponse extends BaseMandrillResponse {
    private String html;

    public String getHtml() {
        return html;
    }public void setHtml(String html) {
    this.html = html;
}}
