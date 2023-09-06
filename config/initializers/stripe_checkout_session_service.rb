class StripeCheckoutSessionService
  def call(event)
    basket = Basket.find_by(checkout_session_id: event.data.object.id)
    basket.update(payment_status: 'paid')
    # current_basket.update(basket_status: 'closed')

    # new_basket = Basket.new
    # user = current_user
    # new_basket.table = current_basket.table
    # new_basket.user = user
    # new_basket.save!
  end
end
