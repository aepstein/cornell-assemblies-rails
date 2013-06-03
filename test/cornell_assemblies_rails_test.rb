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

  test "listify" do
    assert_equal '', [].listify
    assert_equal 'a', %w( a ).listify
    assert_equal 'a and b', %w( a b ).listify
    assert_equal 'a or b', %w( a b ).listify(joiner: 'or')
    assert_equal 'a, b, and c', %w( a b c ).listify
    assert_equal 'a; b; or c', %w( a b c ).listify(separator: ';', joiner: 'or')
  end

  test 'to_roman' do
    assert_equal 'I', 1.to_roman
  end

  test 'to_i_from_roman' do
    assert_equal 1, 'I'.to_i_from_roman
    assert_equal 1, 'i'.to_i_from_roman
  end

  test 'floor' do
    # Time is 10:44:24
    t = Time.at 1360165464
    assert_equal t.sec, 24
    assert_equal t.floor.sec, 0
    assert_equal t.floor.min, 44
  end

  test 'ceil' do
    # Time is 10:44:24
    t = Time.at 1360165464
    assert_equal t.sec, 24
    assert_equal t.ceil.sec, 0
    assert_equal t.ceil.min, 45
  end
end

