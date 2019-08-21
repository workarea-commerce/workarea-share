module Workarea
  class Storefront::ShareViewModel < ApplicationViewModel
    def to
      if to_name.present?
        "#{to_name} <#{to_email}>"
      else
        to_email
      end
    end

    def from
      if from_name.present?
        "#{from_name} <#{from_email}>"
      else
        from_email
      end
    end

    def from_name
      model.from_name || options[:user].try(:name)
    end

    def from_email
      model.from_email || options[:user].try(:email)
    end

    def friendly_from
      if from_name.blank?
        from_email
      else
        from_name
      end
    end

    def friendly_to
      if to_name.present?
        "#{to_name} (#{to_email})"
      else
        to_email
      end
    end
  end
end
