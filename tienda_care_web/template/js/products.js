document.addEventListener("DOMContentLoaded", () => {
  const list = document.getElementById("product-list");
  if (list) {
    fetch("http://localhost:8080/tu-app/ProductServlet")
      .then(res => res.json())
      .then(data => {
        data.forEach(prod => {
          const div = document.createElement("div");
          div.classList.add("product-card");
          div.innerHTML = `
            <h2>${prod.name}</h2>
            <p>${prod.description}</p>
            <strong>$${prod.price}</strong>
            <a href="detail.html?id=${prod.id}">Ver más</a>
          `;
          list.appendChild(div);
        });
      });
  }

  // Mostrar detalle
  const detail = document.getElementById("detail-container");
  if (detail) {
    const params = new URLSearchParams(window.location.search);
    const id = params.get("id");
    fetch(`http://localhost:8080/tu-app/ProductServlet?id=${id}`)
      .then(res => res.json())
      .then(prod => {
        detail.innerHTML = `
          <h2>${prod.name}</h2>
          <p>${prod.description}</p>
          <strong>Precio: $${prod.price}</strong>
        `;
      });
  }

  // Enviar formulario
  const form = document.getElementById("product-form");
  if (form) {
    form.addEventListener("submit", (e) => {
      e.preventDefault();
      const data = Object.fromEntries(new FormData(form).entries());

      fetch("http://localhost:8080/tu-app/ProductServlet", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify(data)
      }).then(res => {
        if (res.ok) {
          alert("Producto registrado");
          window.location.href = "index.html";
        }
      });
    });
  }
});