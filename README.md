[![Gem Version](https://badge.fury.io/rb/apidoco.svg)](https://badge.fury.io/rb/apidoco)

# Apidoco - Ruby on Rails API documentation tool
Easy documentation of REST APIs - [Demo](https://apidoco-demo.herokuapp.com/docs/).

## Screenshots

![screeshot 1](https://github.com/72pulses/apidoco/blob/feature/update-readme/images/1.jpg?raw=true)


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

## How to add authentication

Create a configuration file in initializers e.g. /config/initializers/apidoco.rb and add the following.

```ruby
Apidoco.auth_name = 'authentication_name'
Apidoco.auth_password = 'authentication_password'
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

### Sample API documentation format

```
// docs/api/v1/posts/create.json
{
  "published": true,
  "sort_order": 1,
  "name": "Create Post",
  "end_point": "/posts",
  "http_method": "POST",
  "header": {
    "Authorization": "Token token=token"
  },
  "params": [{
    "key": "post['name']",
    "required": true,
    "type": "String"
  }, {
    "key": "post['content']",
    "required": false
  }],
  "notes": [
    "Authorization Token Need to be passed via header"
  ],
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

```
// docs/api/v1/posts/edit.json
{
  "published": true,
  "sort_order": 2,
  "name": "Edit Post",
  "end_point": "/posts",
  "http_method": "POST",
  "params": [{
    "key": "post['name']",
    "required": true,
    "type": "String"
  }, {
    "key": "post['content']",
    "required": false,
    "type": "String"
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
  "published": true,
  "sort_order": 3,
  "name": "Delete Post",
  "end_point": "/posts",
  "http_method": "POST",
  "params": [{
    "key": "post['name']",
    "required": true,
    "type": "String"
  }, {
    "key": "post['content']",
    "required": false,
    "type": "String"
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

## Documentation format reference


| Key | Description | Default | Example |
| --- | --- | --- | --- |
| `published` | Set this to false if you do not want to list this api | `true` | -- |
| `sort_order` | The  order of the api in the documenatation | 0 | `"sort_order": 10` |
| `name` | Name of the api | --- | --- |
| `end_point` | --- | --- | `"end_point": "/posts"` |
| `http_method` | The HTTP method of the API | --- | `"http_method": "GET"` |
| `params` | Parameters to be used | --- | `"params: [{ "key": "post['name']",    "required": true, "type": "String" }]"` |
| `examples` | Array of sample requests and responses | --- | `[{ "request": { "post": { "name": "I was scared" } } }, "response": { "message": "Post was successfully created", "id": 101 } }]`


## License
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
