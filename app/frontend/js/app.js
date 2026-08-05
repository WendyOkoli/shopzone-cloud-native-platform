async function loadProducts() {
    const response = await fetch("data/products.json");
    const products = await response.json();

    const container = document.getElementById("products");

    container.innerHTML = "";

    products.forEach(product => {
        container.innerHTML += `
            <div class="col-md-3 mb-4">
                <div class="card shadow-sm h-100">

                    <img src="${product.image}" class="card-img-top">

                    <div class="card-body">

                        <h5>${product.name}</h5>

                        <p class="text-primary fw-bold">
                            ₦${product.price.toLocaleString()}
                        </p>

                        <p>${product.description}</p>

                        <button class="btn btn-primary w-100">
                            Add to Cart
                        </button>

                    </div>

                </div>
            </div>
        `;
    });
}

loadProducts();