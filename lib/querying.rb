def select_books_titles_and_years_in_first_series_order_by_year
  "SELECT books.title, year FROM books
  JOIN series ON books.series_id = series.id
  GROUP BY books.title
  HAVING series.id = 1
  ORDER BY year"
end

def select_name_and_motto_of_char_with_longest_motto
  "SELECT name, motto FROM characters
  ORDER BY length(motto) DESC LIMIT 1"
end

def select_value_and_count_of_most_prolific_species
  "SELECT species, COUNT(species) AS count FROM characters
  GROUP BY species
  ORDER BY count DESC LIMIT 1"
end

def select_name_and_series_subgenres_of_authors
  "SELECT authors.name, subgenres.name AS series_subgenre FROM authors
  JOIN series ON authors.id = series.author_id
  JOIN subgenres ON series.subgenre_id = subgenres.id
  GROUP BY authors.name"
end

def select_series_title_with_most_human_characters
  "SELECT series.title FROM series
  JOIN books ON series.id = books.series_id
  JOIN character_books ON books.id = character_books.book_id
  JOIN characters ON character_books.character_id = characters.id
  ORDER BY (SELECT COUNT(species) AS human_count FROM characters WHERE species = 'human') DESC LIMIT 1 "
end

def select_character_names_and_number_of_books_they_are_in
  "SELECT characters.name, COUNT(character_books.book_id) AS book_count FROM characters
  LEFT OUTER JOIN character_books ON characters.id = character_books.character_id
  GROUP BY characters.name
  ORDER BY book_count DESC"
end
