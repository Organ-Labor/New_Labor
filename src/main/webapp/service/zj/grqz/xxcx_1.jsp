<%@ page contentType="text/html; charset=UTF-8" import="com.oracle.labor.common.codetable.*" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/j.js"></script>
<script>

$(function(){
	$("#sfz").blur(function(){
		var bipSfz=$("#sfz").val();
		//alert(bipSfz);
		$.get("<%=request.getContextPath()%>/service/getGrbasicinfo/"+bipSfz,function(){
		    alert($("#Name").val()+" "+$("#Sex").val());
			$("#bipName").val($("#Name").val());
			$("#bipSex").val($("#Sex").val());
			
		})
	})
})

</script>

<script type="text/javascript">
    
    
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
		 
	 })
    
    </script>

<script>
	function AS(){
		var sfzhm=form1.bipSfz.value;
		var name=form1.bipName.value;
		var xb=form1.bipSex.value;
		var age1=form1.minAge.value;
		var age2=form1.maxAge.value;
		var xl1=form1.whcd1.value;
		var xl2=form1.whcd2.value;
		var hyzk=form1.hyzk.value;
		var jkzk=form1.jkzk.value;
		var djrq1=form1.djsj1.value;
		var djrq2=form1.djsj2.value;
		var zzmm =form1.zzmm.value;
		var qzgw =form1.qzgw.value;
		var rylb=form1.rylb.value;
		var hjxz=form1.hjxz.value;
		var cxfw =form1.cxfw.value;
		var flag=false;
		if(sfzhm!=""||name!=""||xb!=""||age1!=""||age2!=""||xl1!=""||xl2!=""
		||hyzk!=""||jkzk!=""||djrq1!=""||djrq2!=""||zzmm!=""||qzgw!=""||rylb!=""||hjxz!=""||cxfw!=""){
		form1.action="<%=request.getContextPath()%>/service/selectToGr/1";
        form1.submit();
		}else{
		alert("至少有一个条件不能为空");
		}
	}
</script>

<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="<%=request.getContextPath()%>/styles/css/common.css" rel="stylesheet" type="text/css">
</head>
<body>
<input type="hidden" id="Name" value="${sessionScope.bipBasicinfo.bipName}"/>
<input type="hidden" id="Sex" value="${sessionScope.bipBasicinfo.bipSex}">


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
</div>

<form  method="post" name="form1">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td><table width="98%"  border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td height="20" valign="bottom"><img src="<%=request.getContextPath()%>/styles/images/right/now.gif" width="11" height="12">
          当前位置：职业介绍 &gt; 个人求职 &gt; 信息查询</td>
        </tr>
        <tr>
          <td valign="bottom" background="<%=request.getContextPath()%>/styles/images/right/dsline.gif" height="8"><img src="<%=request.getContextPath()%>/styles/images/index/spacer.gif"></td>
        </tr>
      </table></td>
  </tr>
  <tr>
    <td align="center" valign="top">
	<table width="98%" border="0" cellpadding="0" cellspacing="0"   class="title">
      <tr>
        <td width="30">
		<table border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td ><img src="<%=request.getContextPath()%>/styles/css/bb_d.gif"></td>
          </tr>
        </table></td>
        <td  valign="bottom">查询条件&nbsp;&nbsp;&nbsp;提示：[默认统计职介为本职介]</td>
      </tr>
    </table>
    </td>
  </tr>
</table>       
<TABLE width="98%" align="center"
	border="0" cellPadding="0" cellSpacing="0" bordercolor="#FFFFFF" class="tablebody">
	<tr>
    <td width="100%" valign="top">		
		<TABLE width="100%" align="center"
			border="0" cellPadding="0" cellSpacing="1" bordercolor="#FFFFFF" class="tablebody">
        <tr class="line2"> 
			<td width="85" align="right" class="line2">身份证号码</td>
			<td colspan="3" align="center" class="line2"><input type="text" name="bipSfz" id="sfz" style="WIDTH: 100%" maxlength="18" ></td>
        </tr>
        <tr class="line1">
        	<td align="right" >姓　　名</td>
			<td align="center" ><input type="text" name="bipName" id="bipName" style="WIDTH: 100%" value=""></td>
			<td width="55" align="right" >性　　别</td>
			<td align="center" ><select name="bipSex"  style="WIDTH: 100%" id="bipSex">
				<%=SexOperation.getOption()%>
			  </select></td>
        </tr>
        <tr class="line2"> 
			<td align="right" >年　　龄</td>
			<td align="center" ><input type="text" name="minAge" maxlength="2" style="WIDTH: 100%"></td>
			<td width="50" align="center" >到</td>
			<td align="center" ><input type="text" name="maxAge" maxlength="2" style="WIDTH: 100%"></td>
        </tr>
        <tr class="line1">
			<td align="right">学　　历</td>
			<td align="center" ><select  name="whcd1" style="WIDTH: 100%">
			<%=EducationallevelOperation.getOption()%>
	
			</select></td>
			<td align="center" >到</td>
			<td align="center" ><select  name="whcd2" style="WIDTH: 100%">
			<%=EducationallevelOperation.getOption()%>
		
			</select></td>     
        </tr>
        <tr class="line2">
        	<td align="right" class="line2">婚姻状况</td>
			<td align="center" class="line2"><select  name="hyzk" style="WIDTH: 100%">
			<%=MarriageOperation.getOption()%>
				
			</select></td>   
			<td align="right" class="line2">健康状况</td>
			<td align="center" class="line2"><select  name="jkzk" style="WIDTH: 100%">
			<%=HealthstateOperation.getOption()%>
				
			</select></td>
        </tr>
        <tr class="line1"> 
			<td align="right" >登记日期</td>
			<td align="center" ><textarea type="text" name="djsj1"  style='width:110%' class='mask'  htcurl="url(<%=request.getContextPath()%>/common/htc/format.htc)"  rows="1" cols="10" mask='date' maxlength='10' ></textarea>
			<td align="center" >到</td>
			<td align="center"><textarea type="text" name="djsj2"  style='width:110%' class='mask'  htcurl="url(<%=request.getContextPath()%>/common/htc/format.htc)"  rows="1" cols="10" mask='date' maxlength='10' ></textarea></td>
        </tr>
        <tr class="line2"> 
			<td align="right" class="line2">政治面貌</td>
			<td align="center" class="line2"><select  name="zzmm" style="WIDTH: 100%">
			<%=PoliticsaspectOperation.getOption()%>
			
			</select></td>
			<td align="right" class="line2">求职岗位</td>
			<td align="center" class="line2"><input type="text" id="zpgz_name" id="qzgw"></td>
        </tr>
        <tr class="line1">
        	<td align="right">人员类别</td>
			<td align="center" ><select  name="rylb" style="WIDTH: 100%">
			<%=PersonneltypeOperation.getOption()%>
		
			</select></td>
			<td align="right" >户籍性质</td>
			<td align="center" ><select  name="hjxz" style="WIDTH: 100%">
			<%=RprtypeOperation.getOption()%>
	
			</select></td>
        </tr>
        <tr class="line2"> 
			<td align="right" class="line2">查询范围</td>
			<td align="center" class="line2"><select name="cxfw" style="WIDTH: 100%">
				<option value="0"> </option>
				<option value="dq">当前</option>
				<option value="gd">归档</option>
				<option value="qb">全部</option>
			</select></td>
			<td align="right" class="line2">&nbsp;</td>
			<td align="center" class="line2">&nbsp;</td>
        </tr>
      </table>
      <table width="100%" 
        border="0" cellPadding="0" cellSpacing="0" bordercolor="#FFFFFF" class="tablebody">
        <tr align="center" class="line1"> 
          <td> <input name="cx" type="submit" class="BUTTONs3" value="查 询" onClick="AS()"> 
            &nbsp;&nbsp;<input name="qk" type="reset" class="BUTTONs3" value="取 消"> </td>
        </tr>
      </table> 
    </td>
  </tr>
</table>
</form>

</body>

</html>
