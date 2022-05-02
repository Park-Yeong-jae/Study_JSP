/* 객체 만드는 방법 1 */ 
// 빈 객체 선언
var calc = {};

// 멤버변수 추가
calc.x = 0;
calc.y = 0;

// 메소드 추가
calc.setValue = function(p1, p2) {
	this.x = p1;
	this.y = p2;
}

calc.plus = function() {
	return this.x + this.y;
}

calc.minus = function() {
	return this.x - this.y;
}

calc.result = function() {
	var value1 = this.plus();
	var value2 = this.minus();
	
	document.write("<p>덧셈결과 : " + value1 + "</p>");
	document.write("<p>뺄셈결과 : " + value2 + "</p>");
}

/* 객체 만드는 방법 2 */
// json 방식 사용
// (Javascript Object Notation : 자바스크립트 객체 표현식)
// => {이름: 데이터, 이름: 데이터, 이름: 데이터}
var calc2 = {
	x: 0,
	y: 0,
	setValue: function(p1, p2) {
		this.x = p1;
		this.y = p2;
	},
	plus: function() {
		return this.x + this.y;
	},
	minus: function() {
		return this.x - this.y;
	},
	result: function() {
		var value1 = this.plus();
		var value2 = this.minus();
		
		document.write("<p>덧셈결과 : " + value1 + "</p>");
		document.write("<p>뺄셈결과 : " + value2 + "</p>");
	}
};






















