<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/common/import.jsp" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

<head>
<title>冻结解冻业务处理页面</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="<%=request.getContextPath()%>/styles/css/common.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="../../../js/jquery-1.11.1.min.js"></script>
<script>
     $(function(){
    	 
    	 $("#bt_dwdj").click(function () {
 			if(confirm("你确认要冻结/解冻吗")){
 				
 				if($("input:checked").size()<1){
 					alert("请至少选择一项在进行删除");
 				}else if($("input:checked").size()>1){
 					alert("一次只能对一项进行操作！");
 				}else{
 					$("#reason").css('display','block');
 				}
 			}
 		});
    	 $("#bt_submit").click(function(){
    		 
    		 var reason=$("#djreason").val();
    	     var bh=$("#zpbh").val();
    	    // alert(bh);
     		// alert(reason);
     		 var url="../../dwzp_jxdj/"+bh+"/"+reason;
    		 $.post(url,function(data){
    				if(confirm(data)){
    					window.open("../../../index.jsp","_top");
    				}
    		});
    	 });
    	
     })
     

</script>
</head>
<body>
<form method="post" id="form1" name="form1" action="">
<table width="98%"  border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="20" valign="bottom"><img src="<%=request.getContextPath()%>/styles/images/right/now.gif" width="11" height="12">
      当前位置：职业介绍 &gt; 单位招聘 &gt; 冻结/解冻</td>
    </tr>
    <tr>
      <td valign="bottom" background="<%=request.getContextPath()%>/styles/images/right/dsline.gif" height="8"><img src="<%=request.getContextPath()%>/styles/images/index/spacer.gif"></td>
    </tr>
</table>
<table width="98%"  align="center"  border="0" cellpadding="0" cellspacing="0"   class="title">
  <tr>
    <td width="30">
	<table border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td><img src="<%=request.getContextPath()%>/styles/css/bb_d.gif"></td>
      </tr>
    </table></td>
    <td  valign="bottom">查询结果&nbsp;&nbsp;&nbsp;提示：[点击单位名称可以查看详细信息]
    </td>
  </tr>
</table>
<TABLE width="98%" align="center"  border=1 cellPadding=0 cellSpacing=0 bordercolor="#FFFFFF" class=tablebody>
    <TR class="line2"> 
      <TD width="10%" align="center" class="line4">操作</TD>
      <TD width="24%" align="center" class="line4">单位名称</TD>
      <TD width="24%" align="center" class="line4">单位地址</TD>
      <TD width="17%" align="center" class="line4">联系电话</TD>
      <TD width="12%" align="center" class="line4">登记日期</TD>
    </TR>
    <c:forEach var="obj" items="${ sessionScope.info.list}">
    <tr>
    <td width="10%" align="center" class="line4"><input type="checkbox" name="dwdlbh" id="dwdlbh" value="${obj.bio_id }"></td>
    <td width="24%" align="center" class="line4">${obj.bio_name}</td>
    <td width="24%" align="center" class="line4">${obj.bio_bua_address}</td>
    <td width="17%" align="center" class="line4">${obj.LXRSJ}</td>
    <td width="12%" align="center" class="line4">${obj.DJSJ}
    <input type="hidden" id="zpbh" value="${obj.ZPBH }">
    </td>
    </tr>
    </c:forEach>
    
<%-- <logic:present name="uff" scope="request">
      <input type="hidden" name="dwzt" value="<bean:write name='uff' property='dwzt'/>">
    <TR class="line2"> 
      <TD width="10%" align="center" class="line4"><input type="checkbox" name="dwdlbh" value="<bean:write name='uff' property='dwdlbh'/>" onclick="either(this,form1.cb)"><bean:write name="uff" property="dwzt"/></TD>
      <TD width="24%" align="center" class="line4"><bean:write name="uff" property="bio_name"/>${DwInfo.bio_name}</TD>
      <TD width="24%" align="center" class="line4"><bean:write name="uff" property="bio_bua_address"/>${DwInfo.bio_bua_address}</TD>
      <TD width="17%" align="center" class="line4"><bean:write name="uff" property="bio_con_fax"/>${DwInfo.lxrsj}</TD>
      <TD width="12%" align="center" class="line4"><bean:write name="uff" property="djsj"/>${DwInfo.djsj}</TD>
    </TR>
</logic:present> --%>
	<tr align="center" > 
		<td align="center" colspan="6" class="line2"> 
	      <input name="bt_dwdj" type="button" class="BUTTONs6"  value="单位冻结/解冻" id="bt_dwdj">&nbsp;&nbsp;
	      
	    </td>
	</tr>
</TABLE>
<table width="98%" align="center" border="0" cellpadding="0" cellspacing="0"   class="title">
  <tr>
    <td width="30">
	<table border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td ><img src="<%=request.getContextPath()%>/styles/css/bb_d.gif"></td>
      </tr>
    </table></td>
    <td  valign="bottom">岗位信息操作</td>
  </tr>
</table>

<table id="reason" width="98%"  border="0" align="center" cellpadding="0" cellspacing="0" style="display:none">
	<tr><td>&nbsp;</td></tr>
	<tr><td align="center"><input type="button" id="bt_submit" value="确认冻结/解冻">请输入操作原因：</td></tr>
		<tr>
			<td align="center" valign="top">
				<textarea name="djreason" id="djreason" cols="55" rows="8"></textarea>
			</td>
		</tr>
</table>
</form>
</body>
</html>