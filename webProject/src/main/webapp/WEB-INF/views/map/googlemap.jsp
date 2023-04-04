<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="container">
<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCQqHwm75xj0zOtfhA5ZgyOlFF7_en12OY&callback=initMap"></script>
<style>
	#roadView{
		width:100%; height:800px; border:2px solid #ddd; 
	}
	#search{
		position:absolute;
		top:50px;
		left:45%;
	}
	#searchList{
		border:1px solid gray;
		background:#ddd; 
		opacity:0.8;
		position:absolute;
		width:300px;
		height:600px;
		top:150px;
		left:50px;
		overflow:scroll;
	}
	.c{
		background:white; margin:5px; font-size:0.8em; font-weight:bold; padding:5px;
	}
</style>
<body>
<div id='gMap'>
	<div id='roadView'></div> <!-- 요기에 지도나와 -->
	<div id='search'>
		<input type='text' id='address' name='address' value='잠실역'/>
		<input type='button' id='geoSubmit' name='geoSubmit' value='geoCode' onclick='geocodeAddress()'/>
	</div>
	<div id='searchList'></div>	
</div>
<script>
	var latitude = 37.5729503;
	var longitude = 126.9793578;
	var map; //map, geoCoder을 searchAddress에서도 사용해야해서 밖에서 선언
	var geoCoder;
	function initMap(){
		
		var myCenter = new google.maps.LatLng(latitude, longitude);
		var option = {
				center : myCenter,
				zoom : 12,
				mapTypeId : google.maps.MapTypeId.ROADMAP
		}				//구글지도객체
		map = new google.maps.Map(document.getElementById('roadView'), option);
		
		//지오코드 객체 만들기
		geoCoder = new google.maps.Geocoder();
		
	}
	//입력받은 검색어로 지도정보 표시하기
	function searchAddress(addr){
		//alert('검색어 위치로 이동함.'+addr); //확인
		
		//전달받은 검색어를 이용하여 주소정보찾기
		//만든 변수.		
		geoCoder.geocode({'address':addr} //검색어
						,function(results, status){ //results : 지도 찾은 정보, status : 성공여부(OK면 주소가 있다), ZERO_RESULTS
							console.log(status, results);
							if(status=='OK'){//주소찾음
								//주소로 위치 이동
								//위도, 경도			//순서대로(점점 안으로 들어가는) f12눌러서 console의 results보기 맨마지막 괄호는 함수(f)라는!
								var la = results[0]['geometry']['location']['lat'](); //json표기법1
								var lng = results[0]['geometry']['location']['lng']();
								//주소(추가로 회색박스에 정보 넣기로 했으니깐)
								//var searchAddr = results[0]['formatted_address'];
								//var searchAddr;
								//if(results)
								var searchAddr = results[0].address_components[3].long_name;
									searchAddr += " "+results[0].address_components[2].long_name;
									searchAddr += " "+results[0].address_components[1].long_name;
									searchAddr += " "+results[0].address_components[0].long_name;
								
								//찾은 위치로 지도의 센터 위치 변경하기
								map.setCenter(results[0].geometry.location); //json표기법2 location안에 위도경도정보 다있으니깐 location까지
								
								//마커만들기
								var marker = new google.maps.Marker({
									map:map,
									icon:'gmap_pin.png',
									title: searchAddr.substring(5), //말풍선도움말 ****.substring()의미찾아보기
									position: results[0].geometry.location //마커위치
								});
								
								//회색 박스안에 또 div에서넣어야
								var mapInfo = "<div class='c'>위도 : "+ la;
								mapInfo += "<br/>경도 : "+ lng;
								mapInfo += "<br/>주소 : "+ searchAddr+"</div>";
																					//누적되게
								document.getElementById('searchList').innerHTML = document.getElementById('searchList').innerHTML + mapInfo;
								
								//마커를 마우스 오버하면 대화상자 보여주기/벗어나면없어지기(이벤트처리)	
								//			대화상자 만들어주는 함수
								var popWin = new google.maps.InfoWindow({content: mapInfo})
								//	마우스 오버와 아웃 이벤트처리하기  이벤트대상									지도변수	대상되는 > 마커위치에 팝업띄워라
								google.maps.event.addListener(marker, 'mouseover', function(){popWin.open(map, marker)});
								google.maps.event.addListener(marker, 'mouseout', function(){popWin.open(map, marker)});
								////////////////////////////////mouseout확인
							}else{ //주소 못 찾음	
							}
						}//콜백함수
						
		);//geocode함수
		
	}
	//검색어 입력 후 클릭시 요기로 이동 35행
	function geocodeAddress(){
		var addr = document.getElementById('address').value; //address의 값을 구해 addr에 넣어라
		if(addr==''){
			alert('지역명 또는 건물명을 입력하세요');
		}else{
			searchAddress(addr);
		}
	}
	
/* 		$(function(){
			$("#geoSubmit").submit(function(){
				var url = ""
				
				$.ajax({
					url : 
				})
			}
		}) */

</script>
</div>