<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "goodee.vo.Card"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카드 플레이 액션</title>
</head>
<body>
	<% //1.수집
		int playerCount = Integer.parseInt(request.getParameter("count"));
		System.out.println(playerCount);
	%>

	<%	//2.세팅
		//카드 갯수세팅
		int cardCount = 3; //cardCount 상수로..
		Card[] deck = new Card[52];
	
		for(int i =0; i<deck.length; i++){
			//카드 생성
			deck[i] = new Card();
			//카드 숫자 세팅
			deck[i].num = (i%13)+1;
			
			//카드 무늬 세팅
			if(i/13 ==0){
				deck[i].kind = "spade";
			}else if(i/13 ==1){
				deck[i].kind = "diamond";
			}else if(i/13 ==2){
				deck[i].kind = "heart";
			}else{
				deck[i].kind = "clover";
			}
		}
		/* 전체 확인용
		for(Card c : deck){
			System.out.print(c.num+c.kind+", ");
		}
		*/
		//셔플
		for (int i=0; i <1000; i++){
			int r = (int)(Math.random() *52) ;// 0~0.9까지
			Card temp = deck[0];
			deck[0] = deck[r];
			deck[r] = temp;
		}
		/* 셔플 확인용
		for(Card c : deck){
			System.out.print(c.num+c.kind+", ");
		}
		*/
		%>
		<%
		//3. 출력
		int score = 0;
	
		// 카드 분배
		for (int i =0; i<cardCount*playerCount; i++){ //10, 15 ,20
		%>
			<img src="<%=request.getContextPath()%>/img/<%=deck[i].kind+deck[i].num%>.jpg">
			score = score + <%=deck[i].kind+deck[i].num%>
		<%
			if( (i+1)%cardCount  == 0){ //totalscore[2 / 5 ...8 ...11]
		%>
				<br>
		<%
			}//3개씩if문		
		}//전체 for문
		
		%>
	</DIV>
	
		<h3>블랙잭 룰</h3>
	<div>1) 카드3장 숫자의 합이 21을 넘지 않으면서 21에 가까운 사람이 승</div>

	<div>2) 합이 같으면 제일 높은 숫자값을 가진 사람이 승</div>

	<div>3) 제일 높은 숫자값까지 동일하면 무니가 spade > diamond > heart > clover 순 </div>
	<hr>
</body>
</html>