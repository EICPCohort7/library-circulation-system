import { getBookInInventory } from '../generate-functions.js';

describe('JEST: generate-functions.js', () => {
  let inventory = {};
  beforeEach(() => {
    inventory = {
      1: 5,
      2: 3,
    };
  });

  it('Smoke test', () => {
    getBookInInventory(inventory);
  });

  it('should return a valid chosen id', () => {
    let validIds = Object.keys(inventory);
    let [chosenId] = getBookInInventory(inventory);
    expect(validIds).toContain(chosenId);
  });
});
