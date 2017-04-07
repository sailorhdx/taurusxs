<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ attribute name="path" type="java.lang.String" required="true" description="属性"%>
<%@ attribute name="items" type="java.util.List" required="true" description="对象列表"%>
<%@ attribute name="value" type="java.lang.String" required="true" description="值"%>
<%@ attribute name="itemLabel" type="java.lang.String" required="true" description="列表标签"%>
<%@ attribute name="itemValue" type="java.lang.String" required="true" description="列表值"%>
<%@ attribute name="itemLayout" type="java.lang.String" required="false" description="布局方式list or inline"%>

<c:set var="_layout" value="${empty itemLayout? 'list' : itemLayout}" />
<!-- mt-checkbox-list -->
<!-- mt-checkbox-inline -->
<div class="mt-radio-${_layout }">
<c:forEach items="${items}" var="item" varStatus="idxStatus">
        <label class="mt-radio mt-radio-outline">
            <input path="${path }" id="${path }${idxStatus.index + 1}" type="radio" name="${path }" value="${item[itemValue] }" ${value eq item[itemValue]? 'checked':'' }/>${item[itemLabel] }<span></span>
        </label>
</c:forEach>
</div>

