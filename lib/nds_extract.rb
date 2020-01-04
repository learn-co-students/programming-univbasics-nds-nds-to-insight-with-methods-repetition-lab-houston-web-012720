$LOAD_PATH.unshift(File.dirname(__FILE__))
require_relative './directors_database'

def directors_totals(source)
  result = {}
  director_index = 0
  while director_index < source.size do
    director = source[director_index]
    result[director[:name]] = gross_for_director(director)
    director_index += 1
  end
  result
end

def gross_for_director(d)
  total = 0
  index = 0
  while index < d[:movies].length do
    total += d[:movies][index][:worldwide_gross]
    index += 1
  end
  total
end

def list_of_directors(source)
  d_list = []
  d_index = 0
  while d_index < source.length do
    d_list << source[d_index][:name]
    d_index += 1
  end
  d_list
end

def total_gross(source)
  director_array = list_of_directors(source)
  director_total_hash = directors_totals(source)
  grand_gross = 0
  dir_index = 0
  while dir_index < director_array.length do
    grand_gross += director_total_hash[director_array[dir_index]]
    dir_index += 1
  end
  grand_gross
end
