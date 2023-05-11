<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PingPong</title>
    <link rel="stylesheet" href="/resources/css/style.css"> <!-- 메인 헤더, 네브 css -->
    <link rel="stylesheet" href="/resources/css/qna/QnAhome.css">
</head>
<body>

	<jsp:include page="/WEB-INF/views/common/header.jsp"/>


    <!-- 고객센터 홈 -->
    <div class="ch-main-container">
        <!-- ----------------------------------- Q&A 검색창 --------------------------------- -->
        <section>
            <article class="ch-search-area">
                <form action="#" method="GET">
                    <fieldset>
                        <svg width="31" height="30" viewBox="0 0 31 30" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <path d="M26.6805 24.1125L22.4305 19.875C23.8017 18.1281 24.5457 15.9708 24.543 13.75C24.543 11.7722 23.9565 9.83879 22.8577 8.1943C21.7589 6.54981 20.1971 5.26809 18.3698 4.51121C16.5425 3.75433 14.5319 3.5563 12.5921 3.94215C10.6523 4.328 8.87043 5.28041 7.47191 6.67894C6.07338 8.07746 5.12097 9.85929 4.73512 11.7991C4.34927 13.7389 4.5473 15.7496 5.30418 17.5768C6.06105 19.4041 7.34278 20.9659 8.98727 22.0647C10.6318 23.1635 12.5652 23.75 14.543 23.75C16.7638 23.7528 18.921 23.0087 20.668 21.6375L24.9055 25.8875C25.0217 26.0047 25.1599 26.0977 25.3123 26.1611C25.4646 26.2246 25.628 26.2573 25.793 26.2573C25.958 26.2573 26.1214 26.2246 26.2737 26.1611C26.426 26.0977 26.5643 26.0047 26.6805 25.8875C26.7976 25.7713 26.8906 25.633 26.9541 25.4807C27.0175 25.3284 27.0502 25.165 27.0502 25C27.0502 24.835 27.0175 24.6716 26.9541 24.5193C26.8906 24.367 26.7976 24.2287 26.6805 24.1125ZM7.04297 13.75C7.04297 12.2666 7.48284 10.8166 8.30695 9.58323C9.13106 8.34986 10.3024 7.38857 11.6728 6.82091C13.0433 6.25325 14.5513 6.10473 16.0062 6.39411C17.461 6.6835 18.7974 7.39781 19.8463 8.4467C20.8952 9.4956 21.6095 10.832 21.8989 12.2868C22.1883 13.7417 22.0397 15.2497 21.4721 16.6201C20.9044 17.9906 19.9431 19.1619 18.7098 19.986C17.4764 20.8101 16.0263 21.25 14.543 21.25C12.5539 21.25 10.6462 20.4598 9.23967 19.0533C7.83315 17.6468 7.04297 15.7391 7.04297 13.75Z" fill="#231F20"/></svg>

                        <input type="search" name="query" placeholder="찾으시는 질문을 입력하세요">
                        
                        <svg width="21" height="20" viewBox="0 0 21 20" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <path d="M11.6427 10.0015L15.2261 6.42646C15.383 6.26954 15.4711 6.05671 15.4711 5.83479C15.4711 5.61287 15.383 5.40004 15.2261 5.24312C15.0691 5.0862 14.8563 4.99805 14.6344 4.99805C14.4125 4.99805 14.1996 5.0862 14.0427 5.24312L10.4677 8.82646L6.89272 5.24312C6.7358 5.0862 6.52297 4.99805 6.30106 4.99805C6.07914 4.99805 5.86631 5.0862 5.70939 5.24312C5.55247 5.40004 5.46431 5.61287 5.46431 5.83479C5.46431 6.05671 5.55247 6.26954 5.70939 6.42646L9.29272 10.0015L5.70939 13.5765C5.63128 13.6539 5.56929 13.7461 5.52698 13.8476C5.48467 13.9492 5.46289 14.0581 5.46289 14.1681C5.46289 14.2781 5.48467 14.3871 5.52698 14.4886C5.56929 14.5902 5.63128 14.6823 5.70939 14.7598C5.78686 14.8379 5.87903 14.8999 5.98058 14.9422C6.08212 14.9845 6.19105 15.0063 6.30106 15.0063C6.41107 15.0063 6.51999 14.9845 6.62154 14.9422C6.72309 14.8999 6.81525 14.8379 6.89272 14.7598L10.4677 11.1765L14.0427 14.7598C14.1202 14.8379 14.2124 14.8999 14.3139 14.9422C14.4155 14.9845 14.5244 15.0063 14.6344 15.0063C14.7444 15.0063 14.8533 14.9845 14.9549 14.9422C15.0564 14.8999 15.1486 14.8379 15.2261 14.7598C15.3042 14.6823 15.3662 14.5902 15.4085 14.4886C15.4508 14.3871 15.4726 14.2781 15.4726 14.1681C15.4726 14.0581 15.4508 13.9492 15.4085 13.8476C15.3662 13.7461 15.3042 13.6539 15.2261 13.5765L11.6427 10.0015Z" fill="#C5C5C5"/></svg>
                    </fieldset>
                </form>
            </article>
        </section>
        <!-- --------------------------------------------------------------------------------- -->

        <!-- --------------------------------------------------------------------------------- -->
        <section> <!-- FAQ 버튼 -->
            <ul class="ch-QnA-section">
                <li class="ch-squareBtn">
                    <a href="QnAguide.html">
                        기본 가이드
                    </a>
                </li>
                <li class="ch-squareBtn">
                    <a href="#">
                        계정/프로필
                    </a>
                </li>
                <li class="ch-squareBtn">
                    <a href="#">
                        게시글
                    </a>
                </li>
                <li class="ch-squareBtn">
                    <a href="#">
                        신고/안전
                    </a>
                </li>
                <li class="ch-squareBtn">
                    <a href="#">
                        FAQ
                    </a>
                </li>
                <li class="ch-squareBtn"  id="inquiry">
                    <a href="#">
                        1:1 문의
                    </a>
                </li>
            </ul>
        </section>

        <section>  <!-- 질문 구역 -->
            <ul class="ch-rank-section">
                <li class="ch-listBtn">
                    <a href="FAQ_list.html">
                        아이디를 잃어버렸어요.
                        <svg width="30" height="30" viewBox="0 0 30 30" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <path d="M12.4993 23.7494C12.2072 23.75 11.9242 23.6483 11.6993 23.4619C11.5727 23.357 11.4681 23.2281 11.3914 23.0827C11.3147 22.9373 11.2674 22.7781 11.2523 22.6144C11.2373 22.4507 11.2546 22.2856 11.3034 22.1286C11.3522 21.9716 11.4315 21.8258 11.5368 21.6994L17.1368 14.9994L11.7368 8.28694C11.6329 8.15908 11.5554 8.01196 11.5086 7.85403C11.4618 7.69611 11.4467 7.5305 11.4641 7.36671C11.4816 7.20292 11.5312 7.0442 11.6101 6.89965C11.6891 6.75511 11.7959 6.62759 11.9243 6.52444C12.0536 6.41064 12.2051 6.32481 12.3691 6.27232C12.5332 6.21983 12.7064 6.20183 12.8777 6.21944C13.0491 6.23704 13.215 6.28988 13.365 6.37463C13.5149 6.45938 13.6458 6.57422 13.7493 6.71194L19.7868 14.2119C19.9706 14.4356 20.0711 14.7162 20.0711 15.0057C20.0711 15.2952 19.9706 15.5758 19.7868 15.7994L13.5368 23.2994C13.4114 23.4507 13.2521 23.5703 13.0718 23.6485C12.8916 23.7267 12.6954 23.7613 12.4993 23.7494Z" fill="#231F20"/>
                        </svg>
                    </a>
                </li>
                <li class="ch-listBtn">
                    <a href="FAQ_list.html">
                        비밀번호를 잊어버렸어요.
                        <svg width="30" height="30" viewBox="0 0 30 30" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <path d="M12.4993 23.7494C12.2072 23.75 11.9242 23.6483 11.6993 23.4619C11.5727 23.357 11.4681 23.2281 11.3914 23.0827C11.3147 22.9373 11.2674 22.7781 11.2523 22.6144C11.2373 22.4507 11.2546 22.2856 11.3034 22.1286C11.3522 21.9716 11.4315 21.8258 11.5368 21.6994L17.1368 14.9994L11.7368 8.28694C11.6329 8.15908 11.5554 8.01196 11.5086 7.85403C11.4618 7.69611 11.4467 7.5305 11.4641 7.36671C11.4816 7.20292 11.5312 7.0442 11.6101 6.89965C11.6891 6.75511 11.7959 6.62759 11.9243 6.52444C12.0536 6.41064 12.2051 6.32481 12.3691 6.27232C12.5332 6.21983 12.7064 6.20183 12.8777 6.21944C13.0491 6.23704 13.215 6.28988 13.365 6.37463C13.5149 6.45938 13.6458 6.57422 13.7493 6.71194L19.7868 14.2119C19.9706 14.4356 20.0711 14.7162 20.0711 15.0057C20.0711 15.2952 19.9706 15.5758 19.7868 15.7994L13.5368 23.2994C13.4114 23.4507 13.2521 23.5703 13.0718 23.6485C12.8916 23.7267 12.6954 23.7613 12.4993 23.7494Z" fill="#231F20"/>
                        </svg>
                    </a>
                </li>
                <li class="ch-listBtn">
                    <a href="FAQ_list.html">
                        프로필을 변경하고 싶어요.
                        <svg width="30" height="30" viewBox="0 0 30 30" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <path d="M12.4993 23.7494C12.2072 23.75 11.9242 23.6483 11.6993 23.4619C11.5727 23.357 11.4681 23.2281 11.3914 23.0827C11.3147 22.9373 11.2674 22.7781 11.2523 22.6144C11.2373 22.4507 11.2546 22.2856 11.3034 22.1286C11.3522 21.9716 11.4315 21.8258 11.5368 21.6994L17.1368 14.9994L11.7368 8.28694C11.6329 8.15908 11.5554 8.01196 11.5086 7.85403C11.4618 7.69611 11.4467 7.5305 11.4641 7.36671C11.4816 7.20292 11.5312 7.0442 11.6101 6.89965C11.6891 6.75511 11.7959 6.62759 11.9243 6.52444C12.0536 6.41064 12.2051 6.32481 12.3691 6.27232C12.5332 6.21983 12.7064 6.20183 12.8777 6.21944C13.0491 6.23704 13.215 6.28988 13.365 6.37463C13.5149 6.45938 13.6458 6.57422 13.7493 6.71194L19.7868 14.2119C19.9706 14.4356 20.0711 14.7162 20.0711 15.0057C20.0711 15.2952 19.9706 15.5758 19.7868 15.7994L13.5368 23.2994C13.4114 23.4507 13.2521 23.5703 13.0718 23.6485C12.8916 23.7267 12.6954 23.7613 12.4993 23.7494Z" fill="#231F20"/>
                        </svg>
                    </a>
                </li>
                <li class="ch-listBtn">
                    <a href="FAQ_list.html">
                        닉네임을 바꾸고 싶어요.
                        <svg width="30" height="30" viewBox="0 0 30 30" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <path d="M12.4993 23.7494C12.2072 23.75 11.9242 23.6483 11.6993 23.4619C11.5727 23.357 11.4681 23.2281 11.3914 23.0827C11.3147 22.9373 11.2674 22.7781 11.2523 22.6144C11.2373 22.4507 11.2546 22.2856 11.3034 22.1286C11.3522 21.9716 11.4315 21.8258 11.5368 21.6994L17.1368 14.9994L11.7368 8.28694C11.6329 8.15908 11.5554 8.01196 11.5086 7.85403C11.4618 7.69611 11.4467 7.5305 11.4641 7.36671C11.4816 7.20292 11.5312 7.0442 11.6101 6.89965C11.6891 6.75511 11.7959 6.62759 11.9243 6.52444C12.0536 6.41064 12.2051 6.32481 12.3691 6.27232C12.5332 6.21983 12.7064 6.20183 12.8777 6.21944C13.0491 6.23704 13.215 6.28988 13.365 6.37463C13.5149 6.45938 13.6458 6.57422 13.7493 6.71194L19.7868 14.2119C19.9706 14.4356 20.0711 14.7162 20.0711 15.0057C20.0711 15.2952 19.9706 15.5758 19.7868 15.7994L13.5368 23.2994C13.4114 23.4507 13.2521 23.5703 13.0718 23.6485C12.8916 23.7267 12.6954 23.7613 12.4993 23.7494Z" fill="#231F20"/>
                        </svg>
                    </a>
                </li>
            </ul>
        </section>
    </div>


    <section> <!-- 1:1 문의 창 -->
        <div id="grayBackground">
            <div id="oneToOne">
                <!-- 로고, X버튼 -->
                <div>                
                    <svg width="150" height="31" viewBox="0 0 150 31" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <g opacity="0.5">
                        <path d="M18.6834 4.28677C18.6834 6.44287 16.9355 8.19073 14.7794 8.19073C12.6234 8.19073 10.8755 6.44287 10.8755 4.28677C10.8755 2.13068 12.6234 0.382812 14.7794 0.382812C16.9355 0.382812 18.6834 2.13068 18.6834 4.28677Z" fill="#A8C3F0"/>
                        <path fill-rule="evenodd" clip-rule="evenodd" d="M22.5871 24.7553C26.4056 23.9802 29.2796 20.6043 29.2796 16.557C29.2796 11.9368 25.5342 8.19141 20.914 8.19141C16.2938 8.19141 12.5483 11.9368 12.5483 16.557C12.5483 20.6043 15.4224 23.9802 19.2409 24.7553V28.8266C19.2409 29.7507 19.9899 30.4998 20.914 30.4998C21.838 30.4998 22.5871 29.7507 22.5871 28.8266V24.7553Z" fill="#92B4EC" fill-opacity="0.8"/>
                        <path fill-rule="evenodd" clip-rule="evenodd" d="M10.0388 24.7553C13.8573 23.9802 16.7313 20.6042 16.7313 16.557C16.7313 11.9368 12.9858 8.19141 8.36563 8.19141C3.74542 8.19141 0 11.9368 0 16.557C0 20.6043 2.87408 23.9803 6.6926 24.7553V28.8266C6.6926 29.7507 7.44168 30.4998 8.36572 30.4998C9.28977 30.4998 10.0388 29.7507 10.0388 28.8266V24.7553Z" fill="#F5DA8A" fill-opacity="0.8"/>
                        <path d="M44.0563 12.3575C43.7635 12.2404 43.5293 12.1819 43.3536 12.1819C43.1975 12.1819 42.9047 12.2599 42.4752 12.4161C42.1629 12.5137 41.9482 12.6894 41.8311 12.9431C41.7335 13.1774 41.6847 13.6166 41.6847 14.2607C41.6847 14.6511 41.6944 14.9634 41.714 15.1977L41.8018 16.8959L42.3874 16.8666C43.1292 16.8081 43.8221 16.4762 44.4663 15.8711C45.1299 15.266 45.4618 14.6609 45.4618 14.0558C45.4618 13.7239 45.3251 13.3921 45.0519 13.0603C44.7786 12.7284 44.4467 12.4942 44.0563 12.3575ZM41.6847 9.57597C42.1727 9.34173 42.8168 9.22461 43.6171 9.22461C44.2223 9.22461 44.7883 9.30269 45.3154 9.45885C45.8424 9.59549 46.467 9.98588 47.1893 10.63C48.2824 11.6255 48.8289 12.787 48.8289 14.1143C48.8289 14.251 48.8094 14.4559 48.7704 14.7292C48.5557 16.0956 47.8529 17.3156 46.6622 18.3892C45.4715 19.4627 44.2223 20.0093 42.9144 20.0288H41.8896V24.2744C41.8896 26.3044 41.8701 27.5439 41.8311 27.9929C41.792 28.4419 41.6749 28.7639 41.4797 28.9591C41.1089 29.3495 40.6892 29.5447 40.2207 29.5447C39.8693 29.5447 39.5473 29.4178 39.2545 29.1641C38.9812 28.9298 38.786 28.598 38.6689 28.1686C38.5908 27.7391 38.5518 25.592 38.5518 21.727V19.4139C38.5713 15.6271 38.6103 13.314 38.6689 12.4747C38.7274 11.6353 38.8641 11.0595 39.0788 10.7472C39.2545 10.5129 39.4789 10.3372 39.7522 10.2201C40.0255 10.0835 40.3573 9.96636 40.7477 9.86876C41.1577 9.77116 41.47 9.67357 41.6847 9.57597Z" fill="black"/>
                        <path d="M53.3723 11.7427C53.9384 11.6451 54.9144 11.5767 56.3003 11.5377H56.8566C57.8131 11.5377 58.4279 11.6743 58.7012 11.9476C58.9355 12.2014 59.0526 12.5039 59.0526 12.8553C59.0526 13.1871 58.9452 13.4994 58.7305 13.7922C58.5158 14.085 58.2328 14.2705 57.8814 14.3486C57.5496 14.4462 57.3348 14.778 57.2372 15.3441C57.1592 15.9101 57.1201 17.1789 57.1201 19.1504V22.2541L57.735 22.4005C58.5939 22.6152 59.0233 23.1032 59.0233 23.8645C59.0233 24.411 58.8086 24.7819 58.3792 24.9771C57.9497 25.1723 57.0811 25.2992 55.7733 25.3577C55.5 25.3772 55.1486 25.387 54.7192 25.387C53.9579 25.387 53.4114 25.3187 53.0795 25.182C52.7477 25.0259 52.5232 24.7526 52.4061 24.3622C52.3866 24.3232 52.3768 24.2451 52.3768 24.128C52.3768 23.8742 52.4842 23.6009 52.6989 23.3081C52.9136 23.0154 53.1576 22.8104 53.4309 22.6933C53.6456 22.6152 53.7822 22.4786 53.8408 22.2834C53.9189 22.0686 53.9872 21.5611 54.0458 20.7608C54.1434 19.7263 54.1922 18.3794 54.1922 16.7202V14.4657H53.548C53.099 14.4657 52.7184 14.29 52.4061 13.9386C52.0547 13.5873 51.8791 13.2554 51.8791 12.9431C51.8791 12.6503 52.0059 12.3966 52.2597 12.1819C52.533 11.9671 52.9038 11.8207 53.3723 11.7427Z" fill="black"/>
                        <path d="M62.7576 12.3283C62.8747 11.5475 63.109 10.9814 63.4603 10.63C63.8117 10.2787 64.0947 10.103 64.3094 10.103C64.5437 10.103 64.9633 10.3275 65.5685 10.7764C65.9784 11.0888 66.4566 11.6451 67.0032 12.4454C67.5497 13.2262 68.3988 14.5828 69.5505 16.5153C69.8043 16.9837 70.0092 17.218 70.1654 17.218C70.302 17.218 70.3703 16.2127 70.3703 14.2022C70.3703 12.2111 70.4875 11.0497 70.7217 10.7179C70.9364 10.4056 71.2682 10.2494 71.7172 10.2494C72.1466 10.2494 72.5175 10.4056 72.8298 10.7179C73.025 10.9131 73.1421 11.3523 73.1812 12.0355C73.2202 12.7187 73.2593 14.5535 73.2983 17.54C73.3178 18.6527 73.3276 19.9312 73.3276 21.3757C73.3276 22.6054 73.2983 23.3765 73.2397 23.6888C73.2007 23.9816 73.0836 24.2061 72.8884 24.3622C72.537 24.6745 72.215 24.8307 71.9222 24.8307C71.4537 24.8307 70.9169 24.4696 70.3118 23.7473C69.7067 23.0056 68.8966 21.7563 67.8816 19.9995C66.5542 17.7157 65.832 16.5738 65.7149 16.5738C65.6173 16.5738 65.5294 17.745 65.4513 20.0874C65.3537 22.0394 65.2464 23.2984 65.1293 23.8645C65.0121 24.4305 64.7584 24.8014 64.368 24.9771C64.0752 25.1137 63.8214 25.182 63.6067 25.182C63.353 25.182 63.0406 25.0259 62.6698 24.7136L62.0842 24.2158L62.3477 18.7698C62.5234 15.2367 62.66 13.0895 62.7576 12.3283Z" fill="black"/>
                        <path d="M81.1562 9.60525C81.5076 9.48813 81.8785 9.42957 82.2689 9.42957C82.9911 9.42957 83.6841 9.61501 84.3477 9.98588C85.0309 10.3372 85.5775 10.8252 85.9874 11.4499C86.3973 12.0745 86.6023 12.6113 86.6023 13.0603C86.6023 13.3726 86.4949 13.6849 86.2802 13.9972C86.085 14.3095 85.8117 14.4657 85.4604 14.4657C84.9724 14.4657 84.377 14.1534 83.6743 13.5287C82.9716 12.9041 82.5812 12.5918 82.5031 12.5918C82.2689 12.5918 81.9175 12.7382 81.449 13.031C81.0001 13.3042 80.6682 13.5775 80.4535 13.8508C79.7899 14.7292 79.458 15.998 79.458 17.6572C79.458 19.6091 79.8875 20.9658 80.7463 21.727C81.1758 22.0784 81.6345 22.2541 82.1225 22.2541C82.1615 22.2541 82.2298 22.2541 82.3274 22.2541C82.4445 22.2346 82.5324 22.2248 82.5909 22.2248L83.7914 22.1662L83.85 21.405C83.85 21.3659 83.85 21.3074 83.85 21.2293C83.8695 21.1512 83.8793 21.1024 83.8793 21.0829C83.8793 20.8682 83.8305 20.7315 83.7329 20.673C83.6353 20.5949 83.4303 20.5363 83.118 20.4973C82.7081 20.3997 82.3079 20.1947 81.9175 19.8824C81.5466 19.5701 81.3612 19.2773 81.3612 19.004C81.3612 18.7503 81.5369 18.4672 81.8882 18.1549C82.2396 17.8036 82.7861 17.6279 83.5279 17.6279C84.1525 17.6279 84.7772 17.7548 85.4018 18.0085C86.046 18.2623 86.4559 18.5551 86.6315 18.8869C86.7877 19.1992 86.8658 19.8434 86.8658 20.8194C86.8658 22.459 86.7291 23.5717 86.4559 24.1573C86.2412 24.5672 85.9191 24.8405 85.4896 24.9771C85.0797 25.0942 84.1037 25.2211 82.5617 25.3577C82.425 25.3772 82.2396 25.387 82.0054 25.387C80.8537 25.387 79.8289 25.0747 78.931 24.4501C78.0526 23.8059 77.3889 22.8982 76.94 21.727C76.53 20.6535 76.3251 19.1407 76.3251 17.1887C76.3251 16.3493 76.3837 15.6661 76.5008 15.1391C76.774 13.7922 77.3304 12.6211 78.1697 11.6255C79.0091 10.63 80.0046 9.9566 81.1562 9.60525Z" fill="black"/>
                        <path d="M102.616 12.3575C102.323 12.2404 102.089 12.1819 101.913 12.1819C101.757 12.1819 101.464 12.2599 101.035 12.4161C100.722 12.5137 100.508 12.6894 100.39 12.9431C100.293 13.1774 100.244 13.6166 100.244 14.2607C100.244 14.6511 100.254 14.9634 100.273 15.1977L100.361 16.8959L100.947 16.8666C101.689 16.8081 102.382 16.4762 103.026 15.8711C103.689 15.266 104.021 14.6609 104.021 14.0558C104.021 13.7239 103.885 13.3921 103.611 13.0603C103.338 12.7284 103.006 12.4942 102.616 12.3575ZM100.244 9.57597C100.732 9.34173 101.376 9.22461 102.177 9.22461C102.782 9.22461 103.348 9.30269 103.875 9.45885C104.402 9.59549 105.026 9.98588 105.749 10.63C106.842 11.6255 107.388 12.787 107.388 14.1143C107.388 14.251 107.369 14.4559 107.33 14.7292C107.115 16.0956 106.412 17.3156 105.222 18.3892C104.031 19.4627 102.782 20.0093 101.474 20.0288H100.449V24.2744C100.449 26.3044 100.43 27.5439 100.39 27.9929C100.351 28.4419 100.234 28.7639 100.039 28.9591C99.6683 29.3495 99.2486 29.5447 98.7801 29.5447C98.4287 29.5447 98.1067 29.4178 97.8139 29.1641C97.5406 28.9298 97.3454 28.598 97.2283 28.1686C97.1502 27.7391 97.1112 25.592 97.1112 21.727V19.4139C97.1307 15.6271 97.1697 13.314 97.2283 12.4747C97.2868 11.6353 97.4235 11.0595 97.6382 10.7472C97.8139 10.5129 98.0384 10.3372 98.3116 10.2201C98.5849 10.0835 98.9167 9.96636 99.3071 9.86876C99.7171 9.77116 100.029 9.67357 100.244 9.57597Z" fill="black"/>
                        <path d="M117.173 13.1188C116.665 12.787 116.255 12.6211 115.943 12.6211C115.553 12.6211 115.104 12.8748 114.596 13.3823C113.796 14.1826 113.396 15.2855 113.396 16.6909C113.396 18.3501 113.913 19.6677 114.948 20.6437C115.455 21.1122 115.992 21.3464 116.558 21.3464C116.929 21.3464 117.28 21.2293 117.612 20.9951C118.588 20.2143 119.076 19.004 119.076 17.3644C119.076 16.486 118.91 15.6661 118.578 14.9049C118.246 14.1241 117.778 13.5287 117.173 13.1188ZM113.747 10.1908C114.45 9.83948 115.045 9.66381 115.533 9.66381C115.65 9.66381 116.002 9.68333 116.587 9.72237C117.602 9.81996 118.393 10.0347 118.959 10.3665C119.544 10.6788 120.13 11.2547 120.716 12.094C121.75 13.6166 122.267 15.3343 122.267 17.2472V17.4229C122.248 18.8869 121.955 20.185 121.389 21.3171C120.843 22.4493 120.071 23.3081 119.076 23.8937C118.647 24.1475 118.276 24.3134 117.963 24.3915C117.671 24.4501 117.212 24.4793 116.587 24.4793C114.186 24.4793 112.381 23.191 111.17 20.6144C110.722 19.6384 110.478 18.5551 110.438 17.3644C110.438 17.2863 110.429 17.1789 110.409 17.0423C110.409 16.8861 110.409 16.769 110.409 16.6909C110.409 13.4897 111.522 11.323 113.747 10.1908Z" fill="black"/>
                        <path d="M125.892 12.3283C126.009 11.5475 126.243 10.9814 126.595 10.63C126.946 10.2787 127.229 10.103 127.444 10.103C127.678 10.103 128.098 10.3275 128.703 10.7764C129.113 11.0888 129.591 11.6451 130.138 12.4454C130.684 13.2262 131.533 14.5828 132.685 16.5153C132.939 16.9837 133.144 17.218 133.3 17.218C133.436 17.218 133.505 16.2127 133.505 14.2022C133.505 12.2111 133.622 11.0497 133.856 10.7179C134.071 10.4056 134.403 10.2494 134.852 10.2494C135.281 10.2494 135.652 10.4056 135.964 10.7179C136.159 10.9131 136.277 11.3523 136.316 12.0355C136.355 12.7187 136.394 14.5535 136.433 17.54C136.452 18.6527 136.462 19.9312 136.462 21.3757C136.462 22.6054 136.433 23.3765 136.374 23.6888C136.335 23.9816 136.218 24.2061 136.023 24.3622C135.671 24.6745 135.349 24.8307 135.057 24.8307C134.588 24.8307 134.051 24.4696 133.446 23.7473C132.841 23.0056 132.031 21.7563 131.016 19.9995C129.689 17.7157 128.966 16.5738 128.849 16.5738C128.752 16.5738 128.664 17.745 128.586 20.0874C128.488 22.0394 128.381 23.2984 128.264 23.8645C128.147 24.4305 127.893 24.8014 127.502 24.9771C127.21 25.1137 126.956 25.182 126.741 25.182C126.487 25.182 126.175 25.0259 125.804 24.7136L125.219 24.2158L125.482 18.7698C125.658 15.2367 125.794 13.0895 125.892 12.3283Z" fill="black"/>
                        <path d="M144.291 9.60525C144.642 9.48813 145.013 9.42957 145.403 9.42957C146.125 9.42957 146.818 9.61501 147.482 9.98588C148.165 10.3372 148.712 10.8252 149.122 11.4499C149.532 12.0745 149.737 12.6113 149.737 13.0603C149.737 13.3726 149.629 13.6849 149.415 13.9972C149.219 14.3095 148.946 14.4657 148.595 14.4657C148.107 14.4657 147.511 14.1534 146.809 13.5287C146.106 12.9041 145.716 12.5918 145.637 12.5918C145.403 12.5918 145.052 12.7382 144.583 13.031C144.134 13.3042 143.803 13.5775 143.588 13.8508C142.924 14.7292 142.592 15.998 142.592 17.6572C142.592 19.6091 143.022 20.9658 143.881 21.727C144.31 22.0784 144.769 22.2541 145.257 22.2541C145.296 22.2541 145.364 22.2541 145.462 22.2541C145.579 22.2346 145.667 22.2248 145.725 22.2248L146.926 22.1662L146.984 21.405C146.984 21.3659 146.984 21.3074 146.984 21.2293C147.004 21.1512 147.014 21.1024 147.014 21.0829C147.014 20.8682 146.965 20.7315 146.867 20.673C146.77 20.5949 146.565 20.5363 146.252 20.4973C145.842 20.3997 145.442 20.1947 145.052 19.8824C144.681 19.5701 144.496 19.2773 144.496 19.004C144.496 18.7503 144.671 18.4672 145.023 18.1549C145.374 17.8036 145.921 17.6279 146.662 17.6279C147.287 17.6279 147.912 17.7548 148.536 18.0085C149.18 18.2623 149.59 18.5551 149.766 18.8869C149.922 19.1992 150 19.8434 150 20.8194C150 22.459 149.864 23.5717 149.59 24.1573C149.376 24.5672 149.053 24.8405 148.624 24.9771C148.214 25.0942 147.238 25.2211 145.696 25.3577C145.559 25.3772 145.374 25.387 145.14 25.387C143.988 25.387 142.963 25.0747 142.065 24.4501C141.187 23.8059 140.523 22.8982 140.074 21.727C139.664 20.6535 139.459 19.1407 139.459 17.1887C139.459 16.3493 139.518 15.6661 139.635 15.1391C139.908 13.7922 140.465 12.6211 141.304 11.6255C142.143 10.63 143.139 9.9566 144.291 9.60525Z" fill="black"/>
                        </g>
                    </svg>
                    
                    <svg width="40" height="41" viewBox="0 0 50 51" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <path d="M27.9379 25.4695L36.8962 16.532C37.2885 16.1397 37.5089 15.6076 37.5089 15.0528C37.5089 14.498 37.2885 13.9659 36.8962 13.5736C36.5039 13.1813 35.9718 12.9609 35.417 12.9609C34.8622 12.9609 34.3302 13.1813 33.9379 13.5736L25.0004 22.532L16.0629 13.5736C15.6706 13.1813 15.1385 12.9609 14.5837 12.9609C14.0289 12.9609 13.4968 13.1813 13.1045 13.5736C12.7122 13.9659 12.4918 14.498 12.4918 15.0528C12.4918 15.6076 12.7122 16.1397 13.1045 16.532L22.0629 25.4695L13.1045 34.407C12.9093 34.6006 12.7543 34.8311 12.6485 35.0849C12.5427 35.3388 12.4883 35.6111 12.4883 35.8861C12.4883 36.1612 12.5427 36.4335 12.6485 36.6873C12.7543 36.9412 12.9093 37.1716 13.1045 37.3653C13.2982 37.5606 13.5286 37.7156 13.7825 37.8213C14.0364 37.9271 14.3087 37.9815 14.5837 37.9815C14.8587 37.9815 15.131 37.9271 15.3849 37.8213C15.6388 37.7156 15.8692 37.5606 16.0629 37.3653L25.0004 28.407L33.9379 37.3653C34.1315 37.5606 34.362 37.7156 34.6158 37.8213C34.8697 37.9271 35.142 37.9815 35.417 37.9815C35.6921 37.9815 35.9644 37.9271 36.2182 37.8213C36.4721 37.7156 36.7025 37.5606 36.8962 37.3653C37.0915 37.1716 37.2465 36.9412 37.3522 36.6873C37.458 36.4335 37.5124 36.1612 37.5124 35.8861C37.5124 35.6111 37.458 35.3388 37.3522 35.0849C37.2465 34.8311 37.0915 34.6006 36.8962 34.407L27.9379 25.4695Z" fill="#231F20"/>
                    </svg>
                </div>

                <!-- 1 : 1 문의 구간 -->
                <div>
                    1 : 1 문의
                </div>
                <form action="#" method="post" enctype="multipart/form-data">
                    이메일<br>
                    <input type="email" name="Email" id="otoEmail" placeholder="답장 받으실 이메일을 입력해주세요."> <br>
                    <textarea name="Content" id="otoContent" cols="30" rows="10" placeholder="문의사항을 입력해주세요."></textarea> <br>

                    <label for="chooseFile">+ 사진 파일 첨부하기</label>
                    <input type="file" id="chooseFile" name="chooseFile" accept="image/*" multiple> <br>
                    <p id="fileName" name="picture"></p>
                    <div><button id="submit">메세지 전송</button></div>
                </form>
            </div>
        </div>
    </section>
    

    <script src="/resources/js/script.js"></script> <!-- 메인 헤더, 네브 js -->
    <script src="/resources/js/qna/QnAhome.js"></script>
</body>
</html>