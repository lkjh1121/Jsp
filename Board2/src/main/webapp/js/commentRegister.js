/**
 * 
 */
// 댓글 등록
$(function(){
	
	$('.commentForm > form').submit(function(){
		
		let inputParent = $(this).children('input[name=parent]');
		let inputUid    = $(this).children('input[name=uid]');
		let textarea    = $(this).children('textarea[name=content]');
		
		let parent  = inputParent.val();
		let uid     = inputUid.val();
		let content = textarea.val();
		
		let jsonData = {"parent": parent, "uid": uid, "content": content };
		
		$.ajax({
			url: '/Board2/comment.do',
			type: 'post',
			data: jsonData,
			dataType: 'json',
			success: function(data){
				
				console.log(data);
				// 화면 동적 생성
				let html = `<article class="comment">
        	                    <span>
    	                        	<span class="nick">닉네임</span>
    	                        	<span class="rdate">22-03-16</span>
    	                    	</span>
    	                    	<textarea name="comment" readonly>댓글내용</textarea>
    	                    	<div>
    	                        	<a href="#" class="del">삭제</a>
    	                        	<a href="#" class="modify" data-mode="r">수정</a>
    	                    	</div>
    	                	</article>`;
				
    	        
				let dom = $(html);
				
				dom.find('.nick').text(data.nick);
				dom.find('.rdate').text(data.rdate);
				dom.find('textarea').text(data.content);
				dom.find('.del').attr('data-no', data.no);
				dom.find('.modify').attr('data-no', data.no);
				
				$('.commentList').append(dom);
				
				textarea.val("");
				$('.empty').remove();
				
				
			} // success end
		}); // ajax end
		
		return false;
	});
}); 