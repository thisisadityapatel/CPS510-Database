import { useNavigate } from "react-router-dom";
import "./styles/Home.css";

function Home() {
  const navigate = useNavigate();

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
        alert("Query executed successfully");
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
      </div>
    </div>
  );
}

export default Home;