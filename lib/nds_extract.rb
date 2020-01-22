$LOAD_PATH.unshift(File.dirname(__FILE__))
require_relative './directors_database'
require 'pp'

# pp directors_database

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

# p directors_totals(directors_database)

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
  result = []
  
  for director in source do
    result << director[:name]
  end
  
  return result
end

def total_gross(source)
  # Write this implementation
  #
  # Should use methods:
  # 1. directors_totals: returns a Hash of { dir_name => gross }
  # 2. list_of_directors: names provides an Array of directors names (use
  #
  # Visit each key (i.e. director name), look up the value in the hash
  # returned by directors_totals, and add it to a running total. When done,
  # return the total
  
  total = 0
  
  directors = list_of_directors(source)
  
  #raul
  # d_totals = directors_totals(source)

  # directors.each do | d, index |
  #   d_totals[d]
  # end
  
  # pp directors
  
  d_totals = directors_totals(source)
  
  i = 0
  while i < directors.length do
    name = directors[i]
    director_gross = d_totals[name]
    
    total += director_gross
    
    i += 1
  end
  
  # total = get_gross_total(d_totals)
  
  return total
  
end

# def get_gross_total(source)
#   total = 0
  
#   for director in source do
#     total += director[1]
    
#     # pp director[1]
#   end
  
#   return total
# end

# def get_gross_total(director_totals)
  
# end

# total_gross(directors_database)
# p get_gross_total({"Stephen Spielberg"=>1357566430,
# "Russo Brothers"=>2281002470,
# "James Cameron"=>2571020373,
# "Spike Lee"=>256624217,
# "Wachowski Siblings"=>806180282,
# "Robert Zemeckis"=>1273838385,
# "Quentin Tarantino"=>662738268,
# "Martin Scorsese"=>636812242,
# "Francis Ford Coppola"=>509719258})