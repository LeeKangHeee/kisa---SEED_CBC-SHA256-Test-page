<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<body id="root" style="margin: 0; background-color: #f4f6f8" onload="initTmap()"><!-- 맵 생성 실행 -->


<%@include file="header.jsp"%>
<%@include file="side_type.jsp"%>

    <div class="high-top" style="margin-left: 250px; padding-left: 20px; padding-bottom: 20px;">

        <div style="padding-top: 20px; font-size: 12px; color: #546e7a;">자동 배차 및 미리보기</div>

        <div style="padding-left:8px; padding-top: 2px; ">
            <div>배차일자</div>
            <div>
                <input aria-invalid="false" type="text" name="startDate" style="width: 200px; height: 30px;">
                <button  onclick="location.href='/preview'" style="background-color:#f4f6f8; border: white; cursor:pointer; ">
                    <img src="../../images/startButton.png">
                </button>
            </div>


        </div>


        <div id="map_div" style="width:1210px; height:750px; padding-top:5px;"></div>

    </div>




</body>



<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>배송지역 미리보기</title>

    <script src="https://apis.openapi.sk.com/tmap/jsv2?version=1&appKey=비공개^^"></script>
    <script type="text/javascript">
        // 페이지가 로딩이 된 후 호출하는 함수입니다.
        function initTmap(){
            // map 생성
            // Tmapv2.Map을 이용하여, 지도가 들어갈 div, 넓이, 높이를 설정합니다.
            var map = new Tmapv2.Map("map_div", { // 지도가 생성될 div
                center : new Tmapv2.LatLng(35.859644221599574, 128.53585826499167),
                width : "1210px",	// 지도의 넓이
                height : "750px",	// 지도의 높이
                zoom : 12
            });

            // 장보고 식자재마트 본사 마커
            var marker = new Tmapv2.Marker({
                position: new Tmapv2.LatLng(35.859644221599574, 128.53585826499167), //Marker의 중심좌표 설정.
                icon:"https://jangbogovrp.web.app/images/makers/marker_green.png",
                map: map //Marker가 표시될 Map 설정..
            });

        }




    </script>

</head>


</html>