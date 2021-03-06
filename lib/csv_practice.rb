require 'csv'
require 'awesome_print'

def get_all_olympic_athletes(filename)
  athlete_attributes = %w[ID Name Height Team Year City Sport Event Medal]

  CSV.read(filename, headers: true).map do |athletes|
    each_athlete = Hash.new()
    athlete_attributes.each { |attribute| each_athlete[attribute] = athletes[attribute] }
    each_athlete
  end
end

def total_medals_per_team(olympic_data)
  return olympic_data.filter { |athlete| athlete['Medal'] != 'NA' }
             .group_by { |athlete| athlete['Team'] }
             .to_h { |team, medals| [team, medals.size] }
end

def get_all_gold_medalists(olympic_data)
  return olympic_data.filter { |athlete| athlete['Medal'] == 'Gold' }
end


