
<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" language="java" %>
<script>
    $(function(){
        $.post('${pageContext.request.contextPath}/city/queryById',{"id":"${param.id}"},function (city) {
            $('#CityId').val(city.id);
            $('#CityName').textbox({
                value:city.name,
            });
            $.post("${pageContext.request.contextPath}/province/queryAll1",function(province1){
                    $.each(province1,function (i,province) {
                        var $option = $('<option></option>');
                        $option.prop("value",province.id).prop("text",province.name);
                        if(city.province.id==province.id){
                            $option.prop("selected",true) ;
                        }
                        $('#province_sel').append($option);
                    });
                    $('#province_sel').combobox({
                        width:175,
                        required:true,
                        multiple:false,
                    })
            },"JSON");
        },'JSON');


    });
</script>
<div style="text-align: center">
    <form method="post" class="easyui-form" id="CityFf">
        <div style="margin-top: 30px"><input type="hidden" data-options="required:true" id="CityId" name="id"></div>
        <div style="margin-top: 30px">市名：<input class="easyui-textbox" data-options="required:true" id="CityName" name="name" ></div>
        <div style="margin-top: 30px">所属省：<select id="province_sel"></select></div>
    </form>
</div>
