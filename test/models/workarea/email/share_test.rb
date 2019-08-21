require 'test_helper'

module Workarea
  module Email
    class ShareTest < TestCase
      def url
        @url ||= 'http://www.reddit.com/r/ruby?q=a'
      end

      def path
        @path ||= '/r/ruby?q=a'
      end

      def test_initialize
        share = Email::Share.new(url: url)
        assert_equal(path, share.url)
      end

      def test_valid
        share = Email::Share.new
        share.url = url
        share.valid?

        assert_equal(path, share.url)
      end
    end
  end
end
