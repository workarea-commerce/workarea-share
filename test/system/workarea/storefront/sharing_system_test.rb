require 'test_helper'

module Workarea
  module Storefront
    class SharingSystemTest < Workarea::SystemTest
      include Storefront::SystemTest

      def test_sharing_through_email
        from_email = 'bcrouse@workarea.com'
        to_name = 'Ben Crouse'
        to_email = 'bcrouse-friend@workarea.com'

        product = create_product(
          name: 'Integration Product',
          variants: [{ sku: 'SKU1', regular: 10.to_m }]
        )

        visit storefront.product_path(product)
        click_link 'Share by Email'

        fill_in 'to_name', with: to_name
        fill_in 'to_email', with: to_email
        fill_in 'from_email', with: from_email
        fill_in 'message', with: 'test message'
        click_button 'email_friend'

        assert(page.has_content?("Thanks for sharing! An email has been sent to #{to_name} (#{to_email})."))
      end

      def test_announcing_share_event
        product = create_product
        visit storefront.product_path(product)

        find(%{[title="#{t('workarea.storefront.shares.share_on_twitter')}"]}).click

        events =
          page.evaluate_script('WORKAREA.analytics.events')
              .select { |e| e['name'] == 'share' }

        assert_equal(1, events.count)
        payload = events.first['arguments'].first

        assert_equal('twitter', payload['type'])
        assert_match('http://', payload['url'])
        assert_match(storefront.product_path(product), payload['url'])
      end
    end
  end
end
