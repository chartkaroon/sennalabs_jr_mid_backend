// Question 1
function profit(info){
    //1. Calculate Profit = (sell price - cost price) x inventory
    //2. Use Math.round to round it up to the nearest dollar
    return Math.round((info.sell_price - info.cost_price) * info.inventory );
}

// Test
let info = {
    cost_price: 32.67,
    sell_price: 45.00,
    inventory: 1200
};
let info2 = {
    cost_price: 225.89,
    sell_price: 550.00,
    inventory: 100
};
console.log(profit(info));
console.log(profit(info2));


