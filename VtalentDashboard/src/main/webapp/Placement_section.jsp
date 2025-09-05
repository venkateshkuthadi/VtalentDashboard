<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Placed Students</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
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

    section {
      height: 100vh;
      padding: 50px;
    }

    .card mb-3 {
      margin: 50rem;

    }

    .card-body {
      margin: 10px;
      background-color: aliceblue;

    }

    .card-body:hover {
      box-shadow: 10px 10px 10px rgba(20, 24, 29, 0.7);

    }

    .h2 {
      margin-bottom: 120px;
    }

    #content {
      margin-bottom: 25px;
    }

    .card-footer text-body-secondary {
      height: 40px;
    }

    .blockquote {
      display: inline-block;
    }

    #hyd_address:hover,
    #vizak_address:hover {
      background-color: white;
      position: absolute;
      box-shadow: 10px 10px 10px rgba(20, 24, 29, 0.7);

    }
  </style>
  <style>
    /* Header Styling */
    header {
      color: #ffffff;
    }

    .header-container {
      display: flex;
      align-items: center;
      justify-content: center;
      position: relative;
    }

    .logo-box {
      position: absolute;
      left: 20px;
    }

    .logo {
      height: 60px;
      width: auto;
    }

    .content {
      text-align: center;
    }

    .content h1 {
      margin: 0;
      font-size: 2em;
    }

    nav {
      margin-top: 10px;
    }

    nav a {
      color: white;
      margin: 0 15px;
      text-decoration: none;
      font-weight: bold;
    }

    nav a:hover {
      text-decoration: underline;
    }

    .btn.Home {
      background: #ff7a00;
      color: #fff;
      margin-left: 8px;
    }

    .btn.Contact {
      background: #ff7a00;
      color: #fff;
      margin-left: 8px;
    }

    body {
      font-family: Arial, sans-serif;
      background: #f9f9f9;
    }

    /* ✅ Auto scroll container */
    .scroll-wrapper {
      overflow: hidden;
      white-space: nowrap;
      width: 100%;
      box-sizing: border-box;
    }

    .scroll-container {
      display: inline-flex;
      gap: 20px;
      animation: scroll-left 90s linear infinite;
      /* auto scroll */
    }

    @keyframes scroll-left {
      0% {
        transform: translateX(0);
      }

      100% {
        transform: translateX(-50%);
      }

      /* move half because we duplicate cards */
    }

    .student-card {
      background: #fff;
      border-radius: 12px;
      width: 250px;
      flex: 0 0 auto;
      box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
      text-align: center;
      overflow: hidden;
      transition: 0.3s;
      position: relative;
    }

    .student-card:hover {
      transform: translateY(-5px);
      box-shadow: 0 6px 16px rgba(0, 0, 0, 0.15);
    }

    .student-card img {
      width: 100%;
      height: 300px;
      object-fit: cover;
      display: block;
    }

    .student-card h3 {
      margin: 10px 0 5px;
      font-size: 16px;
      color: #333;
    }

    .student-card p {
      font-size: 18px;
      font-weight: bold;
      margin: 0 0 40px;
      color: #000;
    }

    /* Auto scrolling text inside card */
    .scroll-text {
      position: absolute;
      bottom: 0;
      width: 100%;
      background: #eee;
      padding: 5px 0;
      overflow: hidden;
      white-space: nowrap;
    }

    .scroll-text span {
      display: inline-block;
      padding-left: 100%;
      animation: text-scroll 20s linear infinite;
      font-size: 14px;
      color: #444;
    }

    @keyframes text-scroll {
      0% {
        transform: translateX(0);
      }

      100% {
        transform: translateX(-100%);
      }
    }
  </style>
</head>
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

</header>
<br>
<br>
<br>

<body>
  <!-- ✅ Auto Scrolling Cards -->
  <div class="scroll-wrapper">
    <div class="scroll-container">

      <!-- Cards Set 1 -->
      <div class="student-card">
        <img src="Placement_imgs/mojesh.jpg">
        <h3>Mojesh (2025)</h3>
        <p>HCL</p>
        <div class="scroll-text"><span>Congratulations! Placed in HCL - Keep Shining!</span></div>
      </div>

      <div class="student-card">
        <img src="Placement_imgs/Sita.jpg">
        <h3>Sita Maha Lakshmi (2025)</h3>
        <p>CONVERGEONE</p>
        <div class="scroll-text"><span>Big Achievement! Placed in CONVERGEONE - Wishing Success!</span></div>
      </div>

      <div class="student-card">
        <img src="Placement_imgs/venkatesh.jpg">
        <h3>G Venkatesh (2025)</h3>
        <p>Cognizant</p>
        <div class="scroll-text"><span>Great Work! Placed in Cognizant - Congratulations!</span></div>
      </div>

      <div class="student-card">
        <img src="Placement_imgs/tejaswini.jpg">
        <h3>P Tejaswi (2024)</h3>
        <p>PROLIFICS</p>
        <div class="scroll-text"><span>Well Done! Placed in PROLIFICS - Keep Growing!</span></div>
      </div>

      <div class="student-card">
        <img src="Placement_imgs/balu_prakash.jpg">
        <h3>Balu Prakash (2024)</h3>
        <p>PROLIFICS</p>
        <div class="scroll-text"><span>Fantastic! Placed in Tech PROLIFICS - All the Best!</span></div>
      </div>

      <!-- ✅ Duplicate Cards for Infinite Effect -->
      <div class="student-card">
        <img src="Placement_imgs/Ramya.jpg">
        <h3>Ramya (2025)</h3>
        <p>Cognizant</p>
        <div class="scroll-text"><span>Congratulations! Placed in Cognizant - Keep Shining!</span></div>
      </div>

      <div class="student-card">
        <img src="Placement_imgs/chandra_shekar.jpg">
        <h3>Chandra Sekhar (2024)</h3>
        <p>Magnasoft</p>
        <div class="scroll-text"><span>Big Achievement! Placed in Magnasoft - Wishing Success!</span></div>
      </div>

      <div class="student-card">
        <img src="Placement_imgs/nagendra.jpg">
        <h3>Nagendra (2025)</h3>
        <p>Innocito</p>
        <div class="scroll-text"><span>Great Work! Placed in Innocito - Congratulations!</span></div>
      </div>

      <div class="student-card">
        <img src="Placement_imgs/pushpa.jpg">
        <h3>CH Pushpa (2024)</h3>
        <p>PROLIFICS</p>
        <div class="scroll-text"><span>Well Done! Placed in PROLIFICS - Keep Growing!</span></div>
      </div>

      <div class="student-card">
        <img src="Placement_imgs/krishna_sai.jpg">
        <h3>Varanasi Krishna Sai (2024)</h3>
        <p>WIPRO</p>
        <div class="scroll-text"><span>Fantastic! Placed in WIPRO - All the Best!</span></div>
      </div>


      <div class="student-card">
        <img src="Placement_imgs/kanishk.jpg">
        <h3>Kanishk Reddy (2024)</h3>
        <p>GSPANN</p>
        <div class="scroll-text"><span>Fantastic! Placed in GSPANN - All the Best!</span></div>
      </div>

      <div class="student-card">
        <img src="Placement_imgs/sri_datu.jpg">
        <h3>Sri Datu (2024)</h3>
        <p>EY</p>
        <div class="scroll-text"><span>Fantastic! Placed iN EY - All the Best!</span></div>
      </div>

      <div class="student-card">
        <img src="Placement_imgs/Anusha.jpg">
        <h3>K Anusha (2024)</h3>
        <p>WIPRO</p>
        <div class="scroll-text"><span>Well Done! Placed in WIPRO - Keep Growing!</span></div>
      </div>

      <div class="student-card">
        <img src="Placement_imgs/navya_sri.jpg">
        <h3>Magam Navyasri (2024)</h3>
        <p>Magnasoft</p>
        <div class="scroll-text"><span>Fantastic! Placed in Magnasoft - All the Best!</span></div>
      </div>


      <div class="student-card">
        <img src="Placement_imgs/ashrita.jpg">
        <h3>Ravula Ashritha (2024)</h3>
        <p>Cognizant</p>
        <div class="scroll-text"><span>Fantastic! Placed in Cognizant - All the Best!</span></div>
      </div>

      <div class="student-card">
        <img src="Placement_imgs/anil.jpg">
        <h3>B Anil (2024)</h3>
        <p>GSPANN</p>
        <div class="scroll-text"><span>Fantastic! Placed in GSPANN - All the Best!</span></div>
      </div>

      <div class="student-card">
        <img src="Placement_imgs/anuhya.jpg">
        <h3>Anuhya (2024)</h3>
        <p>WIPRO</p>
        <div class="scroll-text"><span>Fantastic! Placed in WIPRO - All the Best!</span></div>
      </div>

      <div class="student-card">
        <img src="Placement_imgs/soundarya.jpg">
        <h3>Soundarya (2024)</h3>
        <p>Cognizant</p>
        <div class="scroll-text"><span>Fantastic! Placed in Cognizant - All the Best!</span></div>
      </div>

      <div class="student-card">
        <img src="Placement_imgs/Vyashanavi.jpg">
        <h3>Vyshnavi (2024)</h3>
        <p>Cognizant</p>
        <div class="scroll-text"><span>Fantastic! Placed in Cognizant - All the Best!</span></div>
      </div>

      <div class="student-card">
        <img src="Placement_imgs/manogna.jpg">
        <h3>Manogna (2024)</h3>
        <p>BirlaSoft</p>
        <div class="scroll-text"><span>Fantastic! Placed in BirlaSoft - All the Best!</span></div>
      </div>

      <div class="student-card">
        <img src="Placement_imgs/hima.jpg">
        <h3>Hima (2024)</h3>
        <p>HCL</p>
        <div class="scroll-text"><span>Fantastic! Placed in HCL - All the Best!</span></div>
      </div>

      <div class="student-card">
        <img src="Placement_imgs/rama_venkata.jpg">
        <h3>Rama Venkata Naga Sai (2024)</h3>
        <p>Tech Mahindra</p>
        <div class="scroll-text"><span>Fantastic! Placed in Tech Mahindra - All the Best!</span></div>
      </div>

      <div class="student-card">
        <img src="Placement_imgs/Prasanna.jpg">
        <h3>K Prasanna (2024)</h3>
        <p>Cognizant</p>
        <div class="scroll-text"><span>Fantastic! Placed in Cognizant - All the Best!</span></div>
      </div>

      <div class="student-card">
        <img src="Placement_imgs/karunakar.jpg">
        <h3>Karunakar (2024)</h3>
        <p>Cognizant</p>
        <div class="scroll-text"><span>Fantastic! Placed in Cognizant - All the Best!</span></div>
      </div>

      <div class="student-card">
        <img src="Placement_imgs/swetha.jpg">
        <h3>B Swetha (2024)</h3>
        <p>WIPRO</p>
        <div class="scroll-text"><span>Fantastic! Placed in WIPRO - All the Best!</span></div>
      </div>

    </div>
  </div>
</body>
</html>