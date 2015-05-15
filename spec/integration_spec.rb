ENV["RACK_ENV"] = "test"

require('spec_helper')
require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('listing all the bands', {type => :feature}) do
  it('returns all existing bands') do
    visit('/')
    expect(page).to have_content('The Beatles')
  end
end

describe('adding a new band', {:type => :feature}) do
  it('adds a new band') do
    visit('/')
    fill_in('band_name', :with => 'The Beatles')
    click_button('Add Band')
    expect(page).to have_content('The Beatles')
  end
end

describe('add a venue', {:type => :feature}) do
  it('will add a venue and display it') do
    visit('/')
    fill_in('venue_name', :with => 'The Hollywood Bowl')
    click_button('Add Venue')
    expect(page).to have_content('The Hollywood Bowl')
  end
end

describe('list a bands venues', {:type => :feature}) do
  it('will add an existing venue to a band and list bands venues') do
    test_venue = Venue.create({:venue_name => 'The Hollywood Bowl'})
    @id = test_venue.id()
    visit('/band/:id')
    fill_in('venue_name', :with => 'The Hollywood Bowl')
    click_button('Add Venue')
    expect(page).to have_content('The Hollywood Bowl')
  end
end
