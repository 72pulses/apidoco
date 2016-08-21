# Apidoco
Easy documentation of REST APIs

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'apidoco'
```

And then execute:
```bash
$ bundle
```

Add this line to your routes:

```ruby
mount Apidoco::Engine, at: "/docs"
```

## Generators

To create a Api documentation file for an action:

```ruby
rails g apidoco path_to_file/file_name
```
For Eg:

```ruby
rails g apidoco api/v1/posts/new
```
will create a file under docs/api/v1/posts/new.json with a sample content.

## Contributing
Contribution directions go here.

## License
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

### Sample API documentation format

```
// docs/api/v1/posts/create.json
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

// docs/api/v1/posts/edit.json
{
  "name": "Edit Post",
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

//docs/api/v1/posts/delete.json
{
  "name": "Delete Post",
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
```
