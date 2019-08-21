module Workarea
  module Storefront
    class SharesController < Storefront::ApplicationController
      before_action :find_share

      def new
      end

      def create
        if verify_recaptcha(model: @share, env: Rails.env) && @share.save
          flash[:success] = t(
            'workarea.storefront.flash_messages.share_message_sent',
            recipient: @share.friendly_to
          )
          ShareMailer.share(@share.id.to_s).deliver_later
          redirect_to @share.url
        else
          render :new
        end
      end

      private

      def find_share
        model = Email::Share.new(share_params)
        @share = ShareViewModel.wrap(model, view_model_options)
      end

      def share_params
        params.permit(
          :url,
          :title,
          :to_email,
          :to_name,
          :from_email,
          :from_name,
          :message
        )
      end
    end
  end
end
