$('#imageFullScreen').width()
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
        var pointerContent=$(_this.parentNode).attr("text")
        $(".text").text(pointerContent)
        $("#pointerStyle").toggleClass("pointShow")
    })
     $(".m_info_e").click(function(){
         $("#pointerStyle").toggleClass("pointShow")
     })
    // $("#pointerContainer").delegate(".pointer","touchstart",function(){
    //     var _this=this
    //     var pointerContent=$(_this.parentNode).find(".pointerStyle")
    //     pointerContent.toggleClass("pointShow")
    // })
    $("#imagesMap").click(function(){
        $("#pointShow").removeClass("pointShow")
    })
    // $("#imgContainer").delegate(".imageFullScreen","touchup",function(){
    //     $(".pointShow").removeClass("pointShow")
    // })
}
var mockJSON={
    a:{
        pos:[150,150],
        text:"测试文字A"
    },
    b:{
        pos:[300,150],
         text:"测试文字B"
    },
    c:{
        pos:[240,210],
         text:"测试文字C"
    }
}

function addPointerContainer(parent){
    var pointerContainer=$("<div id='pointerContainer'>")
    parent.append(pointerContainer)
    addPointer(mockJSON)
    adjustPointerPos()
}
function addPointer(json){
    var parent=$("#pointerContainer")
    for(e in json){
        parent.append(createPoint(json[e].pos,json[e].text))
    }
}

function createPoint(pos,text){
    // var child=$("<div class='pointerDiv' style='transform:translate3d("+pos[0]+"em,"+pos[1]+"em, 0)''>\
    //                 <div class='pointerStyle'>\
    //                     <p>"+text+"</p>\
    //                 </div>\
    //                 <img src='/static/images/mark_roundns.png' class='pointer'>\
    //             </div>")
    var dictY=["top:-22rem;","top:5rem;"] 
    var dictX=["left:5rem;","left:-10rem;"]
    var rightPos=[null,dictY[pos[1]>10?0:1]]
    // if(pos[1])
    var child=$("<div class='pointerDiv' style='transform:translate3d("+pos[0]+"rem,"+pos[1]+"rem, 0)' text="+text+"'>\
                    <img src='/static/images/mark_roundns.png' class='pointer'>\
                </div>")
    return child
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
    $("#pointerContainer").css("transform","translate3d("+values[4]+"px, "+values[5]+"px, 0px) scale3d("+values[0]+", "+values[3]+", 1)")
    var nowZoom=$(".pointerDiv").css("zoom")
    //console.log(nowZoom)
    nowZoom=(1/values[0])
    nowZoom=nowZoom<=0.5?0.55:nowZoom
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
        var originalSize = {width:$("#imagesMap").width(),height:$("#imagesMap").height()}; // target original size


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