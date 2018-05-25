<%@ page contentType="text/html; charset=UTF-8" %>
<html>
<head>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.11.1.js"></script>
    <script type="text/javascript" >
    	$(function(){
    	
    		<%-- $.get("<%=request.getContextPath()%>/service/zj/tjhz/tjcx.do",{},function(data){
    			$.getJSON("<%=request.getContextPath()%>/service/zj/tjhz/tjcx.do",{},function(d){
    		
    				$("#xb").html(d.sex);
    				$("#hjxz").html(d.huji);
    				$("#rylb").html(d.per);
    				$("#gzgz").html(d.sp);
    				$("#dwlx").html(d.dwlx);
    				$("#hwlb").html(d.gwlb);
    				$("#zdxl1").html(d.ed1);
    				$("#zgxl2").html(d.ed2);
    			}); 
    		
    		});   		 --%>
    		 //求职工种
    		<%--  var id=$("#ID").val();
        	 alert(id);
        	 var url="<%=request.getContextPath()%>/service/getZpgz/"+id;
        	 alert(url); 
        	 $("#zpgw").load("<%=request.getContextPath()%>/service/getQzgz/1");--%>
        	$("#gzgz").load("<%=request.getContextPath()%>/service/getQzgz/1");
    		
    		//加载下拉列表
    		//1.性别
    		 $("#xb").load("<%=request.getContextPath()%>/service/getSex/1");
    		//2.户籍性质
             $("#hjxz").load("<%=request.getContextPath()%>/service/hjxz/10");
            //3.人员类别
    		 $("#rylb").load("<%=request.getContextPath()%>/service/rylb/20");
            <%-- //4.求职岗位
             $("#gzgz").load("<%=request.getContextPath()%>/service/getQzgz/1000000"); --%>
            //5.学历
             $("#zdxl1").load("<%=request.getContextPath()%>/service/whcd/10");
             $("#zgxl2").load("<%=request.getContextPath()%>/service/whcd/10");
             //6.单位类型
             $("#dwlx").load("<%=request.getContextPath()%>/service/dwlx/10");
             //7.岗位类别
             $("#gwlb").load("<%=request.getContextPath()%>/service/gwlb/10");
    	});    
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
  <script language="javascript">
//判断输入的日期是否正确
function CheckDate(INDate){ 
if (INDate==""){return true;}
if(INDate.indexOf('-',0)!=-1){	separate="-"}
else{
	if(INDate.indexOf('/',0)!=-1){separate="/"}
	else {return true;}
	}
	area=INDate.indexOf(separate,0)
	//获取年份
	subYY=INDate.substr(0,area)
	if(isNaN(subYY) || subYY<=0){
		return true;
	}		
	//转换月份
	subMM=INDate.substr(area+1,INDate.indexOf(separate,area+1)-(area+1))
	if(isNaN(subMM) || subMM<=0){
		return true;
	}
	if(subMM.length<2){subMM="0"+subMM}
	//转换日
	area=INDate.lastIndexOf(separate)
	subDD=INDate.substr(area+1,INDate.length-area-1)
	if(isNaN(subDD) || subDD<=0){
		return true;
	}
	if(eval(subDD)<10){subDD="0"+eval(subDD)}
	NewDate=subYY+"-"+subMM+"-"+subDD
	if(NewDate.length!=10){return true;}
    if(NewDate.substr(4,1)!="-"){return true;}
    if(NewDate.substr(7,1)!="-"){return true;}
	var MM=NewDate.substr(5,2);
	var DD=NewDate.substr(8,2);
	if((subYY%4==0 && subYY%100!=0)||subYY%400==0){ //判断是否为闰年
		if(parseInt(MM)==2){
			if(DD>29){return true;}
		}
	}else{
		if(parseInt(MM)==2){
			if(DD>28){return true;}
		}	
	}
	var mm=new Array(1,3,5,7,8,10,12); //判断每月中的最大天数
	for(i=0;i< mm.length;i++){
		if (parseInt(MM) == mm[i]){
			if(parseInt(DD)>31){
				return true;
			}else{
				return false;
			}
		}
	}
   if(parseInt(DD)>30){return true;}
   if(parseInt(MM)>12){return true;}
   return false;
   }
</script>
<script language="javascript">

function check(myform){
	myform.submit();
			if(!myform.djkssj.value==""||!myform.djjssj.value==""||!myform.tjkssj.value==""||!myform.tjjssj.value==""){
	if(!myform.djkssj.value==""||!myform.djjssj.value==""){
	if(CheckDate(myform.djkssj.value)){	
		alert("您输入的开始日期不正确！\n 请注意日期格式（如：2007-07-17）或闰年！");	
		return ;
	}else if(CheckDate(myform.djjssj.value)){
		alert("您输入的结止日期不正确！\n 请注意日期格式（如：2007-07-17）或闰年！");
		return;	
	}
	}if(!myform.tjkssj.value==""||!myform.tjjssj.value==""){
	if(CheckDate(myform.tjkssj.value)){
		alert("您输入的开始日期不正确！\n 请注意日期格式（如：2007-07-17）或闰年！");
		return;
	}else if(CheckDate(myform.tjjssj.value)){
		alert("您输入的结止日期不正确！\n 请注意日期格式（如：2007-07-17）或闰年！");
		return;	
	}
	}
	}
	
}
</script>
  
<title>推荐情况查询</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="<%=request.getContextPath()%>/styles/css/common.css" rel="stylesheet" type="text/css">

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
</div>


<input type="hidden" id="ID" name="bioId" value="${sessionScope.bioInfomation[0].bioId} ">
<form name="form1" action="<%=request.getContextPath()%>/service/getSearch/1" method="post">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td><table width="98%"  border="0" align="center" cellpadding="0" cellspacing="0">
        <tr> 
          <td height="20" valign="bottom"><img src="<%=request.getContextPath()%>/styles/images/right/now.gif" width="11" height="12">当前位置：职业介绍 
            &gt; 推荐服务 &gt; 推荐情况查询</td>
        </tr>
        <tr> 
          <td valign="bottom" background="<%=request.getContextPath()%>/styles/images/right/dsline.gif" height="8"><img src="<%=request.getContextPath()%>/styles/images/index/spacer.gif"></td>
        </tr>
      </table></td>
  </tr>
  <tr> 
    <td align="center" valign="top"><TABLE width="98%" border=0 cellPadding=0 cellSpacing=0 bordercolor="#FFFFFF" class=tablebody>
     <TR>
            <TD width="30" height=20 class="title"><img src="<%=request.getContextPath()%>/styles/css/bb_d.gif" width="30" height="19"></TD>
            <TD class="title" style="padding-top:5px">查询条件</TD>
     </TR>
    </TABLE>
      <table width="98%" border="0" cellspacing="1" cellpadding="0">
        <tr class="line2">
          <td width="13%" align="right">性　　别</td>
          <td width="13%"><select id="xb" name="bipSex" style="width:100%">
				<option value=""/>
				
          </select>          </td>
          <td width="13%" align="right">户籍性质</td>
          <td width="13%"><select  id="hjxz" name="hjxz" style="width:100%">
				<option value="">
				
          </select>          </td>
          <td width="13%" align="right" >年　　龄</td>
          <td width="13%"><input id="zxnl1" name="minAge" style="WIDTH: 100%" maxlength="2"></td>
          <td width="5%" align="center">至</td>
          <td width="13%"><input id="zdnl2" name="maxAge" style="WIDTH: 100%" maxlength="2"></td>
        </tr>
        <tr class="line1">
          <td align="right">人员类别</td>
          <td><select id="rylb" name="rylb" style="width:100%">
				<option value="">
			
          </select>          </td>
          <td align="right">求职岗位</td>
          <td><input type="text" id="zpgz_name" name="gz" value=""> </td>
          <td align="right">学　　历</td>
          <td><select id="zdxl1" name="whcd1" style="width:100%">
				 <option value="">
				
          </select>          </td>
          <td align="center">至</td>
          <td><select id="zgxl2" name="whcd2" style="width:100%">
				<option value="">
				
          </select>          </td> 
        </tr>
        <tr class="line2">
          <td align="right">单位类型</td>
          <td><select id="dwlx" name="orgtype" style="WIDTH: 100%">
						<option value="">请选择</option>
						
            </select></td>
          <td align="right">岗位类别</td>
          <td><select id="gwlb" name="gwlb" style="WIDTH: 100%">
						<option value="">请选择</option>
						
						</select></td>
          <td align="right">登记时间</td>
          <td><textarea name="djsj1" style="width: 100%;" class="mask" htcurl="url(<%=request.getContextPath() %>/common/htc/format.htc)" rows="1" cols="10" mask="date" maxlength="10" ></textarea></td>
          <td align="center">至</td>
          <td><textarea name="djsj2" style="width: 100%;" class="mask" htcurl="url(<%=request.getContextPath() %>/common/htc/format.htc)" rows="1" cols="10" mask="date" maxlength="10" ></textarea></td>
        </tr>
        <tr class="line1">
		  <td align="right">回执状态</td>
          <td><select name="hzzt" style="width: 100%;"> 
		  <option value=""> 
		  <option value="s">成功 
		  <option value="f">未成功 
 
 
		  <option value="n">未回执 
 
 
          </option></option></option></option></select>          </td>
          <td width="60" align="right">推荐时间</td>
          <td width="100" align="center"><textarea name="tjsj1" style="width: 100%;" class="mask" htcurl="url(<%=request.getContextPath() %>/common/htc/format.htc)" rows="1" cols="10" mask="date" maxlength="10"></textarea></td>
          <td width="15" align="center">至</td>
          <td width="100" align="center"><textarea name="tjsj2" style="width: 100%;" class="mask" htcurl="url(<%=request.getContextPath() %>/common/htc/format.htc)" rows="1" cols="10" mask="date" maxlength="10"></textarea></td>
        </tr>
      </table>
      <table width="98%%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td>&nbsp;</td>
        </tr>
        <tr class="line2">
          <td align="center">
            <input name="bc" type="button" class="BUTTONs3" value="查 询" onclick="check(form1)" >
            &nbsp;&nbsp;&nbsp;&nbsp;<INPUT name="qk" type="reset"class=BUTTONs3  value="取 消">
          </td>
        </tr>
      </table>
  </tr>
</table>
</form>
</body>
</html>
