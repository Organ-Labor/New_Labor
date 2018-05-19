<%@ page contentType="text/html; charset=UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>单位冻结解冻 列表页面</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="<%=request.getContextPath()%>/styles/css/common.css" rel="stylesheet" type="text/css">
<script src="<%=request.getContextPath()%>/js/commonjs.js"></script>
<script>

function toBack(){
		window.location.href="<%=request.getContextPath()%>/service/zj/dwzp/dwdj_dj_1.jsp";
	}
</script>
</head>
<body>
<form name="form1" action="" method="post">
<table width="98%"  border="0" align="center" cellpadding="0" cellspacing="0">
	<tr>
	  <td height="20" valign="bottom"><img src="<%=request.getContextPath()%>/styles/images/right/now.gif" width="11" height="12">
				当前位置：职业介绍 &gt; 单位招聘 &gt; 冻结/解冻</td>
	</tr>
	<tr>
	  <td valign="bottom" background="<%=request.getContextPath()%>/styles/images/right/dsline.gif" height="8"><img src="<%=request.getContextPath()%>/styles/images/index/spacer.gif"></td>
	</tr>
</table>
<table width="98%" align="center" border="0" cellpadding="0" cellspacing="0"   class="title">
  <tr>
    <td width="38">
	<table width="38" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="30"><img src="<%=request.getContextPath()%>/styles/css/bb_d.gif"></td>
      </tr>
    </table></td>
    <td  valign="bottom">查询结果&nbsp;&nbsp;&nbsp;提示：[共有${info.total }个单位符合查询条件，点击单位名称可以查看详细信息]
    </td>
  </tr>
</table>
<table width="98%" align="center" border="0" cellpadding="0" cellspacing="0" id="c1" style="display:block">
<tr>
  <td valign="top">	
    <table width="100%" align="center" border="0" cellpadding="1" cellspacing="1" >
      <tr align="center"  >
        <td class="line4">状态</td>
        <td class="line4">单位名称</td>
        <td class="line4">单位地址</td>
        <td class="line4">联系电话</td>
        <td class="line4">登记时间</td>
       
      </tr>
      <c:forEach var="common" items="${info.list }">
		      <tr align="center"  >
				<td class="line4"><c:if test="${common.SFDJ=='n' }">正常</c:if>
				<c:if test="${common.SFDJ=='y' }">已冻结</c:if></td>
		        <td class="line4">
		        ${common.bio_name}
		        </td>
		        <td class="line4">${common.bio_bua_address}</td>
		        <td class="line4">${common.LXRSJ}</td>
		        <td class="line4">${common.DJSJ}</td>
			  </tr>     
      </c:forEach>
      
      
    </table> </td>
</tr>
</table>
<br>
<TABLE width="98%" align="center" 
        border=0 cellPadding=0 cellSpacing=1 bordercolor="#9DCBEC" class="tablebody" align="center">
  <TR align="center"> 
  
  	<TD  align="right" class="line2">
     <a href="<%=request.getContextPath()%>/service/zj/dwzp/dwdj_dj_3.jsp"><font class="BUTTONs3">确定</font></a>
    </TD>
  
    <TD  align="left" class="line2">
      <INPUT name="button2" type="button" class="BUTTONs3" value="返回" onClick="window.history.go(-1);">
    </TD>
    
  </TR>
</TABLE>
</form>
</body>
</html>
