require 'test_helper'

class PersonTest < ActiveSupport::TestCase
  def setup
      @steve = people(:steve)
    end

    test "should save person" do
      assert @steve.valid?
      assert @steve.errors[:first_name].empty?
    end

    test "should not save person without first_name" do
      @steve.first_name = nil
      assert @steve.invalid?
      assert_not @steve.errors[:first_name].empty?
    end
end
