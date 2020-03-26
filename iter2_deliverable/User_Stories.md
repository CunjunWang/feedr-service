# Detailed User Stories and Operation Steps for Feedr Iteration 2

## User Features
**1. Edit Profile**

After you log in, click `My Dashboard` on top right of home page.

In the dashboard page, the left section is user profile. Click Edit.

Submit the form and your profile should be updated.

## Order Features
**1. Checkout and Place Order**

Pick a food truck on the homepage, click `Show`.

Pick the food you want, click `Add to Order`, or click `Remove from Order` to delete from cart.

Click `Checkout`.

Click `Place Order`.

**2. Payment**

After you click `Place Order`, you should be redirected to Stripe page.

Pay with card `4242 4242 4242 4242` and fill any other required information randomly.

Click `Pay`, and you should be redirected to you order page.

Your order status should be `PREPARING`.

**3. Cancel Payment**

After you click `Place Order`, you should be redirected to Stripe page.

If you click `back` (not the back of browser, but the back of the Stripe page), you should be redirected to your order page, and the order status should be `NOT PAID`.

You should see a button `Pay Order`, and you can pay the order again.