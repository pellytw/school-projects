class School < ApplicationRecord
  belongs_to :locality
  has_many :projects, dependent: :destroy

  LEVELS = {
    initial: "Inicial",
    primary: "Primaria",
    secondary: "Secundaria",
    tertiary: "Terciaria",
    multiple: "Multiple"
  }.freeze

  enum :level, LEVELS.keys.index_with(&:to_s)

  validates :name, :level, :locality, presence: true

  def display_name
    [ name, code.presence ].compact.join(" - ")
  end
end
