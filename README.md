# Shmyhloralizer

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/shmyhloralizer`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'shmyhloralizer'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install shmyhloralizer

## Usage

```ruby
# app/serializers/user_serializer.rb

class UserSerializer < Shmyhloralizer
  attribute :first_name
  attribute :last_name
  attribute :email

  has_one :profile

  group :integrations do
    has_many :integrations
  end

  group :chat do
    has_many :friends
  end

  group :statistic do
    attribute :friend_count
    attribute :photo_count
    attribute :video_count
  end
end
```

```ruby
class UsersController < ApplicationController
  def index
    # ...

    render json: users, group: [:chat, :integrations]
  end

  def show
    # ...

    render json: user, group: :statistic
  end
end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/v-shmyhlo/shmyhloralizer.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
