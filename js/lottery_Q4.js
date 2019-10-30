//Question 4
function getPermutations(initNumber) {
    let remainingString;
    let permutations = [];
    let initNumberStr = initNumber.toString();
    const digits = initNumberStr.length;

    // 1. Check if there is only 1 character. We don't need to proceed through
    if (initNumberStr.length < 2) {
        return initNumber;
    }

    //2. Loop through each digits of the input
    for (let i = 0; i < digits; i++) {
        let char = initNumberStr[i];

        //2.1 If char was used already, skip it this time, because We don't want any duplicates
        if (initNumberStr.indexOf(char) != i){
            continue;
        }

        //2.2 Keep remaining String and call this function recursively
        remainingString = initNumberStr.slice(0,i) + initNumberStr.slice(i+1,initNumberStr.length);

        for (let subPermutation of getPermutations(remainingString)){
            //2.3 Parse to integer before putting into the result array
            permutations.push(parseInt(char + subPermutation));
        }
    }
    return permutations;
}

// Test
console.log(getPermutations(123456));