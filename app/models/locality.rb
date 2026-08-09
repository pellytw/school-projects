class Locality < ApplicationRecord
  has_many :schools, dependent: :destroy

  validates :name, :province, presence: true

  def display_name
    "#{name}, #{province}"
  end
end
