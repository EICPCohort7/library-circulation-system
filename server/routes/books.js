import express from 'express';
let router = express.Router();

router.get('/', (req, res) => {
  res.send('You requested all the books');
});

export default router;
