# LinkInTheMiddle

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/link_in_the_middle`. To experiment with that code, run `bin/console` for an interactive prompt.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'link_in_the_middle'
```

And then execute:

  $ bundle install

Or install it yourself as:

  $ gem install link_in_the_middle

## Usage
### Get become user secret token
```ruby
require 'link_in_the_middle/users/become'

data = LinkInTheMiddle::Users::Become.perform(
  email: "email@mail.com"
)
=> "9e2b20fe-8c42-4f26-aac5-75275dcb8615"
```


### Get list of Legal Entities:
```ruby
require 'link_in_the_middle/legal_entities/search'

LinkInTheMiddle::LegalEntities::Search.perform(
  search: "lesaffre int"
)
=> {:records=>[#< id="3" title="Lesaffre International">, #< id="14" title="Lesaffre International Corporation">]}
```

### Get list of Region/BU/Corp functions:
```ruby
require 'link_in_the_middle/business_units/search'

LinkInTheMiddle::BusinessUnits::Search.perform(
  search: "agrauxine"
)
=> {:records=>[#< id="1" title="Agrauxine">]}
```

### Get list of Job Families:
```ruby
require 'link_in_the_middle/job_families/search'

LinkInTheMiddle::JobFamilies::Search.perform(
  search: "communication"
)
=> {:records=>[#< id="1" title="Communication" subJobFamilies=...>]}
```

### Get list of Sub Job Families:
```ruby
require 'link_in_the_middle/sub_job_families/search'

LinkInTheMiddle::SubJobFamilies::Search.perform(
  search: "accounting",
  job_family_id: 1
)
=> {:records=>[#< id="1" title="Accounting" jobFamily=...>]}
```

### Get list of Peso Bandings:
```ruby
require 'link_in_the_middle/peso_bandings/list'

LinkInTheMiddle::PesoBandings::List.perform
=> {:records=>[#< banding="A" subBandings=...>, #< banding="B" subBandings=...>, #< banding="C" subBandings=...>, #< banding="D" subBandings=...>, #< banding="E" subBandings=...>]}
```

### Get list of Training Topics:
```ruby
require 'link_in_the_middle/training_topics/search'

LinkInTheMiddle::TrainingTopics::Search.perform(
  search: "example"
)
=> {:records=>[#< id="1" title="example">]}
```

### Get list of Training Sub Topics:
```ruby
require 'link_in_the_middle/training_sub_topics/search'

LinkInTheMiddle::TrainingSubTopics::Search.perform(
  search: "example"
)
=> {:records=>[#< id="1" title="example">]}
```

### Find an employee by email:
```ruby
require 'link_in_the_middle/employees/find'

LinkInTheMiddle::Employees::Find.perform(
  search_params: {
    email: "email@mail.com"
  }
)
=> {:record=>#< id="13" uniqueEmployeeId="L000133" firstname="Neuf" lastname="Troisquarts" isManager=true isHrOrg=true email="email@mail.com">}
```

## Configuration

Configure link graphql api endpoint and auth token

```ruby
# initializers/link_in_the_middle.rb
LinkInTheMiddle.configure do |config|
  config.api_token = <your-token>
  config.link_graphql_api_endpoint = "https://..."
  config.update_schema_on_each_request = false # trigger GraphQL::Client.dump_schema for each request
end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/link_in_the_middle.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).