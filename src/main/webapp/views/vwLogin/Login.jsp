<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:main>
    <jsp:attribute name="css">
       <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.20/jquery.datetimepicker.min.css" integrity="sha512-f0tzWhCwVFS3WeYaofoLWkTP62ObhewQ1EZn65oSYDZUg1+CyywGKkWzm8BxaJj5HGKI72PnMH9jYyIFz+GH7g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    </jsp:attribute>

    <jsp:attribute name="js">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.20/jquery.datetimepicker.full.min.js" integrity="sha512-AIOTidJAcHBH2G/oZv9viEGXRqDNmfdPVPYOYKGy3fti0xIplnlgMHUGfuNRzC6FkzIo0iIxgFnr9RikFxK+sw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        <script>
            $('#frmLogin').on('submit', function (e) {
                e.preventDefault();
                const username = $('#username').val();
                const password = $('#password').val();

                $.getJSON('${pageContext.request.contextPath}/Registration/LoginSuccess?user=' + username+'&pass='+password, function (data) {
                    if (data ==true)
                    {
                        $('#frmLogin').off('submit').submit();
                    }
                    else
                    {
                        alert("Đăng nhập thất bại! Vui lòng kiểm tra lại tài khoản, mật khẩu!")
                    }
                });

            });
        </script>
    </jsp:attribute>
    <jsp:body>
        <div class="page">
            <section>
                <!--Bắt Đầu Phần Hình Ảnh-->
                <div class="img-bg">
                    <img src="https://niemvuilaptrinh.ams3.cdn.digitaloceanspaces.com/tao_trang_dang_nhap/hinh_anh_minh_hoa.jpg" alt="Hình Ảnh Minh Họa">
                </div>
                <!--Kết Thúc Phần Hình Ảnh-->
                <!--Bắt Đầu Phần Nội Dung-->
                <div class="noi-dung">
                    <div class="form" id="frmLogin">
                        <h2 style="margin-top: 100px">Đăng Nhập</h2>
                        <form action="Login" method="post">
                            <div class="input-form" >
                                <span>Tên Người Dùng</span>
                                <input type="text" name="login_username" placeholder="Username" id="username">
                            </div>
                            <div class="input-form">
                                <span>Mật Khẩu</span>
                                <input type="password" name="login_password" placeholder="Password" id="password">
                            </div>
                            <div class="nho-dang-nhap">
                                <label><input type="checkbox" name=""> Nhớ Đăng Nhập</label>
                            </div>
                            <div class="input-form">
                                <input type="submit" value="Đăng Nhập">
                            </div>
                            <div class="input-form">
                                <p>Bạn Chưa Có Tài Khoản? <a href="${pageContext.request.contextPath}/Registration/Register">Đăng Ký</a></p>
                            </div>
                        </form>
<%--                        <h3>Đăng Nhập Bằng Mạng Xã Hội</h3>--%>
<%--                        <ul class="icon-dang-nhap">--%>
<%--                            <li><i class="fab fa-facebook-square" aria-hidden="true"></i></li>--%>
<%--                            <li><i class="fab fa-google-plus-square" aria-hidden="true"></i></li>--%>
<%--                            <li><i class="fab fa-twitter-square" aria-hidden="true"></i></li>--%>
<%--                        </ul>--%>
                    </div>
                </div>
                <!--Kết Thúc Phần Nội Dung-->
            </section>
        </div>
    </jsp:body>
</t:main>