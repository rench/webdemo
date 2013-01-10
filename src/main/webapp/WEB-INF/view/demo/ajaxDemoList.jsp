<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>best dialog demo</title>
<%@include file="../includes/commonHead.jsp" %>

<script type="text/javascript" >
$(document).ready(function() {
	
	//查询
	$("#ajaxQueryBtn").click(function(){
		$("#demoList").jqGrid('setGridParam',{postData:$('#demoForm').serializeObject()}).trigger('reloadGrid'); 
	});
	
	//deal query result
	function processQuerySuccess(data){
		alert("processQuerySuccess");
	};
    
	var rownumIndex = 1;
	$("#demoList").bind("gridComplete",function(){
		rownumIndex = 1;
	});
	$("#demoList").txGrid({
		type: 'ajaxList',
		caption: 'ajax demo 列表',
		url:'${contextPath}/bestDemo/ajax/ajaxQueryDemoList',
		mtype: "GET", //如果查询逻辑与具体当前登录人员信息相关，就建议使用POST
		rownumbers: true, //显示行号
	   	multiselect: true, //支持多选
	   	multiboxonly: true, //显示多选checkbox
		height: function(reccount){
			return reccount < 10 ? 'auto' : 255;
		},
		//列显示名称，是一个数组对象
	   	colNames:['id','自定义行号','登录名', '显示整数','显示为金额','电子邮箱','姓名(+登+截取)','最后更新时间(时间id排序)','自定义格式时间'],
	   	//name 列显示的名称,index 传到服务器端用来排序用的列名称,width 列宽度
	   	//align 对齐方式；sortable  是否可以排序
	   	colModel:[
	   	    //align string left, center, right.
	   	    //隐藏的id列
	   		{name:'id',index:'id', width:'40',hidden:true},
	   		//小小小
	   		{name:'rownum',width:'40',formatter:function(cellvalue, options, rowObject){
					return rownumIndex++;
		   		}},
	   		//xxxx：	
	   		{name:'loginName',index:'id asc,loginName',search:true,sortable:true},
	   		//可排序，显示为整数
	   		{name:'testIntegerObj',index:'testIntegerObj',align:"right",sortable:true,formatter:"integer",formatoptions:{thousandsSeparator:","}},
	   		//显示为金额，如果为其他字段辅助判断可以自定义formatter
	   		{name:'testBigDecimal',index:'testBigDecimal',formatter:"currency",formatoptions:{prefix:"$",thousandsSeparator:","},sortable:true},
	   		//显示在右边，并添加email的连接
	   		{name:'email',index:'email',align:"right",formatter:"email"},
	   		//var opts= {rowId: rowId, colModel:cm, gid:ts.p.id, pos:colpos };cm.formatter.call(ts,cellval,opts,rwdat,_act);
	   		//这里rowObject即返回数据的本行的json对象
	   		//截取字符的一部分
	   		{name:'name',search:true,formatter:function(cellvalue, options, rowObject){
	   			var newName = cellvalue + ":" + rowObject['loginName'];
	   			return "<span title='" + newName + "'>" + $.subString(newName,10,'...') + "</span>";
	   		},beforeFormatterTitle:true},
	   		//显示title
	   		{name:'lastUpdateDate',index:'id,lastUpdateDate',formatter:'date',width:150,sortable:true,title:true},
	   		{name:'createDate',formatter:'date',formatoptions: {newformat:'Y-m-d'},width:120}		
	   	],
	});
	
	$("#add").click(function(){
		DialogUtils.openDialog({
			id : "addDemoDialog",
			title : "增加demo",
			contentUrl: "${contextPath}/bestDemo/toAddDemo",
			modal: true,
			height: $("body").height(),
			width: $("body").width(),
			resizable: false,
			draggable: false,
			captionButtons: {
	            pin: {visible: false, click: self.pin, iconClassOn: 'ui-icon-pin-w', iconClassOff:'ui-icon-pin-s'},
	            refresh: {visible: false, click: self.refresh, iconClassOn: 'ui-icon-refresh'},
	            toggle: {visible: false, click: self.toggle, iconClassOn: 'ui-icon-carat-1-n', iconClassOff:'ui-icon-carat-1-s'},
	            minimize: {visible: false, click: self.minimize, iconClassOn: 'ui-icon-minus'},
	            maximize: {visible: false, click: self.maximize, iconClassOn: 'ui-icon-extlink'},
	            close: {visible: true, iconClassOn: 'ui-icon-close'}
	        }
		});
		$("addDemoDialog").wijdialog("maximize");
		var _winResizeForDialogTimer = null;
		$(window).resize(function(event){
			if(_winResizeForDialogTimer != null){
				clearTimeout(_winResizeForDialogTimer);
			}
			_winResizeForDialogTimer = setTimeout(function(){
				$("addDemoDialog").wijdialog("maximize");
			},100);
		})
	});
});
</script>
<style type="text/css">
.select{
	height: 14px;
	padding-top: 0px;
	padding-buttom: 0px;
}
</style>
</head>
<body>
<form:form method="post" id="demoForm" modelAttribute="demoForm">

<!-- query condition -->
<div class="ui-widget-content form-table">
	<div class="grid-12-12">
		<div class="grid-1-12">姓名:</div>
		<div class="grid-3-12"><input name="name" type="text" value='<c:out value="${name }"></c:out>'/></div>
		<div class="grid-1-12">数字:</div>
		<div class="grid-3-12"><input name="number" type="text" value='<c:out value="${number }"></c:out>'/></div>
		<div class="grid-4-12">
			<button type="button" id="ajaxQueryBtn" ptype="query">查询</button>
		</div>
	</div>
</div>
<br/>
<br/>

<!-- grid -->
<div class="list-table">
	<table id="demoList">
	</table>
	<div id="demoListPager"></div>
	<div class="operRow">
		<button id="add" type="button" ptype="add">增加</button>
		&nbsp;&nbsp;
		<button id="del" type="button" ptype="del">删除</button>
		&nbsp;&nbsp;
		<button id="refresh" type="button" ptype="refresh">刷新</button>
		&nbsp;&nbsp;
		<button id="modify" type="button" ptype="modify">编辑</button>
	</div>
</div>

</form:form>
</body>
</html>