# 🎮 Tic-Tac-Toe (Java + JSP)

A modern web version of the classic **Tic-Tac-Toe** game — built with **Java**, **JSP**, and **Tomcat**.  
Clean design, animated interface, and smooth gameplay wrapped in a simple web app.

---

## ✨ Features
- 🎨 Stylish UI with colored X and O  
- 💡 Instant updates via page reloads  
- 🧠 Simple game logic on the backend (Java)  
- 🏁 Detects wins, draws, and allows restart  
- 🧩 Clean structure with MVC-like separation  

---

## 🧱 Tech Stack
- **Java 17+**
- **JSP / Servlets**
- **Apache Tomcat 9**
- **JSTL**
- **HTML / CSS / jQuery**

---

## ⚙️ Setup & Run

1. Clone the repository:   
   ```bash
   git clone https://github.com/Rarxan/Tic-Tac-Toe.git
   cd Tic-Tac-Toe
Build with Maven:

mvn clean package
Deploy the generated .war to Tomcat:

Copy the WAR file from target/ to Tomcat’s webapps/ folder.

Start Tomcat.

Open in your browser:


http://localhost:8080/  

🎨 Preview
A vibrant, minimalistic look with glowing Xs and Os on a dark neon background.

🧠 Logic Overview
Board — represented as a list of 9 cells.

Sign — enum with CROSS, NOUGHT, EMPTY.

LogicServlet — handles clicks and determines game state.

RestartServlet — resets the board.

💬 Author
Yuri (Rarxan) — Java developer, cybersecurity enthusiast, and tech tinkerer.

If you like this project — ⭐ it on GitHub and drop a follow!

📜 License
This project is released under the MIT License.
Feel free to fork, modify, and improve.
