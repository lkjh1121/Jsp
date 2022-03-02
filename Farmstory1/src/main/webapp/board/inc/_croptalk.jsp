<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String type = request.getParameter("type");
%>
<div id="sub">
    <div><img src="../img/sub_top_tit3.png" alt="CROP TALK"></div>
    <section class="cate3">
        <aside>
            <img src="../img/sub_aside_cate3_tit.png" alt="농작물이야기"/>

            <ul class="lnb">
                <li class="<%= type.equals("story") ?"on":"off"%>"><a href="/Farmstory1/board/list.jsp?cate=croptalk&type=story">농작물이야기</a></li>
                <li class="<%= type.equals("grow")  ?"on":"off"%>"><a href="/Farmstory1/board/list.jsp?cate=croptalk&type=grow">텃밭가꾸기</a></li>
                <li class="<%= type.equals("school")?"on":"off"%>"><a href="/Farmstory1/board/list.jsp?cate=croptalk&type=school">귀농학교</a></li>
            </ul>

        </aside>
        <article>
            <nav>
                <img src="../img/sub_nav_tit_cate3_<%= type %>.png" alt="농작물이야기"/>
                <p>
                    HOME > 농작물이야기 > 
                    <% if(type.equals("story")){ %>
                    	<em>농작물이야기</em>
                    <% } else if(type.equals("grow")){ %>
                    	<em>텃밭가꾸기</em>
                    <% } else if(type.equals("school")){ %>
                    	<em>귀농학교</em>
                    <% } %>
                </p>
            </nav>
            <!-- 내용 시작 -->