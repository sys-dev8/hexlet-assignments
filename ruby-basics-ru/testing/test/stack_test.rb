# frozen_string_literal: true

require_relative 'test_helper'
require_relative '../lib/stack'

class StackTest < Minitest::Test
  # BEGIN
  def setup
    @stack = Stack.new
  end
  def test_if_empty_stack
    @stack.to_a
    @stack.empty?
    @stack.size
    assert @stack.empty?
    assert(@stack.size == 0)
  end

  def test_if_add_element
    @stack.push! 'ruby'
    @stack.push! 'php'
    @stack.push! 'java'
    @stack.to_a
    assert(@stack.size == 3)
    refute @stack.empty?
  end

  def test_if_delete_element
    @stack.pop!
    @stack.to_a
    assert(@stack.size == 0)
  end

  def test_if_clear_stack
    @stack.clear!
    @stack.to_a
    assert @stack.empty?
  end
end

test_methods = StackTest.new({}).methods.select { |method| method.start_with? 'test_' }
raise 'StackTest has not tests!' if test_methods.empty?
