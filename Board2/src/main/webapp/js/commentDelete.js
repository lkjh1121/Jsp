/**
 * 
 */
 // 댓글 삭제
$(function(){
	
	// 댓글 삭제 - 동적 이벤트 구현
	$(document).on('click', '.comment > div > .del', function(e){
		e.preventDefault();
		
		let parentArticle = $(this).parent().parent();
		
		let result = confirm('정말 삭제하시겠습니까?');
		if(!result){
			return;
		}
		
		let no = $(this).attr('data-no');
		let jsonData = {"no":no};
		let url = "/Board2/commentDelete.do";
		
		$.get(url, jsonData, function(data){
			
			if(data.result == 1){
				alert("삭제 되었습니다.");
				// 화면 동적 삭제
				parentArticle.remove();
			}
			
		}, 'json');
	});
	
}); // 댓글 삭제 끝