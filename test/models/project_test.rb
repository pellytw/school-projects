require "test_helper"

class ProjectTest < ActiveSupport::TestCase
  test "is valid with title category status and school" do
    project = Project.new(
      title: "Feria de ciencias",
      category: :science,
      status: :active,
      school: schools(:one)
    )

    assert project.valid?
  end

  test "requires title" do
    project = Project.new(category: :science, status: :active, school: schools(:one))

    assert_not project.valid?
    assert_includes project.errors[:title], "can't be blank"
  end

  test "belongs to a school" do
    assert_equal schools(:one), projects(:one).school
  end

  test "end date cannot be before start date" do
    project = Project.new(
      title: "Proyecto con fechas",
      category: :science,
      status: :active,
      school: schools(:one),
      starts_on: Date.new(2026, 8, 10),
      ends_on: Date.new(2026, 8, 9)
    )

    assert_not project.valid?
    assert_includes project.errors[:ends_on], "no puede ser anterior a la fecha de inicio"
  end
end
