<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page language="java" import="com.oracle.labor.common.codetable.*" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>xxcx_1</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="<%=request.getContextPath()%>/styles/css/common.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-1.11.1.js"></script>
<script>
$(function(){
	
		 <%-- var id=$("#ID").val();
    	 alert(id);
    	 var url="<%=request.getContextPath()%>/service/getZpgz/"+id;
    	 alert(url); --%>
    	 //求职工种
<%--     	 $("#zpgw").load("<%=request.getContextPath()%>/service/getQzgz/1");
 --%>		
		<%-- alert("zpgw");
			var dx,dy;
			var dx=(screen.height/2-105)+"";
   			var dy=(screen.width/2-200)+"";
			var rValue,iTem;
			var qzgz=$(this).val();
			alert(qzgz);
			rValue=window.showModalDialog("<%=request.getContextPath() %>/common/choosegz_ModalDialog_qyc.jsp",qzgz,"dialogTop="+dx+";dialogLeft="+dy+";dialogHeight=210px;dialogWidth=400px;help=no;fullscreen=1;status=no;center=yes");		
			if(rValue != null){				
				$(this).html(rValue);				
			}
				return;			 --%>
		

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
</head>
<body>
<input type="hidden" id="ID" name="bioId" value="${sessionScope.bioInfomation[0].bioId} ">


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

<form method="post"	name="form1" action="<%=request.getContextPath() %>/service/selectToDw/1">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td><table width="98%"  border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td height="20" valign="bottom"><img src="<%=request.getContextPath()%>/styles/images/right/now.gif" width="11" height="12">当前位置：职业介绍 
            &gt; 单位招聘 &gt; 信息查询</td>
        </tr>
        <tr>
          <td valign="bottom" background="<%=request.getContextPath()%>/styles/images/right/dsline.gif" height="8"><img src="<%=request.getContextPath()%>/styles/images/index/spacer.gif"></td>
        </tr>
      </table></td>
  </tr>
</table>  
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td align="center" valign="top">
	<table width="98%" border="0" cellpadding="0" cellspacing="0"   class="title">
      <tr>
        <td width="30">
		<table border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td><img src="<%=request.getContextPath()%>/styles/css/bb_d.gif"></td>
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
    <td width="58%" valign="top">		
		<TABLE width="100%" align="center"
			border="0" cellPadding="0" cellSpacing="0" bordercolor="#FFFFFF" class="tablebody">
        <tr class="line2">
          <td width="75" align="right">单位法人码</td>
          <td> 
            <INPUT type="text" name="bioNo" style="WIDTH: 100%" maxlength="18" ></td>
          <td width="55" align="right">单位名称</td>
          <td><INPUT type="text"  name="bioName"  style="WIDTH: 100%" maxlength="18" ></td>

        </tr>
        <tr class="line2">
          <td align="right">登记时间</td>
          <td><textarea name="djsj1" style='width:100%' class='mask'  htcurl="url(<%=request.getContextPath()%>/common/htc/format.htc)"  rows="1" cols="10" mask='date' maxlength='10' ></textarea></td>
          <td width="50" align="center">至</td>
          <td><textarea name="djsj2" style='width:100%' class='mask'  htcurl="url(<%=request.getContextPath()%>/common/htc/format.htc)"  rows="1" cols="10" mask='date' maxlength='10' ></textarea></td>

        </tr>
        <tr class="line2">
          <td align="right">经济类型</td>
          <td><select name="regType" size=1 style="WIDTH: 100%">
						<%=RegtypeOperation.getOption() %>
				
            </select></td>
          <td align="right">单位性质</td>
          <td><select name="orgType" size=1 style="WIDTH: 100%">
						<%=OrgtypeOperation.getOption() %>
				
            </select></td>
        </tr>
        <tr class="line2">
          <td align="right">岗位类别</td>
          <td><select name="gwlb" size=1 style="WIDTH: 100%">
						<%=ZjdgwlbOperation.getOption() %>
						
						</select></td>
          <td align="right">招聘岗位</td>
          <td id="o1"><input type="text" id="zpgz_name" value="" name="zpgw"></td>
        </tr>
        <tr class="line2">
          <td align="right">人员类别</td>
          <td><select name="rylb" size=1 style="WIDTH: 100%"><%=PersonneltypeOperation.getOption()%></select></td>        
          <td align="right">户籍性质</td>
          <td><select name="hjxz" size=1 style="WIDTH: 100%">
						<%=RprtypeOperation.getOption() %>
						
						</select></td>
        </tr>
        <tr class="line2">
          <td  align="right">查询范围</td>
          <td class="line2"><select name="cxfw" size=1 style="WIDTH: 100%">
					<option value="dq" selected>当前</option>
					<option value="gd">归档</option>
					<option value="qb">全部</option>
          </select></td>  
      
          <td align="right">单位行业</td>
          <td><select name="industry" size=1 style="WIDTH: 100%">
						<%=IndustryOperation.getOption() %>
						
            </select></td>   
		</tr>
      </table>
      <TABLE width="100%" 
        border=0 cellPadding=0 cellSpacing=1 bordercolor="#9DCBEC" class="tablebody">
        <TR align="center"> 
          <TD align="center" class="line2"> 
            <input name="bc" type="submit" class="BUTTONs3" id="bc" value="查 询"  > 
            &nbsp; <INPUT name="qk" type="reset"class="BUTTONs3" value="取 消"> 
            &nbsp;&nbsp;</TD>
        </TR>
      </TABLE>
	 </td>
  </tr>
</table>
</form>
</body></html>
