
<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" language="java" %>
<script>
    $(function(){
        $.post('${pageContext.request.contextPath}/counter/queryById',{"id":"${param.id}"},function (counter) {
            $('#idCounter').val(counter.id);
            $('#countCounter').textbox({
                value:counter.count,
            });
            $('#nameCounter').textbox({
                value:counter.name,
            });
            $.post("${pageContext.request.contextPath}/record/queryAll1",function(record1){
                $.each(record1,function (i,record) {
                    var $option = $('<option></option>');
                    $option.prop("value",record.id).prop("text",record.name);
                    if(counter.record.id==record.id){
                        $option.prop("selected",true) ;
                    }
                    $('#record_sel').append($option);
                });
                $('#record_sel').combobox({
                    width:175,
                    required:true,
                    multiple:false,
                })
            },"JSON");
        },'JSON');
    });
</script>
<div style="text-align: center">
    <form method="post" class="easyui-form" id="ffCounter">
        <div style="margin-top: 30px"><input type="hidden" data-options="required:true" id="idCounter" name="id"></div>
        <div style="margin-top: 30px">计数器名：<input class="easyui-textbox" data-options="required:true" id="nameCounter" name="name" ></div>
        <div style="margin-top: 30px">计数器名：<input class="easyui-textbox" data-options="required:true" id="countCounter" name="count" ></div>
        <div style="margin-top: 30px">所属记录：<select id="record_sel" name="record.id"/></div>

    </form>
</div>
