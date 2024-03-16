
const rangeElement = document.querySelector('input[type="range"]');
const gridContainer = document.querySelector(".grid-container");

rangeElement.addEventListener("input", (event) => {
    const value = event.target.value;

    gridContainer.innerHTML = "";

    for (let i = 0; i < value; i++) {
        const gridItem = document.createElement("div");
        gridItem.classList.add("grid-item");
        gridItem.textContent = i + 1;
        gridContainer.appendChild(gridItem);
    }
});