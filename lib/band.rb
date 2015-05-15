class Band < ActiveRecord::Base
  has_and_belongs_to_many(:venues)
  validates(:band_name, :presence => true)
  before_save(:upcase_letter)

  define_method(:upcase_letter) do
    band_name = self.band_name()
    band_name.split.map(&:capitalize).join(' ')
    band_name
  end
end
