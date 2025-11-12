$targetDir = Join-Path (Get-Location) "html"
if (-not (Test-Path $targetDir)) {
    New-Item -ItemType Directory -Path $targetDir | Out-Null
}

$pages = @{
    "page01_basic_structure.html" = @'
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Basic HTML Structure</title>
</head>
<body>
    <h1>Welcome to Basic HTML</h1>
    <p>This page demonstrates the minimal HTML skeleton.</p>
</body>
</html>
'@
    "page02_headings.html" = @'
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Heading Levels</title>
</head>
<body>
    <h1>Main Title</h1>
    <h2>Section Heading</h2>
    <h3>Subsection Heading</h3>
    <h4>Sub-subsection Heading</h4>
    <h5>Minor Heading</h5>
    <h6>Smallest Heading</h6>
</body>
</html>
'@
    "page03_paragraphs.html" = @'
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Paragraphs and Text</title>
</head>
<body>
    <h1>About the Library</h1>
    <p>The city library offers a wide range of books, magazines, and digital resources.</p>
    <p>Members can access study rooms, attend events, and participate in reading clubs.</p>
</body>
</html>
'@
    "page04_lists.html" = @'
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Lists Example</title>
</head>
<body>
    <h1>Shopping Checklist</h1>
    <ul class="shopping-list">
        <li>Fresh fruits</li>
        <li>Vegetables</li>
        <li>Bread</li>
    </ul>
    <h2>Steps to Prepare Breakfast</h2>
    <ol class="breakfast-steps">
        <li>Boil water</li>
        <li>Brew coffee</li>
        <li>Toast bread</li>
    </ol>
</body>
</html>
'@
    "page05_nested_lists.html" = @'
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Nested Lists</title>
</head>
<body>
    <h1>Project Tasks</h1>
    <ul class="project-task-list">
        <li>Planning
            <ul class="subtask-list">
                <li>Define scope</li>
                <li>Gather requirements</li>
            </ul>
        </li>
        <li>Development
            <ul class="subtask-list">
                <li>Implement features</li>
                <li>Write tests</li>
            </ul>
        </li>
        <li>Launch</li>
    </ul>
</body>
</html>
'@
    "page06_table_basic.html" = @'
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Simple Table</title>
</head>
<body>
    <h1>Weekly Schedule</h1>
    <table class="schedule-table" border="1" cellpadding="6">
        <thead>
            <tr>
                <th>Day</th>
                <th>Activity</th>
                <th>Time</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>Monday</td>
                <td>Team Meeting</td>
                <td>10:00 AM</td>
            </tr>
            <tr>
                <td>Wednesday</td>
                <td>Workshop</td>
                <td>2:00 PM</td>
            </tr>
            <tr>
                <td>Friday</td>
                <td>Demo Session</td>
                <td>4:00 PM</td>
            </tr>
        </tbody>
    </table>
</body>
</html>
'@
    "page07_table_with_caption.html" = @'
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Table with Caption</title>
</head>
<body>
    <table class="grade-table" border="1" cellpadding="6">
        <caption>Student Grades</caption>
        <thead>
            <tr>
                <th>Name</th>
                <th>Subject</th>
                <th>Grade</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>Asha</td>
                <td>Mathematics</td>
                <td>A</td>
            </tr>
            <tr>
                <td>Ravi</td>
                <td>Science</td>
                <td>B+</td>
            </tr>
        </tbody>
    </table>
</body>
</html>
'@
    "page08_links.html" = @'
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Hyperlinks</title>
</head>
<body>
    <h1>Useful Links</h1>
    <ul class="link-list">
        <li><a href="https://www.wikipedia.org" target="_blank" rel="noopener">Wikipedia</a></li>
        <li><a href="https://www.php.net" target="_blank" rel="noopener">PHP Documentation</a></li>
        <li><a href="https://developer.mozilla.org" target="_blank" rel="noopener">MDN Web Docs</a></li>
    </ul>
</body>
</html>
'@
    "page09_images.html" = @'
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Images Showcase</title>
</head>
<body>
    <h1>Gallery</h1>
    <img class="gallery-image" src="https://via.placeholder.com/150" alt="Sample placeholder image one">
    <img class="gallery-image" src="https://via.placeholder.com/150/0000FF" alt="Sample placeholder image two">
</body>
</html>
'@
    "page10_audio.html" = @'
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Audio Player</title>
</head>
<body>
    <h1>Relaxing Audio</h1>
    <audio class="relaxing-audio" controls>
        <source src="sample.mp3" type="audio/mpeg">
        Your browser does not support the audio element.
    </audio>
</body>
</html>
'@
    "page11_video.html" = @'
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Video Player</title>
</head>
<body>
    <h1>Training Video</h1>
    <video class="training-video" width="320" height="240" controls>
        <source src="sample.mp4" type="video/mp4">
        Your browser does not support the video tag.
    </video>
</body>
</html>
'@
    "page12_form_simple.html" = @'
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Simple Form</title>
</head>
<body>
    <h1>Feedback Form</h1>
    <form class="feedback-form" id="feedback-form">
        <label for="feedback-name">Name:</label>
        <input id="feedback-name" name="name" type="text" required>
        <label for="feedback-message">Message:</label>
        <textarea id="feedback-message" name="message" rows="4"></textarea>
        <button type="submit">Send Feedback</button>
    </form>
</body>
</html>
'@
    "page13_form_login.html" = @'
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Login Form</title>
</head>
<body>
    <h1>User Login</h1>
    <form class="login-form" id="login-form">
        <label for="login-email">Email:</label>
        <input id="login-email" name="email" type="email" required>
        <label for="login-password">Password:</label>
        <input id="login-password" name="password" type="password" required>
        <button type="submit">Sign In</button>
    </form>
</body>
</html>
'@
    "page14_form_registration.html" = @'
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Registration Form</title>
</head>
<body>
    <h1>Create Account</h1>
    <form class="registration-form" id="registration-form">
        <label for="register-name">Full Name:</label>
        <input id="register-name" name="name" type="text" required>
        <label for="register-email">Email:</label>
        <input id="register-email" name="email" type="email" required>
        <label for="register-password">Password:</label>
        <input id="register-password" name="password" type="password" required>
        <button type="submit">Register</button>
    </form>
</body>
</html>
'@
    "page15_form_contact.html" = @'
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Contact Form</title>
</head>
<body>
    <h1>Contact Us</h1>
    <form class="contact-form" id="contact-form">
        <label for="contact-subject">Subject:</label>
        <input id="contact-subject" name="subject" type="text" required>
        <label for="contact-email">Email:</label>
        <input id="contact-email" name="email" type="email" required>
        <label for="contact-message">Message:</label>
        <textarea id="contact-message" name="message" rows="5" required></textarea>
        <button type="submit">Send</button>
    </form>
</body>
</html>
'@
    "page16_form_survey.html" = @'
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Survey Form</title>
</head>
<body>
    <h1>Student Survey</h1>
    <form class="survey-form" id="survey-form">
        <label for="survey-name">Name:</label>
        <input id="survey-name" name="name" type="text">
        <fieldset class="survey-fieldset">
            <legend>Preferred Subjects</legend>
            <label><input type="checkbox" name="subjects" value="maths"> Mathematics</label>
            <label><input type="checkbox" name="subjects" value="science"> Science</label>
            <label><input type="checkbox" name="subjects" value="history"> History</label>
        </fieldset>
        <label for="survey-rating">Rate Facilities:</label>
        <select id="survey-rating" name="rating">
            <option value="excellent">Excellent</option>
            <option value="good">Good</option>
            <option value="average">Average</option>
        </select>
        <button type="submit">Submit Survey</button>
    </form>
</body>
</html>
'@
    "page17_form_newsletter.html" = @'
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Newsletter Signup</title>
</head>
<body>
    <h1>Subscribe</h1>
    <form class="newsletter-form" id="newsletter-form">
        <label for="newsletter-email">Email:</label>
        <input id="newsletter-email" name="email" type="email" placeholder="you@example.com">
        <button type="submit">Subscribe</button>
    </form>
</body>
</html>
'@
    "page18_form_booking.html" = @'
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Booking Form</title>
</head>
<body>
    <h1>Book an Appointment</h1>
    <form class="booking-form" id="booking-form">
        <label for="booking-name">Name:</label>
        <input id="booking-name" name="name" type="text" required>
        <label for="booking-date">Date:</label>
        <input id="booking-date" name="date" type="date" required>
        <label for="booking-time">Time:</label>
        <input id="booking-time" name="time" type="time" required>
        <button type="submit">Book Slot</button>
    </form>
</body>
</html>
'@
    "page19_form_feedback_ratings.html" = @'
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Feedback with Ratings</title>
</head>
<body>
    <h1>Workshop Feedback</h1>
    <form class="rating-form" id="rating-form">
        <label for="rating-name">Name:</label>
        <input id="rating-name" name="name" type="text">
        <label for="rating-select">Rate the session:</label>
        <select id="rating-select" name="rating">
            <option value="5">Outstanding</option>
            <option value="4">Great</option>
            <option value="3">Average</option>
            <option value="2">Below Average</option>
            <option value="1">Poor</option>
        </select>
        <button type="submit">Submit Feedback</button>
    </form>
</body>
</html>
'@
    "page20_form_job_application.html" = @'
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Job Application</title>
</head>
<body>
    <h1>Apply for Internship</h1>
    <form class="job-application-form" id="job-application-form">
        <label for="job-name">Full Name:</label>
        <input id="job-name" name="name" type="text" required>
        <label for="job-email">Email:</label>
        <input id="job-email" name="email" type="email" required>
        <label for="job-resume">Resume URL:</label>
        <input id="job-resume" name="resume" type="url">
        <label for="job-message">Cover Letter:</label>
        <textarea id="job-message" name="message" rows="5"></textarea>
        <button type="submit">Submit Application</button>
    </form>
</body>
</html>
'@
    "page21_semantic_tags.html" = @'
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Semantic Tags</title>
</head>
<body>
    <header class="page-header">
        <h1>Campus News</h1>
    </header>
    <nav class="main-navigation">
        <a href="#news">News</a>
        <a href="#events">Events</a>
        <a href="#contact">Contact</a>
    </nav>
    <main id="news">
        <article class="news-article">
            <h2>Annual Festival</h2>
            <p>The annual festival will be hosted next month with cultural programs.</p>
        </article>
    </main>
    <footer class="page-footer" id="contact">
        <p>Contact: info@example.com</p>
    </footer>
</body>
</html>
'@
    "page22_layout_divs.html" = @'
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Simple Layout</title>
    <style>
        .container {
            display: flex;
            gap: 20px;
        }
        .sidebar {
            width: 30%;
            background-color: #f0f0f0;
            padding: 10px;
        }
        .content-area {
            flex: 1;
            padding: 10px;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="sidebar">
            <h2>Sidebar</h2>
            <p>Links and resources go here.</p>
        </div>
        <div class="content-area">
            <h1>Main Content</h1>
            <p>This section holds the main story or article.</p>
        </div>
    </div>
</body>
</html>
'@
    "page23_inline_css.html" = @'
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Inline CSS Demo</title>
</head>
<body style="font-family: Arial, sans-serif; background-color: #fafafa; color: #222;">
    <h1 style="color: #0066cc;">Inline Styles</h1>
    <p style="line-height: 1.6;">This paragraph uses inline styles for typography demonstration.</p>
</body>
</html>
'@
    "page24_internal_css.html" = @'
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Internal CSS</title>
    <style>
        body {
            font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
            margin: 40px;
        }
        .highlight-box {
            background-color: #ffe9b3;
            border-left: 4px solid #ff9800;
            padding: 15px;
        }
    </style>
</head>
<body>
    <h1>Important Notice</h1>
    <div class="highlight-box">
        <p>Mid-semester exams will begin from next Monday. Please be prepared.</p>
    </div>
</body>
</html>
'@
    "page25_external_css_reference.html" = @'
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>External CSS Reference</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <h1>External Stylesheet Example</h1>
    <p>This page references an external stylesheet named styles.css.</p>
</body>
</html>
'@
    "page26_typography.html" = @'
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Typography Showcase</title>
    <style>
        .intro-text {
            font-size: 1.2rem;
            font-weight: 500;
        }
        .quote-text {
            font-style: italic;
            border-left: 3px solid #ccc;
            padding-left: 10px;
            color: #555;
        }
    </style>
</head>
<body>
    <h1>Typography Showcase</h1>
    <p class="intro-text">Using different fonts and weights can improve readability.</p>
    <p class="quote-text">“Design is intelligence made visible.” – Alina Wheeler</p>
</body>
</html>
'@
    "page27_color_palette.html" = @'
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Color Palette</title>
    <style>
        .palette {
            display: flex;
            gap: 12px;
        }
        .color-swatch {
            width: 80px;
            height: 80px;
            color: #fff;
            display: flex;
            align-items: center;
            justify-content: center;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <h1>Brand Colors</h1>
    <div class="palette">
        <div class="color-swatch" style="background-color: #3f51b5;">Indigo</div>
        <div class="color-swatch" style="background-color: #009688;">Teal</div>
        <div class="color-swatch" style="background-color: #ffc107;">Amber</div>
    </div>
</body>
</html>
'@
    "page28_flexbox_layout.html" = @'
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Flexbox Cards</title>
    <style>
        .card-container {
            display: flex;
            gap: 16px;
        }
        .info-card {
            flex: 1;
            border: 1px solid #ddd;
            padding: 15px;
            border-radius: 4px;
        }
    </style>
</head>
<body>
    <h1>Flexbox Layout</h1>
    <div class="card-container">
        <div class="info-card">
            <h2>Card One</h2>
            <p>Flexbox helps align items along horizontal or vertical axes.</p>
        </div>
        <div class="info-card">
            <h2>Card Two</h2>
            <p>It simplifies responsive layouts with minimal code.</p>
        </div>
    </div>
</body>
</html>
'@
    "page29_grid_layout.html" = @'
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>CSS Grid Layout</title>
    <style>
        .grid-container {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 16px;
        }
        .grid-item {
            background-color: #e3f2fd;
            padding: 20px;
            border: 1px solid #90caf9;
        }
    </style>
</head>
<body>
    <h1>Grid Layout</h1>
    <div class="grid-container">
        <div class="grid-item">Item 1</div>
        <div class="grid-item">Item 2</div>
        <div class="grid-item">Item 3</div>
        <div class="grid-item">Item 4</div>
        <div class="grid-item">Item 5</div>
        <div class="grid-item">Item 6</div>
    </div>
</body>
</html>
'@
    "page30_navigation_bar.html" = @'
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Navigation Bar</title>
    <style>
        .nav-bar {
            background-color: #283593;
            padding: 10px;
        }
        .nav-bar a {
             color: #fff;
             margin-right: 15px;
             text-decoration: none;
        }
        .nav-bar a:hover {
             text-decoration: underline;
        }
    </style>
</head>
<body>
    <nav class="nav-bar">
        <a href="#home">Home</a>
        <a href="#courses">Courses</a>
        <a href="#contact">Contact</a>
    </nav>
    <section id="home">
        <h1>Welcome</h1>
        <p>Navigate through the menu to learn more.</p>
    </section>
</body>
</html>
'@
    "page31_footer.html" = @'
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Footer Layout</title>
    <style>
        .page-footer {
            background-color: #222;
            color: #fff;
            padding: 20px;
            text-align: center;
        }
    </style>
</head>
<body>
    <h1>Page with Footer</h1>
    <p>This page highlights a simple footer design.</p>
    <footer class="page-footer">
        <p>&copy; 2025 College Web Team</p>
    </footer>
</body>
</html>
'@
    "page32_formatted_text.html" = @'
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Formatted Text</title>
</head>
<body>
    <h1>Formatting Examples</h1>
    <p>This sentence contains <strong>bold text</strong>, <em>italic text</em>, and <mark>highlighted text</mark>.</p>
    <p>Here is a chemical formula: H<sub>2</sub>O and a math expression: x<sup>2</sup>.</p>
</body>
</html>
'@
    "page33_block_inline_elements.html" = @'
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Block vs Inline</title>
</head>
<body>
    <h1>Element Types</h1>
    <div class="block-example" style="background-color:#f2f2f2; padding:10px;">This is a block-level div.</div>
    <p>A paragraph can contain <span style="color:#d32f2f;">inline spans</span> without breaking the flow.</p>
</body>
</html>
'@
    "page34_icons_fontawesome.html" = @'
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Font Awesome Icons</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
</head>
<body>
    <h1>Social Icons</h1>
    <p>
        <i class="fab fa-facebook" aria-hidden="true"></i>
        <i class="fab fa-twitter" aria-hidden="true"></i>
        <i class="fab fa-instagram" aria-hidden="true"></i>
    </p>
</body>
</html>
'@
    "page35_form_validation_attributes.html" = @'
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Validation Attributes</title>
</head>
<body>
    <h1>Signup Form</h1>
    <form class="validation-form" id="validation-form">
        <label for="validation-email">Email:</label>
        <input id="validation-email" name="email" type="email" required>
        <label for="validation-password">Password:</label>
        <input id="validation-password" name="password" type="password" minlength="6" required>
        <button type="submit">Create Account</button>
    </form>
</body>
</html>
'@
    "page36_iframe.html" = @'
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Embedded Page</title>
</head>
<body>
    <h1>Embedded Content</h1>
    <iframe class="embedded-frame" src="https://www.wikipedia.org" width="600" height="400" title="Wikipedia"></iframe>
</body>
</html>
'@
    "page37_responsive_meta.html" = @'
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Responsive Meta Tag</title>
</head>
<body>
    <h1>Responsive Design Basics</h1>
    <p>The viewport meta tag ensures the layout adapts to different devices.</p>
</body>
</html>
'@
    "page38_responsive_image.html" = @'
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Responsive Image</title>
    <style>
        .responsive-image {
            max-width: 100%;
            height: auto;
        }
    </style>
</head>
<body>
    <h1>Fluid Image</h1>
    <img class="responsive-image" src="https://via.placeholder.com/600x300" alt="Wide placeholder image">
</body>
</html>
'@
    "page39_media_queries.html" = @'
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Media Queries</title>
    <style>
        body {
            background-color: #eceff1;
        }
        @media (max-width: 600px) {
            body {
                background-color: #ffecb3;
            }
        }
    </style>
</head>
<body>
    <h1>Media Query Demo</h1>
    <p>Resize the browser window to see the background change.</p>
</body>
</html>
'@
    "page40_formatted_code.html" = @'
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Code Formatting</title>
</head>
<body>
    <h1>Sample Code Snippet</h1>
    <pre class="code-block">
function greet() {
    console.log("Hello, World!");
}
    </pre>
</body>
</html>
'@
    "page41_definition_list.html" = @'
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Definition List</title>
</head>
<body>
    <h1>Glossary</h1>
    <dl class="glossary-list">
        <dt>HTML</dt>
        <dd>HyperText Markup Language used for creating web pages.</dd>
        <dt>CSS</dt>
        <dd>Cascading Style Sheets used for styling HTML documents.</dd>
    </dl>
</body>
</html>
'@
    "page42_tables_colspan_rowspan.html" = @'
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Table Colspan Rowspan</title>
</head>
<body>
    <h1>Conference Schedule</h1>
    <table class="conference-table" border="1" cellpadding="6">
        <tr>
            <th rowspan="2">Day</th>
            <th colspan="2">Sessions</th>
        </tr>
        <tr>
            <th>Morning</th>
            <th>Afternoon</th>
        </tr>
        <tr>
            <td>Monday</td>
            <td>Keynote</td>
            <td>Workshops</td>
        </tr>
        <tr>
            <td>Tuesday</td>
            <td>Panel Discussion</td>
            <td>Networking</td>
        </tr>
    </table>
</body>
</html>
'@
    "page43_table_styled.html" = @'
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Styled Table</title>
    <style>
        .styled-table {
            border-collapse: collapse;
            width: 100%;
        }
        .styled-table th, .styled-table td {
            border: 1px solid #bbb;
            padding: 10px;
            text-align: left;
        }
        .styled-table thead {
            background-color: #4caf50;
            color: white;
        }
    </style>
</head>
<body>
    <h1>Sales Report</h1>
    <table class="styled-table">
        <thead>
            <tr>
                <th>Product</th>
                <th>Quarter 1</th>
                <th>Quarter 2</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>Laptops</td>
                <td>120</td>
                <td>140</td>
            </tr>
            <tr>
                <td>Tablets</td>
                <td>90</td>
                <td>110</td>
            </tr>
        </tbody>
    </table>
</body>
</html>
'@
    "page44_ordered_list_types.html" = @'
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Ordered List Types</title>
</head>
<body>
    <h1>Steps to Launch Project</h1>
    <ol class="roman-list" type="I">
        <li>Concept Approval</li>
        <li>Design Phase</li>
        <li>Development Phase</li>
    </ol>
    <ol class="alphabet-list" type="a">
        <li>Testing</li>
        <li>Deployment</li>
    </ol>
</body>
</html>
'@
    "page45_unordered_list_styles.html" = @'
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Unordered List Styles</title>
    <style>
        .square-list {
            list-style-type: square;
        }
        .circle-list {
            list-style-type: circle;
        }
    </style>
</head>
<body>
    <h1>Things to Pack</h1>
    <ul class="square-list">
        <li>Clothes</li>
        <li>Toiletries</li>
    </ul>
    <ul class="circle-list">
        <li>Notebook</li>
        <li>Camera</li>
    </ul>
</body>
</html>
'@
    "page46_buttons.html" = @'
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Buttons Showcase</title>
    <style>
        .primary-button {
            background-color: #2196f3;
            color: white;
            padding: 10px 18px;
            border: none;
            border-radius: 4px;
        }
        .secondary-button {
            background-color: #e0e0e0;
            padding: 10px 18px;
            border: none;
            border-radius: 4px;
        }
    </style>
</head>
<body>
    <h1>Buttons Showcase</h1>
    <button class="primary-button" type="button">Primary Action</button>
    <button class="secondary-button" type="button">Secondary Action</button>
</body>
</html>
'@
    "page47_form_fieldset_legend.html" = @'
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Fieldset and Legend</title>
</head>
<body>
    <h1>Event Registration</h1>
    <form class="event-form" id="event-form">
        <fieldset>
            <legend>Participant Details</legend>
            <label for="participant-name">Name:</label>
            <input id="participant-name" name="name" type="text" required>
            <label for="participant-age">Age:</label>
            <input id="participant-age" name="age" type="number" min="10" max="60">
        </fieldset>
        <button type="submit">Register</button>
    </form>
</body>
</html>
'@
    "page48_contact_card.html" = @'
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Contact Card</title>
    <style>
        .contact-card {
            max-width: 320px;
            border: 1px solid #ccc;
            padding: 15px;
            border-radius: 6px;
        }
        .contact-name {
            font-size: 1.3rem;
            margin-bottom: 5px;
        }
    </style>
</head>
<body>
    <h1>Contact Card</h1>
    <div class="contact-card">
        <div class="contact-name">Priya Sharma</div>
        <div>Email: priya.sharma@example.com</div>
        <div>Phone: +91 9876543210</div>
    </div>
</body>
</html>
'@
    "page49_testimonial_section.html" = @'
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Testimonial Section</title>
    <style>
        .testimonial-section {
            background-color: #f5f5f5;
            padding: 20px;
        }
        .testimonial-quote {
            font-style: italic;
        }
    </style>
</head>
<body>
    <section class="testimonial-section">
        <h1>Student Testimonials</h1>
        <p class="testimonial-quote">“The faculty is supportive and the campus is vibrant.” – Aliya Khan</p>
    </section>
</body>
</html>
'@
    "page50_portfolio_grid.html" = @'
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Portfolio Grid</title>
    <style>
        .portfolio-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 16px;
        }
        .portfolio-item {
            border: 1px solid #ddd;
            padding: 15px;
        }
    </style>
</head>
<body>
    <h1>Portfolio</h1>
    <div class="portfolio-grid">
        <div class="portfolio-item">
            <h2>Project One</h2>
            <p>Responsive landing page design.</p>
        </div>
        <div class="portfolio-item">
            <h2>Project Two</h2>
            <p>Interactive form interface.</p>
        </div>
        <div class="portfolio-item">
            <h2>Project Three</h2>
            <p>Dynamic dashboard layout.</p>
        </div>
    </div>
</body>
</html>
'@
}

foreach ($name in ($pages.Keys | Sort-Object)) {
    $path = Join-Path $targetDir $name
    Set-Content -Path $path -Value $pages[$name] -Encoding UTF8
}

Write-Host ("Created {0} HTML pages in {1}" -f $pages.Count, $targetDir)

