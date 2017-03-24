# Apidoco
Easy documentation of REST APIs - [Demo](https://apidoco-demo.herokuapp.com/docs/).


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
rails g apidoco resource
```
For Eg:
ruby
```
rails g apidoco api/v1/posts
```
will create the following files by default with sample content
- docs/api/v1/posts/show.json
- docs/api/v1/posts/create.json
- docs/api/v1/posts/update.json
- docs/api/v1/posts/destroy.json
- docs/api/v1/posts/index.json

If you need to create Api documention file for actions other than default
crud actions, you need to specify the actions for which the files need to be generated

For Eg:
ruby
```
rails g apidoco api/v1/posts download upload
```
will create the following files with sample content
- docs/api/v1/posts/download.json
- docs/api/v1/posts/upload.json

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
    "required": true,
    "type": "data-type"
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
    "required": true,
    "type": "data-type"
  }, {
    "key": "post['content']",
    "required": false,
    "type": "data-type"
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
