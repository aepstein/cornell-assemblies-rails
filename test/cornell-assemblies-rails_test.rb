require 'test_helper'

class CornellAssembliesRailsTest < ActiveSupport::TestCase
  test "truth" do
    assert_kind_of Module, CornellAssembliesRails
  end

  test "currencify" do
    assert_equal "$1,000.05", 1000.05.currencify
  end
end

