# frozen_string_literal: true

require "csv"
require 'pry'

CSV.foreach('airports_lists.csv') do |row|
  next if row[0] == '_key'

  airport = {
    icao:     row[1] || 'default',
    iata:     row[2] || 'default',
    name:     row[3] || 'default',
    location: row[4] || 'default',
    country:  row[6] || 'default',
    timezone: row[10] || 'default',
    hub:      0,
    lat:      row[8] || 'default',
    lon:      row[9] || 'default',
  }

  CSV.open('airports.csv', 'a') do |csv|
    csv << airport.values
  end
end
