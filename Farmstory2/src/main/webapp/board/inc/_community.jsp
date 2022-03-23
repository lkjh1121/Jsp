<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="sub">
    <div><img src="/Farmstory2/img/sub_top_tit5.png" alt="COMMUNITY"></div>
    <section class="cate5">
        <aside>
            <img src="/Farmstory2/img/sub_aside_cate5_tit.png" alt="커뮤니티"/>
            <ul class="lnb">
                <li class="${type == 'notice' ? 'on':'off'}"><a href="/Farmstory2/board/list.do?cate=community&type=notice">공지사항</a></li>
                <li class="${type == 'menu' ? 'on':'off'}"><a href="/Farmstory2/board/list.do?cate=community&type=menu">오늘의식단</a></li>
                <li class="${type == 'chef' ? 'on':'off'}"><a href="/Farmstory2/board/list.do?cate=community&type=chef">나도요리사</a></li>
                <li class="${type == 'qna' ? 'on':'off'}"><a href="/Farmstory2/board/list.do?cate=community&type=qna">고객센터</a></li>
                <li class="${type == 'faq' ? 'on':'off'}"><a href="/Farmstory2/board/list.do?cate=community&type=faq">자주묻는질문</a></li>
            </ul>
        </aside>
        <article>
            <nav>
                <img src="/Farmstory2/img/sub_nav_tit_cate5_${type}.png" alt="공지사항"/>
                <p>
                    HOME > 커뮤니티 > 
                    <c:if test="${type == 'notice'}"><em>공지사항</em></c:if>
                    <c:if test="${type == 'menu'}"><em>오늘의식단</em></c:if>
                    <c:if test="${type == 'chef'}"><em>나도요리사</em></c:if>
                    <c:if test="${type == 'qna'}"><em>1:1고객문의</em></c:if>
                    <c:if test="${type == 'faq'}"><em>자주묻는질문</em></c:if>
                </p>
            </nav>

            <!-- 내용 시작 -->