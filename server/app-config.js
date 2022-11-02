import chalk from 'chalk';
import path, { dirname } from 'node:path';
import { fileURLToPath } from 'url';
import * as dotenv from 'dotenv';

const __filename = fileURLToPath(import.meta.url);
const __dirname = dirname(__filename);
const dotEnvResults = dotenv.config({ path: path.join(__dirname, '../.env') });

if (dotEnvResults.error) {
  if (dotEnvResults.error.code === 'ENOENT') {
    console.error(
      chalk.red.bold(
        '***** ERROR: Please create a .env file with the appropriate information! *****'
      )
    );
  }
  throw dotEnvResults.error;
}

let { DB_USER, DB_PASSWORD, DB_HOST, DB_PORT, DB_SCHEMA } = process.env;

console.log(`
DB_USER: ${DB_USER}
DB_PASSWORD: ${DB_PASSWORD}
DB_HOST: ${DB_HOST}
DB_PORT: ${DB_PORT}
DB_SCHEMA: ${DB_SCHEMA}
`);
