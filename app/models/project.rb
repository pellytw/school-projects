class Project < ApplicationRecord
  belongs_to :school

  CATEGORIES = {
    science: "Ciencias",
    arts: "Arte",
    technology: "Tecnologia",
    environment: "Ambiente",
    sports: "Deportes",
    reading: "Lectura",
    institutional: "Institucional",
    other: "Otro"
  }.freeze

  STATUSES = {
    draft: "Borrador",
    active: "Activo",
    completed: "Finalizado",
    cancelled: "Cancelado"
  }.freeze

  enum :category, CATEGORIES.keys.index_with(&:to_s)
  enum :status, STATUSES.keys.index_with(&:to_s)

  validates :title, :category, :status, :school, presence: true
  validate :ends_on_after_starts_on

  private

  def ends_on_after_starts_on
    return if starts_on.blank? || ends_on.blank?

    errors.add(:ends_on, "no puede ser anterior a la fecha de inicio") if ends_on < starts_on
  end
end
