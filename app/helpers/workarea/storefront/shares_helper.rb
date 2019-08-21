module Workarea
  module Storefront
    module SharesHelper
      def share_product_url(product, options = {})
        product_url(product, options.merge(host: Workarea.config.host))
      end

      def facebook_query_string(url)
        hash_without_blanks_to_query(u: url)
      end

      def twitter_query_string(url, message = nil)
        hash_without_blanks_to_query(url: url, text: message)
      end

      def share_query_string(url, message = nil, image = nil)
        hash_without_blanks_to_query(
          url: url,
          description: message,
          media: image
        )
      end

      def share_analytics_data(type, url)
        {
          event: 'share',
          domEvent: 'click',
          payload: { type: type, url: url }
        }
      end

      private

      def hash_without_blanks_to_query(hash)
        hash.delete_if { |_k, v| v.blank? }.to_query
      end
    end
  end
end
