module PaymentHelper
  require 'stripe'
  Stripe.api_key = 'sk_test_w9JbfI2uWL6PDdF0ZFMX7qqB00owECyrIb'

  def create_session(truck, user, order)
    logger.info "request url: #{request.original_url}"
    host = 'localhost:3000'

    Stripe::Checkout::Session.create(
        {
            payment_method_types: ['card'],
            success_url: "http://#{host}/orders/complete/#{order.order_no}?session_id={CHECKOUT_SESSION_ID}",
            cancel_url: "http://#{host}/orders/my",
            customer_email: user.email,
            client_reference_id: order.order_no,
            line_items: [
                {
                    name: "Food order to #{truck.Name}",
                    description: truck.Description,
                    amount: (order.order_subtotal * 100).to_i,
                    currency: 'usd',
                    quantity: 1
                }
            ]
        })
  end
end
