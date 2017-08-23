// var backImgSrc=""

// initBack(backImgSrc)


$(document).ready(function() {     

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
// function initBack(src){
//     $("#imageFullScreen").css("background","url("+src+")")
//     console.log($("#imageFullScreen").css("background"))
// }
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
    //var pos=[parseInt(obj.lat)*parseInt(data.width)/100,parseInt(obj.lng)*parseInt(data.height)/100]
   //console.log(pos)
    var child=$("<div class='pointerDiv' style='left:"+pos[0]+"%;top:"+pos[1]+"%;' text="+obj.title+" url_t='"+obj.url+"' thumb='"+obj.thumb+"'>\
                    <img src='"+obj.background+"' class='pointer'>\
                </div>")
    // var child=$("<div class='pointerDiv' style='transform:translate3d("+pos[0]+"rem,"+pos[1]+"rem, 0)' text="+text+"'>\
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
    nowZoom=nowZoom<=0.4?0.45:nowZoom
    nowZoom=nowZoom>=4?3.95:nowZoom
    $(".pointerDiv").css("zoom",nowZoom)
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