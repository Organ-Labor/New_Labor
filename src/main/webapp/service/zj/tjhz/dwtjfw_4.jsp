<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/common/import.jsp"%>
<html>
<head>
<title>单位匹配人员列表</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="<%=request.getContextPath()%>/styles/css/common.css"
	rel="stylesheet" type="text/css">
<script type="text/javascript" src="<%=request.getContextPath()%>/js/j.js"></script>
<script>
	$(function(){
		alert("function");
		
	    //alert(check_val);
		$("#qd").click(function(){
			//alert($("input[name='bipId']").val());获得第一个CheckBox的值
			<%-- alert("<%=request.getContextPath()%>/service/getXxByID/100000"); --%>
			//var value=$("input[name='bipId']").val();
			obj = document.getElementsByName("bipId");
		    check_val = [];
		    for(k in obj){
		        if(obj[k].checked)
		            check_val.push("'"+obj[k].value+"'");
		    }
			alert(check_val);
			form1.action = "<%=request.getContextPath()%>/service/getXxByID/"+check_val;
			alert("<%=request.getContextPath()%>/service/getXxByID/"+check_val);
			form1.submit();
			alert("提交成功!");
			
		})
	})
	
	<%-- function doSubmit(){
		var checkbox = form1.bip_ids;
		var flag = false;
		if(checkbox.checked){
		form1.action = "<%=request.getContextPath()%>/service/zj/tjhz/Servletxs.do";
		form1.submit();
		}else{
			for(var i = 0; i < checkbox.length; i++){
				if(checkbox[i].checked){
					flag = true;
					break;
				}
			}
			if(flag){
				form1.action = "<%=request.getContextPath()%>/service/zj/tjhz/Servletxs.do";
				form1.submit();
			} else {
				alert("至少需要勾选一条记录!");
				return;
			}
		}
	} --%>
	
</script>
</head>

<body>
	<form name="form1" action="" method="post">
		<table width="98%" border="0" align="center" cellpadding="0"
			cellspacing="0">
			<tr>
				<td height="20" valign="bottom"><img
					src="<%=request.getContextPath()%>/styles/images/right/now.gif"
					width="11" height="12">当前位置：职业介绍 &gt; 推荐服务 &gt; 单位推荐服务</td>
			</tr>
			<tr>
				<td valign="bottom"
					background="<%=request.getContextPath()%>/styles/images/right/dsline.gif"
					height="8"><img src="<%=request.getContextPath()%>/styles/images/index/spacer.gif">
				</td>
			</tr>
		</table>
		<table width="98%" align="center" border=" 0" cellpadding="0"
			cellspacing="0" class="title">
			<tr>
				<td width="30">
					<table border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td><img
								src="<%=request.getContextPath()%>/styles/css/bb_d.gif">
							</td>
						</tr>
					</table>
				</td>
				<td valign="bottom">查询结果&nbsp;&nbsp;&nbsp;提示：[共${info.total}条记录，点击姓名可查看个人详细信息]</td>
			</tr>
		</table>
		</form>
		<form name="form" method="post" action="">
			<TABLE width="98%" align="center" border=1 cellPadding=0
				cellSpacing=0 bordercolor="#FFFFFF" class=tablebody>
				<TR>
					<TD width="7%" align="center" class="line4">序号</TD>
					<TD width="6%" align="center" class="line4">选择</TD>
					<TD width="12%" align="center" class="line4">姓名</TD>
					<TD width="6%" align="center" class="line4">性别</TD>
					<TD width="6%" align="center" class="line4">年龄</TD>
					<TD width="27%" align="center" class="line4">择业工种</TD>
					<TD width="24%" align="center" class="line4">居住地址</TD>
					<TD width="12%" align="center" class="line4">登记日期</TD>
				</TR>

				<tr>
				</tr>
				<c:forEach items="${info.list}" varStatus="sum" var="s">
					<TR>
						<TD align="center" class="line2">${sum.count}</TD>
						<TD align="center" class="line2"><input type="checkbox"
							name="bipId"  value="${s.bipId}">
						</TD>
						<TD align="center" class="line2"><a
							href="<%=request.getContextPath()%>/service/getQzzxx/${s.bipId}">${s.bipName}</a>
						</TD>
						<TD align="center" class="line2">${s.sex}</TD>
						<TD align="center" class="line2">${s.age}</TD>
						<TD align="center" class="line2">${s.gz}</TD>
						<TD align="center" class="line2">${s.address}</TD>
						<TD align="center" class="line2">${s.createDate}</TD>
					</TR>
				</c:forEach>
			</TABLE>
			<br>
			<table width="98%" border="0" align="center" cellspacing="0"
				cellpadding="0">
				<tr>
					<td class="line2" align="center"><input name="button2"
						type="button" class=BUTTONs3 value="确 定" id="qd">&nbsp;&nbsp;
						<input name="fh" type="button" class=BUTTONs3 onClick="toBack()"
						value="返 回">
					</td>
				</tr>
			</table>
		</form>
</body>
</html>
