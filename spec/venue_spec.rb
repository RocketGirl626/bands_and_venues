require('spec_helper')

describe(Venue) do
  describe('#venue_name') do
    it('returns the name of the venue') do
      test_venue = Venue.create({:venue_name => 'Hollywood Bowl'})
      expect(test_venue.venue_name()).to(eq('Hollywood Bowl'))
    end
  end


end
