import './app-config.js';
import path, { dirname } from 'node:path';
import { fileURLToPath } from 'url';
import express from 'express';
import cookieParser from 'cookie-parser';
import logger from 'morgan';
import examplesRouter from './routes/examples.js';
import booksRouter from './routes/books.js';

const __filename = fileURLToPath(import.meta.url);
const __dirname = dirname(__filename);

let app = express();

app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));

app.set('json spaces', 2);
app.use('/examples', examplesRouter);
app.use('/api/v1/books', booksRouter);

export default app;
