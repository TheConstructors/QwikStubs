Rails.configuration.stripe = {
  :publishable_key => ENV['STRIPE_TEST_PUBLIC_KEY'],
  :secret_key      => ENV['STRIPE_TEST_API_KEY']
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]