<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ attribute name="content" type="java.lang.String" required="true" description="消息内容"%>
<%@ attribute name="type" type="java.lang.String" description="消息类型：info、success、warning、error、loading"%>
<c:if test="${not empty content}">
	<c:if test="${not empty type}">
		<c:set var="ctype" value="${type}"/>
	</c:if>
	<c:if test="${empty type}">
		<c:set var="ctype" value="${fn:indexOf(content,'失败') eq -1?'success':'danger'}"/>
	</c:if>
	<script type="text/javascript">messageMetronic("${content}","${ctype}");</script>
	<c:set var="ctypeToastr" value="${fn:indexOf(content,'失败') eq -1?'success':'error'}"/>
	<script type="text/javascript">messageToastr("${content}","${ctypeToastr}");</script>
	<!-- 
	<script type="text/javascript">messageGrowl("${content}","${ctype}");</script>
	<script type="text/javascript">messageNotific8("${content}","${ctype}");</script>
	 -->
</c:if>