<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="/common/views/nav.jsp" />

<!DOCTYPE html>
<html>
<head>
  <title>index.html</title>
  <link href="${pageContext.request.contextPath}/common/css/style.css?ver=1" rel="stylesheet">
  <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body class="d-flex flex-column h-100">
<main class="flex-shrink-0">
  <div id="mainBanner" class="carousel slide" data-bs-ride="carousel" data-bs-pause="false">
    <div class="carousel-inner">
      <div class="carousel-item active" data-bs-interval="7000">
        <img src="https://images.pexels.com/photos/2387873/pexels-photo-2387873.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1" class="d-block w-100" alt="...">
        <div class="carousel-caption px-md-5">
          <h5>진심을 담은 강의</h5>
          <hr class="bg-light border-4 border-top border-light">
          <p>천재스터디는 여러분의 성장을 온 마음 다해 응원합니다.</p>
        </div>
      </div>
      <div class="carousel-item" data-bs-interval="7000">
        <img src="https://images.pexels.com/photos/206359/pexels-photo-206359.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1" class="d-block w-100" alt="...">
        <div class="carousel-caption px-md-5">
          <h5>인생에 꼭 필요한 강의</h5>
          <hr class="bg-light border-1 border-top border-light">
          <p>천재스터디는 여러분의 성장을 온 마음 다해 응원합니다.</p>
        </div>
      </div>
      <div class="carousel-item" data-bs-interval="7000">
        <img src="https://images.pexels.com/photos/933054/pexels-photo-933054.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1" class="d-block w-100" alt="...">
        <div class="carousel-caption px-md-5">
          <h5>평생 교육에 맞는 강의</h5>
          <hr class="bg-light border-4 border-top border-light">
          <p>천재스터디는 여러분의 성장을 온 마음 다해 응원합니다.</p>
        </div>
      </div>
      <div class="carousel-item" data-bs-interval="7000">
        <img src="https://images.pexels.com/photos/531602/pexels-photo-531602.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1" class="d-block w-100" alt="...">
        <div class="carousel-caption px-md-5">
          <h5>나의 현재를 위한 강의</h5>
          <hr class="bg-light border-4 border-top border-light">
          <p>천재스터디는 여러분의 성장을 온 마음 다해 응원합니다.</p>
        </div>
      </div>
      <div class="carousel-item" data-bs-interval="7000">
        <img src="https://images.pexels.com/photos/2876511/pexels-photo-2876511.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1" class="d-block w-100" alt="...">
        <div class="carousel-caption px-md-5">
          <h5>나의 미래를 위한 강의</h5>
          <hr class="bg-light border-4 border-top border-light">
          <p>천재스터디는 여러분의 성장을 온 마음 다해 응원합니다.</p>
        </div>
      </div>
    </div>
  </div>
  </div>

  <section class="py-5">
    <div class="container px-5 my-5">
      <div class="row gx-5 justify-content-center">
        <div class="col-lg-8 col-xl-6">
          <div class="text-center">
            <h2 class="fw-bolder">인기 강의</h2>
            <p class="lead fw-normal text-muted mb-5">수강 학생이 가장 많은 강의 목록!</p>
          </div>
        </div>
      </div>


        <div class="row gx-5">
          <c:forEach items="${topThreeClassList}" var="item" varStatus="loop">
            <div class="col-lg-4 mb-5">
              <div class="card h-100 shadow border-0">
                <img style="width: 100%; height: 300px;" class="card-img-top"
                     src="${pageContext.request.contextPath}/teacher/class-image/${item.classImageSavedFilename}" alt="..." />
                <div class="card-body p-4">
                  <div class="badge bg-primary bg-gradient rounded-pill mb-2">인기 강의 top-${loop.index + 1}!</div>
                  <a class="text-decoration-none link-dark stretched-link" href="#!"><h5 class="card-title mb-3">${item.className}</h5></a>
                  <p class="card-text mb-0">${item.classExplain}</p>
                </div>
                <div class="card-footer p-4 pt-0 bg-transparent border-top-0">
                  <div class="d-flex align-items-end justify-content-between">
                    <div class="d-flex align-items-center">
                      <img style="width: 40px; height: 40px" class="rounded-circle me-3" src="${pageContext.request.contextPath}/programming.png" alt="..." />
                      <div class="small">
                        <div class="fw-bold">수강생: ${item.listenStudent}(명)</div>
                        <div class="text-muted">${item.classRegisterDateWithYearMonthDay}</div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </c:forEach>
        </div>
    </div>
  </section>


  <section class="py-5">
    <div class="container px-5 my-5">
      <div class="row gx-5 justify-content-center">
        <div class="col-lg-8 col-xl-6">
          <div class="text-center">
            <h2 class="fw-bolder">최근에 등록된 강의</h2>
            <p class="lead fw-normal text-muted mb-5">누구보다 빠르게 수강신청 해보세요!</p>
          </div>
        </div>
      </div>
      <div class="row gx-5">
        <c:forEach items="${recentClassList}" var="item" varStatus="loop">
          <div class="col-lg-4 mb-5">
            <div class="card h-100 shadow border-0">
              <img style="width: 100%; height: 300px;" class="card-img-top"
                   src="${pageContext.request.contextPath}/teacher/class-image/${item.classImageSavedFilename}" alt="..." />
              <div class="card-body p-4">
                <div class="badge bg-success bg-gradient rounded-pill mb-2">최신 강의 #${loop.index + 1}</div>
                <a class="text-decoration-none link-dark stretched-link" href="#!"><h5 class="card-title mb-3">${item.className}</h5></a>
                <p class="card-text mb-0">${item.classExplain}</p>
              </div>
              <div class="card-footer p-4 pt-0 bg-transparent border-top-0">
                <div class="d-flex align-items-end justify-content-between">
                  <div class="d-flex align-items-center">
                    <img style="width: 40px; height: 40px" class="rounded-circle me-3" src="${pageContext.request.contextPath}/programming.png" alt="..." />
                    <div class="small">
                      <div class="fw-bold">수강생: ${item.listenStudent}(명)</div>
                      <div class="text-muted">${item.classRegisterDateWithYearMonthDay}</div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </c:forEach>
      </div>
    </div>
  </section>
</main>
</body>
</html>
<jsp:include page="/common/views/footer.jsp" />