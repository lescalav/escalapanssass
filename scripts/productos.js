function plantillaProducto(producto) {

  // Etiquetas de la derecha
  let claseDestacado = "";
  if (producto.destacado === "Best Seller") claseDestacado = "etiqueta-naranja";
  if (producto.destacado === "Agotado") claseDestacado = "etiqueta-gris";
  if (producto.destacado === "-15%") claseDestacado = "etiqueta-roja";

  // Etiquetas de la izquierda
  let claseCategoria = "";
  if (producto.categoria === "Acero Inoxidable") claseCategoria = "etiqueta-azul";
  if (producto.categoria === "Hierro Fundido") claseCategoria = "etiqueta-amarilla";
  if (producto.categoria === "Antiadherente") claseCategoria = "etiqueta-verde";
  if (producto.categoria === "Wok") claseCategoria = "etiqueta-morada";

  return `
    <article><a href="producto.html">
      <div class="producto-imagen">
        <span class="etiqueta izquierda ${claseCategoria}">
          ${producto.categoria}
        </span>
        ${producto.destacado ? // Si tiene algún elemento para destacar en la etiqueta de la derecha, lo muestra
          `<span class="etiqueta derecha ${claseDestacado}">
            ${producto.destacado}
          </span>` : ""
        }
        <img src="images/${producto.imagen}" alt="${producto.nombre}">
      </div>
      
      <div class="producto-info"> 
        <h3>${producto.nombre}</h3>
        <p>${producto.coleccion}</p>
        <ul class="caracteristicas">
          ${producto.caracteristicas.map(caracteristica => 
            `<li>
              <span class="material-symbols-outlined">check_circle</span>
              ${caracteristica}
            </li>`).join("")
          }
        </ul>
      </div>

      <div class="producto-acciones">
        <span class="precio">€${producto.precio}</span>
        <button>
          <span class="material-symbols-outlined">add_shopping_cart</span>
        </button>
      </div>

    </a></article>
  `;
}

async function cargarProductos() {
  const respuesta = await fetch("productos.json");
  const productos = await respuesta.json();
  const contenedor = document.getElementById("productos");
  contenedor.innerHTML = productos.map(plantillaProducto).join("");
}

cargarProductos();