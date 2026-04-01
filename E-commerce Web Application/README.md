# E-Commerce Web Application (Online Clothing Store)

## Project Description
This project is a full-stack e-commerce web application for an online clothing store. It includes key features such as user authentication, product management, and search functionality.

The backend is built with Node.js and Express, with APIs tested using Postman to ensure reliable data flow. The frontend is developed using HTML, CSS, and JavaScript, with a focus on a user-friendly interface.

The system uses MySQL for data management and integrates the Google Translate API for multilingual support.

This project demonstrates full-stack development, API integration, database design, and system testing.


## Tech Stack
- Node.js / Express
- MySQL
- HTML, CSS, JavaScript
- Postman
- Google Translate API

---

## Setup Instructions

### Step 1: Download and Unzip the Project
1. Download the zip file containing the project.
2. Unzip the file to extract the project folder.

### Step 2: Open the Project in Visual Studio Code
1. Open Visual Studio Code.
2. Click "Open Folder" and select the extracted folder.

### Step 3: Install Required Dependencies
Open the terminal in VS Code and run:

npm init  
npm install cookie-parser  
npm install cors  
npm install express  
npm install nodemon  
npm install path  
npm install url  
npm install dotenv  
npm install express-session  
npm install mysql2  
npm install expression  

*Note: Run these commands separately for both frontend and backend folders.*

---

## Database Setup
1. Open MySQL (Workbench or CLI).
2. Run the script: sec3_gr11_database.sql  

Use the following credentials:
- Host: localhost  
- Username: itcs223gr11  
- Password: itCsgr11**

---

## Environment Configuration
Create a `.env` file inside the **WS (Web Server)** folder and add:

PORT=8000  
MYSQL_HOST=localhost  
MYSQL_USERNAME=itcs223gr11  
MYSQL_PASSWORD=itCsgr11**  
MYSQL_DATABASE=sec03gr11  

---

## Run the Application
1. In the terminal, run:
npm start  

2. If a warning message appears, click Cancel and run npm start again.

3. Access the application:
- Backend: http://localhost:8000  
- Frontend: http://localhost:3300/homepage  

---

## Features
- User authentication system  
- Product management (add, edit, delete)  
- Search functionality  
- Multilingual support via Google Translate API  
- RESTful API integration  
- Data validation and API testing with Postman  

---
