<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>普通地图&全景图</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=4qXTGvclMqTZXkLsU3twnMA7"></script>
</head>

<body>
<div id="panorama"></div>
<div id="normal_map"></div>
<style type="text/css">
body, html{width: 90%;height: 90%;overflow: hidden;margin:0;}
#panorama {height: 50%;overflow: hidden;}
#normal_map {height:50%;overflow: hidden;}
</style>
<script type="text/javascript">
//全景图展示
var panorama = new BMap.Panorama('panorama');
panorama.setPosition(new BMap.Point(116.353997,40.066124)); //根据经纬度坐标展示全景图
panorama.setPov({heading: -40, pitch: 6});

panorama.addEventListener('position_changed', function(e){ //全景图位置改变后，普通地图中心点也随之改变
    var pos = panorama.getPosition();
    map.setCenter(new BMap.Point(pos.lng, pos.lat));
    marker.setPosition(pos);
});


//普通地图展示
var mapOption = {
        mapType: BMAP_NORMAL_MAP,
        maxZoom: 18,
        drawMargin:0,
        enableFulltimeSpotClick: true,
        enableHighResolution:true
    }
var map = new BMap.Map("normal_map", mapOption);
var testpoint = new BMap.Point(116.353997,40.066124);
map.centerAndZoom(testpoint, 18);
var marker=new BMap.Marker(testpoint);
marker.enableDragging();
map.addOverlay(marker);  
marker.addEventListener('dragend',function(e){
    panorama.setPosition(e.point); //拖动marker后，全景图位置也随着改变
    panorama.setPov({heading: -40, pitch: 6});}
);

</script>
</body>
</html>