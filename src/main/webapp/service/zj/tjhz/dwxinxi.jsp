<%@ page contentType="text/html; charset=UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>dwdj_3_updateBase</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="<%=request.getContextPath()%>/styles/css/common.css"
	rel="stylesheet" type="text/css">
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/j.js"></script>
<!-- 
<script>
	$(function() {
<<<<<<< HEAD
		var aa = "${bio}";
=======
		/* var aa = "${s}";
>>>>>>> refs/remotes/origin/dev3.0
		var a = aa.split(",");
		$("#i1").val(a[0]);
		$("#i2").val(a[1]);
		$("#i3").val(a[2]);-
		$("#i4").val(a[3]);
		$("#i5").val(a[4]);
		$("#i6").val(a[5]);
		$("#i7").val(a[6]);
		$("#i8").val(a[7]);
		$("#i9").val(a[8]);	
		$("#i10").val(a[9]);
		$("#i11").val(a[10]);
		$("#i12").val(a[11]);
		$("#i13").val(a[12]);
		 */
		$("#i1").attr("readonly","readonly");
		$("#i2").attr("readonly","readonly");
		$("#i3").attr("readonly","readonly");
		$("#i4").attr("readonly","readonly");
		$("#i5").attr("readonly","readonly");
		$("#i6").attr("readonly","readonly");
		$("#i7").attr("readonly","readonly");
		$("#i8").attr("readonly","readonly");
		$("#i9").attr("readonly","readonly");	
		$("#i10").attr("readonly","readonly");
		$("#i11").attr("readonly","readonly");
		$("#i12").attr("readonly","readonly");
		$("#i13").attr("readonly","readonly");
	});
</script>  -->

<%-- <script type="text/javascript">
       $(function(){
    	   //加载注册地区的下拉列表
    	   alert("我要加载城市了！");
    	   var code=${b.bioRgaRegioncode};
    	   alert(code);
    	   $("#province").load("<%=request.getContextPath()%>/service/getRegions",{code:code,region:"province"});
    	   $("#city").load("<%=request.getContextPath()%>/service/getRegions",{code:code,region:"city"});
    	   $("#village").load("<%=request.getContextPath()%>/service/getRegions",{code:code,region:"village"});
    	   alert("城市加载完了！");
       })
</script> --%>

<script type="text/javascript">
     $(function(){
    	 //alert("我要加载城市了！");
    	 var code=$("#region").val();
  	     //alert(code);
  	     $("#province").load("<%=request.getContextPath()%>/service/getRegions",{code:code,region:"province"});
  	     $("#city").load("<%=request.getContextPath()%>/service/getRegions",{code:code,region:"city"});
  	     $("#village").load("<%=request.getContextPath()%>/service/getRegions",{code:code,region:"village"});
  	     //alert("城市加载完了！");
     })
</script>
</head>
<body>
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td><table width="98%" border="0" align="center" cellpadding="0"
					cellspacing="0">
					<tr>
						<td height="20" valign="bottom"><img
							src="<%=request.getContextPath()%>/styles/images/right/now.gif"
							width="11" height="12"> 单位基本信息</td>
					</tr>
					<tr>
						<td valign="bottom"
							background="<%=request.getContextPath()%>/styles/images/right/dsline.gif"
							height="8"><img
							src="<%=request.getContextPath()%>/styles/images/index/spacer.gif">
						</td>
					</tr>
				</table></td>
		</tr>
		<tr>
			<td align="center" valign="top">
				<table width="98%" border="0" cellpadding="0" cellspacing="0"
					class="title">
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
					</tr>
				</table>
		<tr>
			<td align="center" valign="top">
				<table width="98%" border="0" cellspacing="0" cellpadding="0"
					style="display:block">

					<tr>
					
						<td valign="top"><table width="100%" border="0"
								cellspacing="1" cellpadding="0">
								<c:forEach items="${bio}" var="b">
								<input type="hidden" id="region" value=${b.bioRgaRegioncode }>
								<tr class="line2">
								    
									<td width="13%" align="right"><span class="redtxt"></span>单位法人码</td>

									<td width="18%"><input id="i1" name="dwfrm" type="text"
										style="WIDTH: 100%" maxlength="32" value="${b.bioNo}"></td>

									<td width="13%" align="right"><span class="redtxt"></span>单位全称</td>
									<td width="20%"><INPUT id="i2" name="dwqc"

										style="WIDTH: 100%" maxlength="64" value="${b.bioName}" type="text">

									</td>
									<td width="14%" align="right">单位简称</td>
									<td width="20%"><INPUT id="i3" name="dwjc"

										style="WIDTH: 100%" maxlength="32" value="${b.bioShortname}" type="text">

									</td>
								</tr>
								<tr class="line1">
									<td align="right"><span class="redtxt"></span>单位性质</td>

									<td width="18%"><input id="i4" name="dwxz" value="${b.orgtypeName}"
										style="WIDTH: 100%;" type="text">

									</td>
									<td align="right"><span class="redtxt"></span>经济类型</td>

									<td><input id="i5" type="text" name="dwjjlx" style="WIDTH: 100%" value="${b.regtypeName}">

									</td>
									<td align="right"><span class="redtxt"></span>单位行业</td>

									<td><input type="text" id="i6" name="dwhy" style="WIDTH: 100%" value="${b.industryName}">

									</td>
								</tr>
								<tr class="line2">

									<td align="right">邮政编码</td>

									<td><INPUT type="text" id="i7" name="yzbm" style="WIDTH: 100%"
										maxlength="32" value="${b.bioBuaPostcode}">

									</td>
									<td align="right">传真机号</td>
									<td><input id="i8" name="czjh" style="WIDTH: 100%"

										type="text" maxlength="32" value="${b.bioConFax}">

									</td>
									<td align="right">Email</td>
									<td><INPUT id="i9" name="email" style="WIDTH: 100%"
										
										maxlength="64" value="${b.bioConMail}">

									</td>
								</tr>
								<tr class="line1">
									<td align="right"><span class="redtxt"></span>注册省(市)</td>
									<td><!--  <input id="province" name="dwszs" style="WIDTH: 100%" readonly="readonly" value="">-->
									    <select id="province" name="dwszs" style="WIDTH: 100%" readonly="readonly" disabled="disabled"></select>
									</td>
									<td align="right">市(区\县)</td>
									<td id="sqx"><!-- <input id="city" name="dwszq"
										style="WIDTH: 100%" readonly="readonly"> -->
										<select id="city" name="dwszq" style="WIDTH: 100%" readonly="readonly" disabled="disabled"></select>
									</td>
									<td align="right">街(镇\乡)</td>
									<td id="jzx"><!--  <input id="village" name="dwszj"
										style="WIDTH: 100%" readonly="readonly">-->
										<select id="village" name="dwszj" style="WIDTH: 100%" readonly="readonly" disabled="disabled"></select>
									</td>
								</tr>
								<tr class="line2">
									<td align="right"><span class="redtxt"></span>经营地址</td>
									<td colspan="5"><INPUT id="i13" name="lxdz"
										style="WIDTH: 100%" maxlength="64" value="${d.bioAddress}">
									</td>
								</tr>
                                </c:forEach>
							</table></td>
					</tr>
				</table> <br></td>
		</tr>
	</table>
</body>
</html>