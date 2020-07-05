<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/include/head.jsp"%>
<%@ include file="/include/preloader.jsp"%>
<%@ include file="/include/header.jsp"%>
<%@ include file="/include/nav.jsp"%>

<style>
/* BASIC css start */
#noticemenu {
	display: table;
	margin: 0 auto 60px;
}

#noticemenu li {
	float: left;
	margin-left: 5px;
}

#noticemenu li:first-child {
	margin-left: 0;
}
/* BASIC css end */
</style>

<div class="content__box">

	<div id="content">
                <div id="guide">
                    <dl class="loc-navi">
                        <dt class="blind">현재 위치</dt>
                        <dd>
                            Home &gt; 이용안내
                        </dd>
                    </dl>
                    <h2 class="tit-page">GUIDE</h2>
                    <div class="page-body center">
                        <img src="/shop/image/user/quide_notice1.jpg" alt="이용안내">
                        <img src="/shop/image/user/quide_notice2.jpg" alt="이용안내">
                        <img src="/shop/image/user/quide_notice3.jpg" alt="이용안내">
                    </div><!-- .page-body -->
                </div><!-- #guide -->
            </div>

</div>
<!-- end of content__box -->

<%@ include file="/include/aside.jsp"%>
<%@ include file="/include/footer.jsp"%>