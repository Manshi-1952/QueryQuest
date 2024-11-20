<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%@ page import="jakarta.servlet.http.HttpServletRequest" %>

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
    <link rel="stylesheet" href="css/index.css">
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

<main class="main">
    <div class="one half">
        <h1>Welcome to <span style="color: #b173dc;">Query Quest</span></h1>
        <p>Your go-to place to ask questions and share knowledge</p>
        <p>Query Quest is your ultimate platform for asking questions, sharing insights, and discovering answers. Connect with a community of curious minds, dive into engaging discussions, and expand your knowledge with ease.</p>
        <div class="buttons">
            <a href="ask-question.jsp" class="button">Ask a Question</a>
            <a href="create-post.jsp" class="button sec">Create a New Post</a>
        </div>
    </div>
    <div class="two half">
        <img src="images/hero.png" alt="Hero Image">
    </div>
</main>

<footer>
    <p>&copy; 2024 Query Quest. All rights reserved.</p>
</footer>

<script>
    const hamburger = document.querySelector(".hamburger");
    const navMenu = document.querySelector(".nav-menu");

    hamburger.addEventListener("click", mobileMenu);

    function mobileMenu() {
        hamburger.classList.toggle("active");
        navMenu.classList.toggle("active");
    }

    const navLink = document.querySelectorAll(".nav-link");

    navLink.forEach(n => n.addEventListener("click", closeMenu));

    function closeMenu() {
        hamburger.classList.remove("active");
        navMenu.classList.remove("active");
    }

    // const scene = new THREE.Scene();
    // const camera = new THREE.PerspectiveCamera(75, window.innerWidth / window.innerHeight, 0.1, 1000);
    // const renderer = new THREE.WebGLRenderer({ alpha: true });
    // renderer.setSize(window.innerWidth, window.innerHeight);
    // document.getElementById('background-container').appendChild(renderer.domElement);
    //
    // // Create geometry and material
    // const geometry = new THREE.SphereGeometry(5, 32, 32);
    // const material = new THREE.MeshBasicMaterial({ color: 0x893BAD, wireframe: true });
    // const sphere = new THREE.Mesh(geometry, material);
    // scene.add(sphere);
    //
    // // Set camera position
    // camera.position.z = 15;
    //
    // // Animate the sphere
    // function animate() {
    //     requestAnimationFrame(animate);
    //     sphere.rotation.x += 0.005;
    //     sphere.rotation.y += 0.005;
    //     renderer.render(scene, camera);
    // }
    //
    // animate();
    //
    // // Handle window resizing
    // window.addEventListener('resize', function () {
    //     renderer.setSize(window.innerWidth, window.innerHeight);
    //     camera.aspect = window.innerWidth / window.innerHeight;
    //     camera.updateProjectionMatrix();
    // });

</script>
</body>
</html>