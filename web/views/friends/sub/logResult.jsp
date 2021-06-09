<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import='java.util.ArrayList, com.friend.model.vo.Log' %>
<%
	ArrayList<Log> myLog = (ArrayList<Log>)request.getAttribute("myLog");
	ArrayList<Log> friendsLog = (ArrayList<Log>)request.getAttribute("friendsLog");
%>

