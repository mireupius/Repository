function memberShipGradeCheckEvent() {
	
	
	var ms_grade = $(".ms_grade").text();
	if (ms_grade == '실버') {
		
		$('.upRow').css("background-color", "#c0c0c0");
		
	} else if (ms_grade == '골드') {
		$('.upRow').css("background-color", "#e7bd42");
		
	} else {
		$('.upRow').css("background-color", "#be4f62");
		
	}
}


	