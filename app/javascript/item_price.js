function price() {
  const priceInput = document.getElementById("item-price"); //価格入力欄の取得 
  priceInput.addEventListener('input', () => {
    const inputValue = priceInput.value;
    const commission = 0.1;
    const commissionFee = Math.floor(inputValue * commission);
    const profit = inputValue - commissionFee;
    const commissionArea = document.getElementById("add-tax-price");
    const profitArea = document.getElementById("profit");
    commissionArea.innerHTML = commissionFee;
    profitArea.innerHTML = profit;
  });
}

window.addEventListener('load', price)