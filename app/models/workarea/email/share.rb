module Workarea
  class Email::Share
    include ApplicationDocument

    field :to_name, type: String
    field :to_email, type: String
    field :from_name, type: String
    field :from_email, type: String
    field :message, type: String
    field :title, type: String
    field :url, type: String

    validates :to_email, presence: true, email: true
    validates :from_email, presence: true, email: true
    validates :message, length: {
      maximum: :max_email_share_message_length
    }
    validates :url, presence: true

    after_initialize :sanitize_url
    before_validation :sanitize_url

    private

    def max_email_share_message_length
      Workarea.config.max_email_share_message_length
    end

    def uri
      URI.parse(url)
    end

    def sanitize_url
      return unless url.present?
      self.url =
        if uri.query.present?
          [uri.path, uri.query].join('?')
        else
          uri.path
        end
    end
  end
end
