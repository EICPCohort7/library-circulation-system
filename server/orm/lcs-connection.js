import { Sequelize } from 'sequelize';
import chalk from 'chalk';

/*
 * process.env should have the following keys:
 * DB_USER
 * DB_PASSWORD
 * DB_HOST
 * DB_PORT
 * DB_SCHEMA
 */

let { DB_USER, DB_PASSWORD, DB_HOST, DB_PORT, DB_SCHEMA } = process.env;

let connectionString = `mysql://${DB_USER}:${DB_PASSWORD}@${DB_HOST}:${DB_PORT}/${DB_SCHEMA}`;

export const connection = new Sequelize(connectionString, {
  logging: (...msg) => console.log(chalk.gray(msg)),
  logQueryParameters: true,
  define: {
    timestamps: false,
    underscored: true,
  },
});
