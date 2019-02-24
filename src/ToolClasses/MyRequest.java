package ToolClasses;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;


public class MyRequest extends HttpServletRequestWrapper {

	private Map<String, String> myParameter = new HashMap<String, String>();

	public MyRequest(ServletRequest request) {
		super((HttpServletRequest) request);
	}

	public String getParameter(String paramName) {
		String value = null;

		if (myParameter.containsKey(paramName)) {
			value = myParameter.get(paramName);
		} else {
			value = super.getParameter(paramName);
		}
		
		return value;
	}

	public void setMyParameter(String key, String value) {

		myParameter.put(key, value);

	}

}