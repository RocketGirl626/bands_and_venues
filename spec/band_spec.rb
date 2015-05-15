require('spec_helper')

describe(Band) do
  describe('#band_name') do
    it('returns the name of the band') do
      test_band = Band.create({:band_name => 'The Beatles'})
      expect(test_band.band_name()).to(eq('The Beatles'))
    end
  end


end
