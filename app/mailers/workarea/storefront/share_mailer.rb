module Workarea
  module Storefront
    class ShareMailer < ApplicationMailer
      def share(id)
        @share = ShareViewModel.wrap(Email::Share.find(id))
        @content = Content::Email.find_content('share')

        mail(
          to: @share.to,
          from: Workarea.config.email_from,
          reply_to: @share.from,
          subject: t('workarea.storefront.email.share.subject', from: @share.friendly_from)
        )
      end
    end
  end
end
