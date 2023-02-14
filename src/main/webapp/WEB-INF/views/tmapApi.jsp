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


        <div id="map_div" style="width:1210px; height:750px; padding-top:5px;">

        </div>
        <button onClick="loadGetAddressFromLonLat()">주소로 선긋기</button>
    </div>




</body>



<head>
    <script
            src="//code.jquery.com/jquery-3.2.1.min.js"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>배송지역 미리보기</title>

    <script src="https://apis.openapi.sk.com/tmap/jsv2?version=1&appKey=0de9ecde-b87c-404c-b7f8-be4ed7b85d4f"></script>
    <script type="text/javascript">

        var map,marker;
        var list;
        // 페이지가 로딩이 된 후 호출하는 함수입니다.
        function initTmap(){
            // map 생성
            // Tmapv2.Map을 이용하여, 지도가 들어갈 div, 넓이, 높이를 설정합니다.
            map = new Tmapv2.Map("map_div", { // 지도가 생성될 div
                center : new Tmapv2.LatLng(35.859644221599574, 128.53585826499167),
                width : "1210px",	// 지도의 넓이
                height : "750px",	// 지도의 높이
                zoom : 12
            });

            // 장보고 식자재마트 본사 마커
            marker = new Tmapv2.Marker({
                position: new Tmapv2.LatLng(35.859644221599574, 128.53585826499167), //Marker의 중심좌표 설정.
                icon:"https://jangbogovrp.web.app/images/makers/marker_green.png",
                map: map //Marker가 표시될 Map 설정..
            });





        }

        function loadGetAddressFromLonLat() {
            // TData 객체 생성
            var tData = new Tmapv2.extension.TData();

            var optionObj = {
                coordType: "WGS84GEO"       //응답좌표 타입 옵션 설정 입니다.
            };

            var params = {
                onComplete:onComplete,      //데이터 로드가 성공적으로 완료 되었을때 실행하는 함수 입니다.
                onProgress:onProgress,      //데이터 로드 중에 실행하는 함수 입니다.
                onError:onError             //데이터 로드가 실패했을때 실행하는 함수 입니다.
            };


            // TData 객체의 지오코딩 함수
            for(var i=0; i<3; i++){
                if(i==0){
                    tData.getGeoFromAddressJson("대구", "달서구", "상인", "273", optionObj, params);
                }else if(i==1){
                    tData.getGeoFromAddressJson("대구", "달서구", "효목", "13-1", optionObj, params);
                }else{
                    tData.getGeoFromAddressJson("대구", "서구", "중리", "711-37", optionObj, params);
                }

            }



            }

        //지오코딩
        function onComplete() {
            console.log(this._responseData); //json으로 데이터를 받은 정보들을 콘솔창에서 확인할 수 있습니다.

            var lon = this._responseData.coordinateInfo.lon;//json으로 데이터를 받은 정보에서 경도정보를 추출합니다.
            var lat = this._responseData.coordinateInfo.lat;//json으로 데이터를 받은 정보에서 위도정보를 추출합니다.

            var marker = new Tmapv2.Marker({
                position : new Tmapv2.LatLng(lat, lon)
            });

            marker.setMap(map);

            // map.setCenter(new Tmapv2.LatLng(lat, lon)); 해당 좌표로 중심점 이동



        }

        //데이터 로드중 실행하는 함수입니다.
        function onProgress(){

        }

        //데이터 로드 중 에러가 발생시 실행하는 함수입니다.
        function onError(){
            alert("onError");
        }




    </script>

</head>


</html>