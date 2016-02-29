package com.xiaofo1022.moocshit.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xiaofo1022.moocshit.service.QiniuAuth;

@Controller
@RequestMapping("/upload")
public class UploadController {

	@Autowired
	private QiniuAuth qiniuAuth;
	
	@RequestMapping(value = "/getUpToken", method = RequestMethod.GET)
	@ResponseBody
	public String getUpToken() {
		return qiniuAuth.getUpToken("moocshit");
	}
}
