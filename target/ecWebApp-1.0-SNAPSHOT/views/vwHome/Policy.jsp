<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<script src="https://www.w3schools.com/lib/w3.js"></script>

<t:main>
  <jsp:body>
    <!-- Start Content -->
    <div id="home" class="w3-content">

      <!-- Contact -->
      <div id="contact" class="w3-container w3-center w3-padding-32">
        <h4 class="policy_title w3-left" style="margin-top: 65px">Chính sách VIP:</h4>
        <img src="${pageContext.request.contextPath}/public/img/chinhsach/chính%20sách%20vip_1200@300x-100.jpg" class="w3-image" style="width:100%">
        <h4 class="policy_title w3-left" style="margin-top: 50px">Chính sách bảo hành:</h4>
        <img src="${pageContext.request.contextPath}/public/img/chinhsach/bảo%20hành%20.jpg" class="w3-image" style="width:100%">
        <h4 class="policy_title w3-left" style="margin-top: 50px">Chính sách đổi trả:</h4>
        <img src="${pageContext.request.contextPath}/public/img/chinhsach/bảo%20hành@300x-100.jpg" class="w3-image" style="width:100%">
        <h4 class="policy_title w3-left" style="margin-top: 50px">Chính sách thành viên:</h4>
        <img src="${pageContext.request.contextPath}/public/img/chinhsach/web_chinhsachdoihang_chinhsachbaohanh_member.jpg" class="w3-image" style="width:100%">
        <p class="w3-center w3-padding">Back to <a href="${pageContext.request.contextPath}/Home" >The Duck Shop</a></p>
      </div>

      <!-- End Content -->
    </div>
  </jsp:body>
</t:main>