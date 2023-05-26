<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CV Generator App</title>
    <link href="main.css">
    <link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>
</head>
<body>
<style>
    @import url("https://fonts.googleapis.com/css2?family=M+PLUS+Code+Latin:wght@300;400;500&display=swap");

    :root {
        --primaryColor: rgb(4, 41, 110);
        --secondaryColor: whitesmoke;
        --inputColor: #d6e6e7a4;
    }

    * {
        padding: 0;
        margin: 0;
        -webkit-box-sizing: border-box;
        box-sizing: border-box;
        font-family: "M PLUS Code Latin", sans-serif;
        -webkit-transition: 1s ease-in-out;
        transition: 1s ease-in-out;
    }

    section {
        margin-bottom: 3rem;
        color: #0a346b;
    }

    .grid {
        display: -ms-grid;
        display: grid;
        gap: 2rem;
    }

    .message {
        color: red;
    }

    .icon {
        font-size: 1.5rem;
    }

    input,
    textarea {
        padding: 15px;
        border-radius: 5px;
        border: 2px solid transparent;
        width: 100%;
        background: var(--inputColor);
    }

    input,
    textarea:focus {
        outline: none;
    }

    img {
        width: 200px;
        height: 200px;
    }

    label {
        font-size: 18px;
        margin-bottom: 10px;
    }

    body {
        background: #fafafa;
    }

    .container {
        margin: 1rem;
    }

    @media screen and (min-width: 480px) {
        .container {
            margin: 3rem 1rem 1rem;
        }
    }

    @media screen and (min-width: 940px) {
        .container {
            margin-left: 25rem;
            margin-right: 25rem;
        }
    }

    .introTxt {
        margin-bottom: 1rem;
        font-size: 20px;
    }

    .intro {
        width: 100%;
        margin: auto;
        padding: 2rem 0;
        text-align: center;
        background: var(--primaryColor);
        color: var(--secondaryColor);
    }

    @media screen and (min-width: 1080px) {
        .intro h1 {
            font-size: 45px;
        }
    }

    .intro p {
        padding: 10px 0 0;
        margin: auto;
    }

    @media screen and (min-width: 1080px) {
        .intro p {
            font-size: 25px;
        }
    }

    .top .imgDiv {
        position: relative;
        height: 200px;
        width: 200px;
        border-radius: 50%;
        overflow: hidden;
        margin: 1rem auto 2rem;
        border: 10px solid rgba(236, 236, 236, 0.808);
    }

    .top .imgDiv:hover #imgBtn {
        display: block;
    }

    .top .imgDiv img {
        height: 100%;
        width: 100%;
        -o-object-fit: cover;
        object-fit: cover;
    }

    .top .imgDiv #file {
        display: none;
    }

    .top .imgDiv #imgBtn {
        position: absolute;
        width: 100%;
        background: #000000a6;
        text-align: center;
        padding: 0.7rem 0.7rem 0.8rem;
        bottom: -10px;
        left: 0;
        color: var(--secondaryColor);
        cursor: pointer;
        font-size: 15px;
        display: none;
        -webkit-transition: display 0.5s ease;
        transition: display 0.5s ease;
    }

    .top .name div {
        margin: 10px 0;
    }

    .top .name input {
        display: block;
        margin: 8px 0;
        background: var(--inputColor);
    }

    .top .contact div {
        display: -webkit-box;
        display: -ms-flexbox;
        display: flex;
        -webkit-box-align: center;
        -ms-flex-align: center;
        align-items: center;
        margin: 10px 0;
    }

    .top .contact div .icon {
        margin: 0 10px;
    }

    .experienceDiv div {
        margin-bottom: 10px;
    }

    .experienceDiv input {
        margin-top: 5px;
        background: var(--inputColor);
    }

    .experienceDiv .date {
        margin: 1rem 0;
        gap: 1rem;
    }

    .experienceDiv .date div {
        margin: 10px 0;
    }

    @media screen and (min-width: 428px) {
        .experienceDiv .date {
            display: -webkit-box;
            display: -ms-flexbox;
            display: flex;
        }
    }

    .experienceDiv .description label {
        margin-bottom: 10px;
    }

    .experienceDiv .description textarea {
        height: 200px;
        width: 100%;
    }

    .btn button {
        padding: 10px;
        border-radius: 5px;
        border: none;
        background: var(--primaryColor);
        color: var(--secondaryColor);
        font-size: 15px;
        width: 50%;
        cursor: pointer;
    }

    .btn button:focus {
        outline: none;
    }

    .btn button:hover {
        background: #000000a6;
    }

    .profile div {
        margin-bottom: 10px;
    }

    .profile input,
    .profile textarea {
        margin-top: 10px;
        background: var(--inputColor);
    }

    .profile .date {
        margin: 1rem 0;
        gap: 1rem;
    }

    .profile .date div {
        margin: 10px 0;
    }

    @media screen and (min-width: 428px) {
        .profile .date {
            display: -webkit-box;
            display: -ms-flexbox;
            display: flex;
        }
    }

    .profile #summary {
        height: 200px;
    }

    @media screen and (min-width: 480px) {
        .profile .flex {
            display: -webkit-box;
            display: -ms-flexbox;
            display: flex;
            -webkit-box-align: center;
            -ms-flex-align: center;
            align-items: center;
            gap: 1rem;
        }
    }

    .profile .skills button,
    .profile .hobbies button {
        padding: 10px;
        border-radius: 5px;
        border: none;
        margin-left: 1rem;
        background: var(--primaryColor);
        color: var(--secondaryColor);
        font-size: 15px;
        width: auto;
        cursor: pointer;
    }

    .profile .skills button:focus,
    .profile .hobbies button:focus {
        outline: none;
    }

    .profile .skills button:hover,
    .profile .hobbies button:hover {
        background: #000000a6;
    }

    .mainBtn {
        width: 100%;
    }

    .mainBtn #previewBtn {
        padding: 10px;
        margin: auto;
        color: var(--secondaryColor);
        background: cornflowerblue;
        border: none;
        font-size: 20px;
        border-radius: 5px;
        width: 100%;
        cursor: pointer;
    }

    .mainBtn #previewBtn:focus {
        outline: none;
    }

    .mainBtn #previewBtn:hover {
        background: #2f5499;
    }

    .footer {
        margin: 2rem auto 0;
        padding: 2rem;
        text-align: center;
        font-size: 20px;
        color: var(--secondaryColor);
        background: var(--primaryColor);
    }

    .openner {
        position: absolute;
        top: 0;
        left: 0;
        right: 0;
        bottom: 0;
        display: -webkit-box;
        display: -ms-flexbox;
        display: flex;
        -webkit-box-align: center;
        -ms-flex-align: center;
        align-items: center;
        -webkit-box-pack: center;
        -ms-flex-pack: center;
        justify-content: center;
        background: rgba(12, 14, 44, 0.698);
        display: none;
    }

    .openner .opennerContent {
        padding: 2rem;
        border-radius: 1rem;
        text-align: center;
        width: 80%;
        color: #2a2a2ace;
        background: var(--secondaryColor);
    }

    @media screen and (min-width: 1080px) {
        .openner .opennerContent {
            width: 60%;
        }
    }

    .openner .opennerContent h1 {
        padding-bottom: 1rem;
        line-height: 2rem;
        color: red;
        font-family: "Poppins", sans-serif;
        font-size: 20px;
    }

    @media screen and (min-width: 450px) {
        .openner .opennerContent h1 {
            font-size: 30px;
            line-height: 2.4rem;
        }
    }

    .openner .opennerContent h5 {
        font-size: 15px;
    }

    @media screen and (min-width: 480px) {
        .openner .opennerContent h5 {
            font-size: 25px;
        }
    }

    @media screen and (min-width: 1080px) {
        .openner .opennerContent h5 {
            font-size: 25px;
        }
    }

    .openner .opennerContent p {
        margin: 1rem auto 0;
        padding-top: 0.5rem;
        text-align: center;
        font-style: italic;
    }

    @media screen and (min-width: 1080px) {
        .openner .opennerContent p {
            width: 60%;
            line-height: 2.4rem;
        }
    }

    #jobMessage {
        display: none;
        color: red;
    }

    #ColMessage {
        display: none;
        color: red;
    }

    .cvContainer {
        margin-top: 2rem;
        background-color: rgba(204, 204, 204, 0.157);
        display: none;
        color: #0a346b;
    }

    .cvContainer .titles {
        margin-bottom: 1rem;
        position: relative;

        width: -moz-max-content;
        width: max-content;
    }

    .cvContainer .titles::after {
        content: "";
        position: absolute;
        background-color: #8f8f8f;
        height: 2px;
        width: 50%;
        bottom: -5px;
        left: 0;
    }

    @media screen and (min-width: 960px) {
        .cvContainer .cvTop {
            display: -ms-grid;
            display: grid;
            -webkit-box-align: center;
            -ms-flex-align: center;
            align-items: center;

            grid-template-columns: repeat(3, 1fr);
        }
    }

    .cvContainer .cvTop .cvTopDiv {
        width: 100%;
        max-width: 200px;
        height: 200px;
        background-color: antiquewhite;
    }

    .cvContainer .cvTop .cvTopDiv img {
        -o-object-fit: cover;
        object-fit: cover;
        width: 100%;
        height: 100%;
    }

    .cvContainer .cvTop .cvNameDiv {
        margin: 1rem 0;
    }

    @media screen and (min-width: 960px) {
        .cvContainer .cvTop .cvNameDiv {
            font-size: 24px;
        }
    }

    .cvContainer .cvTop .cvNameDiv .cvProff p {
        font-size: 25px;
    }

    @media screen and (min-width: 960px) {
        .cvContainer .cvTop .cvNameDiv .cvProff p {
            font-size: 30px;
        }
    }

    .cvContainer .cvTop .cvContactDiv div {
        display: -webkit-box;
        display: -ms-flexbox;
        display: flex;
        -webkit-box-align: center;
        -ms-flex-align: center;
        align-items: center;
        gap: 10px;
    }

    .cvContainer .cvTop .cvContactDiv div p {
        font-size: 18px;
    }

    @media screen and (min-width: 960px) {
        .cvContainer .cvTop .cvContactDiv div p {
            line-height: 2rem;
            font-size: 20px;
        }
    }

    .cvContainer .cvExperienceDiv {
        padding: 10px;
    }

    .cvContainer .cvExperienceDiv .companyDetails {
        margin-bottom: 0.6rem;
    }

    .cvContainer .cvExperienceDiv .companyDetails div p {
        font-size: 18px;
    }

    .cvContainer .cvExperienceDiv .companyDetails .companyName {
        font-weight: 500;
    }

    .cvContainer .cvExperienceDiv .dates {
        display: -webkit-box;
        display: -ms-flexbox;
        display: flex;
        position: relative;
        width: -moz-max-content;
        width: max-content;
        gap: 1rem;
    }

    .cvContainer .cvExperienceDiv .dates::after {
        content: "";
        height: 3px;
        width: 6px;
        background: var(--primaryColor);
        position: absolute;
        left: 50%;
        top: 50%;
        -webkit-transform: translateX(-2.5px);
        transform: translateX(-2.5px);
    }

    .cvContainer .cvExperienceDiv .dates div {
        padding: 8px;
        background-color: var(--primaryColor);
        color: var(--secondaryColor);
        font-size: 15px;
    }

    .cvContainer .cvExperienceDiv .jobDesc {
        max-width: 100%;
        margin-top: 0.5rem;
        opacity: 0.9;
    }

    .cvContainer .cvProfileSection {
        background-color: rgba(185, 184, 184, 0.157);
        padding: 10px;
    }

    .cvContainer .cvProfileSection .pSummary p {
        max-width: 100%;
        margin-bottom: 1rem;
        opacity: 0.9;
    }

    .cvContainer .cvProfileSection .colCert h4 + p {
        margin-bottom: 10px;
    }

    .cvContainer .cvProfileSection .collegeDatesDiv {
        display: -webkit-box;
        display: -ms-flexbox;
        display: flex;
        gap: 1rem;
        margin-bottom: 1rem;
        position: relative;
        width: -moz-max-content;
        width: max-content;
    }

    .cvContainer .cvProfileSection .collegeDatesDiv::after {
        content: "";
        height: 3px;
        width: 6px;
        background: var(--primaryColor);
        position: absolute;
        left: 50%;
        top: 50%;
        -webkit-transform: translateX(-2.5px);
        transform: translateX(-2.5px);
    }

    .cvContainer .cvProfileSection .collegeDatesDiv div {
        padding: 8px;
        background-color: var(--primaryColor);
        color: var(--secondaryColor);
        font-size: 15px;
    }

    .cvContainer .cvProfileSection .skillHobbyDiv,
    .cvContainer .cvProfileSection .personSkills {
        margin-bottom: 2rem;
    }

    #downloadBtn {
        display: none;
        background: #8bee8b;
        border: none;
        padding: 1rem 2rem;
        font-size: 15px;
        cursor: pointer;
    }

    #downloadBtn:hover {
        background: #6cbe6c;
    }

    @media screen and (min-width: 480px) {
        .gridCol {
            display: -ms-grid;
            display: grid;

            grid-template-columns: repeat(2, 1fr);
            gap: 1rem;
        }
    }

    @media screen and (min-width: 800px) {
        .skillsGridCol {
            display: -ms-grid;
            display: grid;

            grid-template-columns: repeat(2, 1fr);
            gap: 1rem;
        }
    }

    @media screen and (max-width: 350px) {
        p {
            width: 200px;
        }
    }

    @media screen and (min-width: 900px) {
        .top {

            grid-template-columns: repeat(3, 1fr);
        }
    }

    ::-webkit-scrollbar {
        width: 1rem;

        border-radius: 2rem;
    }

    ::-webkit-scrollbar-thumb {
        background: var(--primaryColor);
        border-radius: 4px;
        cursor: pointer;
    }
</style>
<script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/1.4.1/html2canvas.min.js">
    window.jsPDF = window.jspdf.jsPDF;
    var docPDF = new jsPDF();

    function print() {
        var elementHTML = document.querySelector("#printTable");
        docPDF.html(elementHTML, {
            callback: function (docPDF) {
                docPDF.save('HTML Linuxhint web page.pdf');
            },
            x: 15,
            y: 15,
            width: 170,
            windowWidth: 650
        });
    }
</script>
<div class="intro"><h1>CV Generator App</h1>
    <p>Completely fill the fields as indicated</p></div>


<div class="container">
    <form action="generateResume" method="post">
        <section class="top grid">

            <%-- <div class="imgDiv">

                 <input type="file" id="file">
                 <label for="file" id="imgBtn">Change Image</label>

             </div>--%>

            <div class="name">
                <h4 class="introTxt">Intro Details</h4>
                <div>
                    <label>Full Name</label>
                    <input class="input" name="name" type="text" placeholder="Enter your Name" value="${user1.name}">
                </div>
                <div>
                    <label>Professional Title</label>
                    <input class="input" name="surname" type="text" placeholder="Enter your surname"
                           value="${user1.surname}">
                </div>

            </div>

            <div class="contact">
                <h4 class="introTxt">Contact Details</h4>
                <div>
                    <i class='bx bx-phone icon'></i>
                    <input class="input" name="phoneNumber" type="text" placeholder="Enter phone number"
                           value="${user1.phone}">
                </div>
                <div>
                    <i class='bx bx-mail-send icon'></i>
                    <input class="input" type="email" name="email" placeholder="Enter email" value="${user1.email}">
                </div>

            </div>

        </section>

        <section class="experienceDiv">
            <h4 class="introTxt">Previous Job</h4>

            <div class="jobDetails">
                <div class="gridCol">
                    <div class="companyName">
                        <label>Company Name</label>
                        <input class="input" name="companyName" type="text" placeholder="Enter company name"
                               value="${user.header}">
                    </div>
                </div>
                <div class="date">
                    <div>
                        <label>Start</label>
                        <input class="input" name="beginDate" type="date" placeholder="Start Date"
                               value="${user.beginDate}">
                    </div>
                    <div>
                        <label>End</label>
                        <h6 id="jobMessage">End date can't be ealier.</h6>
                        <input class="input" name="endDate" type="date" placeholder="End Date" value="${user.endDate}">
                    </div>
                </div>
                <div class="description">
                    <label for="desc">Job Description</label>
                    <textarea id="desc" name="jobDescription" class="input"
                              placeholder="Describe your experience">${user.jobDescription}</textarea>
                </div>
            </div>
            <div id="newExp"></div>

        </section>

        <section class="profile">
            <h4 class="introTxt">Profile Details</h4>
            <div class="profileDiv">
                <label for="summary">Profile Summary</label>
                <textarea id="summary" name="profileSummary" class="input"
                          placeholder="Your profile summary">${user1.profileDesc}</textarea>
            </div>
            <!-- Education division -------------------------------- -->
            <div class="educDetails">
                <div class="gridCol">
                    <div class="certificateName">
                        <label>Nationality</label>
                        <input class="input" type="text" name="nationality" placeholder="Enter certificate"
                               value="${user1.nationality.nationality}">
                    </div>
                    <div class="schoolName">
                        <label>Birthplace</label>
                        <input class="input" type="text" name="birthplace" placeholder="Enter college name"
                               value="${user1.birthplace.name}">
                    </div>
                </div>

                <div class="date">
                    <div>
                        <label>Birthdate</label>
                        <input class="input" type="date" name="birthdate" placeholder="Start Date"
                               value="${user1.birthDate}">
                    </div>
                </div>

            </div>

            <div class="skillsGridCol">
                <div class="flex">
                    <div class="skills">
                        <label>Skills</label>
                        <div>
                            <input class="input" type="text" name="skillName" placeholder="Enter Skill"
                                   value="${user1.skills}">
                        </div>
                    </div>

                </div>
            </div>

        </section>

        <div class="mainBtn">
            <button id="previewBtn">Update and Save Resume</button>
            <button id="previewBtn" onclick="print()">Download CV</button>
        </div>
    </form>
</div>
<div id="cvContainer" class="cvContainer">
    <section class="cvTop" id="cvTop">
        <!-- <div class="cvTopDiv">
           <img src="./Images/girl-smile-food-eggs-wallpaper-preview.jpg" alt="Image">
       </div>

        <div class="cvNameDiv">
           <div class="cvName">
               <h2>Abaho Israel</h2>
           </div>
           <div class="cvProff">
               <p>Web Developer</p>
           </div>
       </div>

        <div class="cvContactDiv">
           <div>
               <i class='bx bx-phone icon' ></i>
               <p>0524312309</p>
           </div>
           <div>
               <i class='bx bx-mail-send icon'></i>
               <p>israelabaho@gmail.com</p>
           </div>
           <div>
               <i class='bx bx-globe icon'></i>
               <p>israelabaho.com</p>
           </div>
       </div>  -->
    </section>

    <section class="cvExperienceDiv">
        <!-- <div class="companyDetails">


          <div>
              <h3 class="titles">PREVIOUS JOB</h3>
              <p class="companyName">Atlantis</p>
            </div>
            <div>
              <p class="jobTitle">Web developer</p>
            </div>
        </div>
        <div class="dates">
            <div class="startDate">mm//dd//yyyy</div>
            <div class="endDate">mm//dd//yyyy</div>
        </div>
        <div class="jobDesc">
          Lorem ipsum dolor sit amet consectetur adipisicing elit. Hic praesentium unde, ullam eos blanditiis minus!
        </div> -->

    </section>

    <section class="cvProfileSection">
        <!-- <div class="pSummary">
            <h3 class="titles">PROFILE SUMMARY</h3>
           <p>
            Lorem ipsum dolor sit amet consectetur adipisicing elit. Asperiores, aliquid accusamus. Voluptatum ut alias excepturi consequuntur deleniti incidunt porro officiis. Lorem ipsum dolor sit amet consectetur adipisicing elit. Asperiores, aliquid accusamus. Voluptatum ut alias excepturi consequuntur deleniti incidunt porro officiis.
           </p>
        </div>
        <div class="colCert">
            <h3 class="titles">EDUCATION</h3>
            <h4 class="cerficate">Degree</h4>
            <p class="college">Nkumba University</p>
        </div>
        <div class="collegeDatesDiv">
            <div class="collegeStartDate">mm/dd/yyyy</div>
            <div class="collegeEndDate">mm/dd/yyyy</div>
        </div>

        <div class="skillHobbyDiv">
            <div class="personSkills">
                <h3 class="titles">EXPERTISE</h3>
                Photoshop, Illustrator, HTML, CSS</div>
            <div class="personHobby">
                <h3 class="titles">HOBBIES</h3>
                Travelling, Gaming, Football
            </div>
        </div> -->
    </section>

</div>
<button id="downloadBtn">Download CV</button>

</div>
<div class="footer">
    <small>Designed and Developed by Karim Karimov</small>
</div>
<div class="openner">
    <div class="opennerContent">
        <h1>This app will be available ready to use soon!</h1>
    </div>
</div>
</body>
</html>

</body>
</html>