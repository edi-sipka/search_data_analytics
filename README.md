<p align="center">
  <h1 align="center"> SimpleSearch App
 </h1>
  
<br>


## What is SimpleSearch App?
SimpleSearch is a web application built using Ruby on Rails framework that allows users to search for articles. The app features a clean and user-friendly interface with a prominent search bar in the header where users can input their search queries.

 <hr>

 ## Key Features

- Real-time search box with instant results for efficient and user-friendly searching.
- Analytics on the most searched articles, providing valuable insights into popular topics and trends.
- List of most popular articles for easy discovery of top-rated content
- User identification based on IP address for secure and personalized experience.
- Responsive design for mobile, tablet, and desktop devices.
- Tested using Rspec, ensuring reliable performance and quality assurance.

 ## Saving examples:
 User searches:
 -  What
 - What is a 
 - What is a good car?

 Search engine only records: What is a good car?
 
 <hr>

<br>

## 🚀 Live Version <a name="live-demo"></a>

- [SimpleSearch App]()

<br>

## Getting Started

This section provides a start guide.

Application was build in [Rails](https://rubyonrails.org/) application.

### Prerequisites

- [Ruby](https://www.ruby-lang.org/en/): Recommended using 3.2.1 version.

- [Rails](https://yarnpkg.com/): Recommended using 7.0.4.3 version.

- [PostgreSQL](https://www.postgresql.org/) 12.14 or higher.

### Gems
- [Turbo Rails](https://github.com/hotwired/turbo-rails)
- [Fuzzy String Match](https://github.com/kiyoka/fuzzy-string-match) 
- [RSpec Rails](https://github.com/rspec/rspec-rails) 

### Installation Documentation

To get a local copy up and running follow these simple steps:

- Copy this link `https://github.com/edi-sipka/search_data_analytics`. 
- Get the directory that you want to clone the repository.
- Open the command prompt in this directory.
- Write git clone `https://github.com/edi-sipka/search_data_analytics`.
- Go to the repository folder in your command prompt
- First run `bundle install` to install all required gems. 
- If your ruby version is below 3.2.1, you should navigate to .rbenv file and change ruby version.
- Check your PostgreSQL version and configure it on config/database.yml file.
- Run `rails db:create` followed by `rails db:migrate` and `rails db:seed` to set up the database
- Run `rails s` to start the server.
- Run `rspec` to run tests

<hr>

<p align="center">
  <strong>SimpleSearch App</strong> 
</p>