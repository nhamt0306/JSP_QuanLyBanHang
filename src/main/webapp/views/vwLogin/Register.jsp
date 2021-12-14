<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:main>
    <jsp:attribute name="css">
       <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.20/jquery.datetimepicker.min.css" integrity="sha512-f0tzWhCwVFS3WeYaofoLWkTP62ObhewQ1EZn65oSYDZUg1+CyywGKkWzm8BxaJj5HGKI72PnMH9jYyIFz+GH7g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    </jsp:attribute>

    <jsp:attribute name="js">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.20/jquery.datetimepicker.full.min.js" integrity="sha512-AIOTidJAcHBH2G/oZv9viEGXRqDNmfdPVPYOYKGy3fti0xIplnlgMHUGfuNRzC6FkzIo0iIxgFnr9RikFxK+sw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        <script>
            $('#frmRegister').on('submit', function (e) {
                e.preventDefault();
                const username = $('#username').val();
                if(username.length ===0)
                {
                    alert("Mời bạn điền đầy đủ thông tin!");
                    return;
                };

                $.getJSON('${pageContext.request.contextPath}/Registration/IsAvailable?user=' + username, function (data) {
                    if (data ==true)
                    {
                        $('#frmRegister').off('submit').submit();
                        alert("Đăng ký thành công!");
                    }
                    else
                    {
                        alert("Tên người dùng đã tồn tại!")
                    }
                });

            });
            // $('#txtDOB').datetimepicker({
            //     format: 'd/m/Y',
            //     timepicker: false,
            //     mask: true
            // });
        </script>
    </jsp:attribute>

    <jsp:body>
        <div class="register_form">
            <section>
                <!--Bắt Đầu Phần Hình Ảnh-->
                <div class="img-bg">
                    <img src="https://niemvuilaptrinh.ams3.cdn.digitaloceanspaces.com/tao_trang_dang_nhap/hinh_anh_minh_hoa.jpg" alt="Hình Ảnh Minh Họa">
                </div>
                <!--Kết Thúc Phần Hình Ảnh-->
                <!--Bắt Đầu Phần Nội Dung-->
                <div class="noi-dung">
                    <div class="form" id="frmRegister">
                        <h2 style="margin-top: 10px">Đăng Ký</h2>
                        <form action="Register" method="post">
                            <div class="input-form">
                                <span>Tên Người Dùng</span>
                                <input type="text" name="username" placeholder="Username" id="username">
                            </div>
                            <div class="input-form">
                                <span>Mật Khẩu</span>
                                <input type="password" name="password" placeholder="Password" id="password">
                            </div>
                            <div class="input-form">
                                <span>Email</span>
                                <input type="text" name="email" placeholder="Email">
                            </div>
                            <div class="input-form">
                                <span>Nhập Lại Mật Khẩu</span>
                                <input type="password" name="repassword" placeholder="Repassword" id="repass">
                            </div>

<%--                            <div class="input-form" id="txtDOB">--%>
<%--                                <span>Ngày Sinh</span>--%>
<%--                                <input type="date" name="dateofbirth">--%>
<%--                            </div>--%>

                            <div class="input-form">
                                <input type="submit" value="Đăng Ký">
                            </div>
                            <div class="input-form">
                                <p>Bạn Đã Có Tài Khoản? <a href="${pageContext.request.contextPath}/Registration">Đăng Nhập</a></p>
                            </div>
                        </form>
                    </div>
                </div>
                <!--Kết Thúc Phần Nội Dung-->
            </section>

        </div>
    </jsp:body>
</t:main>
