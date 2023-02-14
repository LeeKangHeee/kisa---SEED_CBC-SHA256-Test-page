<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  <title>simpleMap</title>
  <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
  <script src="https://apis.openapi.sk.com/tmap/jsv2?version=1&appKey=0de9ecde-b87c-404c-b7f8-be4ed7b85d4f"></script>
  <script type="text/javascript">

    var map;
    var marker_s, marker_e,marker;

    //경로그림정보
    var drawInfoArr = [];


    function initTmap(){

      // 1. 지도 띄우기
      map = new Tmapv2.Map("map_div", {
        center: new Tmapv2.LatLng(35.859644221599574, 128.53585826499167),
        width : "1210px",
        height : "750px",
        zoom : 12,
        zoomControl : true,
        scrollwheel : true
      });

      // 시작, 도착 심볼찍기
      // 시작 + 도착지 - 장보고 고객 배송센터
      marker_s = new Tmapv2.Marker({
        position : new Tmapv2.LatLng(35.859644221599574, 128.53585826499167),
        icon : "https://jangbogovrp.web.app/images/makers/marker_green.png",
        iconSize : new Tmapv2.Size(24, 38),
        map:map
      });

      var json = new Object();
      var jsonArray = new Array();


      json.lat ="35.849644221599574";
      json.lot ="128.83585826499167";
      jsonArray.push(json);
      json={};

      json.lat ="35.839644221599574";
      json.lot ="128.93585826499167";
      jsonArray.push(json);
      json={};

      json={};
      json.lat ="35.809644221599574";
      json.lot ="128.23585826499167";
      jsonArray.push(json);
      json={};


      json.lat ="35.829644221599574";
      json.lot ="128.13585826499167";
      jsonArray.push(json);
      json={};

      console.log(jsonArray);
      //var sJson = JSON.stringify(jsonArray);


      for(var i =0; i<jsonArray.length; i++){
        marker = new Tmapv2.Marker({
          position : new Tmapv2.LatLng(jsonArray[i].lat, jsonArray[i].lot),
          icon : "https://jangbogovrp.web.app/images/makers/marker_22.png",
          iconSize : new Tmapv2.Size(24, 38),
          map:map
        });
      }


      var headers = {};
      headers["appKey"]="0de9ecde-b87c-404c-b7f8-be4ed7b85d4f";
      var viaPoints ={};


      $.ajax({
        type:"POST",
        headers : headers,
        url:"https://apis.openapi.sk.com/tmap/routes/routeOptimization30?version=1&format=json",//
        async:false,
        contentType: "application/json",
        data: JSON.stringify({
          "reqCoordType": "WGS84GEO",
          "resCoordType" : "EPSG3857",
          "startName": "출발",
          "startX": "128.53585826499167",
          "startY": "35.859644221599574",
          "startTime": "201711121314",
          "endName": "도착",
          "endX": "128.53585826499167",
          "endY": "35.859644221599574",
          "searchOption" : "0",
          "viaPoints": [
            {
              "viaPointId": "test01",
              "viaPointName": "test01",
              "viaX": "128.83585826499167",
              "viaY": "35.849644221599574",
            },
            {
              "viaPointId": "test02",
              "viaPointName": "test02",
              "viaX": "128.93585826499167",
              "viaY": "35.839644221599574",
            },
            {
              "viaPointId": "test03",
              "viaPointName": "test03",
              "viaX": "128.23585826499167",
              "viaY": "35.809644221599574",
            },
            {
              "viaPointId": "test04",
              "viaPointName": "test04",
              "viaX": "128.13585826499167",
              "viaY": "35.829644221599574",
            }
          ]
        }),
        success:function(response){
          var resultData = response.properties;
          var resultFeatures = response.features;


          // 결과 출력
          var tDistance = "총 거리 : " + (resultData.totalDistance/1000).toFixed(1) + "km,  ";
          var tTime = "총 시간 : " + (resultData.totalTime/60).toFixed(0) + "분,  ";
          var tFare = "총 요금 : " + resultData.totalFare + "원,  ";
          var countOrder = "배송 건수 : " + jsonArray.length + "건,  ";
          var driverName = "기사 이름 : " + "홍길동"


          $("#result").text(tDistance+tTime+tFare+countOrder+driverName);

          for(var i in resultFeatures) {
            var geometry = resultFeatures[i].geometry;
            var properties = resultFeatures[i].properties;
            var polyline_;

            drawInfoArr = [];

            if(geometry.type == "LineString") {
              for(var j in geometry.coordinates){
                // 경로들의 결과값(구간)들을 포인트 객체로 변환
                var latlng = new Tmapv2.Point(geometry.coordinates[j][0], geometry.coordinates[j][1]);
                // 포인트 객체를 받아 좌표값으로 변환
                var convertPoint = new Tmapv2.Projection.convertEPSG3857ToWGS84GEO(latlng);
                // 포인트객체의 정보로 좌표값 변환 객체로 저장
                var convertChange = new Tmapv2.LatLng(convertPoint._lat, convertPoint._lng);

                drawInfoArr.push(convertChange);
              }

              polyline_ = new Tmapv2.Polyline({
                path : drawInfoArr,
                strokeColor : "#ffe600",
                strokeWeight: 6,
                map : map
              });
            }
          }
        },
        error:function(request,status,error){
          console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
        }
      });
    }



    /**
     *  도로명주소 -> 지번주소 변환 -> 지오코딩
     */
    function addressChanger(){
      var headers = {};
      headers["appKey"]="0de9ecde-b87c-404c-b7f8-be4ed7b85d4f";

      $.ajax({
        method:"GET",
        headers : headers,
        url:"https://apis.openapi.sk.com/tmap/geo/convertAddress?version=1&format=json&callback=result", //주소변환 api 요청 url입니다.
        async:false,
        data:{
          //주소검색 방법
          //NtoO : 새주소 -> 구주소 변환 검색
          //OtoN : 구주소(법정동) -> 새주소 변환 검색
          "searchTypCd" : "NtoO",
          "reqAdd" : "서울시 마포구 와우산로 29가길 69"//변환요청 주소
        },
        //데이터 로드가 성공적으로 완료되었을 때 발생하는 함수입니다.
        success:function(response){
          var resultConvertAdd = response.ConvertAdd;

          var upperDistName = resultConvertAdd.upperDistName;
          var middleDistName = resultConvertAdd.middleDistName;
          var legalLowerDistName = resultConvertAdd.legalLowerDistName;
          var legalDetailName = resultConvertAdd.legalDetailName;
          var primary = resultConvertAdd.primary;
          var secondary = resultConvertAdd.secondary;

          $('#resultAddr').val(upperDistName+" "+middleDistName+" "+legalLowerDistName+" "+legalDetailName+" "+primary+"-"+secondary);
        },
        //요청 실패시 콘솔창에서 에러 내용을 확인할 수 있습니다.
        error:function(request,status,error){
          console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
        }
      });
    }











  </script>







<body id="root" style="margin: 0; background-color: #f4f6f8" onload="initTmap()"><!-- 맵 생성 실행 -->


  <p id="result"></p>
  <div id="map_wrap" class="map_wrap">
  <div id="map_div" style="width:1210px; height:750px; padding-top:5px;">
  </div>
  </div>

</div>




</body>












</html>