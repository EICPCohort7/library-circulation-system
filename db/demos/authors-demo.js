import './load-env.js';
import { connection } from '../../server/orm/lcs-connection.js';
import Author from '../../server/orm/models/Author.js';

async function main() {
  try {
    await connection.sync();
    let robertParker = await Author.findByPk(5);
    console.log('Found the author:', robertParker.commonName);
    await connection.close();
  } catch (error) {
    console.error('Database error:', error);
  }
}

main();
