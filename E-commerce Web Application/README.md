[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-22041afd0340ce965d47ae6ef1cefeee28c7c493a6346c4f15d667ab976d596c.svg)](https://classroom.github.com/a/xi3wYqF3)

## Step 1: Download and Unzip the Project

1. First, download the zip file containing the project.
2. Once the download is complete, unzip the file to extract the project folder.

## Step 2: Open the Project in Visual Studio Code

1. Open **Visual Studio Code**.
2. Click on "Open Folder" and select the folder you just unzipped.

## Step 3: Install Required Dependencies

1. Open the **Terminal** in Visual Studio Code.
2. Run the following commands to install the necessary dependencies for the project:


```bash
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
```
User must do all of this on both front end and back end separately in terminal. 

## Step 4: Set Up the Database

Before creating the .env file, you need to set up the MySQL Database.

Open your MySQL client (e.g., MySQL Workbench or command line).

Run script sec3_gr11_database.sql

Ensure you have the proper credentials:

Host: localhost

Username: itcs223gr11

Password: itCsgr11**

## Step 5 :Create a `.env` File
create a `.env` file inside the WS (Web Server) folder.
In the `.env` file, add the following content:

PORT = 8000

MYSQL_HOST=localhost

 MYSQL_USERNAME=itcs223gr11
 
 MYSQL_PASSWORD=itCsgr11**
 
MYSQL_DATABASE=sec03gr11

## Step 6: Start the Localhost
After that, the users might input the "npm start" to start the localhost.

If found this massege press Cancel (ยกเลิก) and input "npm start" again 

<img src="https://github.com/user-attachments/assets/756d3a5c-591b-46cd-90cc-4494bd099b48" width="350" height="200"/>

Here is the correct example, it will display like this.

<img src="https://github.com/user-attachments/assets/60d33038-e3ff-4f3c-97d3-055bc7203e93" width="300" />


Additionally, the http://localhost:8000 is the back end of our the web browser.

Then, the users can input the http://localhost:3300/homepage to the web browser.

Lastly, the users can use our website.
