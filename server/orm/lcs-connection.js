import { Sequelize } from 'sequelize';
import { getConnectionConfig } from '../app-config';
import chalk from 'chalk';

let { user, password, host, port, schema } = getConnectionConfig();

let connectionString = `mysql://${user}:${password}@${host}:${port}/${schema}`;

export const connection = new Sequelize(connectionString, {
  logging: (...msg) => console.log(chalk.gray(msg.slice(0, -1))),
  logQueryParameters: true,
  define: {
    timestamps: false,
    underscored: true,
  },
});
