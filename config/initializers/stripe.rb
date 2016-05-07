require 'stripe'

Rails.configuration.stripe = {
  :publishable_key => ENV['pk_test_XLmikmfqg5QQOJAEIO2u5qSZ'],
  :secret_key      => ENV[' sk_test_gV4VQA5Pfil8208XXPkSulC2 ']
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]