require 'test_helper'

class CornellAssembliesRailsTest < ActiveSupport::TestCase
  test "truth" do
    assert_kind_of Module, CornellAssembliesRails
  end

  test "currencify" do
    assert_equal "$1,000.05", 1000.05.currencify
  end

  test "to_phone" do
    assert_equal '(607) 555-1212', '5551212'.to_phone( :pretty )
    assert_equal '607.555.1212', '5551212'.to_phone( :dotty )
    assert_equal '6075551212', '5551212'.to_phone( :normal )
    assert_equal '(518) 555-1212', '5185551212'.to_phone( :pretty )
    assert_equal '518.555.1212', '5185551212'.to_phone( :dotty )
    assert_equal '5/8847', '5/8847'.to_phone
    assert_equal '555 1212', '555 1212'.to_phone
  end
end

