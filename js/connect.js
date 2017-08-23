
var url  = "/frame/index.php?m=&c=Spot&a=show_map&id=";
var type = "post";
function Connect(callBack){
	var id   = $('input[name=id]').val()
	var type   = $('input[name=type]').val()
	data=null
	$.post(url+id+'&type='+type,{},function(reslut){
        callBack(reslut.data)
  	},"json");
 	
}