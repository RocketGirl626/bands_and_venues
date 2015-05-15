require("bundler/setup")
Bundler.require(:default)
require('pry')


Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get('/') do
  @bands = Band.all()
  @venues = Venue.all()
  erb(:index)
end

post('/band_add/') do
  @band_name = params.fetch('band_name')
  @band = Band.create({:band_name => @band_name})
  @venues = Venue.all()
  @bands = Band.all()
  erb(:index)
end

post('/venue_add/') do
  @venue_name = params.fetch('venue_name')
  Venue.create({:venue_name => @venue_name})
  @venues = Venue.all()
  @bands = Band.all()
  erb(:index)
end

get('/band/:id') do
  @band = Band.find(params.fetch('id'))
  @venues = Venue.all()
  erb(:band)
end

post('/band_venue_cat_add/') do
  venue_name = params.fetch('venue_name')
  # new_category = Category.create({:cat_name => cat_name})
  venue = Venue.find_by({:venue_name => venue_name})
  band_id = params.fetch('band_id')
  band = Band.find(band_id)
  band.venues.push(venue)
  @band = band
  erb(:band)
end
