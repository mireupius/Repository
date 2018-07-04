package com.sol.mall.goods;

import java.util.List;

public class Options {

	private List<Option> option;
	private String warnMessage;
	
	public Options() {
		// TODO Auto-generated constructor stub
	}

	public Options(List<Option> option, String warnMessage) {
		super();
		this.option = option;
		this.warnMessage = warnMessage;
	}

	public List<Option> getOption() {
		return option;
	}

	public void setOption(List<Option> option) {
		this.option = option;
	}

	public String getWarnMessage() {
		return warnMessage;
	}

	public void setWarnMessage(String warnMessage) {
		this.warnMessage = warnMessage;
	}

}
