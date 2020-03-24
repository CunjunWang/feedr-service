import {checkout_order} from "./stripe";

const place_btn = document.getElementById('place-order');

if (place_btn !== null && place_btn !== undefined) {
    place_btn.addEventListener('click', e => {
        e.target.textContent = 'Processing...';
        const {truck} = e.target.dataset;
        console.log(`truck id ${truck}`);
        checkout_order(truck);
    });
}
