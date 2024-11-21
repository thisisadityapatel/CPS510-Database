import { useNavigate } from "react-router-dom";
import "./styles/Home.css";
import { useState } from "react";

function Home() {
  const navigate = useNavigate();
  const [consoleOutputMessages, setConsoleOutputMessages] = useState([]);

  const handleLogout = async () => {
    const url = "http://localhost:8000/logout";
    try {
      const response = await fetch(url);
      if (response.ok) {
        navigate("/");
      } else {
        alert("Logout failed");
      }
    } catch (error) {
      console.error("Error:", error);
      alert("An error occurred. Please try again.");
    }
  };

  const handleAction = async (action) => {
    const url = `http://localhost:8000/${action}`;
    try {
      const response = await fetch(url, { method: "GET" });
      if (response.ok) {
        alert(`${action.replace("-", " ")} successful`);
        const result = await response.json();
        console.log(JSON.stringify(result))
        setConsoleOutputMessages((prevMessages) => [...prevMessages, JSON.stringify(result)]);
      } else {
        alert(`${action.replace("-", " ")} failed`);
      }
    } catch (error) {
      console.error("Error:", error);
      alert("An error occurred. Please try again.");
    }
  };

  const handleRunQuery = async () => {
    const query = document.getElementById("customQuery").value;
    const url = "http://localhost:8000/run-query";
    const data = { query };

    try {
      const response = await fetch(url, {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
        },
        body: JSON.stringify(data),
      });

      if (response.ok) {
        const result = await response.json();
        console.log(result);
        console.log(JSON.stringify(result))
        setConsoleOutputMessages((prevMessages) => [...prevMessages, JSON.stringify(result)]);
      } else {
        alert("Query execution failed");
      }
    } catch (error) {
      console.error("Error:", error);
      alert("An error occurred. Please try again.");
    }
  };

  return (
    <div>
      {/* Navigation Bar */}
      <nav className="navbar">
        <div className="navbar-title">Car Rental Management Dashboard</div>
        <button className="logout-btn" onClick={handleLogout}>
          Logout
        </button>
      </nav>

      {/* Main Content */}
      <div className="home-container">
        <div className="actions">
          <button onClick={() => handleAction("create-tables")}>
            Create Tables
          </button>
          <button onClick={() => handleAction("drop-tables")}>
            Drop Tables
          </button>
          <button onClick={() => handleAction("populate-tables")}>
            Populate Tables
          </button>
          <button onClick={() => handleAction("query-tables")}>
            Query Tables
          </button>
        </div>
        <div className="custom-query">
          <label htmlFor="customQuery">Custom Query:</label>
          <input type="text" id="customQuery" />
          <button onClick={handleRunQuery}>Run Query</button>
        </div>
        <div 
          style={{
            backgroundColor: "#1e1e1e", // Dark background for the container
            color: "white", // White text
            fontSize: "12px", // Small font size for the text
            padding: "10px",
            height: "500px", // Set a fixed height for the scrollable area
            width: "100%",
            overflowY: "scroll", // Enable vertical scrolling when content overflows
          }}
        >
          {consoleOutputMessages.map((message, index) => (
            <div 
              key={index} 
              style={{
                backgroundColor: "#333", // Darker background for individual message box
                margin: "5px 0", // Space between the individual message boxes
                padding: "8px", // Padding inside each box
                borderRadius: "5px", // Rounded corners for the boxes
                wordBreak: "break-word", // Ensures long text breaks correctly
                display: "block", // Ensure each message is displayed in its own block
                width: "100%", // Make sure each box takes full width of the parent container
              }}
            >
              {message}
            </div>
          ))}
        </div>
      </div>
    </div>
  );
}

export default Home;
