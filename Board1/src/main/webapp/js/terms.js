/**
 * 약관 동의체크 기능
 */
 $(function(){
	$('.terms > div > a:eq(1)').click(function(){
		let isChecked1 = $('input[name=chk1]').is(':checked');
		let isChecked2 = $('input[name=chk2]').is(':checked');
		
		if(!isChecked1){
			alert('이용약관에 동의 체크를 하셔야 합니다.');
			return false;
		}else if(!isChecked2){
			alert('개인정보 취급방침에 동의 체크를 하셔야 합니다.');
			return false;	
		}else{
			return true;
		}
	});
});