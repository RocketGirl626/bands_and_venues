Author Name: Jeanette Fairless
Program Name: Bands and Venues

Description:  The Bands and Venues Applications fulfills the following user stories:

As a user, I want to be able to add, update, delete and list bands. COMPLETE

As a user, I want to be able to add venues (don't worry about updating, listing or destroying venues). COMPLETE

As a user, I want to be able to add venues to a band to show where they have played (possibly with checkboxes).  LIMITATION:  Can only add existing bands.

As a user, I want to be able to see all of the venues a band has played on the individual band page. COMPLETE

As a user, I want band names and venues to be saved with a capital letter no matter how I enter them. NOT WORKING

As a user, I do not want bands and venues to be saved if I enter a blank name. COMPLETE on the band name on index.erb.

Schema:

create_table "bands", force: :cascade do |t|
    t.string   "band_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bands_venues", id: false, force: :cascade do |t|
    t.integer "band_id"
    t.integer "venue_id"
  end

  add_index "bands_venues", ["band_id"], name: "index_bands_venues_on_band_id", using: :btree
  add_index "bands_venues", ["venue_id"], name: "index_bands_venues_on_venue_id", using: :btree

  create_table "venues", force: :cascade do |t|
    t.string   "venue_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

Set-up Instructions: use the following Gemfile:

gem("sinatra")
gem("sinatra-contrib", :require => "sinatra/reloader")
gem("sinatra-activerecord")
gem("rake")
gem("pg")
gem("pry")

group(:test) do
  gem("rspec")
  gem("shoulda-matchers")
  gem("launchy")
end

Known Issues:

As noted above under Description.

Integration spec will not load require('capybara/rspec') so it will not run.  I
worked an hour trying to figure that out, but no luck.

MIT License.  Copyright 2015 Jeanette Fairless
