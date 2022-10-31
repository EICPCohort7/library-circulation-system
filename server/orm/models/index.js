import Author from './Author.js';
import Book from './Book.js';
import BooksAuthors from './BooksAuthors.js';
import Circulation from './Circulation.js';
import Inventory from './Inventory.js';
import Patron from './Patron.js';

Author.belongsToMany(Book, {
  foreignKey: 'authorId',
  through: BooksAuthors,
});

Book.hasOne(Inventory, { foreignKey: 'bookId' });
Book.belongsToMany(Author, {
  foreignKey: 'bookId',
  through: BooksAuthors,
});

Inventory.belongsTo(Book, { foreignKey: 'bookId' });

export { Author, Book, Circulation, Inventory, Patron };
