require 'test_helper'

module Workarea
  module Storefront
    class SharingIntegrationTest < Workarea::IntegrationTest
      def test_sends_a_sharing_email
        from_email = 'bcrouse@workarea.com'
        to_email = 'bcrouse-friend@workarea.com'

        product = create_product(
          name: 'Integration Product',
          variants: [{ sku: 'SKU1', regular: 10.to_m }]
        )

        post storefront.shares_path(product),
             params: {
               url: storefront.product_url(product, host: Workarea.config.host),
               title: product.name,
               to_email: to_email,
               from_email: from_email,
               message: 'test message'
             }

        assert_redirected_to(storefront.product_path(product))

        email = ActionMailer::Base.deliveries.last

        email.parts.each do |part|
          assert_includes(part.body, product.name)
          assert_includes(part.body, 'test message')
          assert_includes(part.body, storefront.product_url(product))
        end

        assert_includes(email.to, to_email)
        assert_match(email.from.first, Workarea.config.email_from)
        assert_includes(email.reply_to, from_email)
      end
    end
  end
end
