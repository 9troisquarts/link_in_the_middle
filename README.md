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
end
```
## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/link_in_the_middle.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
