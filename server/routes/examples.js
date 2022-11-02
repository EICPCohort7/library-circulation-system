import express from 'express';
let router = express.Router();

router.get('/say-hello', (req, res, next) => {
  console.log('Middleware part 2');
  next();
});

router.get('/say-hello', (req, res, next) => {
  console.log('Middleware part 1');
  next();
});

// What's the HTTP Method? get
// What's the URL to answer on? /say-hello
// What should we do? The provided function.
// Three arguments: request, response, next
// request: https://expressjs.com/en/4x/api.html#req
// response: https://expressjs.com/en/4x/api.html#res
// next(): Call to invoke the next piece of middleware
router.get('/say-hello', (req, res, next) => {
  res.send('Hello!');
});

export default router;
