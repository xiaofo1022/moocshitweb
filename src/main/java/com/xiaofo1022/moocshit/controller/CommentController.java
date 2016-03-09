package com.xiaofo1022.moocshit.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xiaofo1022.moocshit.dao.CourseDao;
import com.xiaofo1022.moocshit.mapper.CommentMapper;
import com.xiaofo1022.moocshit.model.Comment;

@Controller
@RequestMapping("/comment")
@Transactional
public class CommentController {

	@Autowired
	private CommentMapper commentMapper;
	@Autowired
	private CourseDao courseDao;
	
	@RequestMapping(value="/addComment", method=RequestMethod.POST)
	@ResponseBody
	public int addComment(@RequestBody Comment comment, HttpServletRequest request) {
		commentMapper.addComment(comment);
		courseDao.updateCourseScore(comment.getCourseId(), comment.getScore());
		return comment.getId();
	}
}
