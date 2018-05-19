<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>dwdj_7_insertzpgzxx</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link href="<%=request.getContextPath()%>/styles/css/common.css"
			rel="stylesheet" type="text/css">
		<script src="<%=request.getContextPath()%>/js/commonjs.js"></script>
		<script type="text/javascript"
			src="<%=request.getContextPath()%>/js/jquery-1.11.1.min.js"></script>
		<script type="text/javascript">
	$(function(){
		
	     //文化程度
		$("#whcd").load("../../Educationallevels/10");
		//岗位类别
		$("#gwlb").load("../../Zjdgwlbs/10");
		//户籍性质
		$("#hjxz").load("../../Rprtypes/10");
		//用工形式
		$("#ygxs").load("../../Employtypes/1");
		//婚姻状况
		$("#hyzk").load("../../Marriages/1");
		//健康状况
		$("#jkzk").load("../../Healthstates/1");
		//人员类别
		$("#rylb").load("../../Personneltypes/20");
		//计算机等级
		$("#jsjdj").load("../../Computergrades/1");
		//熟练程度
		$("#jsjslcd").load("../../Proficiencys/1");
		$("#slcd").load("../../Proficiencys/1");
		//外语
	    $("#jyyz").load("../../Languages/01");
		
	  
	
		$("#bc").click(function(){
			
			var reg=/[a-zA-Z_0-9]$/
        
    	  	var regtoo=/[0-9]$/
        
      		var regthree=/[_a-z0-9]+@([_a-z0-9]+\.)+[a-z0-9]{2,3}$/;   
		
      		if(form1.zpgz_name.value==""){
			alert("招聘工种不允许为空!");
				return;
			}
		if($("#dwlxr").val()==""){
		alert("单位经办人不能为空");
		return;
		
		}
		if($("#zprsn").val()==""&&$("#zprsnv").val()==""&&$("#xbbx").val()==""){
		alert("请至少填写一项招聘人数");
	
		return;
		
		}
	
		if($("#ygxs").val()==""){
		alert("用工形式不能为空");
		
		return;
		
		}
		if(regtoo.test(form1.dwlxr.value)){
			alert("请正确填写经办人!");
			return;
		}
		if(form1.lxrsfzhm.value!=""&&!regtoo.test(form1.lxrsfzhm.value)){
		    alert("身份证格式输入不正确，请重新输入！");
		    return;
		}
		if(form1.lxrsj.value!=""&&!regtoo.test(form1.lxrsj.value)){
		    alert("手机格式输入不正确，请重新输入！");
		    return;
		}
		if(form1.kssj.value!=""&&!regtoo.test(form1.kssj.value)){
		    alert("开始时间格式输入不正确，请重新输入！");
		    return;
		}
		if(form1.jssj.value!=""&&!regtoo.test(form1.jssj.value)){
		    alert("结束时间格式输入不正确，请重新输入！");
		    return;
		}
		if(form1.zprsn.value!=""&&!regtoo.test(form1.zprsn.value)){
		    alert("招聘人数男只能输入数字，请重新输入！");
		    return;
		}
		if(form1.zprsnv.value!=""&&!regtoo.test(form1.zprsnv.value)){
		    alert("招聘人数女只能输入数字，请重新输入！");
		    return;
		}
		if(form1.xbbx.value!=""&&!regtoo.test(form1.xbbx.value)){
		    alert("招聘人数不限只能输入数字，请重新输入！");
		    return;
		}
		if(form1.zxnl.value!=""&&!regtoo.test(form1.zxnl.value)){
		    alert("开始年龄只能输入数字，请重新输入！");
		    return;
		}
		
		if(form1.zdnl.value!=""&&!regtoo.test(form1.zdnl.value)){
		    alert("截止年龄只能输入数字，请重新输入！");
		    return;
		}
		if(form1.zzyx.value!=""&&!regtoo.test(form1.zzyx.value)){
		    alert("开始月薪只能输入数字，请重新输入！");
		    return;
		}
		if(form1.zgyx.value!=""&&!regtoo.test(form1.zgyx.value)){
		    alert("结束月薪只能输入数字，请重新输入！");
		    return;
		}
		
		if($("#zprsn").val()==""){
			$("#zprsn").val("0");
			
			}
			if($("#zprsnv").val()==""){
			$("#zprsnv").val("0");
			
			}
			if($("#xbbx").val()==""){
			$("#xbbx").val("0");
			}
		
		//alert("sss");
		$("#form1").attr('action','../../dwzp_save').submit();
		});
	
	});
	
</script>

<script>
	 
	 $(function(){
		 //加载工种大类
		 $("#gzdl").load("../../Specialtys");
		 //寻找工种中类
		 $("#gzdl").change(function(){
			 var data=$("#gzdl").val();
			// alert(data);
			 $("#gzzl").load("../../Specialty/"+data+"/gz1");
			 $("#gzxl").empty();
			 $("#gzxl2").empty();
			 $("#gzdm").val("");
			 $("#gzmc").val("");
		 });
		 //小类
		 $("#gzzl").change(function(){
			 var data=$("#gzzl").val();
			 $("#gzxl").load("../../Specialty/"+data+"/gz2");
			 $("#gzxl2").empty();
			 $("#gzdm").val("");
			 $("#gzmc").val("");
		 });
		 //细类
		 $("#gzxl").change(function(){
			 var data=$("#gzxl").val();
			 $("#gzxl2").load("../../Specialty/"+data+"/gz3",function(){
				 var ss=$("#gzxl2").val();
				 var dd=$("#gzxl2 option:selected").text();;
				 $("#gzdm").val(ss);
				 $("#gzmc").val(dd);
			 });
		 });
		 //细类改变加载
		 $("#gzxl2").change(function(){
			 var ss=$("#gzxl2").val();
			 var dd=$("#gzxl2 option:selected").text();;
			 $("#gzdm").val(ss);
			 $("#gzmc").val(dd);
		 });
		 
		 //close 弹窗
		 $("#bt_close").click(function(){
			 $("#work_type").css('display','none');
		 });
		 //弹出工种
		 $("#zpgz_name").click(function(){
			 
			 $("#work_type").css('display','block');
		 });
		 //提交工种
		 $("#bt_gzqd").click(function(){
			 var data=$("#gzmc").val();
			 var dm=$("#gzdm").val();
			// alert(dm);
			 $("#zpgz").val(dm);
			 $("#zpgz_name").val(data);
			 $("#work_type").css('display','none');
		 });
		 //招聘地区
		 $("#zpdq_name").click(function(){
			 $("#work_eara").css('display','block');
		 });
		 //close
		 $("#bt_close2").click(function(){
			 $("#work_eara").css('display','none');
		 });
		 //
		 
		//省
			$("#sheng").load("../../Provinces");
			
			$("#sheng").change(function(){
				var data=$("#sheng").val();
				//alert(data);
				$("#shi").load("../../Citys/"+data);
				$("#qu").empty();
				$("#zpdq_code").val("");
				$("#dq_name").val("");
			});
			
			$("#shi").change(function(){
				var data=$("#shi").val();
				//alert(data);
				$("#qu").load("../../villages/"+data);
				$("#zpdq_code").val("");
				$("#dq_name").val("");
			});
			$("#qu").change(function(){
				var aa=$("#qu").val();
				var ss=$("#qu").find("option:selected").text();
				$("#zpdq_code").val(aa);
				$("#dq_name").val(ss);
			});
			//提交地区
			$("#bt_dq").click(function(){
				 var data=$("#dq_name").val();
				 var aa=$("#qu").val();
				 $("#zpdq").val(aa);
				 $("#zpdq_name").val(data);
				 $("#work_eara").css('display','none');
			 });
		
	 })
</script>
	</head>
	<body>
	<div style="position:reletive;">
	   

		<div id="work_type" style="background: white;width: 370px;height: 150px;position:absolute;left:50%;top:175px;transform:translate(-50%,-50%);display: none;" >
				<div>
	   				<input type="button" id="bt_close" value="close" style="float: right;">
	   			</div>
				
				<table align="center" style="top: 50px">
				<tr>
				<td>大&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;类</td>
				<td><select id="gzdl" name="gzdl" style="width:120px"></select></td>
				<td>中&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;类</td>
				<td><select id="gzzl" name="gzzl" style="width:120px"></select></td>
				</tr>
				<tr>
				<td>小&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;类</td>
				<td><select id="gzxl" name="gzxl" style="width:120px"> </select></td>
				<td>细&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;类</td>
				<td><select id="gzxl2" name="gzxl2" style="width:120px"></select></td>
				</tr>
				<tr>
				<td>工种代码</td>
				<td><input type="text" id="gzdm" name="gzdm" readonly="readonly" style="width:120px"></td>
				<td>工种名称</td>
				<td><input type="text" id="gzmc" name="gzmc" readonly="readonly" style="width:120px"></td>
				</tr>
				</table>
				
				<table align="center">
				<tr>
				<td><input type="button" value="确定" id="bt_gzqd"></td>
				</tr>
				</table>
		</div>
		<div id="work_eara" style="background: white;width: 370px;height: 150px;position:absolute;left:50%;top:175px;transform:translate(-50%,-50%);display: none;" >
			<div>
	   			<input type="button" id="bt_close2" value="close" style="float: right;">
	   		</div>
		<br>
		<table align="center">
		<tr>
		<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;省</td>
		<td><select id="sheng" name="sheng" style="width:120px"></select></td>
		</tr>
		<tr>
		<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;市</td>
		<td><select id="shi" name="shi" style="width:120px"></select></td>
		</tr>
		<tr>
		<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;区</td>
		<td><select id="qu" name="qu" style="width:120px"></select></td>
		</tr>
		</table>
		<table align="center">
		<tr><td>地区代码</td><td><input id="zpdq_code" name="zpdq_code"  style="width:120px" type="text" readonly="readonly"></td></tr>
		<tr><td>地区名称</td><td><input id="dq_name" name="dq_name" style="width:120px" type="text" readonly="readonly"></td></tr>
		</table>
		<table align="center">
				<tr>
				<td><input type="button" value="确定" id="bt_dq"></td>
				</tr>
				</table>
		</div>
				
				
		<form method="post" name="form1" id="form1" action="../../dwzp_save" >
		
			<table width="100%" border="0" cellspacing="0" cellpadding="0" >

				<tr>
					<td>
						<table width="98%" border="0" align="center" cellpadding="0"
							cellspacing="0">
							<tr>
								<td height="20" valign="bottom">
									<img
										src="<%=request.getContextPath()%>/styles/images/right/now.gif"
										width="11" height="12">
									当前位置：职业介绍 &gt; 单位登记 &gt; 新增招聘工种信息
								</td>
							</tr>
							<tr>
								<td valign="bottom"
									background="<%=request.getContextPath()%>/styles/images/right/dsline.gif"
									height="8">
									<img
										src="<%=request.getContextPath()%>/styles/images/index/spacer.gif">
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td align="center" valign="top">
						<table width="98%" border="0" cellpadding="0" cellspacing="0"
							class="title">
							<tr>
								<td width="30">
									<table border="0" cellspacing="0" cellpadding="0">
										<tr>
											<td>
												<img src="<%=request.getContextPath()%>/styles/css/bb_d.gif">
											</td>
										</tr>
									</table>
								</td>
								<td valign="bottom">
								<input  style="display: none" name="dwbh" id="dwbh" type="text" value="${company.bioId}">
						招聘信息[公司名称:<span id="gs_name">${company.bioName}</span>,法人码:<span id="frm">${company.bioNo}</span>]
								</td>
							</tr>
						</table>
						<table width="98%" border="0" cellpadding="0" cellspacing="1">
							<tr class="line2">
								<td align="right" width="13%">
									<span class="redtxt">*</span>经办人
								</td>
								<td align="right" width="20%">
									<INPUT name="dwlxr" id="dwlxr" style="WIDTH: 100%"
										maxlength="32">
								</td>
								<td align="right" width="13%">
									身份证
								</td>
								<td align="right" width="20%">
									<INPUT name="lxrsfzhm" id="lxrsfzhm" style="WIDTH: 100%"
										maxlength="32">
								</td>
								<td align="right" width="13%">
									手机
								</td>
								<td align="right" width="20%">
									<input name="lxrsj" id="lxrsj" style="WIDTH: 100%"
										maxlength="11">
								</td>
							</tr>
							<tr>
								<td colspan="6" valign="bottom"
									background="<%=request.getContextPath()%>/styles/images/right/dsline.gif"
									height="8">
									<img
										src="<%=request.getContextPath()%>/styles/images/index/spacer.gif">
								</td>
							</tr>
							<tr class="line2">
								<td align="right">
									<span class="redtxt">*</span>招聘工种
								</td>
								<td id="zpgztd">
								    <input type="hidden" id="zpgz" name="zpgz" value="">
									<input type="text" name="zpgz_name" id="zpgz_name" style="WIDTH: 100%"
										readonly="readonly">
									
								</td>
								<td align="right">
									岗位名称
								</td>
								<!-- 登记默认岗位类别为日常招聘岗位 -->
								<td align="left">
									<INPUT name="zpgzbm" style="WIDTH: 100%" maxlength="16">
								</td>
								<td align="right">
									岗位类别
								</td>
								<td>
									<select id="gwlb" name="gwlb" style="WIDTH: 100%">
								
									</select>
								</td>
							</tr>
							<tr class="line1">
								<td align="right">
									<span class="redtxt">*</span>招聘人数
								</td>
								<td colspan="3">
									男
									<INPUT name="zprsn" id="nars" size="1">
									女
									<INPUT name="zprsnv" id="nvrs" size="1">
									不限
									<INPUT name="xbbx" id="xbbx" size="1">
								</td>
								<td align="right">
									户籍性质
								</td>
								<td>
									<select id="hjxz" name="hjxz" style="WIDTH: 100%">
				
									</select>
								</td>
							</tr>
							<tr class="line2">
								<td align="right" width="140">
									开始时间
								</td>
								<td>
									<textarea name="kssj" id="kssj" style="WIDTH: 100%" class='mask'
										htcurl="url(<%=request.getContextPath()%>/common/htc/format.htc)"
										rows="1" cols="10" mask='date' maxlength="8"></textarea>
								</td>

								<td align="right">
									截至时间
								</td>
								<td>
									<textarea name="jssj" id="jssj" style="WIDTH: 100%" class='mask'
										htcurl="url(<%=request.getContextPath()%>/common/htc/format.htc)"
										rows="1" cols="10" mask='date' maxlength="8"></textarea>
								</td>
								<td align="right">
									年龄
								</td>
								<td>
									<table width="100%" border="0" cellpadding="0" cellspacing="0">
										<tr>
											<td width="45%">
												<INPUT name="zxnl" style="WIDTH: 100%" maxlength="2">
											</td>
											<td width="10%">
												至
											</td>
											<td width="45%">
												<INPUT name="zdnl" style="WIDTH: 100%" maxlength="2">
											</td>
										</tr>
									</table>
								</td>
							</tr>
							<tr class="line1">
								<td align="right" width="140">
									文化程度
								</td>
								<td>
									<select id="whcd" name="whcd" style="WIDTH: 100%">
								
									</select>
								</td>

								<td align="right">
									<span class="redtxt">*</span>用工形式
								</td>
								<td>
									<select id="ygxs" name="ygxs" style="WIDTH: 100%">

									</select>
								</td>

								<td align="right">
									月薪
								</td>
								<td>
									<table width="100%" border="0" cellpadding="0" cellspacing="0">
										<tr>
											<td width="45%">
												<INPUT name="zzyx" style="WIDTH: 100%" maxlength="5"
													onblur="checkJe(this);">
											</td>
											<td width="10%">
												至
											</td>
											<td width="45%">
												<INPUT name="zgyx" style="WIDTH: 100%" maxlength="5"
													onblur="checkJe(this);">
											</td>
										</tr>
									</table>
								</td>

							</tr>
							<tr class="line2">
								<td align="right">
									婚姻状况
								</td>
								<td>
									<select id="hyzk" name="hyzk" style="WIDTH: 100%">

									</select>
								</td>
								<td align="right">
									健康状况
								</td>
								<td>
									<select id="jkzk" name="jkzk" style="WIDTH: 100%">
									
									</select>
								</td>
								<td align="right">
									招用应届生
								</td>
								<td>
									<select name="sfbys" style="WIDTH: 100%">
										<option value=""></option>
										<option value="1">
											是
										</option>
										<option value="0">
											否
										</option>
									</select>
								</td>
							</tr>
							<tr class="line2">
								<td align="right">
									人员类别
								</td>
								<td>
									<select id="rylb" name="rylb" style="WIDTH: 100%">
									
									</select>
								</td>
								<td align="right">
									招聘地区
								</td>
								<td>
								    <input type="hidden" id="zpdq" name="zpdq">
									<input type="text" id="zpdq_name" name="zpdq_name" style="WIDTH: 100%"
									readonly="readonly"
									>
										
								</td>
								<td align="right"></td>
								<td></td>

							</tr>

							<tr class="line1">
								<td align="right">
									计算机等级
								</td>
								<td>
									<select id="jsjdj" name="jsjdj" style="WIDTH: 100%">
						
									</select>
								</td>
								<td align="right">
									熟练程度
								</td>
								<td>
									<select id="jsjslcd" name="jsjslcd" style="WIDTH: 100%">
									
									</select>
								</td>
							</tr>
							<tr class="line2">
								<td align="right">
									具有外语
								</td>
								<td>
									<select id="jyyz" name="jyyz" style="WIDTH: 100%">
								
									</select>
								</td>
								<td align="right">
									熟练程度
								</td>
								<td>
									<select id="slcd" name="slcd" style="WIDTH: 100%">
								
									</select>
								</td>

							</tr>
							<tr class="line1">
								<td align="right">
									工作地点
								</td>
								<td colspan="5">
									<INPUT name="gzdd" style="WIDTH: 100%">
								</td>

							</tr>
							<tr class="line2">
								<td align="right">
									岗位描述
								</td>
								<td>
									<textarea name="gwms" style="width: 152"></textarea>
								</td>
								<td align="right" width="140">
									其他说明
								</td>
								<td colspan="3">
									<textarea name="fldy" style="width: 100%"></textarea>
								</td>
							</tr>

						</table>
						<tr>
							<td>
								<TABLE width="100%" border=0 cellPadding=0 cellSpacing=1
									class="tablebody" align="center">
									<tr height="15px">
										<td>
											b
										</td>
									</tr>
									<TR align="center">
										<TD class="line2">
											<input name="bc" id="bc" type="button" class="BUTTONs3"
												value="保 存">
											&nbsp;&nbsp;
											<INPUT name="fh" type="submit" class="BUTTONs3" value="返 回">
										</TD>
									</TR>
								</TABLE>
							</td>
						</tr>
			</table>
		</form>
		</div>
	</body>
</html>