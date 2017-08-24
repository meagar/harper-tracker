require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase
  test "#rounded_time" do
    cases = {
      '12:30' => '12:30',
      '10:20' => '10:15',
      '10:02' => '10:00',
      '3:50' => '3:45',
      '3:43' => '3:45',
    }

    cases.each do |input, expected|
      assert_equal(expected, rounded_time(Time.parse(input)), "Rounds #{input}")
    end
  end
end
