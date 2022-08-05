# Marvel Challenge - Streetbees 

## General instructions
* Visit the index page (should be sorted by the most liked comics)
* Search for a specific comic book
* Like a comic book - it will redirect to sign page
* Sign in/up
* Back to the index page, you can like/dislike comic books

Important: devise pages are quite ugly - didn't have time to style them :(

## Stack
* Ruby 3.0.1
* Ruby on Rails 7.0.3
* Yarn 1.22.17
* Main libraries: Hotwire (Turbo Frames/Streams), Devise, Faraday, Bootstrap, Capybara, VCR, JSBundling-Rails, CSSBundling-Rails.

## Installation instructions
```
git clone https://github.com/mfts/streetbees-marvel.git
cd streetbees-marvel

bundle install
yarn install
db:create
db:migrate

bin/dev
```

## Testing
* Minitest
* Capybara
* VCR (Marvel Api test)

```
# System test
rails test:system

# Like model
rails test like_test.rb

# Marvel API test (uses VCR)
rails test test/support/marvel_api_test.rb
```
