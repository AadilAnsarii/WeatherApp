🌦️ Weather Application (Java Servlet + OpenWeather API)
A dynamic Weather Web Application developed using Java Servlets, JSP, and OpenWeather API. This project allows users to enter a city name and view real-time weather information such as:

Temperature (°C)
Humidity
Wind Speed
Weather Condition
Current Date & Time
🚀 Features
🔍 Search weather by city name
🌡️ Automatic Kelvin → Celsius conversion
💧 Displays humidity percentage
🌬️ Shows wind speed
🕒 Displays current date & time from API
⚡ Real-time data using OpenWeather REST API
🖥️ Built with Java Servlet + JSP architecture
🛠️ Technologies Used
Java (Servlet API)
JSP
HTML & CSS
OpenWeatherMap API
Gson Library (JSON parsing)
Apache Tomcat Server
Eclipse / Spring Tool Suite
⚙️ How It Works
User enters a city name in the web form.

Servlet receives the request using POST method.

Application calls the OpenWeather API using HttpURLConnection.

JSON response is parsed using Gson.

Required weather data is extracted:

Temperature
Humidity
Wind Speed
Weather Condition
Date & Time
Data is sent to JSP page using request attributes.

JSP displays the weather result to the user.

📂 Project Structure
Weather-Application/
│
├── src/
│   └── MyPackage/
│       └── MyServlet.java
│
├── WebContent/
│   ├── index.jsp
│   └── CSS / UI files
│
└── README.md
▶️ How to Run the Project
1️⃣ Clone Repository
git clone https://github.com/your-username/Weather-Application.git
2️⃣ Import into IDE
File → Import → Existing Project → Select Folder
3️⃣ Configure Server
Add Apache Tomcat server
Deploy the project on Tomcat
4️⃣ Run in Browser
http://localhost:8080/Weather-Application
🔑 API Configuration
This project uses OpenWeather API.

If the API key expires:

Create a free account on OpenWeather.
Generate a new API key.
Replace the key in:
String apiKey = "YOUR_API_KEY";
📸 Screenshots
Add screenshots of:

Home page (city input)
Weather result page
👨‍💻 Author
Aadil Ansari Java Full Stack Developer | Web Designer | Freelancer

⭐ Support
If you found this project helpful:

Give this repository a star ⭐
Share with other developers
📌 Future Improvements
5-day weather forecast
Error handling for invalid city names
Responsive UI design
Spring Boot REST version of the project
