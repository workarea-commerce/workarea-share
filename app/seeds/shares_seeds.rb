module Workarea
  class SharesSeeds
    def perform
      puts 'Adding email shares...'

      product = Catalog::Product.sample

      Email::Share.create!(
        to_name: Faker::Name.name,
        to_email: Faker::Internet.email,
        from_name: Faker::Name.name,
        from_email: Faker::Internet.email,
        message: Faker::Lorem.sentence,
        title: product.name,
        url: "/products/#{product.to_param}"
      )

      puts 'Adding content emails for product sharing...'
      Content::Email.create!(type: 'share', content: "You've Got a Message!")
    end
  end
end
