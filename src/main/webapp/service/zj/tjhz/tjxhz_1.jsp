<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>推荐信回执查询</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="<%=request.getContextPath()%>/styles/css/common.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="<%=request.getContextPath()%>/js/j.js"></script>
<script>
	var rqreg = /^(([1][9])||([2][0]))[0-9]{2}[-](([0][1-9])||([1][0-2]))[-](([0][1-9])||([1-2][0-9])||([3][0-1]))$/;
	var sfzreg = /^[1-9]([0-9]{5})(([1][9])||([2][0]))[0-9]{2}(([0][1-9])||([1][0-2]))(([0][1-9])||([1-2][0-9])||([3][0-1]))[0-9]{3}([0-9]||[X])$/;
	
	function doSubmit(){
		/* var a = $.trim($("#bioSfz").val());
		var b = $.trim($("#bioName").val());
		var c = $.trim($("#bioNo").val());
		var d = $.trim($("#bioName").val());
		var e = $.trim($("#tjsj1").val());
		var f = $.trim($("#tjsj2").val());
		var g = $.trim($("#tjxlx").val());
		if(a == "" || b == "" || c == "" || d == "" || e == "" || f == "" || g == ""){
   			alert("信息不全！！");
			return;
		}
		if(!sfzreg.test($("#sfz").val())){
			alert("错误");
			return;
		}
		if(!rqreg.test($("#qs").val())){
			alert("错误");
			return;
		}
		if(!rqreg.test($("#jz").val())){
			alert("错误");
			return;
		}
		var s = a + b + c + d + e + f + g;
		form1.cx.disabled = true;

		form1.qk.disabled = true;
		form1.action="<%=request.getContextPath()%>/grtj/hzcx";

		form1.submit();
	}
	
	
</script>


<script type="text/javascript">
$(function(){
	//根据身份证号回显姓名
	$("#sfz").blur(function (){
		$.post(
				"<%=request.getContextPath()%>/grtj/commons/name/"+$("#sfz").val(), 
					function(data){
	 		 		$("#xm").val(data);
					});
	})
	//意向匹配中根据单位法人码回显对应单位名称
		$("#frm").blur(function (){
		$.post(
				"<%=request.getContextPath()%>/grtj/commons/dw_name/"+$("#frm").val(), 
   				function(data){
     		  		$("#mc").val(data);
   				});
		})
})
</script>
</head>
<body>
<form name="form1" action="" method="post">
<table width="98%"  border="0" align="center" cellpadding="0" cellspacing="0">
	<tr>
		<td height="20" valign="bottom">d<img src="<%=request.getContextPath()%>/styles/images/right/now.gif" width="11" height="12">当前位置：职业介绍 
			&gt; 推荐服务 &gt; 推荐信回执</td>
	</tr>
	<tr>
		<td valign="bottom" background="<%=request.getContextPath()%>/styles/images/right/dsline.gif" height="8"><img src="<%=request.getContextPath()%>/styles/images/index/spacer.gif"></td>
	</tr>
</table>
<table width="98%" border="0" cellpadding="0" cellspacing="0" 
		align="center"  class="title">
	<tr>
		<td width="30">
			<table border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td ><img src="<%=request.getContextPath()%>/styles/css/bb_d.gif"></td>
				</tr>
			</table></td>
		<td  valign="bottom">查询条件&nbsp;&nbsp;&nbsp;提示：[请输入查询要回执推荐信的条件]</td>
	</tr>
</table>
<table width="98%" align="center" border="0" cellpadding="0" cellspacing="1">
	<tr class="line1"> 
		<td width="" align="right" class="line2">身份证号码</td>
		<td width="" align="left" class="line2"><input id="bipSfz" name="bipSfz" style="WIDTH: 200px;"  maxlength="18"></td>
	</tr>
	<tr class="line1"> 
		<td width="" align="right" class="line2">姓      名</td>
		<td width="" align="left" class="line2"><input id="bipName" name="bipName" style="WIDTH: 200px" maxlength="32"></td>
	</tr>
	<tr class="line1"> 
		<td width="" align="right" class="line1">单位法人码</td>
		<td width="" align="left" class="line1"><input id="bioNo" name="bioNo" style="WIDTH: 200px;"  maxlength="32"></td>
	</tr>
	<tr class="line1"> 
		<td width="" align="right" class="line1">单位名称</td>
		<td width="" align="left" class="line1"><input id="bioName" name="bioName" style="WIDTH: 200px"  maxlength="32"></td>
	</tr>
	<tr class="line1"> 
		<td width="" align="right" class="line2">推荐日期起</td>
		<td width="" align="left" class="line2"><input id="tjsj1" name="tjsj1"  style="WIDTH: 200px"  maxlength="10"></td>
	</tr>
	<tr class="line1"> 
		<td width="" align="right" class="line2">至</td>
		<td width="" align="left" class="line2"><input id="tjsj2" name="tjsj2"  style="WIDTH: 200px"  maxlength="10"></td>
	</tr>
	<tr class="line1"> 
		<td width="" align="right" class="line1">推荐信类型</td>
		<td width="" align="left" class="line1">

		<SELECT id="lx" NAME="tjxType" style="WIDTH: 200px">
		<option value="">

		<option value="g">个人推荐信

		<option value="d">单位推荐信

		</SELECT>
		</td>
	</tr>
</table>
<br>
<table width="98%" align="center"
	border="0" cellPadding="0" cellSpacing="1" bordercolor="#FFFFFF" class="tablebody">
	<tr align="center"> 
		<td height="25" align="center" class="line2"> <input name="cx" type="button" class="BUTTONs3" value="查 询" onClick=doSubmit(); >
			&nbsp;&nbsp;<input name="qk" type="reset"class="BUTTONs3" value="取 消"> 
		 </td>
	</tr>
</table> 
</form>
</body>
</html>