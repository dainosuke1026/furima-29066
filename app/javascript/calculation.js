function calculation() {
  const price_input = document.getElementById("item-price");
  const tax = document.getElementById("add-tax-price");
  const profit = document.getElementById("profit");

  if (price_input == null) {
    return;
  } else {
    price_input.addEventListener("keyup", () => {
      tax_price = Math.floor(price_input.value * 0.1);
      profit_price = Math.floor(price_input.value * 0.9);
      tax.innerHTML = tax_price.toLocaleString();
      profit.innerHTML = profit_price.toLocaleString();
    });
  }
};
setInterval(calculation, 1000);
