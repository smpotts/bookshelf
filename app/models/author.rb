class Author < ApplicationRecord

  def coordinates
    [rand(90), rand(90)]
  end

  def publication_years
    (1...rand(10)).to_a.map{ 1900 + rand(120) }
  end

  validation :last_name, presence: true
end
