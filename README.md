# Apidoco
Short description and motivation.

## Usage
How to use my plugin.

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'apidoco'
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install apidoco
```

## Contributing
Contribution directions go here.

## License
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

```
{
  "base_url": "http://example.com/apis/v1",
  "apis": [
    {
      "name": "Create Post",
      "end_point": "/posts",
      "http_method": "POST",
      "params": [{
        "key": "post['name']",
        "required": true
      }, {
        "key": "post['content']",
        "required": false
      }],
      "examples": [{
        "request": {
          "post": {
            "name": "I was scared",
            "content": "I am serious, I was really scared."
          }
        },
        "response": {
          "success": true,
          "message": "Post was successfully created",
          "post": {
            "id": 101
          }
        }
      }]
    }
  ]
}
```
