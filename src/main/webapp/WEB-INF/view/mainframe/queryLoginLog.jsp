<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>queryLoginLog</title>
<%@include file="../includes/commonHead.jsp" %>
<script type="text/javascript" >
var dataGrid = null;
$(document).ready(function(){
	dataGrid = $('#serviceLogTable').datagrid({
		url : '${contextPath}/servicelog/mainframe/loginLog/queryLoginLogPagedList.action',
		fit : true,
		fitColumns : true,
		border : false,
		pagination : true,
		idField : 'id',
		pageSize : 10,
		pageList : [ 10, 20, 30, 40, 50 ],
		sortName : 'createDate',
		sortOrder : 'desc',
		checkOnSelect : false,
		selectOnCheck : false,
		nowrap : false,
		striped : true,
		rownumbers : true,
		singleSelect : true,
		frozenColumns : [ [ {
			field : 'id',
			title : '编号',
			width : 150,
			hidden : true
		}, {
			field : 'createDate',
			title : '操作员id',
			width : 80
		}, {
			field : 'vcid',
			title : '虚中心id',
			width : 80
		} , {
			field : 'operatorId',
			title : '操作员id',
			width : 80
		}, {
			field : 'organizationId',
			title : '组织id',
			width : 80
		}] ],
		columns : [[ {
			field : 'message',
			title : '日志信息',
			width : 150,
			sortable : true
		}, {
			field : 'modifydatetime',
			title : '最后修改时间',
			width : 150,
			sortable : true
		}, {
			field : 'typeId',
			title : 'BUG类型ID',
			width : 150,
			hidden : true
		}
		]],
		toolbar : '#toolbar',
		onLoadSuccess : function() {
			$('#searchForm table').show();
			parent.$.messager.progress('close');

			$(this).datagrid('tooltip');
		},
		onRowContextMenu : function(e, rowIndex, rowData) {
			e.preventDefault();
			$(this).datagrid('unselectAll');
			$(this).datagrid('selectRow', rowIndex);
			$('#menu').menu('show', {
				left : e.pageX,
				top : e.pageY
			});
		}
	});
});
</script>
</head>
<body>
<div class="easyui-layout" data-options="fit : true,border : false">
	<div data-options="region:'north',title:'查询条件',border:false" style="height: 160px; overflow: hidden;">
		<form id="searchForm" class="form">
			<table class="table table-hover table-condensed">
				<tr>
					<th>开始时间</th>
					<td>
						<input name="minCreateDate" readonly="readonly"
							placeholder="点击选择时间" onclick="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd HH:mm:ss'})" />
					</td>
					<th>结束时间</th>
					<td>
						<input name="maxCreateDate" readonly="readonly"
							placeholder="点击选择时间" onclick="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd HH:mm:ss'})" />
					</td>
				</tr>
			</table>
		</form>
	</div>
	<div data-options="region:'center',border:false">
		<table id="serviceLogTable"></table>
    </div> 
</div> 

<div id="toolbar" style="display: none;"> 
	<a onclick="" href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'transmit'">刷新</a>
</div>
</body>