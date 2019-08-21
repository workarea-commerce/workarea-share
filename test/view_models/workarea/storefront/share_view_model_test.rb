require 'test_helper'

module Workarea
  module Storefront
    class ShareViewModelTest < TestCase
      def share
        @share ||= Email::Share.new
      end

      def test_to
        view_model = ShareViewModel.new(share)

        share.to_email = 'bcrouse@workarea.com'
        assert_equal('bcrouse@workarea.com', view_model.to)

        share.to_name = 'Ben Crouse'
        assert_equal('Ben Crouse <bcrouse@workarea.com>', view_model.to)
      end

      def test_from
        view_model = ShareViewModel.new(share)

        share.from_email = 'bcrouse@workarea.com'
        assert_equal('bcrouse@workarea.com', view_model.from)

        share.from_name = 'Ben Crouse'
        assert_equal('Ben Crouse <bcrouse@workarea.com>', view_model.from)
      end

      def test_from_name
        user = create_user
        view_model = ShareViewModel.new(share, user: user)

        assert_equal(user.name, view_model.from_name)
      end

      def test_from_email
        user = create_user
        view_model = ShareViewModel.new(share, user: user)

        assert_equal(user.email, view_model.from_email)
      end

      def test_friendly_from
        view_model = ShareViewModel.new(share)

        share.from_email = 'bcrouse@workarea.com'
        assert_equal('bcrouse@workarea.com', view_model.friendly_from)

        share.from_name = 'Ben Crouse'
        assert_equal('Ben Crouse', view_model.friendly_from)
      end

      def test_friendly_to
        view_model = ShareViewModel.new(share)

        share.to_email = 'bcrouse@workarea.com'
        assert_equal('bcrouse@workarea.com', view_model.friendly_to)

        share.to_name = 'Ben Crouse'
        assert_equal('Ben Crouse (bcrouse@workarea.com)', view_model.friendly_to)
      end
    end
  end
end
