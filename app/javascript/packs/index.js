import {checkout_order, pay_order} from "./stripe";

const place_btn = document.getElementById('place-order');
const pay_btn = document.getElementById('pay-order');

if (place_btn !== null && place_btn !== undefined) {
    place_btn.addEventListener('click', e => {
        e.target.textContent = 'Processing...';
        const {truck} = e.target.dataset;
        console.log(`truck id ${truck}`);
        checkout_order(truck);
    });
}

if (pay_btn !== null && pay_btn !== undefined) {
    pay_btn.addEventListener('click', e => {
        e.target.textContent = 'Processing...';
        const {order} = e.target.dataset;
        pay_order(order);
    });
}
