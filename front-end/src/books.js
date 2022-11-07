import axios from 'axios';

async function fetchBooks() {
  try {
    let response = await axios.get('/api/v1/books');
    return response.data;
  } catch (err) {
    if (err.response) {
      // HTTP error
      throw new Error(`${err.response.status}: ${err.response.statusText}`);
    } else {
      throw err;
    }
  }
}

async function createBooksTable(target) {
  let table = document.createElement('table');
  table.classList.add('table', 'table-striped');
  let tableHead = document.createElement('thead');
  let tableBody = document.createElement('tbody');
  table.append(tableHead, tableBody);
  tableHead.insertAdjacentHTML('beforeend', '<tr><th>Title</th><th>Year</th></tr>');

  let books = await fetchBooks();
  books.forEach(book => {
    tableBody.insertAdjacentHTML('beforeend', `<tr><td>${book.title}</td><td>${book.publishYear}</td></tr>`);
  });

  target.replaceChildren(table);
}

createBooksTable(document.getElementById('target'));
