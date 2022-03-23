/**
 * 
 */
// 댓글 수정
$(function(){
	// 댓글 수정 - 동적 이벤트 구현
	$(document).on('click', '.comment > div > .modify', function(e){
		e.preventDefault();
		
		let mode = $(this).attr('data-mode');
		
		if(mode == 'r'){
			// 수정모드 전환
			$(this).attr('data-mode', 'w');
			
			let tag = $(this);    			
			let textarea = tag.parent().prev();
			
			tag.prev().hide();		    			
			tag.text('수정하기');
			
			textarea.attr('readonly', false).focus();
			textarea.css({'background':'white', 'outline':'1px solid gray'});
			
		}else{
			// 수정완료 하기
			$(this).attr('data-mode', 'r');
			
			let tag = $(this);    			
			let textarea = tag.parent().prev();    			 			
			
			let content = textarea.val();
			let no = tag.attr('data-no');
			
			let jsonData = {"content": content, "no": no};
			
			
			$.ajax({
				url: '/Board2/commentModify.do',
				type: 'post',
				data: jsonData,
				dataType: 'json',
				success: function(data){
					if(data.result == 1){
						alert('댓글을 수정 했습니다.');
						// 수정완료 모드로 전환
						tag.text('수정');
						tag.prev().show();		    						
						textarea.attr('readonly', true);
						textarea.css({'background':'transparent', 'outline':'none'});
					}
				}
			});
		}
	});

}); // 댓글 수정 끝