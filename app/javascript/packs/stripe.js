import axios from 'axios';

const stripe = Stripe('pk_test_w2RGbhWJUcStaoJEsfGWGM7a00mWYiwtlZ');

export const checkout_order = async (truckId) => {
    try {
        // 1. get the session from the server
        const data = {truckId};
        console.log(`data: ${data}`);
        const session = await axios.post(`/orders/create`, data);
        console.log(`session: ${JSON.stringify(session)}`);

        // 2. create checkout form + charge the credit card
        await stripe.redirectToCheckout({sessionId: session.data.session.id});
    } catch (err) {
        console.log(err);
    }
};
