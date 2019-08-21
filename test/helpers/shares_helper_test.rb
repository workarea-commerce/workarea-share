require 'test_helper'

module Workarea
  module Storefront
    class SharesHelperTest < ViewTest
      def test_facebook_query_string
        query_string = facebook_query_string('test')
        assert_equal('u=test', query_string)
      end

      def test_twitter_query_string
        query_string = twitter_query_string('foo', 'bar')
        assert_includes(query_string, 'text=bar')
        assert_includes(query_string, 'url=foo')
      end

      def test_share_query_string
        query_string = share_query_string('foo', 'bar', 'baz')
        assert_includes(query_string, 'description=bar')
        assert_includes(query_string, 'media=baz')
        assert_includes(query_string, 'url=foo')

        query_string = share_query_string('foo')
        assert_includes(query_string, 'url=foo')
        refute_includes(query_string, 'description')
        refute_includes(query_string, 'media')
      end
    end
  end
end
