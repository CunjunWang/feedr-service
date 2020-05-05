# Feedr

Course project for Columbia University COMS 4156 - Advanced Software Engineering, 2020 Spring.

## Team Members
- [Cunjun Wang](https://github.com/CunjunWang) (UNI: cw3199)
- [Jiefan Li](https://github.com/Jason003) (UNI: jl5501)
- [Jierui Liu](https://github.com/Willincia1124) (UNI: jl5490)



## Motivation
The purpose of our product is that many students and company staffs choose food trucks because 
they are much cheaper and they also provide delicious foods. However, all popular food application 
in the market, like Yelp and Uber Eats, focus on restaurants only, and there is no platform of 
searching, ordering and rating for food trucks. 

We design and build such an integrated application to communicate customers and truck owners.
Customers can order, pay and pick up to avoid lining up. Truck owners get more orders and make 
more money.

We plan to make revenue by claiming a small percentage of service fee for every order. We will 
also hold some promotion events on a regular basis, like distributing discount coupons to attract 
more customers. Finally, advertisement is also an important measure to make profits.



## Technical Stacks
- **Back-end:** Ruby on Rails
- **Template:** Erb
- **Front-end:** Javascript + CSS
- **Database:** PostgreSQL
- **Application Cache:** Redis
- **Deploy:** Heroku



## RESTful APIs
The front-end and back-end of this project is not separated, so we do not expose any API.
Our internal API design abide by the RESTful style, includes:

| HTTP Method | URI | Description |
| --- | --- | --- |
| `GET` | `/` | Visit home page |
| `POST` | `/` | Search trucks on home page|
| `GET` | `/login` | Visit Login page |
| `GET` | `/signup` | Visit Signup page |
| `POST` | `/login` | Login to the application |
| `GET` | `/logout` | Logout the application | 
| `GET` | `/orders/my` | Show my orders |
| `GET` | `/orders/detail/#order_no` | Show details of a order |
| `GET` | `/orders/checkout` | Go to Checkout page |
| `POST` | `/orders/create` | Place an order |
| `POST` | `/orders/update/#order_no` | Update an order |
| `POST` | `/orders/pay` | Pay an order |
| `GET` | `/#foodtruck/#item/add` | Add an item to cart |
| `GET` | `/#foodtruck/#item/remove` | Remove an item from cart |
| `GET` | `/foodtrucks/#foodtruck/toggle` | Toggle truck open status |



## Project Timeline
| Iteration | Date | Milestones |
| --- | --- | --- |
| Iteration 1 | Feb 11th - Mar 6th, 2020 | [Milestones](#iteration-one) |
| Iteration 2 | Feb 6th - Apr 3rd, 2020 | [Milestones](#iteration-two) |
| Iteration 3 | Apr 3rd - Apr 24th, 2020 | [Milestones](#final-iteration) |
| Presentation | Apr 28th, 2020 | / |
| Final Submission | May 11th, 2020 | / |

### Iteration One
Release Date: 2020/03/06

#### 1. Milestones
We have supported the basic control flow of the whole business cycle in iteration one.

    - Signup
    - Login
    - User profile
    - Search food truck
    - CRUD of a food truck
    - CRUD of menu items of a food truck
    - Checkout and place an order
    - Update the order status

#### 2. Compile and Run
- Go to the `feedr-service` root directory: `cd feedr-service`
- Migrate database `rails db:migrate`
- Start the server `rails server`

#### 3. Run the tests
- Go to the root directory `cd feedr-service`
- Run the feature test `cucumber features/xxx.feature` 

#### 4. Comments
For the `checkout and place order` feature, now we made use of the session in the implementation, 
but the Cucumber and Capybara do not support the operation of session, so we cannot write acceptance 
tests on this feature. One potential alternative is Redis, and we will have more discussion in the 
next iteration.

### Iteration Two
Release Date: 2020/04/03

#### 1. Milestones
Most of key features were implemented and tested in iteration one. In this iteration, we just integrated some third party APIs
 to make our functionality more robust. We also changed part of the front-end code to make the application looks better. 

    - Users can now edit profile.
    - Switched to Redis, instead of using session, for cart.
    - Implemented Payment flow with Stripe API.
    - Made the app looks better by adding icons and modifying CSS.
    - Added some check functions to make application robust.

#### 2. Comments
We left some last considerations for the final iteration, includes:

    - Pagination for queries, such as searching for trucks, searching for my orders.
    - Google map integration on truck page.
    - Make the app looks better.
       
### Final Iteration
Release Date: 2020/04/24

#### 1. Milestones
In the final iteration, we fixed some minor bugs and added following new features:

    - Integrated Google map on truck detail page, and uses know where the truck is before placing order.
    - Designed a new UI.

#### 2. Further Considerations
There are many aspects of improvements to make this project more mature and user-friendly, here are what 
we have now:
    
    - Pagination for queries results, such as searching for trucks, searching for my orders.
    - We can implement a rating and comment system for users to get more information about the food trucks.
    - We can integrate more third party OAuth to enable users login with their social account.
    - A like system, user can add trucks to favourite lists.
    - A membership system for promotions activities and coupons.
    - ...

Due to the time limit and workload from other courses, we are not able to implement these great features 
during this term, but since we have those ideas, we are pleased to make them come true in thr future.



## Agile Workflow

    - Form and refine our idea of creating the food-truck service line
    - List the modules of this project and basic workflow, functionalities of the application
    - Assign different roles to each group member based on modules and functionalities
    - Create goals for each iterations and assign dates to the deadline of each iteration
    - Arrange group meetings on a bi-weekly basis to exchange ideas, report progress and incorporate our codes
    - Write Cucumber user-stories and tests to test our workflow and functionality
    - After each iteration, check our iteration goals and modify future iteration goals based on our progress


## Lessons Learned
