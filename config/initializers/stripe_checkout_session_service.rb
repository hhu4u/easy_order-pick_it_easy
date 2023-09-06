class StripeCheckoutSessionService
  def call(event)
    raise
    basket = Basket.find_by(checkout_session_id: event.data.object.id)
    basket.update(payment_status: 'paid')

    puts "---------------------------------------------------------------"
    puts "payment updated"
  end
end
