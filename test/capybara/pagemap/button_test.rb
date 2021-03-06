# frozen_string_literal: true

require 'test_helper'

class DummyButton
  include Capybara::Pagemap
  define_button :submit, '//*[@id="user_submit"]'
  define_button :cancel, '//*[@id="user_cancel"]'

  def page
    PageMock.new
  end
end

module Capybara
  module Pagemap
    class ButonTest < Minitest::Test
      def subject
        @subject ||= DummyButton.new
      end

      def test_respond_to
        assert subject.respond_to?(:submit_button)
        assert subject.respond_to?(:cancel_button)
      end

      def test_input
        refute_nil subject.submit_button
        refute_nil subject.cancel_button
      end

      def test_valid
        assert subject.valid?
      end
    end
  end
end
