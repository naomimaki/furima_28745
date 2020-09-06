function calculation(){
  const itemPrice = document.getElementById("item-price")
  const addTaxPrice = document.getElementById("add-tax-price")
  const Profit = document.getElementById("profit")

  itemPrice.addEventListener('keyup',function(){
    addTaxPrice.innerHTML = itemPrice.value * 0.1
    Profit.innerHTML = itemPrice.value - itemPrice.value * 0.1
  })
}
window.addEventListener("load", calculation);
