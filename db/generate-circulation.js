import { random, sample } from 'lodash-es';
import { add, formatISO } from 'date-fns';
const patronUpperBound = 48;
const bookUpperBound = 25;

let inventory = {
  1: 4,
  2: 3,
  3: 9,
  4: 8,
  5: 9,
  6: 2,
  7: 5,
  8: 6,
  9: 4,
  10: 6,
  11: 9,
  12: 8,
  13: 5,
  14: 4,
  15: 5,
  16: 4,
  17: 6,
  18: 7,
  19: 6,
  20: 1,
  21: 9,
  22: 5,
  23: 7,
  24: 9,
  25: 3,
};

// Current weight: overdue 1 time out of five
let overdueWeight = [false, false, false, false, true];

function formatISODate(d) {
  return formatISO(d, { representation: 'date' });
}

/**
 *
 * @returns {[Date, Date, Date]} [checkoutDate, dueDate, returnDate]
 */
function generateDates() {
  let day = random(1, 31);
  let month = random(1, 12);
  let year = random(2010, 2021);
  let checkoutDate = new Date(`${year}-${month}-${day}`);
  let dueDate = add(checkoutDate, { weeks: 3 });
  let returnDate;
  if (overdueWeight[random(1, 5)]) {
    returnDate = add(dueDate, { days: random(1, 21) });
  } else {
    returnDate = add(dueDate, { days: random(-20, -2) });
  }

  return [formatISODate(checkoutDate), formatISODate(dueDate), formatISODate(returnDate)];
}

function generateCheckedOut() {
  let today = new Date();
  let dueDate = add(today, { days: random(1, 20) });
  let checkedOut;
  if (overdueWeight[random(1, 5)]) {
    checkedOut = add(dueDate, { days: random(-50, -22) });
  } else {
    checkedOut = add(dueDate, { weeks: -3 });
  }
  return [formatISODate(checkedOut), formatISODate(dueDate)];
}

function getBookInInventory(inventory) {
  let inventoryCopy = { ...inventory };
  let validIds = Object.values(inventoryCopy).filter((count) => count > 0);

  if (!validIds.length) {
    console.warn('All books checked out!', inventoryCopy);
    return [null, inventoryCopy];
  }

  let chosenId = sample(validIds);
  inventoryCopy[chosenId] = inventoryCopy[chosenId] - 1;
  return [chosenId, inventoryCopy];
}

let statements = [];
for (let x = 0; x < 10; x++) {
  let [checkout, due, returned] = generateDates();
  let patron = random(1, patronUpperBound);
  let book = random(1, bookUpperBound);
  let statement = `(${book}, ${patron}, '${checkout}', '${due}', '${returned}')`;
  statements.push(statement);
}

for (let x = 0; x < 10; x++) {
  let [checkout, due] = generateCheckedOut();
  let patron = random(1, patronUpperBound);
  let [book, updatedInventory] = getBookInInventory(inventory);
  inventory = updatedInventory;
  let statement = `(${book}, ${patron}, '${checkout}', '${due}', NULL)`;
  statements.push(statement);
}

console.log(statements.join(', '));
