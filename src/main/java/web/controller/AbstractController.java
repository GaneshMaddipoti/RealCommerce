package web.controller;

import com.fasterxml.jackson.databind.ObjectMapper;

public class AbstractController {

	private ObjectMapper mapper = new ObjectMapper();

	public ObjectMapper getMapper() {
		return mapper;
	}

	public void setMapper(ObjectMapper mapper) {
		this.mapper = mapper;
	}

}
