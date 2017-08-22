
var url  = "/frame/index.php?m=&c=Spot&a=show_map&id=";
var type = "post";
function Connect(callBack){
	var id   = $('input[name=id]').val()
	data=null
	$.post(url+id,{},function(reslut){
        callBack(reslut.data)
  	},"json");
 	
}