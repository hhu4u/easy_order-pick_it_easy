class StripeCheckoutSessionService
  def call(event)
    basket = Basket.find_by(checkout_session_id: event.data.object.id)
    basket.update(payment_status: 'paid')
  end
end
