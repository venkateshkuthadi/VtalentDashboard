<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>About Us - VTalent Institute</title>
  <style>
    body {
      margin: 0;
      font-family: "Segoe UI", Arial, sans-serif;
      background: linear-gradient(to bottom, #0f172a, #000);
      color: #f1f5f9;
    }

    /* Navbar */
    .navbar {
      display: flex;
      justify-content: space-between;
      align-items: center;
      background-color: aliceblue;
      padding: 10px 40px;
    }
    .logo img {
      height: 50px;
    }
    .options ul {
      margin: 0;
      padding: 0;
    }
    .options li {
      list-style: none;
      display: inline-block;
    }
    .options li a {
      color: #0b3f8c;
      font-size: 18px;
      margin-right: 40px;
      text-decoration: none;
      padding: 8px 16px;
      border-radius: 5px;
      transition: all 0.3s ease;
    }

    /* Navbar hover effects */
    #index_page:hover,
    #contact_page:hover,
    #content_page:hover {
      background-color: aliceblue;
      color: orangered;
    }
    #login_page {
      background-color: rgb(255, 69, 0);
      color: white;
    }
    #register_page {
      background-color: orangered;
      color: white;
    }
    #login_page:hover,
    #register_page:hover {
      background-color: white;
      color: #0b3f8c;
      box-shadow: 10px 10px 10px rgba(0, 123, 255, 0.7);
    }

    /* Header text */
    .header-content {
      text-align: center;
      padding: 40px 20px 20px;
    }
    .header-content h1 {
      font-size: 2.5rem;
      font-weight: 800;
      background: linear-gradient(to right, #818cf8, #38bdf8, #2dd4bf);
      -webkit-background-clip: text;
      background-clip: text;
      -webkit-text-fill-color: transparent;
      color: transparent;
    }
    .header-content p {
      margin-top: 10px;
      max-width: 800px;
      margin-inline: auto;
      color: #cbd5e1;
      font-size: 1.05rem;
    }

    /* CEO + About Container */
    .container {
      max-width: 1200px;
      margin: 0 auto;
      padding: 40px 20px;
      display: grid;
      grid-template-columns: 1fr 2fr;
      gap: 40px;
    }
    .card {
      background: rgba(30, 41, 59, 0.6);
      border: 1px solid rgba(255, 255, 255, 0.1);
      border-radius: 20px;
      overflow: hidden;
      box-shadow: 0 10px 25px rgba(0, 0, 0, 0.6);
      transition: transform 0.3s ease;
    }
    .card:hover {
      transform: translateY(-5px);
    }
    .ceo-photo {
      width: 100%;
      height: 350px;
      object-fit: cover;
    }
    .ceo-details {
      padding: 20px;
    }
    .ceo-details h2 {
      font-size: 1.8rem;
      font-weight: 700;
      margin: 10px 0 5px;
    }
    .ceo-details p.role {
      font-size: 0.9rem;
      color: #94a3b8;
    }
    .ceo-details p {
      margin-top: 15px;
      line-height: 1.5;
      color: #e2e8f0;
    }
    .quote {
      margin-top: 20px;
      padding: 15px;
      border-left: 4px solid #38bdf8;
      background: rgba(15, 23, 42, 0.5);
      font-style: italic;
      border-radius: 10px;
    }

    /* About section */
    .about {
      padding: 30px;
      background: rgba(30, 41, 59, 0.6);
      border-radius: 20px;
      border: 1px solid rgba(255, 255, 255, 0.1);
      box-shadow: 0 10px 25px rgba(0, 0, 0, 0.6);
    }
    .about h3 {
      font-size: 2rem;
      margin-bottom: 20px;
      font-weight: 700;
    }
    .about p {
      line-height: 1.6;
      margin-bottom: 20px;
      color: #e2e8f0;
    }

    /* Features */
    .features {
      display: grid;
      grid-template-columns: 1fr 1fr;
      gap: 20px;
    }
    .feature-box {
      padding: 15px;
      border: 1px solid rgba(255, 255, 255, 0.1);
      background: rgba(15, 23, 42, 0.7);
      border-radius: 15px;
    }
    .feature-box h4 {
      margin-bottom: 10px;
      font-size: 1.2rem;
      font-weight: 600;
      color: #f8fafc;
    }
    .feature-box ul {
      margin: 0;
      padding-left: 20px;
      list-style: disc;
      color: #cbd5e1;
    }

    /* ========= Hero Slider (no cropping) ========= */
.hero {
  position: relative;
  overflow: hidden;
  height: 150px; /* unified height */
  background: #fff;
}
.carousel { width: 100%; height: 100%; }
.slides { display: flex; transition: transform 0.5s ease-in-out; height: 100%; }
.slide { min-width: 100%; height: 500px; }
.slide img {
  width: 50%;
  height: 30%;
  display: block;
  margin: 0 auto;
  object-fit: cover; /* keeps logos visible without cropping */
  background: #fff;
}
.prev, .next {
  position: absolute;
  top: 50%;
  transform: translateY(-50%);
  background: rgba(0,0,0,0.5);
  color: #fff;
  border: none;
  width: 44px;
  height: 44px;
  border-radius: 50%;
  font-size: 20px;
  cursor: pointer;
}
.prev { left: 12px; }
.next { right: 12px; }

    /* Stats */
    .stats {
      margin-top: 30px;
      display: grid;
      grid-template-columns: repeat(4, 1fr);
      gap: 15px;
    }
    .stat-box {
      text-align: center;
      background: rgba(15, 23, 42, 0.7);
      border-radius: 12px;
      padding: 15px;
      border: 1px solid rgba(255, 255, 255, 0.1);
    }
    .stat-box h5 {
      font-size: 1.5rem;
      font-weight: 700;
    }
    .stat-box span {
      font-size: 0.8rem;
      color: #94a3b8;
    }

    /* Responsive */
    @media (max-width: 900px) {
      .container {
        grid-template-columns: 1fr;
      }
      .features {
        grid-template-columns: 1fr;
      }
      .stats {
        grid-template-columns: repeat(2, 1fr);
      }
    }
  </style>
</head>
<body>

  <!-- Navbar + Header -->
  <header>
    <div class="navbar">
      <div class="logo">
        <img src="https://vtalent.in/images/vtalentlogo.png" alt="logo">
      </div>
      <div class="options">
        <ul>
          <li><a href="Homepage.html" id="index_page">Home</a></li>
          <li><a href="Coursespage.html" id="content_page">Course</a></li>
          <li><a href="ViewContactInformation.html" id="contact_page">Contact</a></li>
          <li><a href="aboutus.jsp" id="aboutus_page">About</a></li>
          <li><a href="Placement_section.jsp" id="placements_page">Placements</a></li>
        </ul>
      </div>
    </div>
    <div class="header-content">
      <h1>About VTalent</h1>
      <p>VTalent is a Company Based technical training, skill development, and placement organization building job-ready software talent across India.</p>
    </div>
  </header>

  <!-- CEO + About Section -->
  <div class="container">
    <!-- CEO Section -->
    <div class="card">
      <img src="images/CEO.DNG" alt="CEO" class="ceo-photo">
      <div class="ceo-details">
        <h2>Mr. Prasad Mandava</h2>
        <p class="role">Chief Executive Officer, VTalent</p>
        <p>With extensive experience in IT talent acquisition and training, Prasad leads VTalent's mission to bridge the gap between education and employability through industry-aligned programs and mentoring.</p>
        <div class="quote">"Graduation isn't the end-it's the beginning of your career journey. Build skills that map to real roles."</div>
      </div>
    </div>

    <!-- Institute Section -->
    <div class="about">
      <h3>Who We Are</h3>
      <p>Vtalent is a leading Technical Training, Skill Development and Placement company based in Hyderabad serving PAN India. Our courses are designed and developed by IT Veterans with more than a decade of experience in training and placing the right candidates in leading MNC's.</p>

      <div class="features">
        <div class="feature-box">
          <h4>Job-Ready Curriculum</h4>
          <ul>
            <li>Full-stack tracks in Java, .NET, Python With AWS Cloud</li>
            <li>Salesforce developer pathway</li>
            <li>Data Science fundamentals to projects</li>
            <li>Gen AI & Machine Learning With AWS Cloud</li>
          </ul>
        </div>
        <div class="feature-box">
          <h4>Mentorship & Placements</h4>
          <ul>
            <li>Aptitude Training</li>
            <li>GD / JAM Sessions</li>
            <li>Resume Preparation & Presentation</li>
            <li>Interview prep & mock panels</li>
            <li>Soft-skills coaching</li>
            <li>Guidance aligned to hiring needs</li>
            <li>Placements in TOP MNC's & Mid Level Companies</li>
            <li>Duration - 4 Months</li>
          </ul>
        </div>
      </div>

      <section class="hero">
    <div class="carousel">
      <div class="slides" id="slides">
        <!-- Images -->
        <div class="slide"><img src="https://globalprimenews.com/wp-content/uploads/2022/09/IMG-20220926-WA0017.jpg" alt="photo1" /></div>
        <div class="slide"><img src="https://i.ytimg.com/vi/Om9_ehc8fY0/hqdefault.jpg" alt="photo2" /></div>
        <div class="slide"><img src="https://content.jdmagicbox.com/v2/comp/bangalore/j3/080pxx80.xx80.150224140928.e4j3/catalogue/accenture-services-pvt-ltd-bellandur-bangalore-international-call-centres-5ux9ifj1ya.jpg" alt="photo3" /></div>
        <div class="slide"><img src="https://content.linkedin.com/content/dam/me/business/en-us/sales-solutions/resources/images/apac/images/infosys-logo.png.original.png" alt="photo4" /></div>
        <div class="slide"><img src="https://assets.bizclikmedia.net/1800/2078fc51a1d0c01acb89f9059988b282:1a2d75da422936e0dbe19112ce90cd57/screenshot-77.png" alt="photo5" /></div>
        <div class="slide"><img src="https://www.hrkatha.com/wp-content/uploads/2024/02/Capgemini.png" alt="photo6" /></div>
        <div class="slide"><img src="https://www.ltimindtree.com/wp-content/uploads/2022/12/Podcast-Logo.jpg" alt="photo7" /></div>
        <div class="slide"><img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQrOCGn0hJhqcLCJmCTdPYb5s6OjL3TQpgmtxNi00VNIj2MHg6dzyKAz0qPLILUUILS4w8&usqp=CAU" alt="photo8" /></div>
        <div class="slide"><img src="https://logos-world.net/wp-content/uploads/2023/03/Cognizant-Logo.jpg" alt="photo8" /></div>
        <div class="slide"><img src="https://images.livemint.com/img/2020/08/24/1600x900/logo_1598270990368_1598271001545.jpg" alt="photo9" /></div>
        <div class="slide"><img src="https://www.unlistedsharebrokers.com/wp-content/uploads/2021/10/l-n-t-infotech-pre-ipo-shares.jpg" alt="photo10" /></div>
        <div class="slide"><img src="https://www.consultancy.in/profile/media/ernst-young-spotlight-2023-08-31-121406490.svg" alt="photo11" /></div>
        <div class="slide"><img src="https://m.media-amazon.com/images/I/31epF-8N9LL.png" alt="photo12" /></div>
        <div class="slide"><img src="https://images.ctfassets.net/lyvx7el2wsii/2d1y7KHyqz3le8pWGU085g/9db09a55bf007266a5acf100b9d682ce/GSPANN_Logo.png" alt="photo13" /></div>
        <div class="slide"><img src="https://www.magnasoft.com/wp-content/uploads/2023/04/magnasoft-logo-1.jpg" alt="photo14" /></div>
        <div class="slide"><img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRgPa05rrLog6JjB9oyWBFy62L-majq_i75uQ&s" alt="photo2" /></div>
        <div class="slide"><img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRKkUooq-YT9G5S_jHVj3uzPyaZ1uMNJbJlJO7PfGSqHMZXnkaqXI512kGJCQ6E7Xl9NEc&usqp=CAU" alt="photo2" /></div>
        <div class="slide"><img src="https://innocito.com/wp-content/uploads/2023/08/Innocito-Logo-SEO.jpg" alt="photo2" /></div>
      </div>
      <button class="prev" id="prevBtn" aria-label="Previous"><</button>
      <button class="next" id="nextBtn" aria-label="Next">></button>
    </div>
  </section>

      <div class="stats">
        <div class="stat-box">
          <h5>10+</h5>
          <span>Years of mentoring</span>
        </div>
        <div class="stat-box">
          <h5>5+</h5>
          <span>Programs</span>
        </div>
        <div class="stat-box">
          <h5>Real-world</h5>
          <span>Capstone projects</span>
        </div>
        <div class="stat-box">
          <h5>Outcome-driven</h5>
          <span>Focus</span>
        </div>
      </div>
    </div>
  </div>

  <script>
document.addEventListener("DOMContentLoaded", () => {
  let currentIndex = 0;
  const slidesEl = document.getElementById('slides');
  const totalSlides = slidesEl.children.length;
  let timer;

  function goTo(index) {
    currentIndex = (index + totalSlides) % totalSlides;
    slidesEl.style.transform = `translateX(-${currentIndex * 100}%)`;
  }

  function next() { goTo(currentIndex + 1); }
  function prev() { goTo(currentIndex - 1); }

  document.getElementById('nextBtn').addEventListener('click', next);
  document.getElementById('prevBtn').addEventListener('click', prev);

  // Start auto-slide
  function startAuto() {
    timer = setInterval(next, 2000); // slower (2s)
  }

  function stopAuto() {
    clearInterval(timer);
  }

  startAuto();

  // Pause on hover
  const hero = document.querySelector('.hero');
  hero.addEventListener('mouseenter', stopAuto);
  hero.addEventListener('mouseleave', startAuto);
});
</script>



</body>
</html>