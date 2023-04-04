<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
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
	<div id='roadView'></div> <!-- ��⿡ �������� -->
	<div id='search'>
		<input type='text' id='address' name='address' value='��ǿ�'/>
		<input type='button' id='geoSubmit' name='geoSubmit' value='geoCode' onclick='geocodeAddress()'/>
	</div>
	<div id='searchList'></div>	
</div>
<script>
	var latitude = 37.5729503;
	var longitude = 126.9793578;
	var map; //map, geoCoder�� searchAddress������ ����ؾ��ؼ� �ۿ��� ����
	var geoCoder;
	function initMap(){
		
		var myCenter = new google.maps.LatLng(latitude, longitude);
		var option = {
				center : myCenter,
				zoom : 12,
				mapTypeId : google.maps.MapTypeId.ROADMAP
		}				//����������ü
		map = new google.maps.Map(document.getElementById('roadView'), option);
		
		//�����ڵ� ��ü �����
		geoCoder = new google.maps.Geocoder();
		
	}
	//�Է¹��� �˻���� �������� ǥ���ϱ�
	function searchAddress(addr){
		//alert('�˻��� ��ġ�� �̵���.'+addr); //Ȯ��
		
		//���޹��� �˻�� �̿��Ͽ� �ּ�����ã��
		//���� ����.		
		geoCoder.geocode({'address':addr} //�˻���
						,function(results, status){ //results : ���� ã�� ����, status : ��������(OK�� �ּҰ� �ִ�), ZERO_RESULTS
							console.log(status, results);
							if(status=='OK'){//�ּ�ã��
								//�ּҷ� ��ġ �̵�
								//����, �浵			//�������(���� ������ ����) f12������ console�� results���� �Ǹ����� ��ȣ�� �Լ�(f)���!
								var la = results[0]['geometry']['location']['lat'](); //jsonǥ���1
								var lng = results[0]['geometry']['location']['lng']();
								//�ּ�(�߰��� ȸ���ڽ��� ���� �ֱ�� �����ϱ�)
								//var searchAddr = results[0]['formatted_address'];
								//var searchAddr;
								//if(results)
								var searchAddr = results[0].address_components[3].long_name;
									searchAddr += " "+results[0].address_components[2].long_name;
									searchAddr += " "+results[0].address_components[1].long_name;
									searchAddr += " "+results[0].address_components[0].long_name;
								
								//ã�� ��ġ�� ������ ���� ��ġ �����ϱ�
								map.setCenter(results[0].geometry.location); //jsonǥ���2 location�ȿ� �����浵���� �������ϱ� location����
								
								//��Ŀ�����
								var marker = new google.maps.Marker({
									map:map,
									icon:'gmap_pin.png',
									title: searchAddr.substring(5), //��ǳ������ ****.substring()�ǹ�ã�ƺ���
									position: results[0].geometry.location //��Ŀ��ġ
								});
								
								//ȸ�� �ڽ��ȿ� �� div�����־��
								var mapInfo = "<div class='c'>���� : "+ la;
								mapInfo += "<br/>�浵 : "+ lng;
								mapInfo += "<br/>�ּ� : "+ searchAddr+"</div>";
																					//�����ǰ�
								document.getElementById('searchList').innerHTML = document.getElementById('searchList').innerHTML + mapInfo;
								
								//��Ŀ�� ���콺 �����ϸ� ��ȭ���� �����ֱ�/������������(�̺�Ʈó��)	
								//			��ȭ���� ������ִ� �Լ�
								var popWin = new google.maps.InfoWindow({content: mapInfo})
								//	���콺 ������ �ƿ� �̺�Ʈó���ϱ�  �̺�Ʈ���									��������	���Ǵ� > ��Ŀ��ġ�� �˾������
								google.maps.event.addListener(marker, 'mouseover', function(){popWin.open(map, marker)});
								google.maps.event.addListener(marker, 'mouseout', function(){popWin.open(map, marker)});
								////////////////////////////////mouseoutȮ��
							}else{ //�ּ� �� ã��	
							}
						}//�ݹ��Լ�
						
		);//geocode�Լ�
		
	}
	//�˻��� �Է� �� Ŭ���� ���� �̵� 35��
	function geocodeAddress(){
		var addr = document.getElementById('address').value; //address�� ���� ���� addr�� �־��
		if(addr==''){
			alert('������ �Ǵ� �ǹ����� �Է��ϼ���');
		}else{
			searchAddress(addr);
		}
	}
	
	$(function(){
		$("#geoSubmit").submit(function(){
			var url = ""
			
			$.ajax({
				url : 
			})
		}
	})

</script>
</div>