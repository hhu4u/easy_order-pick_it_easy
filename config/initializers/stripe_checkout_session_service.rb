class StripeCheckoutSessionService
  def call(event)
    current_basket = Basket.find_by(checkout_session_id: event.data.object.id)
    current_basket.update(payment_status: 'paid')
    current_basket.update(basket_status: 'closed')

    new_basket = Basket.new(basket_status: 'New')
    user = User.first
    new_basket.table = current_basket.table
    new_basket.user = user
    new_basket.save!
  end
end
