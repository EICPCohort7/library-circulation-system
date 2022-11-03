import express from 'express';
import { Book } from '../orm/models/index.js';
import { Op, ValidationError } from 'sequelize';
let router = express.Router();

function handleError(res, error) {
  return res.status(500).send('Book endpoint error:', error);
}

router.get('/', async (req, res) => {
  try {
    return res.json(await Book.findAll());
  } catch (error) {
    handleError(res, error);
  }
});

router.get('/:bookId([0-9]+)', async (req, res) => {
  try {
    let bookId = req.params.bookId;
    let book = await Book.findByPk(bookId);
    if (book) return res.json(book);

    return res.status(404).send(`Book ID ${bookId} not found`);
  } catch (error) {
    handleError(res, error);
  }
});

// This should probably go into a controller(like) object
router.get('/search', async (req, res) => {
  /** @see https://developer.mozilla.org/en-US/docs/Web/API/URLSearchParams */
  let criteria = new URLSearchParams(req.query);

  try {
  // Partial implementation
    if (criteria.title) {
      let results = await Book.findAll({
        where: {
          title: criteria.title,
        },
      });
      if (results.length) return res.json(results);
      return res.status(404).send(`No books with title ${criteria.title} found.`);
    }

    // Or should we make partial matches the default?
    if (criteria.titleLike) {
      let results = await Book.findAll({
        where: {
          title: {
            [Op.substring]: criteria.title,
          },
        },
      });
      if (results.length) return res.json(results);
      return res.status(404).send(`No books with title ${criteria.title} found.`);
    }
  } catch (error) {
    handleError(res, error);
  }
});

router.post('/', async (req, res) => {
  try {
  // Note use of build() and not create()
  // Allows for local validations
    let bookToBeAdded = Book.build({ ...req.body });
    let result = await bookToBeAdded.save();
    if (result instanceof ValidationError) {
      console.error('Validation failed:', result);
      throw result;
    }
    return res.json(bookToBeAdded);
  } catch (error) {
    // Might want more robust error handling here
    handleError(res, error);
  }
});

router.patch('/:bookId([0-9]+)', async (req, res) => {
  try {
    let book = await Book.findByPk(req.params.bookId);
    if (!book) return res.status(404).send(`Book ID ${req.params.bookId} not found`);
    let results = await book.update({ ...req.body });
    console.log(`Update ${req.params.bookId}, ${results[0]} rows affected`);
    return res.json(book);
  } catch (error) {
    handleError(res, error);
  }
});

router.put('/:bookId([0-9]+)', async (req, res) => {
  try {
    let book = await Book.findByPk(req.params.bookId);
    if (!book) return res.status(404).send(`Book ID ${req.params.bookId} not found`);

    // Does a partial update, inconsistent with the definition of PUT
    let results = await book.update({ ...req.body });
    console.log(`Update ${req.params.bookId}, ${results[0]} rows affected`);
    return res.json(book);
  } catch (error) {
    handleError(res, error);
  }
});

router.delete('/:bookId([0-9]+)', async (req, res) => {
  try {
    let book = await Book.findByPk(req.params.bookId);
    if (!book) return res.status(404).send(`Book ID ${req.params.bookId} not found`);

    let results = await book.destroy();
    if (results === 1) {
      console.log(`Book ${req.params.bookId} deleted.`);
      return res.status(204);
    } else if (results === 0) {
      console.log(`Book ${req.params.bookId} NOT deleted, for some reason.`);
      return res.status(500).send(`Book ${req.params.bookId} not deleted for some reason`);
    } else if (results > 1) {
      console.error('Multiple books deleted, this should not happen.');
      throw new Error('Multiple books deleted, this should not happen.');
    }
  } catch (error) {
    handleError(res, error);
  }
});

export default router;
