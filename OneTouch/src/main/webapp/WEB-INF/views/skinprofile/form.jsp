<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">
function send(f){
	let skin1 = f.skin1.value;
	let skin2 = f.skin2.value;
	let skin3 = f.skin3.value;
	let skin4 = f.skin4.value;
	let skin5 = f.skin5.value;

	if(skin1==""){
		alert("1번 문항의 답을 골라주세요.");
		return;
	}
	if(skin2==""){
		alert("2번 문항의 답을 골라주세요.");
		return;
	}
	if(skin3==""){
		alert("3번 문항의 답을 골라주세요.");
		return;
	}
	if(skin4==""){
		alert("4번 문항의 답을 골라주세요.");
		return;
	}
	if(skin5==""){
		alert("5번 문항의 답을 골라주세요.");
		return;
	}
	
	f.action="insert.do"
	f.submit();
	
}
</script>
<body>
<div>
	<form method="get">
		<div>
			<h5>얼굴에 기름이 많다고 느껴지거나, 세안을 한 뒤 1시간 정도 지나면 기름이 나오시나요?</h5>
			<select name="skin1">
				<option value="">답변을 선택해주세요.</option>
				<option value="1">전체적으로 나온다</option>
				<option value="2">이마랑 코 쪽 위주로 나온다</option>
				<option value="3">안 나온다</option>
			</select>		
		</div>
		<div>
			<h5>피부가 조그마한 자극에도 금방 붉어지거나, 피부 질환 치료를 받으신 적이 있나요?</h5>
				<select name="skin2">
				<option value="">답변을 선택해주세요.</option>
				<option value="1">그렇다</option>
				<option value="2">아니다</option>
			</select>
		</div>
		<div>
			<h5>기미나 주근깨가 많거나 피부가 검어지는 체질이신가요?</h5>
			<select name="skin3">
				<option value="">답변을 선택해주세요.</option>
				<option value="1">그렇다</option>
				<option value="2">아니다</option>
				<option value="2">빨개졌다가 돌아온다</option>
			</select>
		</div>
		<div>
			<h5>조금이라도 주름이 있는 편인가요?</h5>
			<select name="skin4">
				<option value="">답변을 선택해주세요.</option>
				<option value="1">그렇다</option>
				<option value="2">아니다</option>
			</select>
		</div>
		<div>
			<h5>아래 그림 중 당신의 피부톤을 골라주세요.</h5>
			<select name="skin5">
				<option value="">답변을 선택해주세요.</option>
				<option value="1">밝은 톤</option>
				<option value="2">중간 톤</option>
				<option value="3">어두운 톤</option>
			</select>
		</div>
		<input type="button" value="진단 결과 확인하기"
		onclick="send(this.form);">
	</form>
</div>
</body>
</html>