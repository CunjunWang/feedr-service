# Instructions

## Get Project Code
1. Download code: `git clone https://github.com/CunjunWang/feedr-service.git`
2. Go to project root: `cd feedr-service`

## Build Project
1. Run `bundle install` to install ruby gems
2. Run `npm install` or `yarn install` to install node dependencies 
3. Change `config/database.yml` with your own database configuration
4. Migrate database changes: `rails db:migrate`
5. Add seed data: `rails db:seed`

## Run Tests
Execute `cucumber features/xxx.feature` and replace `xxx` with certain test name.

## Start Server
1. Run `rails server`
2. Visit `localhost:3000`