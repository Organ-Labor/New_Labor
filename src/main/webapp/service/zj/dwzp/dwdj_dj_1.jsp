<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>冻结解冻</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="<%=request.getContextPath()%>/styles/css/common.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="../../../js/jquery-1.11.1.min.js"></script>
<script>
	  $(function(){
		
		  
		  $("#bt_submit").click(function(){
			
			  var aa=$("#bio_no").val();//法人码
			  var bb=$("#bio_name").val();//公司名称
		
			  if(aa==""&&bb!=""){
				  $("#form1").attr('action',"../../dwzp_djs/1/"+bb+"/0").submit();
			  }else if(aa!=""&&bb==""){
				  $("#form1").attr('action',"../../dwzp_djs/1/"+aa+"/1").submit();
			  }else{
				  alert("法人码与公司名称不能同时为空！");
			  }

		  });
		  

	  });	
				
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
<table width="98%" align="center" border="0" cellpadding="0" cellspacing="0"  class="titlehand" >
	<tr > 
		<td width="30"> 
	  	<table  border="0" cellspacing="0" cellpadding="0">
          <TR> 
            <TD ><img src="<%=request.getContextPath()%>/styles/css/bb_d.gif"></TD>
          </TR>
      	</table>
      </td>    
      <td valign="bottom">查询条件&nbsp;&nbsp;&nbsp;提示：[请输入你要冻结解冻的单位的单位法人码或单位名称]</td >
   </tr>
</table>
<TABLE width="98%"  align="center"
border=1 cellPadding=0 cellSpacing=0 bordercolor="#FFFFFF" class=tablebody>
    <TR>
		<TD align="center" class="line2"> 
			<table width="297" border="0" cellspacing="0" cellpadding="0">
	            <tr> 
	               <td width="90" align="right">单位法人码</td>
					<td width="23"  align="right"></td>
	                <td width="160"><input id="bio_no" name="bio_no" type="text" maxlength="64" style='width:100%' onblur="huitian2()"></td>
					<td width="24"  align="right"></td>
	             </tr>
             </table>
        </TD>
     </TR>
     <tr>
		<TD align="center" class="line1"> 
			<table width="297" border="0" cellspacing="0" cellpadding="0">
              	<tr> 
                  <td width="90"  align="right">单位名称</td>
				  <td width="23"  align="right"></td>
                  <td width="160"><input id="bio_name" name="bio_name" type="text" maxlength="64" style='width:100%'></td>
				  <td width="24"  align="right"></td>
                </tr>
            </table>
        </TD>
     </tr>	
</TABLE>
<table width="98%"><tr><td>&nbsp;</td></tr></table>
<table width="98%" border="0" align="center">
  <TR align="center"  class="line2"> 
    <TD>
      <INPUT name="bt_submit" id="bt_submit" type="button"class="BUTTONs3" value="确 定">
      &nbsp;&nbsp;
     
      <INPUT class="BUTTONs3" type="reset" value="取 消" name="button2"> 
    </TD>
  </TR>
</table>
</form>
</body>
</html>
