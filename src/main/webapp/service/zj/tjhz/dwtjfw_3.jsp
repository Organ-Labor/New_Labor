<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/common/import.jsp"%>
<html>
<head>
<title>单位推荐条件选择</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="<%=request.getContextPath()%>/styles/css/common.css"
	rel="stylesheet" type="text/css">
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/j.js"></script>

<!-- 
<script>
	$(function(){
		var a;
		$.get("SelectAjax.do",{f: "select"},
   			function(data){
   				$("#selects").append(data);
   		});
   		$("#selects").bind("change", function (){
   			$.get("SelectAjax.do",{f: "getInfo",getInfo: $(this).val()},
   				function(data){
   					a = data.split(",");
   					$("#s1").empty();$("#s2").empty();$("#s3").empty();
   					$("#s4").empty();$("#s5").empty();$("#s6").empty();
   					$("#s7").empty();$("#s8").empty();
   					$("#s1").append(a[0]);$("#s2").append(a[1]);$("#s3").append(a[2]);
   					$("#s4").append(a[3]);$("#s5").append(a[4]);$("#s6").append(a[5]);
   					$("#s7").append(a[6]);$("#s8").append(a[7]);
   			});
   		});
		$("#s8").bind("click", function (){
			var tt = window.showModalDialog("diqu.jsp",null,"dialogHeight:200px;dialogWidth:400px;center:yes");
			var a = tt.split("_");
			var j = a[0].split(",");
			var i = a[1].split(","); 
			var b = $("<option></option>");
			var value=j[2];
			var text=i[2];
			b.val(value);
			b.text(text);
			$(this).empty();			
			$(this).append(b);		
		});
		$("#qd").click(function(){
			if($.trim($("#n1").val()) == "" || $.trim($("#n2").val()) == "" || $.trim($("#s1").val()) == "" 
				|| $.trim($("#s2").val()) == "" || $.trim($("#zuo").val()) == "" || $.trim($("#you").val()) == ""){
				alert("信息不全！！！");
				return;
			}
			var age = /^[1-9]\d$/;
			var height = /^[1-9]\d{1,2}$/;
			var vision = /[1-5]\.[0]/;
			var h = true;
			h = age.test($.trim($("#n1").val()));
			h = age.test($.trim($("#n2").val()));
			h = height.test($.trim($("#sg1").val()));
			h = height.test($.trim($("#sg2").val()));
			h = vision.test($.trim($("#zuo").val()));
			h = vision.test($.trim($("#you").val()));
			if($("#sg1").val() > $("#sg2").val() || 
			$("#n1").val() > $("#n2").val()){
				h = false;
			}
			if(h){
				form1.qd.disabled = true;
				form1.qx.disabled = true;
				form1.back.disabled = true;
				form1.action = "<%=request.getContextPath()%>/service/zj/tjhz/Servletpp.do";
				form1.submit();
			}else{
				alert("信息有误！！");
			}
		});
	});
</script>

 -->

<script type="text/javascript">
     $(function(){
    	 var id=$("#ID").val();
    	 //alert(id);
    	 var url="<%=request.getContextPath()%>/service/getZpgz/"+id;
    	 //alert(url);
    	 //求职工种
    	 $("#qzgz").load("<%=request.getContextPath()%>/service/getZpgz/"+id);
    	/*  $("#qzgz").click(function(){
    		 alert("点击事件有效!");
    		 $.post(url,function(data){
    			 alert("没有数据传回来！");
    			 alert(data);
    		 })
    	 })  */
    	 
    	 //给求职工种框加失去焦点事件
    	 $("#qzgz").blur(function(){
    		 var q=$(this).val();
    		 var id=$("#ID").val();
    		 //alert(q);
    		 //alert(id);
    		 <%-- alert("<%=request.getContextPath()%>/service/selectTozptj/"+id+"/"+q); --%>
    		 //load其他信息
    		 $.get("<%=request.getContextPath()%>/service/selectTozptj/"+id+"/"+q,function(data){
    			//alert("进入get的function");
    			//alert(data);
    			var dataObj=eval("("+data+")"); 
    			for(var i=0;i<dataObj.length;i++){
    				//alert("性别编码："+dataObj[i].bipSex);
    				var xbcode=dataObj[i].bipSex;
    				var hyzkcode=dataObj[i].hyzk;
    				var whcdcode=dataObj[i].whcd;
    				var hjxzcode=dataObj[i].hjxz;
    				var rylbcode=dataObj[i].rylb;
    				var jkzkcode=dataObj[i].jkzk;
    				//alert("xbcode:"+xbcode);
    				var yjbyscode=dataObj[i].yjbys;
    				 $("#sfyj option[value='"+yjbyscode+"']").attr("selected", true);
    				var minAge=dataObj[i].minAge;
    				var maxAge=dataObj[i].maxAge;
    				$("#n1").val(minAge);
    				$("#n2").val(maxAge);
    				
    			}
    			
    			 //加载下拉列表
           	 //获得招聘工种对应的招聘条件编码
           	 //alert("性别编码："+xbcode);
           	 <%-- //1.求职工种
           	 $("#qzgz").load("<%=request.getContextPath()%>/service/getQzgz/1000000"); --%>
           	 //2.性别
           	 $("#xb").load("<%=request.getContextPath()%>/service/getSex/"+xbcode);
           	<%--  var url1="<%=request.getContextPath()%>/service/getSex/1";
           	 $.post(url1,function(data){
           		 alert(data);
           	 }) --%>
           	 //3.加载婚姻状况
        		 $("#hyzk").load("<%=request.getContextPath()%>/service/hyzk/"+hyzkcode);
        		 //4.文化程度
        		 $("#whcd").load("<%=request.getContextPath()%>/service/whcd/"+whcdcode);
        		 //5.户籍性质
        		 $("#hjxz").load("<%=request.getContextPath()%>/service/hjxz/"+hjxzcode);
        		 //6.加载人员类别
        		 $("#rylb").load("<%=request.getContextPath()%>/service/rylb/"+rylbcode);
        		 //7.健康状况
        		 $("#jkzk").load("<%=request.getContextPath()%>/service/jkzk/"+jkzkcode);
        		 //8.工作地区
        		 $("#gzdq").load("<%=request.getContextPath()%>/service/getGzdq");
    		 })
    		
    	 })	 
    	 
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
    	 
 		 //对表单进行处理
 		$("#qd").click(function(){
 			form1.action = "<%=request.getContextPath()%>/service/getQzz/1";
			form1.submit();
			<%-- if($.trim($("#n1").val()) == "" || $.trim($("#n2").val()) == "" || $.trim($("#s1").val()) == "" 
				|| $.trim($("#s2").val()) == "" || $.trim($("#zuo").val()) == "" || $.trim($("#you").val()) == ""){
				alert("信息不全！！！");
				return;
			}
			var age = /^[1-9]\d$/;
			var height = /^[1-9]\d{1,2}$/;
			var vision = /[1-5]\.[0]/;
			var h = true;
			h = age.test($.trim($("#n1").val()));
			h = age.test($.trim($("#n2").val()));
			h = height.test($.trim($("#sg1").val()));
			h = height.test($.trim($("#sg2").val()));
			h = vision.test($.trim($("#zuo").val()));
			h = vision.test($.trim($("#you").val()));
			if($("#sg1").val() > $("#sg2").val() || 
			$("#n1").val() > $("#n2").val()){
				h = false;
			}
			if(h){
				form1.qd.disabled = true;
				form1.qx.disabled = true;
				form1.back.disabled = true;
				form1.action = "<%=request.getContextPath()%>/service/getQzz/1";
				form1.submit();
			}else{
				alert("信息有误！！");
			} --%>
		});
     })
 </script>

</head>
<body>
	<!-- 隐藏域获得value -->
	<input type="hidden" id="ID" name="bioId"
		value="${sessionScope.bioInfomation[0].bioId} ">
    <div style="position:reletive;">
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
    </div>
	<form name="form1" action="" method="post">
		<%-- <c:set var="bio" value="${sessionScope.b}"/> --%>
		<table width="98%" align="center" border="0" align="center"
			cellpadding="0" cellspacing="0">
			<tr>
				<td height="20" valign="bottom"><img
					src="<%=request.getContextPath()%>/styles/images/right/now.gif"
					width="11" height="12">当前位置：职业介绍 &gt; 推荐服务 &gt; 单位推荐服务</td>
			</tr>
			<tr>
				<td valign="bottom"
					background="<%=request.getContextPath()%>/styles/images/right/dsline.gif"
					height="8"><img
					src="<%=request.getContextPath()%>/styles/images/index/spacer.gif"></td>
			</tr>
		</table>
		<table width="98%" align="center" border="0" cellpadding="0"
			cellspacing="0" class="title">
			<tr>
				<td width="30">
					<table border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td><img
								src="<%=request.getContextPath()%>/styles/css/bb_d.gif"></td>
						</tr>
					</table>
				</td>
				<td><input type="hidden" name="bio_id"
					value="<bean:write name='bio_id' scope='request'/>"></td>
				<td><input type="hidden" name="bio_bua_address"
					value="<bean:write name='bio_bua_address' scope='request'/>"></td>
				<td><input type="hidden" name="lxdh"
					value="<bean:write name='lxdh' scope='request'/>"></td>

				<%-- 			    <td  valign="bottom">单位名称:&nbsp;&nbsp;${bioInfo.bioName}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;单位地址:&nbsp;&nbsp;${bioInfo.bioBuaAddress}</td>
 --%>
				<td valign="bottom">单位名称:&nbsp;&nbsp;${sessionScope.bioInfomation[0].bioName}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;单位地址:&nbsp;&nbsp;${sessionScope.bioInfomation[0].bioAddress}</td>
			</tr>
		</table>
		<%-- <input type="hidden" id="ID" value="${bioInfo.bioId }"> --%>


		<table width="98%" align="center" border="0" cellpadding="0"
			cellspacing="1" bordercolor="#FFFFFF" class="tablebody">
			<tr>
				<td class="line4">请选择招聘条件:</td>
			</tr>
		</table>
		<table width="98%" align="center" border="0" cellpadding="0"
			cellspacing="0" bordercolor="#FFFFFF" class="tablebody">
			<tr>
				<td width="112" align="right" class="line1">查找个人求职工种为</td>
				<td class="line1">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>

							<td width="11%">
								<table border="0" cellspacing="2" cellpadding="0">
									<tr>
										<td><select name="gz" style="width: 120px;" id="qzgz">
												<option value="" selected>--请选择--</option>
												<%--<c:if test="${not empty CompInfoList && CompInfoList.size() > 0 }">  
                                    <c:forEach var="item" items="${CompInfoList }">  
                                        <option value="${item.id }">${item.name }</option>  
                                    </c:forEach>  
                                    <option value="1">--全部--</option>  
                                </c:if>   --%>
										</select></td>
										<td class="line2"></td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
		<table width="98%" align="center" border="0" cellpadding="0"
			cellspacing="1" bordercolor="#9DCBEC" class="tablebody">
			<tbody>
				<tr>
					<td width="16%" align="right" class="line2">性 别</td>
					<td width="20%" align="center" class="line2"><select id="xb"
						name="bipSex" style="WIDTH: 100%">

					</select></td>
					<td width="12%" align="right" class="line2">婚姻状况</td>
					<td width="20%" align="center" class="line2"><select id="hyzk"
						name="bipHyzk" style="WIDTH: 100%">

					</select></td>
					<td width="11%" align="right" class="line2">文化程度</td>
					<td width="20%" align="center" class="line2"><select id="whcd"
						name="bipWhcd" style="WIDTH: 100%">

					</select></td>
				</tr>
				<tr>
					<td align="right" class="line1">户籍性质</td>
					<td align="center" class="line1"><select id="hjxz"
						name="bipHjxz" style="WIDTH: 100%">

					</select></td>
					<td align="right" class="line2">人员类别</td>
					<td align="center" class="line2"><select id="rylb"
						name="bipRylb" style="WIDTH: 100%">

					</select></td>
					<td align="right" class="line1">健康状况</td>
					<td align="center" class="line1"><select id="jkzk"
						name="bipJkzk" style="WIDTH: 100%">

					</select></td>
				</tr>
				<tr>
					<td align="right" class="line2">应届毕业生</td>
					<td align="center" class="line2"><select id="sfyj"
						name="bipTNewgraduate" style="WIDTH: 100%">
							<option value="y">是</option>
							<option value="n">否</option>
							<option value="k">无要求</option>
					</select></td>
					<td align="right" class="line1">工作地区</td>
					<td align="center" class="line1">
					<input id="zpdq_name" name="gzdq" value="" style="WIDTH: 100%">
				   </td>
				</tr>
				<tr>
					<td align="right" class="line1">年 龄</td>
					<td align="left" class="line1"><input id="n1" name="minAge"
						style="WIDTH: 42%" maxlength="2">至<input id="n2"
						name="maxAge" style="WIDTH: 42%" maxlength="2"></td>
					<td align="right" class="line1">身 高</td>
					<td align="left" class="line1"><input id="sg1" name="minLong"
						style="WIDTH: 42%" maxlength="3">至<input id="sg2"
						name="maxLong" style="WIDTH: 42%" maxlength="3"></td>
					<td align="right" class="line1">视 力</td>
					<td align="left" class="line1"><input id="zuo" name="leftsl"
						style="WIDTH: 46%" maxlength="3">-<input id="you"
						name="rightsl" style="WIDTH: 46%" maxlength="3"></td>
				</tr>
		</table>
		<br>
		<table width="98%" border="0" align="center" cellspacing="0"
			cellpadding="0">
			<tr>
				<td class="line2" align="center"><input id="qd" name="qd"
					type="button" class=BUTTONs3 value="确 定">&nbsp;&nbsp; <input
					name="qx" type="reset" class=BUTTONs3 value="取 消">&nbsp;&nbsp;
					<!--  <input name="back" type="button"class=BUTTONs3 onClick="onclick()" value="返 回"> -->

					<input type="button" class="btn" value="返回"
					onclick="javascript:history.go(-1);" /></td>
			</tr>
		</table>
	</form>
</body>
</html>
