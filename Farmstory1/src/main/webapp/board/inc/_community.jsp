<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String type = request.getParameter("type");
%>
<div id="sub">
    <div><img src="../img/sub_top_tit5.png" alt="COMMUNITY"></div>
    <section class="cate5">
        <aside>
            <img src="../img/sub_aside_cate5_tit.png" alt="커뮤니티"/>

            <ul class="lnb">
                <li class="<%= type.equals("notice") ?"on":"off"%>"><a href="/Farmstory1/board/list.jsp?cate=community&type=notice">공지사항</a></li>
                <li class="<%= type.equals("menu") ?"on":"off"%>"><a href="/Farmstory1/board/list.jsp?cate=community&type=menu">오늘의식단</a></li>
                <li class="<%= type.equals("chef") ?"on":"off"%>"><a href="/Farmstory1/board/list.jsp?cate=community&type=chef">나도요리사</a></li>
                <li class="<%= type.equals("qna") ?"on":"off"%>"><a href="/Farmstory1/board/list.jsp?cate=community&type=qna">고객문의</a></li>
                <li class="<%= type.equals("faq") ?"on":"off"%>"><a href="/Farmstory1/board/list.jsp?cate=community&type=faq">자주묻는질문</a></li>
            </ul>
        </aside>
        <article>
            <nav>
                <img src="../img/sub_nav_tit_cate5_<%= type %>.png" alt="공지사항"/>
                <p>
                    HOME > 커뮤니티 > 
                    <% if(type.equals("notice")){ %>
                    	<em>공지사항</em>
                    <% } else if(type.equals("menu")){ %>
                    	<em>오늘의식단</em>
                    <% } else if(type.equals("chef")){ %>
                    	<em>나도요리사</em>
                    <% } else if(type.equals("qna")){ %>
                    	<em>고객문의</em>
                    <% } else if(type.equals("faq")){ %>
                    	<em>자주묻는질문</em>
                    <% } %>
                </p>
            </nav>

            <!-- 내용 시작 -->