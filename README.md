# README
TO SEE TABLES, ` open active_designer/index.html` in terminal



This README would normally document whatever steps are necessary to get the
application up and running.

* Questions:
1. spec/athletes/index_spec.rb it block line 13/29. Can I override 13 or simply comment out? 

2. do I need to model test self.college_athlete? 

3. US 16.  For model method gym_athletes_sorted, do I make and write in gym_athlete_spec.rb  or do I nest it spec/models/gym/athlete/index_spec.rb

4. line 16b of spec/models/gym_athlete_spec.rb
Am I supposed to use `appear_before` or have it as is

* Must go back to
  - boolean in show and index_spec for updating form (show: 54, 18)
  index: 44, 56
  gym_athlete index_spec: 54

* Refactor wish list
  - If statement in view for model boolean method US3
  - US6 appear before.  Is this correct? It seems to know when it's created as to how it's ordered in my `before` block, not necessarily `created_at`
  - app/models/athlete.rb describe instance and class method blocks


Things you may want to cover:

* Ruby version
  ruby 3.2.2

* System dependencies
  
* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
