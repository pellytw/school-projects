require "test_helper"

class SchoolTest < ActiveSupport::TestCase
  test "is valid with name level and locality" do
    school = School.new(
      name: "Escuela de Prueba",
      level: :primary,
      locality: localities(:one)
    )

    assert school.valid?
  end

  test "requires name" do
    school = School.new(level: :primary, locality: localities(:one))

    assert_not school.valid?
    assert_includes school.errors[:name], "can't be blank"
  end

  test "requires level" do
    school = School.new(name: "Escuela de Prueba", locality: localities(:one))

    assert_not school.valid?
    assert_includes school.errors[:level], "can't be blank"
  end

  test "belongs to a locality" do
    assert_equal localities(:one), schools(:one).locality
  end
end
