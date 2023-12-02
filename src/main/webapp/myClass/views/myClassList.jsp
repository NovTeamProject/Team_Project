<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <title>나의 강의실</title>
    <link href="${pageContext.request.contextPath}/teacher/css/styles.css?ver=1" rel="stylesheet">
    <!-- Bootstrap icons-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet"/>
    <!-- jquery cdn-->
    <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
            crossorigin="anonymous"></script>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>


</head>
<body>
<jsp:include page="/common/views/nav.jsp"></jsp:include>
<section class="py-5">
    <div class="container px-5 my-5">
        <div class="text-center mb-5">
            <h1 class="fw-bolder">나의 강의실</h1>
            <p class="lead fw-normal text-muted mb-0">오늘도 성장하는 하루 되세요!</p>
        </div>

        <div class="row gx-5">
            <c:choose>
                <c:when test="${ClassList != null and not empty ClassList}">
                    <c:forEach items="${ClassList}" var="item">
                        <%--    JSTL의 "c:choose", "c:when"와 "c:forEach" 태그를 사용하여 수강 중인 강의 리스트가 비어있지 않을 경우 각각의 강의 정보를 순회하며 보여주는 코드--%>

                        <div class="position-relative mb-5">
                            <img style="width: 600px; height: 400px;" class="img-fluid rounded-3 mb-3" src="https://dummyimage.com/600x400/343a40/6c757d" alt="..." />
                            <a class="h3 fw-bolder text-decoration-none link-dark stretched-link" href="#!">${item.className}</a><br>
                            <a class="h5 fw-bolder text-decoration-none link-dark stretched-link" href="#!">강사 : ${item.teacherName}</a>
                            <div class="float-end">
                                <button class="btn btn-primary mb-4">질문하기</button>
                                <button class="btn btn-danger mb-4" id="${item.classIdx}">강의 삭제하기</button>
                            </div>
                        </div>

                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <div class="text-center">
                        <h2 class="fw-bolder">현재 수강 중인 강의가 없습니다.</h2>
                        <p class="lead fw-normal text-muted mb-0">새로운 강의를 수강신청 해보세요.</p><br><br>
                        <a class="btn btn-lg btn-primary" href="#!">수강 가능한 강의 목록 보기</a>
                    </div>
                </c:otherwise>
                <%--      "c:otherwise" 태그로 강의 목록이 비어있을 경우 보여줄 메시지를 정의 --%>

            </c:choose>
        </div>
    </div>
</section>


<section class="py-5 bg-light">
    <div class="container px-5 my-5">
        <h4 class="display-6 fw-bolder mb-4">천재스터디 회원님의 성장을 응원합니다.</h4>
        <h6 class="lead fw-normal text-muted mb-0">Believe in yourself.</h6>
    </div>
</section>

<%--강의 삭제 요청--%>
<script>
    document.querySelectorAll('button[id]').forEach(function(button) {
        button.addEventListener('click', function(event) {
            var classIdx = event.target.id;
            $.ajax({
                url: '/deleteClass',
                type: 'post',
                data: { classIdx: classIdx },
                success: function() {
                    alert('강의가 삭제되었습니다.');
                    location.reload();
                },
                error: function() {
                    alert('강의 삭제에 실패했습니다.');
                }
            });
        });
    });
</script>

<jsp:include page="/common/views/footer.jsp"></jsp:include>
</body>
</html>