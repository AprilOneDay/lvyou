
$(document).ready(function() {     
        initBack()
        $('#imageFullScreen').smartZoom({'containerClass':'zoomableContainer'});        
        $('#topPositionMap,#leftPositionMap,#rightPositionMap,#bottomPositionMap').bind("click", moveButtonClickHandler);
        $('#zoomInButton,#zoomOutButton').bind("click", zoomButtonClickHandler);
        
        function zoomButtonClickHandler(e){
            var scaleToAdd = 0.5;
            if(e.target.id == 'zoomOutButton')
                scaleToAdd = -scaleToAdd;
            $('#imageFullScreen').smartZoom('zoom', scaleToAdd);
        }        
        function moveButtonClickHandler(e){
            var pixelsToMoveOnX = 0;
            var pixelsToMoveOnY = 0;
    
            switch(e.target.id){
                case "leftPositionMap":
                    pixelsToMoveOnX = 50; 
                break;
                case "rightPositionMap":
                    pixelsToMoveOnX = -50;
                break;
                case "topPositionMap":
                    pixelsToMoveOnY = 50; 
                break;
                case "bottomPositionMap":
                    pixelsToMoveOnY = -50;  
                break;
            }
            $('#imageFullScreen').smartZoom('pan', pixelsToMoveOnX, pixelsToMoveOnY);
        } 
       
});
function addClickEvent(){
     $("#pointerContainer").delegate(".pointer","click",function(){
        var _this=this
        getPointData(_this)
    })
     $(".m_info_e").click(function(){
         $("#pointerStyle").toggleClass("pointShow")
     })
    $("#pointerContainer").delegate(".pointer","touchstart",function(){
        var _this=this
        getPointData(_this)
    })
    $("#imagesMap").click(function(){
        $("#pointShow").removeClass("pointShow")
    })
    // $("#imgContainer").delegate(".imageFullScreen","touchup",function(){
    //     $(".pointShow").removeClass("pointShow")
    // })
}
// function getPointData(_this){
//     var parent=$(_this.parentNode)
//     var pointerContent=parent.attr("text")
//     var pointerImg=parent.attr("thumb")
//     var pointerUrl=parent.attr("url_t")
    
//     $(".text").text(pointerContent)
//     $(".m_info_t").css("background",'url('+pointerImg+')')
//     $(".m_info_t").css("background-size",'cover')
//     $($(".m_info_b a")[0]).attr("href",pointerUrl)
//     $("#pointerStyle").toggleClass("pointShow")
// }
function getPointData(_this){
    var parent=$(_this.parentNode)
    var pointerUrl=parent.attr("url_t")
    location.href=pointerUrl
}
// var testJSON={
//     a:{
//         lat:"50",
//         lng:"50",
//         thumb:"./static/images/bg1.png",
//         title:"光华梁式大宗祠",
//         url:"127.0.0.1:8080"
//     },
//     b:{
//          lat:"0",
//         lng:"0",
//         thumb:"./static/images/bg1.png",
//         title:"光华梁式大宗祠",
//         url:"127.0.0.1:8080"
//     },
//     c:{
//          lat:"90",
//         lng:"90",
//         thumb:"./static/images/bg1.png",
//         title:"光华梁式大宗祠",
//         url:"127.0.0.1:8080",
//         background:""
//     }
// }

function addPointerContainer(parent){
     Connect(function(res){
         var mockJSON=res
        var smartZoomPointerContainer=$("<div id='smartZoomPointerContainer'>")
        var pointerContainer=$("<div id='pointerContainer'>")
        // var data=turnPx()

        // pointerContainer.width(parseInt(data.width))
        // pointerContainer.height(parseInt(data.height))
        var target=$("#imageFullScreen")
        pointerContainer.width(parseInt(target.width()))
        pointerContainer.height(parseInt(target.height()))

        smartZoomPointerContainer.width(parent.width())
        smartZoomPointerContainer.height(parent.height())
        //parent.append(pointerContainer)
        smartZoomPointerContainer.append(pointerContainer)
        $("#imageFullScreen").append(pointerContainer)
        addPointer(mockJSON)
        adjustPointerPos()
        addClickEvent() 

    })
    
}
// function addPointerContainer(parent){

//         var mockJSON=testJSON
//         var smartZoomPointerContainer=$("<div id='smartZoomPointerContainer'>")
//         var pointerContainer=$("<div id='pointerContainer'>")
//         // var data=turnPx()

//         // pointerContainer.width(parseInt(data.width))
//         // pointerContainer.height(parseInt(data.height))
//         var target=$("#imageFullScreen")
//         pointerContainer.width(parseInt(target.width()))
//         pointerContainer.height(parseInt(target.height()))

//         smartZoomPointerContainer.width(parent.width())
//         smartZoomPointerContainer.height(parent.height())
//         //parent.append(pointerContainer)
//         smartZoomPointerContainer.append(pointerContainer)
//         $("#imageFullScreen").append(pointerContainer)
//         addPointer(mockJSON)
//         adjustPointerPos()
//         addClickEvent() 

    
// }
function changeImgSize(obj){
    var data=adjustToContainerMy()
    $(obj).width(data.width)
    $(obj).height(data.height)
}
function initBack(){
    var src=$("input[name=map]").val()
    $("#imageMap").src(src)
    $("#imageFullScreen").css("background-image","url("+src+")")
    //console.log($("#imageFullScreen").css("background-image"))
}
function addPointer(json){
    var parent=$("#pointerContainer")
    for(e in json){
        parent.append(createPoint(json[e]))
    }
    
}

function createPoint(obj){
    // var child=$("<div class='pointerDiv' style='transform:translate3d("+pos[0]+"em,"+pos[1]+"em, 0)''>\
    //                 <div class='pointerStyle'>\
    //                     <p>"+text+"</p>\
    //                 </div>\
    //                 <img src='./static/images/mark_roundns.png' class='pointer'>\
    //             </div>")
    // var dictY=["top:-22rem;","top:5rem;"] 
    // var dictX=["left:5rem;","left:-10rem;"]
    // var rightPos=[null,dictY[pos[1]>10?0:1]]
    // if(pos[1])
    //var data=turnPx()
    var pos=[parseInt(obj.lat),parseInt(obj.lng)]
    var url=obj.background?obj.background:"static/images/mark_roundns.png"
    //var pos=[parseInt(obj.lat)*parseInt(data.width)/100,parseInt(obj.lng)*parseInt(data.height)/100]
   //console.log(pos)
    var child=$("<div class='pointerDiv' style='left:"+pos[0]+"%;top:"+pos[1]+"%;' text="+obj.title+" url_t='"+obj.url+"' thumb='"+obj.thumb+"'>\
                   <svg version='1.1' id='Layer_1'  x='0px' y='0px' width='44px' height='54px' viewBox='0 0 44 54' enable-background='new 0 0 44 54' xml:space='preserve' class='pointer'>  <image id='image0' width='44' height='54' x='0' y='0'\
    xlink:href='data:image/png;base64,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' />\
                </div>")
    // var child=$("<div class='pointerDiv' style='left:"+pos[0]+"%;top:"+pos[1]+"%;' text="+obj.title+" url_t='"+obj.url+"' thumb='"+obj.thumb+"'>\
    //                <svg version='1.1' id='Layer_1' xmlns='http://www.w3.org/2000/svg' xmlns:xlink='http://www.w3.org/1999/xlink' x='0px' y='0px' width='44px' height='54px' viewBox='0 0 44 54' enable-background='new 0 0 44 54' xml:space='preserve'>  <image id='image0' width='44' height='54' x='0' y='0'\
    // xlink:href='data:image/png;base64,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' />\
    //                 <img src='"+url+"' class='pointer'>\
    //             </div>")
    // // var child=$("<div class='pointerDiv' style='transform:translate3d("+pos[0]+"rem,"+pos[1]+"rem, 0)' text="+text+"'>\
    //                 <img src='./static/images/mark_roundns.png' class='pointer'>\
    //             </div>")
    return child
}
function removePoint(){
    var pointers=$(".pointerDiv")
    for(var i =0;i<pointers.length;i++){
        $(pointers[i]).remove()
    }
}
function turnPx(){
    var targetElement=$("#imageFullScreen")
    var posData=targetElement.css("transform")
    var values = posData.split('(')[1].split(')')[0].split(',');
    var data={
        width:(targetElement.width()*values[0]).toFixed(2),
        height:(targetElement.height()*values[3]).toFixed(2)
    }
    return data
}
function adjustPointerPos(){
    if(!$("#pointerContainer")){
        return
    }

    var posData=$("#imageFullScreen").css("transform")

    if(!posData||posData=="none"){
        return
    }
    var values = posData.split('(')[1].split(')')[0].split(',');
    //$("#pointerContainer").css("transform","translate3d("+values[4]+"px, "+values[5]+"px, 0px)")
    //$("#pointerContainer").css("transform","translate3d("+values[4]+"px, "+values[5]+"px, 0px) scale3d("+values[0]+", "+values[3]+", 1)")
    //$("#pointerContainer").css("transform","translate3d("+values[4]+"px, "+values[5]+"px, 0px) scale3d("+values[0]+", "+values[3]+", 1)")
    // removePoint()
    // addPointer(mockJSON)
    // var nowZoom=$(".pointerDiv").css("zoom")
    // //console.log(nowZoom)

    nowZoom=(1/values[0])
    // nowZoom=nowZoom<=0.40?0.42:nowZoom
    // nowZoom=nowZoom>=4?3.95:nowZoom
    $(".pointerDiv").css("transform","scale3d("+nowZoom+","+nowZoom+",1)")
}
// function computeSelf(_this){

//  var flag=IsPC()
//  var size=getSize(_this)
//  var data=null
//  if(flag){
//      $(_this).width(size.x)
//      data={
//         x:size.x,
//         y:size.Cy
//      }
//  }else{
//      $(_this).height(size.y)
//      data={
//         x:size.Cx,
//         y:size.y
//      }
//  }
// }
function computeSelf(_this){
    var data=adjustToContainerMy()
    $(_this).width(data.width)
    $(_this).height(data.height)
    console.log(data)
}
function getSize(targetElement){
var winHeight,winWidth

winHeight =$(window).height();  
winWidth =$(window).width();

var scale=targetElement.width()/targetElement.height()
    
return {
     x:winWidth,
     y:winHeight,
     Cx:winHeight*scale,
     Cy:winWidth/scale
 }
}
function IsPC()  
{  
           var userAgentInfo = navigator.userAgent;  
           var Agents = new Array("Android", "iPhone", "SymbianOS", "Windows Phone", "iPad", "iPod");  
           var flag = true;  
           for (var v = 0; v < Agents.length; v++) {  
               if (userAgentInfo.indexOf(Agents[v]) > 0) { flag = false; break; }  
           }  
           return flag;  
}            
 function adjustToContainerMy(){
        
        var containerDiv = $("#smartZoomContainer"); // the zoom container 
        var originalSize = {width:$("#imageMap").width(),height:$("#imageMap").height()}; // target original size


        // get the zoomable container position from settings
        var parentOffset = containerDiv.parent().offset(); 
        //console.log(containerDiv)
        var containerDivNewLeft = getContainerDivPositionFromSettingsMy(0, parentOffset.left, containerDiv.parent().width());
        var containerDivNewTop = getContainerDivPositionFromSettingsMy("0", parentOffset.top, containerDiv.parent().height());
        containerDiv.offset({left: containerDivNewLeft, top: containerDivNewTop}); // apply position find
        containerDiv.width(getContainerDivSizeFromSettingsMy("100%", containerDiv.parent().width(), containerDivNewLeft - parentOffset.left)); // apply size found to zoomablecontainer 
        
        containerDiv.height(getContainerDivSizeFromSettingsMy("100%", containerDiv.parent().height(), containerDivNewTop - parentOffset.top));
        var containerRect = getRectMy(containerDiv); // get the rectangle from the new containerDiv position and size
        //console.log(originalSize)
        //console.log(containerRect)

        var scaleToFit =Math.max(containerRect.width/originalSize.width, containerRect.height/originalSize.height).toFixed(2); // scale to use to include the target into containerRect
        var maxScaleToFit=Math.min(Math.min(containerRect.width/originalSize.width, containerRect.height/originalSize.height), 1).toFixed(2);
        var newWidth = originalSize.width * scaleToFit; // we could now find the new size
        var newHeight = originalSize.height * scaleToFit;

        return {
                width:newWidth,
                height:newHeight
                }
    }
    function getContainerDivPositionFromSettingsMy(settingsValue, zoomableContainerParentPosValue, zoomableContainerParentSizeValue){
        if(settingsValue.search && settingsValue.search("%") != -1)
            return zoomableContainerParentPosValue + zoomableContainerParentSizeValue * (parseInt(settingsValue)/100);
        else
            return zoomableContainerParentPosValue + parseInt(settingsValue);
    }
    function getContainerDivSizeFromSettingsMy(settingsValue, zoomableContainerParentValue, divPosDiff){
        if(settingsValue.search && settingsValue.search("%") != -1)
            return (zoomableContainerParentValue - divPosDiff)* (parseInt(settingsValue)/100);
        else
            return parseInt(settingsValue);
    }
    function getRectMy(jqObject) {
        var offset = jqObject.offset();
        if(!offset)
            return null;
        var formX = offset.left;
        var formY = offset.top; 
        return {'x':formX, 'y':formY, 'width':jqObject.outerWidth(), 'height':jqObject.outerHeight()};
    }