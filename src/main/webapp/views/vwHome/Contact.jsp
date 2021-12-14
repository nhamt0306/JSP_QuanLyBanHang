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
        <h2 class="w3-wide" style="margin-top: 95px">LIÊN  HỆ  NGAY</h2>
        Số 1, Võ Văn Ngân, TP. Thủ Đức<br>
        SĐT: +84 79797979<br>
        Email: ute.no1@gmail.com<br>
        Mở cửa: 8:00 - 19h00 hằng ngày
        <p class="w3-opacity w3-center"><i>Gửi thắc mắc cho chúng tôi!</i></p>

        <form action="/action_page.php" target="_blank">
          <input class="w3-input" type="text" placeholder="Tên" required name="Name">
          <input class="w3-input" type="text" placeholder="Email" required name="Email">
          <input class="w3-input" type="text" placeholder="Nội dung" required name="Message"><br>
          <button class="w3-button w3-black" type="submit">Gửi cho chúng tôi</button>
        </form>
        <br>
        <img src="${pageContext.request.contextPath}/public/img/pictures/map.jpg" class="w3-image" style="width:100%">
        <p class="w3-center w3-padding">Back to <a href="${pageContext.request.contextPath}/Home" >The Duck Shop</a></p>
      </div>

      <!-- End Content -->
    </div>
  </jsp:body>
</t:main>