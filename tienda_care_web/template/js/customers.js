document.addEventListener("DOMContentLoaded", () => {
  const form = document.getElementById("customer-form");
  if (form) {
    form.addEventListener("submit", (e) => {
      e.preventDefault();
      const data = Object.fromEntries(new FormData(form).entries());

      fetch("http://localhost:8080/tu-app/CustomerServlet", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify(data)
      }).then(res => {
        if (res.ok) {
          alert("Cliente registrado");
          window.location.href = "index.html";
        }
      });
    });
  }
});