<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>dwtjfw_tjhmc.jsp</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="<%=request.getContextPath()%>/styles/css/common.css"
	rel="stylesheet" type="text/css">
</head>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/j.js"></script>
<script type="text/javascript">
   
   $(function(){
	   alert("请打印");
	  <%--  $("#besure").click(function(){
		   form1.action="<%=request.getContextPath()%>/service/getBB";
		   form1.submit();
	   }) --%>
   })

</script>

<body>

<form name="form1" action="" method="post">
<input type="hidden" name="bioId" value="${sessionScope.bioInfomation[0].bioId}">
	<table align="center" border=0>
		<TR>
			<TD width="7%" align="center" class="line4">序号</TD>
			<TD width="6%" align="center" class="line4">身份证号码</TD>
			<TD width="12%" align="center" class="line4">姓名</TD>
			<TD width="6%" align="center" class="line4">性别</TD>
			<TD width="6%" align="center" class="line4">年龄</TD>
			<TD width="24%" align="center" class="line4">联系电话</TD>
			<TD width="12%" align="center" class="line4">居住地址</TD>
		</TR>
		<c:forEach items="${xinxi}" varStatus="sum" var="s">
		<input type="hidden" name="bipId" value="${s.bipId }">
		<input type="hidden" name="gzbh" value="${s.gzbh }">
			<TR>
			<TD width="7%" align="center" class="line4">${sum.count}</TD>
			<TD width="6%" align="center" class="line4">${s.bipSfz}</TD>
			<TD width="12%" align="center" class="line4">${s.bipName}</TD>
			<TD width="6%" align="center" class="line4">${s.bipSex}</TD>
			<TD width="6%" align="center" class="line4">${s.bipAge}</TD>
			<TD width="24%" align="center" class="line4">${s.bipMobile}</TD>
			<TD width="12%" align="center" class="line4">${s.bipJaddress}</TD>
			</TR>
		</c:forEach>
		<tr>
			<TD align="left" class="line4" colspan="7">
				希望贵单位将与上述求职者洽谈的结果通知本推荐单位。如达成聘用意向，请告知贵单位的单位法人码及聘用人员的身份证号码或姓名，以免我们向其他用人单位继续推荐。

			</TD>
		</tr>
		<tr>
			<TD align="left" class="line4" colspan="7">推荐单位联系地址:&nbsp;&nbsp;${sessionScope.bioInfomation[0].bioAddress}</TD>
		</tr>
		<tr>
			<TD align="left" class="line4" colspan="7">联系电话:&nbsp;&nbsp;${sessionScope.bioInfomation[0].contactTel}</TD>
		</tr>
		<!-- <tr align="left">
		
			<TD align="center" class="line2" colspan="7"><input
				type="button" name="button" class="BUTTONs3" value="确认" id="besure"
				></TD>
		</tr> -->
		<tr align="left">
		   
			<TD align="center" class="line2" colspan="7"><input
				type="button" name="button" class="BUTTONs3" value="打印"
				onclick="window.print()"></TD>
		</tr>
	</table>
</form>
</body>
</html>

