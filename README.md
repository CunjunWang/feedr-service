# Feedr
Course project for Columbia University COMS 4156 - Advanced Software Engineering, 2020 Spring.

## Team Members
- [Cunjun Wang](https://github.com/CunjunWang) (UNI: cw3199)
- [Jiefan Li](https://github.com/Jason003) (UNI: jl5501)
- [Jierui Liu](https://github.com/Willincia1124) (UNI: jl5490)

## Iteration One
Release Date: 2020/03/06
### 1. Background
We have supported the basic control flow of the whole business cycle in iteration one.

    - Signup
    - Login
    - User profile
    - Search food truck
    - CRUD of a food truck
    - CRUD of menu items of a food truck
    - Checkout and place an order
    - Update the order status

### 2. Compile and Run
- Go to the `feedr-service` root directory: `cd feedr-service`
- Migrate database `rails db:migrate`
- Start the server `rails server`

### 3. Run the tests
- Go to the root directory `cd feedr-service`
- Run the feature test `cucumber features/xxx.feature` 

### 4. Comments
For the `checkout and place order` feature, now we made use of the session in the implementation,
 but the Cucumber and Capybara do not support the operation of session, so we cannot write acceptance
 tests on this feature. One potential alternative is Redis, and we will have more discussion on the 
 next iteration.

## Iteration Two
Release Date: 2020/04/03
### 1. Background
Most of key features were implemented and tested in iteration one. In this iteration, we just integrated some third party APIs
 to make our functionality more robust. We also changed part of the front-end code to make the application looks better. 

    - Users can now edit profile.
    - Switched to Redis, instead of using session, for cart.
    - Implemented Payment flow with Stripe API.
    - Made the app looks better by adding icons and modifying CSS.
    - Added some check functions to make application robust.

### 2. Compile and Run & Run the tests
- All steps are the same as those for iteration 1.

### 3. Comments
We left some last considerations for the final iteration, includes:

    - Pagination for queries, such as searching for trucks, searching for my orders.
    - Google map integration.
    - Make the app looks better.