package com.xiaofo1022.moocshit.service;

import org.springframework.stereotype.Service;

import com.qiniu.util.Auth;

@Service
public class QiniuAuth {

	public static final String ACCESS_KEY = "h9PCmkHaG7bpIbhnpDBYeGxFzI8d29Ii_ZnAsldy";
	public static final String SECRET_KEY = "8PNcfvdXAflpKTWfmobsYJkAgL1R6P7aHyqPcvFi";
	
	public static Auth auth = Auth.create(ACCESS_KEY, SECRET_KEY);
	
	public String getUpToken(String bucket) {
		return auth.uploadToken(bucket);
	}
}
