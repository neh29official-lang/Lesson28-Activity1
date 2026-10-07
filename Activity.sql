DROP TABLE IF EXISTS book;

CREATE TABLE book (
    book_id INTEGER PRIMARY KEY,
    title TEXT NOT NULL,
    genre TEXT NOT NULL,
    rating REAL NOT NULL,
    pages INTEGER NOT NULL,
    pub_year INTEGER NOT NULL
);

INSERT INTO book VALUES (1, 'Dragon Quest',    'Fantasy',    9.2, 312, 2021);
INSERT INTO book VALUES (2, 'Code Wizards',    'Sci-Fi',     8.5, 280, 2020);
INSERT INTO book VALUES (3, 'Ocean Deep',      'Adventure',  7.8, 195, 2022);
INSERT INTO book VALUES (4, 'Star Rangers',    'Sci-Fi',     9.5, 340, 2019);
INSERT INTO book VALUES (5, 'Forest Secrets',  'Fantasy',    8.1, 228, 2023);
INSERT INTO book VALUES (6, 'Robot City',      'Sci-Fi',     7.2, 260, 2021);
INSERT INTO book VALUES (7, 'Time Jumpers',    'Adventure',  8.9, 175, 2022);
INSERT INTO book VALUES (8, 'Magic Academy',   'Fantasy',    9.0, 398, 2020);


-- 1. Display all books
SELECT * FROM book;


-- 2. Books sorted by rating (lowest to highest)
SELECT title, rating
FROM book
ORDER BY rating ASC;


-- 3. Books sorted by rating (highest to lowest)
SELECT title, rating
FROM book
ORDER BY rating DESC;


-- 4. Sort by genre, then rating
SELECT title, genre, rating
FROM book
ORDER BY genre ASC, rating DESC;


-- 5. Top 3 highest-rated books
SELECT title, rating
FROM book
ORDER BY rating DESC
LIMIT 3;


-- 6. First 5 books by publication year
SELECT title, pub_year
FROM book
ORDER BY pub_year ASC
LIMIT 5;


-- 7. Count books in each genre
SELECT genre, COUNT(*) AS book_count
FROM book
GROUP BY genre;


-- 8. Total pages and average rating for each genre
SELECT genre,
       SUM(pages) AS total_pages,
       AVG(rating) AS avg_rating
FROM book
GROUP BY genre;


-- 9. Genres having more than 2 books
SELECT genre, COUNT(*) AS book_count
FROM book
GROUP BY genre
HAVING COUNT(*) > 2;


-- 10. Genres with an average rating of 8.5 or higher
SELECT genre, AVG(rating) AS avg_rating
FROM book
GROUP BY genre
HAVING AVG(rating) >= 8.5;