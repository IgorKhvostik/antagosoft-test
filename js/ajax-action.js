$(function(){
    var form = $('form[name="set_address_form"]');
    var city = form.find('[name="city_id"]');
    var area = form.find('[name="area_id"]');
    var myAddressArea = $('#my_address_area');

    load_city(city);

    city.on("change",function(){
        load_area($(this).val(),area);
    });

    get_my_address(myAddressArea);

    $(document).on("click",'.bcross[data-id]', function(){
        delete_address($(this).attr("data-id"));
    });
});

function load_city($selector){
    $.getJSON('/ajax-action.php',{'action':'getCity'},function(data){
        changeSelect($selector,data)
    });
}

function load_area(city_id,$selector){
    $.getJSON('/ajax-action.php',{'action':'getArea','city_id':city_id},function(data){
        changeSelect($selector,data)
    });
}

function get_my_address($selector){
    $.post('/ajax-action.php',{'action':'getMyAddress'},function (data) {
        $selector.html(data);
    });
}

function changeSelect($selector,data){
    $selector.find("option:not([value='0'])").remove();
    $.each(data,function(key, value){
        var option = $('<option/>').attr('value',key).text(value);
        $selector.append(option);
    });
}

function delete_address(id){
    if(confirm("Are you sure ?")){
        $.post('/ajax-action.php',{'action':'delete','id':id},function (data) {

            get_my_address($('#my_address_area'));
        });
    }
}

