DROP
  SCHEMA IF EXISTS books;

CREATE SCHEMA books;

USE books;

CREATE TABLE
  authors (
    author_id INTEGER PRIMARY KEY NOT NULL auto_increment,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    common_name VARCHAR(255) NOT NULL
  );

CREATE TABLE
  books (
    book_id INTEGER PRIMARY KEY NOT NULL auto_increment,
    title VARCHAR(255) NOT NULL,
    publish_year INTEGER,
    isbn VARCHAR(255),
    notes VARCHAR(1024)
  );

CREATE TABLE
  books_authors (
    book_author_id INTEGER PRIMARY KEY NOT NULL auto_increment,
    book_id INTEGER NOT NULL,
    author_id INTEGER NOT NULL,
    FOREIGN key (book_id) REFERENCES books (book_id),
    FOREIGN key (author_id) REFERENCES authors (author_id)
  );

CREATE TABLE
  patrons (
    patron_id INTEGER PRIMARY KEY NOT NULL auto_increment,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    date_of_birth DATE NOT NULL,
    email VARCHAR(255),
    phone_number VARCHAR(30),
    city VARCHAR(255),
    province VARCHAR(100),
    postal_code VARCHAR(10)
  );

CREATE TABLE
  inventory (
    inventory_id INTEGER PRIMARY KEY NOT NULL auto_increment,
    book_id INTEGER NOT NULL,
    inventory INTEGER NOT NULL,
    FOREIGN key (book_id) REFERENCES books (book_id)
  );

CREATE TABLE
  circulation (
    circulation_id INTEGER PRIMARY KEY NOT NULL auto_increment,
    book_id INTEGER NOT NULL,
    patron_id INTEGER NOT NULL,
    checkout_date DATE NOT NULL,
    due_date DATE NOT NULL,
    return_date DATE,
    FOREIGN key (book_id) REFERENCES books (book_id),
    FOREIGN key (patron_id) REFERENCES patrons (patron_id)
  );

INSERT INTO
  authors
VALUES
  (1, 'Gabriel', 'Garcia Márquez', 'Gabriel Garcia Márquez'),
  (2, 'Herman', 'Melville', 'Herman Melville'),
  (3, 'John', 'Steinbeck', 'John Steinbeck'),
  (4, 'Francis', 'Fitzgerald', 'F. Scott Fitzgerald'),
  (5, 'Robert', 'Parker', 'Robert B. Parker'),
  (6, 'Isabel', 'Allende', 'Isabel Allende'),
  (7, 'Nora', 'Ephron', 'Nora Ephron'),
  (8, 'Joanne', 'Rowling', 'J. K. Rowling'),
  (9, 'John', 'Tolkien', 'J. R. R. Tolkien'),
  (10, 'Arch', 'Whitehead', 'Colson Whitehead');

-- book_id, title, publish_year, isbn, notes
INSERT INTO
  books (book_id, title, publish_year, isbn)
VALUES
  (1, 'One Hundred Years of Solitude', 1967, '9780060883287'),
  (2, 'Love in the Time of Cholera', 1985, '9780060883287'),
  (3, 'The General in His Labyrinth', 1989, '9781400034703'),
  (4, 'Moby-Dick; or, the Whale', 1851, '9780143105954'),
  (5, 'The Grapes of Wrath', 1939, '9780143039433'),
  (6, 'Travels with Charley: In Search of America', 1962, '9780140053203'),
  (7, 'The Great Gatsby', 1925, '9798745274824'),
  (8, 'The Godwulf Manuscript', 1973, '9780440129615'),
  (9, 'Mortal Stakes', 1975, '9780440157588'),
  (10, 'A Savage Place', 1981, '9780440180951'),
  (11, 'The Widening Gyre', 1983, '9780440195351'),
  (12, 'The House of the Spirits', 1982, '9781501117015'),
  (13, 'Zorro', 2005, '9780007201983'),
  (14, 'Heartburn', 1983, '9781844085170'),
  (15, 'I Remember Nothing: And Other Reflections', 2010, '9780307742803'),
  (16, 'Harry Potter and the Philosopher''s Stone', 1997, '9781408855898'),
  (17, 'Harry Potter and the Chamber of Secrets', 1998, '9781338299151'),
  (18, 'Harry Potter and the Prisoner of Azkaban', 1999, '9781526606167'),
  (19, 'The Hobbit', 1937, '9780547928227'),
  (20, 'The Fellowship of the Ring', 1954, '9780358380238'),
  (21, 'The Two Towers', 1954, '9780547928203'),
  (22, 'The Return of the King', 1955, '9780547928197'),
  (23, 'Zone One', 2011, '9780307455178'),
  (24, 'The Underground Railroad', 2016, '9780345804327'),
  (25, 'The Nickel Boys', 2019, '9780345804341');

INSERT INTO
  books_authors (book_id, author_id)
VALUES
  (1, 1),
  (2, 1),
  (3, 1),
  (4, 2),
  (5, 3),
  (6, 3),
  (7, 4),
  (8, 5),
  (9, 5),
  (10, 5),
  (11, 5),
  (12, 6),
  (13, 6),
  (14, 7),
  (15, 7),
  (16, 8),
  (17, 8),
  (18, 8),
  (19, 9),
  (20, 9),
  (21, 9),
  (22, 9),
  (23, 10),
  (24, 10),
  (25, 10);

INSERT INTO
  inventory
VALUES
  (1, 1, 4),
  (2, 2, 3),
  (3, 3, 9),
  (4, 4, 8),
  (5, 5, 9),
  (6, 6, 2),
  (7, 7, 5),
  (8, 8, 6),
  (9, 9, 4),
  (10, 10, 6),
  (11, 11, 9),
  (12, 12, 8),
  (13, 13, 5),
  (14, 14, 4),
  (15, 15, 5),
  (16, 16, 4),
  (17, 17, 6),
  (18, 18, 7),
  (19, 19, 6),
  (20, 20, 1),
  (21, 21, 9),
  (22, 22, 5),
  (23, 23, 7),
  (24, 24, 9),
  (25, 25, 3);

-- patron_id, first_name, last_name, date_of_birth, email, phone_number, city, province, postal_code
INSERT INTO
  patrons
VALUES
  (
    1,
    'Mujtaba',
    'Fiolek',
    '1997-11-26',
    'Mujtaba_Fiolek@messages.org',
    '(575) 487-6568',
    'Ferriday',
    'LA',
    '71334'
  ),
  (
    2,
    'Baltej',
    'Baker',
    '1996-03-17',
    'Baltej_Baker@libero.it',
    '(308) 688-2058',
    'Austin',
    'TX',
    '73344'
  ),
  (
    3,
    'Christopher',
    'Smith',
    '2000-02-13',
    'Christopher_Smith@hotmail.com',
    '(848) 646-2354',
    'Kilgore',
    'TX',
    '75663'
  ),
  (
    4,
    'Thomas',
    'Filinaite',
    '1998-02-05',
    'Thomas_Filinaite@yahoo.com',
    '(309) 930-8293',
    'Hillman',
    'MN',
    '56338'
  ),
  (
    5,
    'Joseph',
    'Casey',
    '1999-04-25',
    'Joseph_Casey@alibaba.cn',
    '(783) 809-8230',
    'San Jose',
    'CA',
    '95191'
  ),
  (
    6,
    'Chidinma',
    'Nathan',
    '1998-02-18',
    'Chidinma_Nathan@yahoo.com',
    '(247) 922-3094',
    'Twin Falls',
    'ID',
    '83301'
  ),
  (
    7,
    'Andre',
    'Patel',
    '1994-11-19',
    'Andre_Patel@yahoo.com',
    '(207) 639-4885',
    'Lorane',
    'OR',
    '97451'
  ),
  (
    8,
    'Andre',
    'Lora',
    '1997-12-22',
    'Andre_Lora@gmail.com',
    '(425) 361-2024',
    'Point Pleasant',
    'PA',
    '18950'
  ),
  (
    9,
    'Charlie',
    'O''Reilly ',
    '1999-02-03 ',
    'Charlie_O_Reilly@bt.co.uk',
    '(214) 333-9931',
    'Glencoe',
    'OH',
    '43928'
  ),
  (
    10,
    'Anthony',
    'Ogualiri',
    '1998-09-20',
    'Anthony_Ogualiri@rogers.ca',
    '(789) 977-5356',
    'Slidell',
    'LA',
    '70459'
  ),
  (
    11,
    'Idris',
    'Wallace',
    '1997-04-11',
    'Idris_Wallace@messages.org',
    '(427) 270-6676',
    'Rebuck',
    'PA',
    '17867'
  ),
  (
    12,
    'Mujtaba',
    'Iaconis',
    '2000-04-27',
    'Mujtaba_Iaconis@comcast.net',
    '(310) 309-7966',
    'Spartanburg',
    'SC',
    '29319'
  ),
  (
    13,
    'Joel',
    'Saffiullah',
    '1996-08-13',
    'Joel_Saffiullah@hotmail.com',
    '(531) 409-6420',
    'Memphis',
    'TN',
    '38177'
  ),
  (
    14,
    'Idris',
    'Mick',
    '1997-03-26',
    'Idris_Mick@comcast.net',
    '(837) 651-2216',
    'Eugene',
    'OR',
    '97401'
  ),
  (
    15,
    'Michael',
    'Abou-Francis',
    '2000-05-02',
    'Michael_Abou-Francis@comcast.net',
    '(649) 545-1173',
    'Karlsruhe',
    'ND',
    '58744'
  ),
  (
    16,
    'Daniel',
    'Antohi',
    '1997-06-19',
    'Daniel_Antohi@aol.com',
    '(678) 848-2087',
    'Miami',
    'FL',
    '33173'
  ),
  (
    17,
    'Tim',
    'Nasser',
    '1999-07-01',
    'Tim_Nasser@email.net',
    '(889) 678-9263',
    'Atlanta',
    'GA',
    '30388'
  ),
  (
    18,
    'Adam',
    'Kotlinski',
    '1995-03-27',
    'Adam_Kotlinski@rogers.ca',
    '(313) 600-8863',
    'Oregon',
    'OH',
    '43618'
  ),
  (
    19,
    'Michael',
    'Sardary',
    '1994-10-30',
    'Michael_Sardary@outlook.com',
    '(523) 712-9386',
    'Aurora',
    'CO',
    '80047'
  ),
  (
    20,
    'Fatima',
    'Wishart',
    '1995-06-03',
    'Fatima_Wishart@rogers.ca',
    '(309) 540-8397',
    'Florissant',
    'MO',
    '63033'
  ),
  (
    21,
    'Baltej',
    'Howe',
    '2000-03-13',
    'Baltej_Howe@email.net',
    '(276) 934-6604',
    'Los Angeles',
    'CA',
    '90065'
  ),
  (
    22,
    'Maria',
    'Yohannes',
    '1995-10-23',
    'Maria_Yohannes@yandex.ru',
    '(787) 208-7018',
    'Hendrix',
    'OK',
    '74741'
  ),
  (
    23,
    'Daniel',
    'Gritter',
    '1996-05-24',
    'Daniel_Gritter@bt.co.uk',
    '(400) 892-2200',
    'Linn',
    'KS',
    '66953'
  ),
  (
    24,
    'Mujtaba',
    'Portillo',
    '1994-09-16',
    'Mujtaba_Portillo@yahoo.com',
    '(671) 368-5561',
    'Cedar Key',
    'FL',
    '32625'
  ),
  (
    25,
    'Hector',
    'Whig',
    '1998-05-05',
    'Hector_Whig@email.net',
    '(352) 277-2684',
    'Marne',
    'IA',
    '51552'
  ),
  (
    26,
    'Peter',
    'Keezer',
    '1996-01-10',
    'Peter_Keezer@bt.co.uk',
    '(236) 873-9742',
    'Nolan',
    'TX',
    '79537'
  ),
  (
    27,
    'Seena Rose',
    'Travers',
    '1997-11-17',
    'Seena Rose_Travers@email.net',
    '(286) 303-4184',
    'Roanoke',
    'VA',
    '24042'
  ),
  (
    28,
    'Callum',
    'Castillo',
    '1996-07-03',
    'Callum_Castillo@comcast.net',
    '(832) 257-9603',
    'Cabin John',
    'MD',
    '20818'
  ),
  (
    29,
    'Andre',
    'Yang',
    '1996-09-27',
    'Andre_Yang@gmail.com',
    '(543) 422-9911',
    'Dallas',
    'WV',
    '26036'
  ),
  (
    30,
    'Vasile',
    'Villanueva',
    '1994-11-16',
    'Vasile_Villanueva@hotmail.com',
    '(616) 504-4842',
    'Southwestern Manitoba',
    'Manitoba',
    'R0M 2L9'
  ),
  (
    31,
    'Andre',
    'Ogle',
    '2000-05-01',
    'Andre_Ogle@yahoo.com',
    '(985) 666-8976',
    'Cap-aux-meules',
    'Quebec',
    'G0B 4Q5'
  ),
  (
    32,
    'Charlie',
    'Ejiofor',
    '1995-09-24',
    'Charlie_Ejiofor@alibaba.cn',
    '(638) 621-4308',
    'Abitibi-Témiscamingue-Est',
    'Quebec',
    'J0Y 604'
  ),
  (
    33,
    'Maria',
    'Whiteman',
    '1998-08-04',
    'Maria_Whiteman@messages.org',
    '(977) 996-9550',
    'Valleyfield',
    'Quebec',
    'J7X 8M3'
  ),
  (
    34,
    'Dylan',
    'McDonagh',
    '1996-08-11',
    'Dylan_McDonagh@libero.it',
    '(635) 335-9541',
    'East Kootenays',
    'British Columbia',
    'V0B 0B5'
  ),
  (
    35,
    'Michal',
    'Mazzarese',
    '1997-12-12',
    'Michal_Mazzarese@yandex.ru',
    '(511) 998-3482',
    'Becancour',
    'Quebec',
    'G9H 0R0'
  ),
  (
    36,
    'Joseph',
    'Qureshi',
    '1996-02-01',
    'Joseph_Qureshi@libero.it',
    '(536) 472-3127',
    'Pickering Central',
    'Ontario',
    'L1X 9T8'
  ),
  (
    37,
    'Kevin',
    'Vitriago',
    '2000-04-15',
    'Kevin_Vitriago@yahoo.com',
    '(700) 933-5533',
    'Pembroke Central And Northern Subdivisions',
    'Ontario',
    'K8A 1U6'
  ),
  (
    38,
    'Katrina',
    'Manghan',
    '1997-06-08',
    'Katrina_Manghan@libero.it',
    '07781 143892',
    'Edinburgh',
    NULL,
    'EH1 3PX'
  ),
  (
    39,
    'Phillip',
    'Fahrenkopf',
    '1995-12-15',
    'Phillip_Fahrenkopf@aol.com',
    '07624 748001',
    'Edinburgh',
    NULL,
    'EH9 1TZ'
  ),
  (
    40,
    'Demi',
    'Thomas',
    '1995-11-21',
    'Demi_Thomas@rogers.ca',
    '07843 913897',
    'Cardiff',
    NULL,
    'CF24 3HB'
  ),
  (
    41,
    'Fardin',
    'Chia',
    '1995-07-15',
    'Fardin_Chia@yahoo.com',
    '07422 569231',
    'Swansea',
    NULL,
    'SA1 6JQ'
  ),
  (
    42,
    'Michal',
    'Paxton',
    '1998-03-04',
    'Michal_Paxton@comcast.net',
    '07624 095243',
    'London',
    NULL,
    'SW2 1EW'
  ),
  (
    43,
    'Matthew',
    'Zarba',
    '1999-02-23',
    'Matthew_Zarba@comcast.net',
    '07624 469156',
    'London',
    NULL,
    'HA9 0WS'
  ),
  (
    44,
    'Ieva ',
    'Mathew',
    '1996-07-04',
    'Ieva _Mathew@rogers.ca',
    '07624 257626',
    'London',
    NULL,
    'SE10 0QS'
  ),
  (
    45,
    'Seena Rose',
    'Ringes',
    '1998-01-22',
    'Seena Rose_Ringes@comcast.net',
    '07624 993492',
    'London',
    NULL,
    'IG11 7QF'
  ),
  (
    46,
    'Michal',
    'Kibria',
    '1995-05-15',
    'Michal_Kibria@messages.org',
    '07624 285834',
    'London',
    NULL,
    'WC2E 7BB'
  ),
  (
    47,
    'Vasile',
    'Sawicki',
    '1995-07-15',
    'Vasile_Sawicki@messages.org',
    '07828 017897',
    'Tynemouth',
    NULL,
    'NE30 4BY'
  ),
  (
    48,
    'Maria',
    'Ijaz',
    '1999-01-12',
    'Maria_Ijaz@yandex.ru',
    '07624 580397',
    'Newcastle upon Tyne',
    NULL,
    'NE1 4ST'
  );

INSERT INTO
  circulation (book_id, patron_id, checkout_date, due_date, return_date)
VALUES
  (9, 10, '2010-06-26', '2010-07-17', '2010-07-07'),
  (25, 32, '2017-11-10', '2017-12-01', '2017-12-14'),
  (2, 34, '2014-08-30', '2014-09-20', '2014-09-02'),
  (9, 12, '2019-03-28', '2019-04-18', '2019-04-04'),
  (11, 27, '2020-08-29', '2020-09-19', '2020-08-30'),
  (7, 9, '2015-03-15', '2015-04-05', '2015-03-28'),
  (21, 31, '2019-06-03', '2019-06-24', '2019-06-15'),
  (10, 22, '2016-02-20', '2016-03-12', '2016-03-05'),
  (16, 16, '2017-10-15', '2017-11-05', '2017-10-23'),
  (12, 33, '2016-05-31', '2016-06-21', '2016-06-19'),
  (2, 2, '2022-10-15', '2022-11-05', NULL),
  (6, 38, '2022-10-05', '2022-10-26', NULL),
  (5, 45, '2022-10-19', '2022-11-09', NULL),
  (6, 37, '2022-10-17', '2022-11-07', NULL),
  (5, 4, '2022-10-14', '2022-11-12', NULL),
  (8, 19, '2022-10-22', '2022-11-12', NULL),
  (5, 14, '2022-10-15', '2022-11-05', NULL),
  (4, 25, '2022-10-02', '2022-10-27', NULL),
  (4, 41, '2022-10-16', '2022-11-06', NULL),
  (5, 46, '2022-10-07', '2022-10-28', NULL);