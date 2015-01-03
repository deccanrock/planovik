package com.deccanrock.planovik.service.dao;

public class OrgNameList {
	private String Key;
	private String Value;

	public void SetKey(String key) {
		Key = key;
	}
	
	public void SetValue(String value) {
		Value = value;
	}
	
	String GetKey() {
		return Key;
	}

	String GetValue() {
		return Value;
	}

}
