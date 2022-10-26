import { DataTypes } from 'sequelize';
import { connection } from '../lcs-connection.js';

const Book = connection.define('book', {
  bookId: {
    type: DataTypes.INTEGER,
    primaryKey: true,
    autoIncrement: true,
  },
  title: {
    type: DataTypes.STRING,
    allowNull: false,
  },
  publishYear: DataTypes.INTEGER,
  isbn: DataTypes.STRING,
  notes: DataTypes.STRING,
});

export default Book;
