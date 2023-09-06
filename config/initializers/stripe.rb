require_relative 'stripe_checkout_session_service'

Rails.configuration.stripe = {
  publishable_key: ENV['STRIPE_PUBLISHABLE_KEY'],
  secret_key:      ENV['STRIPE_SECRET_KEY'],
  signing_secret:  ENV['STRIPE_WEBHOOK_SECRET_KEY']
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]
StripeEvent.signing_secret = Rails.configuration.stripe[:signing_secret]

StripeEvent.configure do |events|
  events.subscribe 'checkout.session.completed', StripeCheckoutSessionService.new
end


# set :port, 4242

# post '/webhook' do
#     payload = request.body.read
#     sig_header = request.env['HTTP_STRIPE_SIGNATURE']
#     event = nil

#     begin
#         event = Stripe::Webhook.construct_event(
#             payload, sig_header, endpoint_secret
#         )
#     rescue JSON::ParserError => e
#         # Invalid payload
#         status 400
#         return
#     rescue Stripe::SignatureVerificationError => e
#         # Invalid signature
#         status 400
#         return
#     end

#     # Handle the event
#     puts "Unhandled event type: #{event.type}"

#     status 200
