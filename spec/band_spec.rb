require('spec_helper')

describe(Band) do
  describe('#band_name') do
    it('returns the name of the band') do
      test_band = Band.create({:band_name => 'The Beatles'})
      expect(test_band.band_name()).to(eq('The Beatles'))
    end
  end

  it("validates presence of the name of the band") do
    test_band = Band.new({:band_name => ""})
    expect(test_band.save()).to(eq(false))
  end

  it("converts the first letter of each word in the band name to uppercase") do
    test_band = Band.create({:band_name => 'the beatles'})
    expect(test_band.band_name()).to(eq('The Beatles'))
  end
end
