
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String username = (String) session.getAttribute("username");
    if (username == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="css/articles.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/three.js/r128/three.min.js"></script>
    <title>Query Quest</title>
</head>
<body>
<header>
    <div id="background-container"></div>

    <nav class="navbar">
        <a href="index.jsp" class="nav-logo"><b><i>Query Quest</i></b></a>
        <ul class="nav-menu">
            <li class="nav-item">
                <a href="profile.jsp" class="nav-link">Hi, <%= username %></a>
            </li>
            <li class="nav-item">
                <a href="questions.jsp" class="nav-link">Questions</a>
            </li>
            <li class="nav-item">
                <a href="articles.jsp" class="nav-link">Articles</a>
            </li>
            <li class="nav-item">
                <a href="logout.jsp" class="nav-link">Logout</a>
            </li>
        </ul>
        <div class="hamburger">
            <span class="bar"></span>
            <span class="bar"></span>
            <span class="bar"></span>
        </div>
    </nav>
</header>

<div class="articles-heading">
    <h1 style="margin:15px">Articles</h1>
    <h2 style="font-size: 18px; font-weight: normal">'Uncover Stories That Matter'</h2>
</div>

<main class="main">
    <div class="section-container">
        <section class="left-section">
            <!-- Content for the first section goes here -->
            <div class="container">
                <h2>Category</h2>
                <a href="#" class="h3">Crimes</a>
                <a href="#" class="h3">Economy</a>
                <a href="#" class="h3">Education</a>
                <a href="#" class="h3">Environment</a>
                <a href="#" class="h3">Health</a>
                <a href="#" class="h3">Population</a>
            </div>
        </section>

        <section class="right-section">
            <!-- Content for the second section goes here -->
            <!-- Container-1-->
            <div class="container-1">
                <div class="flipper">
                    <div class="front f1">
                        <h1 style="color: #171a29">Population</h1>
                        <img src="images/img_6.png" alt="Front Image">
                    </div>
                    <div class="back">
                            <div class="image-div">
                                <img src="images/img.png" alt="Description 1" class="container-image">
                            </div>
                            <div class="content-div">
                                <h4 style="opacity: 0.9; font-weight: lighter; padding: 6px 0;">Population</h4>
                                <h3 style="color:#7a2a9e;padding-bottom:5px;">How have American households changed over time?</h3>
                                <p style="color: #ffffff;font-family: 'Times New Roman',sans-serif;opacity: 0.3">In 2023, single-parent households reached their lowest share since 1977.</p>
                            </div>
                    </div>
                </div>
            </div>

            <!--Container-2 -->
            <div class="container-1">
                <div class="flipper">
                    <div class="front f2">
                        <h1 style="color: #171a29">Health</h1>
                        <img src="images/img_7.png" alt="Front Image">
                    </div>
                    <div class="back">
                        <div class="image-div">
                            <img src="images/img.png" alt="Description 1" class="container-image">
                        </div>
                        <div class="content-div">
                            <h4 style="opacity: 0.9; font-weight: lighter; padding: 6px 0;">Population</h4>
                            <h3 style="color:#7a2a9e;padding-bottom:5px;">How have American households changed over time?</h3>
                            <p style="color: #ffffff;font-family: 'Times New Roman',sans-serif;opacity: 0.3">In 2023, single-parent households reached their lowest share since 1977.</p>
                        </div>
                    </div>
                </div>
            </div>

            <!--Container-3 -->
            <div class="container-1">
                <div class="flipper">
                    <div class="front f3">
                        <h1 style="color: #171a29">Education</h1>
                        <img src="images/img_8.png" alt="Front Image">
                    </div>
                    <div class="back">
                        <div class="image-div">
                            <img src="images/img.png" alt="Description 1" class="container-image">
                        </div>
                        <div class="content-div">
                            <h4 style="opacity: 0.9; font-weight: lighter; padding: 6px 0;">Population</h4>
                            <h3 style="color:#7a2a9e;padding-bottom:5px;">How have American households changed over time?</h3>
                            <p style="color: #ffffff;font-family: 'Times New Roman',sans-serif;opacity: 0.3">In 2023, single-parent households reached their lowest share since 1977.</p>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Container-4 -->
            <div class="container-1">
                <div class="flipper">
                    <div class="front f4">
                        <h1 style="color: #171a29">Crime</h1>
                        <img src="images/img_9.png" alt="Front Image">
                    </div>
                    <div class="back">
                        <div class="image-div">
                            <img src="images/img.png" alt="Description 1" class="container-image">
                        </div>
                        <div class="content-div">
                            <h4 style="opacity: 0.9; font-weight: lighter; padding: 6px 0;">Population</h4>
                            <h3 style="color:#7a2a9e;padding-bottom:5px;">How have American households changed over time?</h3>
                            <p style="color: #ffffff;font-family: 'Times New Roman',sans-serif;opacity: 0.3">In 2023, single-parent households reached their lowest share since 1977.</p>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Container-5 -->
            <div class="container-1">
                <div class="flipper">
                    <div class="front f5">
                        <h1 style="color: #171a29">Economy</h1>
                        <img src="images/img_10.png" alt="Front Image">
                    </div>
                    <div class="back">
                        <div class="image-div">
                            <img src="images/img.png" alt="Description 1" class="container-image">
                        </div>
                        <div class="content-div">
                            <h4 style="opacity: 0.9; font-weight: lighter; padding: 6px 0;">Population</h4>
                            <h3 style="color:#7a2a9e;padding-bottom:5px;">How have American households changed over time?</h3>
                            <p style="color: #ffffff;font-family: 'Times New Roman',sans-serif;opacity: 0.3">In 2023, single-parent households reached their lowest share since 1977.</p>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Container-6 -->
            <div class="container-1">
                <div class="flipper">
                    <div class="front f6">
                        <h1 style="color: #171a29">Environment</h1>
                        <img src="images/img_11.png" alt="Front Image">
                    </div>
                    <div class="back">
                        <div class="image-div">
                            <img src="images/img.png" alt="Description 1" class="container-image">
                        </div>
                        <div class="content-div">
                            <h4 style="opacity: 0.9; font-weight: lighter; padding: 6px 0;">Population</h4>
                            <h3 style="color:#7a2a9e;padding-bottom:5px;">How have American households changed over time?</h3>
                            <p style="color: #ffffff;font-family: 'Times New Roman',sans-serif;opacity: 0.3">In 2023, single-parent households reached their lowest share since 1977.</p>
                        </div>
                    </div>
                </div>
            </div>



            <!-- Container-2-->
<%--            <div class="container-div">--%>
<%--                <div class="image-div">--%>
<%--                    <img src="images/img_1.png" alt="Description 1" class="container-image">--%>
<%--                </div>--%>
<%--                <div class="content-div">--%>
<%--                    <h4 style="opacity: 0.9; font-weight: lighter; padding: 6px 0;">Population</h4>--%>
<%--                    <h3 style="color:#7a2a9e;padding-bottom:5px;">How have American households changed over time?</h3>--%>
<%--                    <p style="color: #ffffff;font-family: 'Times New Roman',sans-serif;opacity: 0.3">In 2023, single-parent households reached their lowest share since 1977.</p>--%>
<%--                </div>--%>
<%--            </div>--%>

<%--            <!-- Container-3-->--%>
<%--            <div class="container-div">--%>
<%--                <div class="image-div">--%>
<%--                    <img src="images/img_2.png" alt="Description 1" class="container-image">--%>
<%--                </div>--%>
<%--                <div class="content-div">--%>
<%--                    <h4 style="opacity: 0.9; font-weight: lighter; padding: 6px 0;">Population</h4>--%>
<%--                    <h3 style="color:#7a2a9e;padding-bottom:5px;">How have American households changed over time?</h3>--%>
<%--                    <p style="color: #ffffff;font-family: 'Times New Roman',sans-serif;opacity: 0.3">In 2023, single-parent households reached their lowest share since 1977.</p>--%>
<%--                </div>--%>
<%--            </div>--%>

<%--            <!-- Container-4-->--%>
<%--            <div class="container-div">--%>
<%--                <div class="image-div">--%>
<%--                    <img src="images/img_3.png" alt="Description 1" class="container-image">--%>
<%--                </div>--%>
<%--                <div class="content-div">--%>
<%--                    <h4 style="opacity: 0.9; font-weight: lighter; padding: 6px 0;">Population</h4>--%>
<%--                    <h3 style="color:#7a2a9e;padding-bottom:5px;">How have American households changed over time?</h3>--%>
<%--                    <p style="color: #ffffff;font-family: 'Times New Roman',sans-serif;opacity: 0.3">In 2023, single-parent households reached their lowest share since 1977.</p>--%>
<%--                </div>--%>
<%--            </div>--%>

<%--            <!-- Container-5-->--%>
<%--            <div class="container-div">--%>
<%--                <div class="image-div">--%>
<%--                    <img src="images/img_4.png" alt="Description 1" class="container-image">--%>
<%--                </div>--%>
<%--                <div class="content-div">--%>
<%--                    <h4 style="opacity: 0.9; font-weight: lighter; padding: 6px 0;">Population</h4>--%>
<%--                    <h3 style="color:#7a2a9e;padding-bottom:5px;">How have American households changed over time?</h3>--%>
<%--                    <p style="color: #ffffff;font-family: 'Times New Roman',sans-serif;opacity: 0.3">In 2023, single-parent households reached their lowest share since 1977.</p>--%>
<%--                </div>--%>
<%--            </div>--%>


<%--            <!-- Container-6-->--%>
<%--            <div class="container-div">--%>
<%--                <div class="image-div">--%>
<%--                    <img src="images/img_5.png" alt="Description 1" class="container-image">--%>
<%--                </div>--%>
<%--                <div class="content-div">--%>
<%--                    <h4 style="opacity: 0.9; font-weight: lighter; padding: 6px 0;">Population</h4>--%>
<%--                    <h3 style="color:#7a2a9e;padding-bottom:5px;">How have American households changed over time?</h3>--%>
<%--                    <p style="color: #ffffff;font-family: 'Times New Roman',sans-serif;opacity: 0.3">In 2023, single-parent households reached their lowest share since 1977.</p>--%>
<%--                </div>--%>
<%--            </div>--%>

<%--            <!-- Container-7-->--%>
<%--            <div class="container-div">--%>
<%--                <div class="image-div">--%>
<%--                    <img src="images/img.png" alt="Description 1" class="container-image">--%>
<%--                </div>--%>
<%--                <div class="content-div">--%>
<%--                    <h4 style="opacity: 0.9; font-weight: lighter; padding: 6px 0;">Population</h4>--%>
<%--                    <h3 style="color:#7a2a9e;padding-bottom:5px;">How have American households changed over time?</h3>--%>
<%--                    <p style="color: #ffffff;font-family: 'Times New Roman',sans-serif;opacity: 0.3">In 2023, single-parent households reached their lowest share since 1977.</p>--%>
<%--                </div>--%>
<%--            </div>--%>

<%--            <!-- Container-8-->--%>
<%--            <div class="container-div">--%>
<%--                <div class="image-div">--%>
<%--                    <img src="images/img.png" alt="Description 1" class="container-image">--%>
<%--                </div>--%>
<%--                <div class="content-div">--%>
<%--                    <h4 style="opacity: 0.9; font-weight: lighter; padding: 6px 0;">Population</h4>--%>
<%--                    <h3 style="color:#7a2a9e;padding-bottom:5px;">How have American households changed over time?</h3>--%>
<%--                    <p style="color: #ffffff;font-family: 'Times New Roman',sans-serif;opacity: 0.3">In 2023, single-parent households reached their lowest share since 1977.</p>--%>
<%--                </div>--%>
<%--            </div>--%>

<%--            <!-- Container-9-->--%>
<%--            <div class="container-div">--%>
<%--                <div class="image-div">--%>
<%--                    <img src="images/img.png" alt="Description 1" class="container-image">--%>
<%--                </div>--%>
<%--                <div class="content-div">--%>
<%--                    <h4 style="opacity: 0.9; font-weight: lighter; padding: 6px 0;">Population</h4>--%>
<%--                    <h3 style="color:#7a2a9e;padding-bottom:5px;">How have American households changed over time?</h3>--%>
<%--                    <p style="color: #ffffff;font-family: 'Times New Roman',sans-serif;opacity: 0.3">In 2023, single-parent households reached their lowest share since 1977.</p>--%>
<%--                </div>--%>
<%--            </div>--%>
        </section>
    </div>
</main>


</body>
</html>
