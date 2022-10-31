// import '../db/demos/load-env.js';
import { Author } from '../server/orm/models/index.js';
import { expect } from 'chai';

describe('Author model', () => {
  it('Smoke Test', async () => {
    let result = await Author.sync({ logging: false });
    expect(result).to.equal(Author);
  });

  it('should query someone in the database', async () => {
    let testAuthor = await Author.findByPk(5, { logging: false });
    expect(testAuthor.firstName).to.equal('Robert');
    expect(testAuthor.get('lastName')).to.equal('Parker');
  });

  it('should query books (an assocation)', async () => {
    let testAuthor = await Author.findByPk(5, { logging: false });

    /** @type {Book[]} */
    let testBooks = await testAuthor.getBooks({ logging: false });
    expect(testBooks.length).to.be.greaterThan(0);
    let titles = testBooks.map((book) => book.title);
    expect(titles).to.contain('The Godwulf Manuscript');
  });
});
