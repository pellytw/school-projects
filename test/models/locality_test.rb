require "test_helper"

class LocalityTest < ActiveSupport::TestCase
  test "is valid with name and province" do
    locality = Locality.new(name: "Puerto Deseado", province: "Santa Cruz")

    assert locality.valid?
  end

  test "requires name" do
    locality = Locality.new(province: "Santa Cruz")

    assert_not locality.valid?
    assert_includes locality.errors[:name], "can't be blank"
  end

  test "requires province" do
    locality = Locality.new(name: "Puerto Deseado")

    assert_not locality.valid?
    assert_includes locality.errors[:province], "can't be blank"
  end
end
