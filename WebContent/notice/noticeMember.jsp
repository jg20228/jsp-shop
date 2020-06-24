<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/include/head.jsp"%>
<%@ include file="/include/preloader.jsp"%>
<%@ include file="/include/header.jsp"%>
<%@ include file="/include/nav.jsp"%>

<style>
/* BASIC css start */
#noticemenu {display:table; margin:0 auto 60px;}
#noticemenu li {float:left; margin-left:5px;}
#noticemenu li:first-child {margin-left:0;}
/* BASIC css end */
</style>

<link rel="stylesheet" href="/shop/css/user/join.css">
<div class="content__box">

<h2 class="tit-page">MEMBER</h2>

<ul id="noticemenu" class="rollover">

    <li>
    	<a href="/shop/notice/noticeBoard.jsp">
    	<img src="/shop/image/notice/noticemenu1.gif" onmouseover="this.src='/shop/image/notice/noticemenu1_over.gif'" onmouseout="this.src='/shop/image/notice/noticemenu1.gif'">
    	</a>
    </li>
    
    <li>
    	<a href="/shop/notice/noticeMember.jsp">
    	    <img src="/shop/image/notice/noticemenu2_over.gif" onmouseover="this.src='/shop/image/notice/noticemenu2_over.gif'" onmouseout="this.src='/shop/image/notice/noticemenu2_over.gif'">
    	</a>
    </li>
    
    <li>
    	<a href="/shop/notice/noticeOverseas.jsp">
    	    <img src="/shop/image/notice/noticemenu3.gif" onmouseover="this.src='/shop/image/notice/noticemenu3_over.gif'" onmouseout="this.src='/shop/image/notice/noticemenu3.gif'">
    	</a>
    </li>
    
    <li>
    	<a href="/shop/notice/noticeSize.jsp">
    	    <img src="/shop/image/notice/noticemenu4.gif" onmouseover="this.src='/shop/image/notice/noticemenu4_over.gif'" onmouseout="this.src='/shop/image/notice/noticemenu4.gif'">
    	</a>
    </li>
</ul>


<img src="/shop/testImg/EXmember.png">

<%@ include file="/include/serviceArea.jsp"%>
</div>
<!-- end of content__box -->
<%@ include file="/include/aside.jsp"%>
<%@ include file="/include/footer.jsp"%>