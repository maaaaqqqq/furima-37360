window.addEventListener('load',() => {
  const priceInput = document.getElementById('item-price');
  priceInput.addEventListener('input',() => {
    const inputValue = priceInput.value;
    const addTaxDom = document.getElementById("add-tax-price");
    const calcTax = Math.floor(inputValue * 0.1 );
    addTaxDom.innerHTML = calcTax;
    const makeProfitDom = document.getElementById("profit");
    makeProfitDom.innerHTML = Math.floor(inputValue - calcTax);
  });
});