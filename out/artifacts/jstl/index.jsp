<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Date" %>
<%--
  Created by IntelliJ IDEA.
  User: LENOVO
  Date: 2020/9/27
  Time: 9:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
  <title></title>
</head>
<body>
<%
  request.setAttribute("student.name","张三");
  ArrayList list = new ArrayList();
  list.add("java");
  list.add("mysql");
  request.setAttribute("list",list);
  request.setAttribute("pageSize",2);
  request.setAttribute("num",8);
  /*session*/
  session.setAttribute("name","admin");
%>
<%--
    ${}约等于request.getAttribute()
    requestScope,获取指定对象的值，不进行其他操作
--%>
${requestScope["student.name"]}
${list[1]}
${num/pageSize}
${sessionScope.name}
${nameq}
<%--JSTL--%>
<c:out value="glt;显示的数据&gt" escapeXml="true"></c:out>
<c:out value="glt;显示的数据&gt" escapeXml="falsex"></c:out>
<%--变量--%>
<br>
<c:set var="uid" value="admin" scope="request"></c:set>
<c:out value="${uid}"></c:out>
<br>
<%--清楚变量--%>
<c:remove var="uid"></c:remove>
<%--不显示--%>
<c:out value="${uid}"></c:out>
<br>
<%--循环--%>
<c:forEach var="i" begin="1" end="5">
  <p
          <c:if test="${i%2==0}">
            style="background: green;"
          </c:if>
  >
    <:c:out value="$[i]"></:c:out>    <:c:out value="$[i]"></:c:out>
  </p>
</c:forEach>

<c:url var="myUrl" value="index.jsp">
  <c:param name="name" value="admin"></c:param>
  <c:param name="url" value="www.baidu.com"></c:param>
</c:url>
<c:out value="${myUrl}"/>
<a href="<c:out value="${myUrl}"/>">携带参数跳转</a>

<%--日期格式转换--%>
<c:set value="<%=new Date()%>" var="now"></c:set>
<p>
  日期格式：
  <fmt:formatDate value="now" dateStyle="long" timeStyle="long" type="both"></fmt:formatDate>
</p>
</body>
</html>