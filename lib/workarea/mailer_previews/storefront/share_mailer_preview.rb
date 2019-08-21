module Workarea
  module Storefront
    class ShareMailerPreview < ActionMailer::Preview
      def share
        share = Email::Share.first
        ShareMailer.share(share.id)
      end
    end
  end
end
