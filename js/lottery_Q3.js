//Question 3
function getAllWinningNumbers(winningNumber){
    const lastTwoDigits = winningNumber.toString(10).substr(4);
    let allWinningNumbers = [];

    for(let i = 0; i<= 9999; i++){
        //1. Parse 'i' to String and then add leading zero(s) until we've got the first 4 digits
        let oneOfWinningNumbers = i.toString(10).padStart(4, '0');

        //2. Concatenate the first four digits with the last 2 digits we retrieved from the input
        oneOfWinningNumbers = oneOfWinningNumbers.concat(lastTwoDigits);

        //3. Now, we've got one of 6-digit winning numbers. We then push into an array
        allWinningNumbers.push(oneOfWinningNumbers);
    }

    return allWinningNumbers;
}

console.log(getAllWinningNumbers(100099));