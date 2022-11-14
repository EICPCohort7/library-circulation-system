// Ideally, this should be password protected
import express from 'express';
import { sortBy } from 'lodash-es';
let router = express.Router();

router.get('/environment', (req, res) => {
  let env = {};
  for (let key of sortBy(Object.keys(process.env), k => k.toLowerCase())) {
    env[key] = process.env[key];
  }

  res.render('environment.pug', {
    title: 'App Server Environment',
    env,
  });
});

export default router;
