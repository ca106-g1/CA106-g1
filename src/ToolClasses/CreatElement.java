package ToolClasses;

import java.io.Serializable;

public class CreatElement implements Serializable{
	
	private static final long serialVersionUID = -6902673612868243673L;

	private String node;
	private String id;
	private String name;
	private String class_name;
	private String data_value;	
	
	public CreatElement() {
	}

	public CreatElement(String node, String id, String name, String class_name, String data_value) {
		this.node = node;
		this.id = id;
		this.name = name;
		this.class_name = class_name;
		this.data_value = data_value;
	}
	
	
	public String getNode() {
		return node;
	}
	public void setNode(String node) {
		this.node = node;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getClass_name() {
		return class_name;
	}
	public void setClass_name(String class_name) {
		this.class_name = class_name;
	}
	public String getData_value() {
		return data_value;
	}
	public void setData_value(String data_value) {
		this.data_value = data_value;
	}

}
