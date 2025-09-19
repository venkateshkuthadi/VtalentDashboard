<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String homeLink = "index.jsp"; 
	String contactPage="contact.html";
	String courses="courses.html";// default home link
    if (session.getAttribute("student") != null) {
        homeLink = "student.jsp";
        contactPage="Studentcontactpage.html";
        courses="CoursesPage.html";
    }
%>

<!-- The content below won't be displayed due to redirect logic above -->
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Python Course Content</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <style>
    body {
      font-family: Arial, sans-serif;
      margin: 0;
      background: #f4f6f8;
      color: #333;
    }

    header {
      background: #422ea1;
      color: #ffffff;
      padding: 20px 40px;
      display: flex;
      align-items: center;
      justify-content: space-between;
      box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    }

    .logo {
      height: 60px;
      width: auto;
    }

    nav a {
      color: #fff;
      margin-left: 20px;
      text-decoration: none;
      font-weight: bold;
    }

    nav a:hover {
      text-decoration: underline;
    }

    .course-title {
      text-align: center;
      margin-top: 20px;
    }

    .course-title h1 {
      font-size: 2.5em;
      color: #333;
      margin: 0;
      text-decoration: underline;
    }

    .container {
      display: flex;
      justify-content: center;
      padding: 40px;
    }

    .box {
      background: #fff;
      padding: 25px;
      border-radius: 12px;
      box-shadow: 0 4px 10px rgba(0,0,0,0.1);
      width: 70%;
      max-width: 900px;
    }

    h2 {
      margin-top: 25px;
      color: #2c3e50;
      border-bottom: 2px solid #422ea1;
      padding-bottom: 6px;
    }

    ul {
      margin-left: 20px;
      line-height: 1.7;
    }

    li {
      margin-bottom: 6px;
    }
  </style>
</head>
<body>

  <header>
    <div class="logo-box">
      <img src="images/logo.jpg.jpg" class="logo" alt="Logo" />
    </div>
    <nav>
      <a href="<%= homeLink %>">Home</a>
      <a href="<%= courses %>">Courses</a>
      <a href="<%= contactPage %>">Contact</a>
    </nav>
  </header>

  <div class="course-title">
    <h1>Course Content</h1>
  </div>

  <div class="container">
    <div class="box">

      <h2>Python General-Purpose Libraries</h2>
      <ul>
        <li>NumPy – Numerical computing & arrays</li>
        <li>Pandas – Data manipulation & analysis</li>
        <li>Matplotlib, Seaborn, Plotly – Visualization</li>
        <li>OpenCV – Image processing</li>
        <li>Requests & BeautifulSoup – API & Web scraping</li>
        <li>PyPDF2 / pdfplumber – PDF handling</li>
        <li>Streamlit / Gradio – Build AI/ML web apps</li>
      </ul>

      <h2>Machine Learning</h2>
      <ul>
        <li>scikit-learn, LightGBM, Optuna, Imbalanced-learn</li>
        <li><b>Supervised Learning:</b> Logistic Regression, Decision Trees, Random Forest, KNN, SVM, Naive Bayes</li>
        <li><b>Regression:</b> Linear, Lasso, SVR, Gradient Boosting (XGBoost, LightGBM, CatBoost)</li>
        <li><b>Unsupervised:</b> k-Means, Hierarchical, DBSCAN, Gaussian Mixture Models</li>
      </ul>

      <h2>Deep Learning</h2>
      <ul>
        <li>TensorFlow</li>
        <li>Keras</li>
        <li>PyTorch</li>
        <li>FastAI</li>
      </ul>

      <h2>NLP (Natural Language Processing)</h2>
      <ul>
        <li>NLTK</li>
        <li>spaCy</li>
        <li>TextBlob</li>
        <li>Transformers (BERT, GPT, T5)</li>
        <li>SentenceTransformers</li>
      </ul>

      <h2>Computer Vision</h2>
      <ul>
        <li>OpenCV, scikit-image, torchvision</li>
        <li>YOLOv5/YOLOv8, MMDetection</li>
      </ul>

      <h2>Speech & Audio AI</h2>
      <ul>
        <li>SpeechRecognition, Vosk, Whisper</li>
        <li>pydub, gTTS</li>
      </ul>

      <h2>Generative AI</h2>
      <ul>
        <li>OpenAI GPT (3.5, 4)</li>
        <li>Google Gemini API</li>
        <li>LLaMA 2/3, Claude</li>
        <li>Stable Diffusion, DALL·E</li>
      </ul>

      <h2>Sample Projects</h2>
      <ul>
        <li>Apollo Hospital Chatbot – Login/Signup, Voice Input, Gemini AI, Appointment Booking</li>
        <li>Smart Agriculture Planning System – Weather API, Crop Recommendation</li>
        <li>Auto Typing / AI Content Generator – Automated typing with AI APIs</li>
      </ul>

    </div>
  </div>
</body>
</html>
