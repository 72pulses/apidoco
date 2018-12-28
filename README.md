[![Gem Version](https://badge.fury.io/rb/apidoco.svg)](https://badge.fury.io/rb/apidoco)

# Apidoco - Ruby on Rails API documentation tool
Easy documentation of REST APIs - [Demo](https://apidoco-demo.herokuapp.com/docs/).

## Screenshots

![screeshot 1](https://github.com/72pulses/apidoco/blob/master/images/1.jpg?raw=true)

![screeshot 2](https://github.com/72pulses/apidoco/blob/master/images/2.jpg?raw=true)


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
Apidoco.app_name = 'your app name' # This will appear as the HTML title for api_doco pages
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
  "name": "Create",
  "sort_order": 1,
  "end_point": "api/v1/posts/:id.json",
  "http_method": "POST",
  "params": [{
    "key": "post[title]",
    "required": true,
    "type": "String",
    "description": "Title of the post",
    "validations": ["Should be less than or equal to 40 characters"]
  }, {
    "key": "post[content]",
    "required": true,
    "type": "String",
    "description": "Content/Body of the post",
    "validations": ["Should be less than or equal to 300 characters"]
  }, {
    "key": "post[publsihed]",
    "required": true,
    "type": "Boolean",
    "description": "Published status of the post"
  }],
  "header": {
    "Authentication": "Token token=<token>",
    "Content-Type": "application/json"
  },
  "examples": [{
    "request_headers": {
      "Authentication": "Token token=<token>",
      "Content-Type": "application/json"
    },
    "request": {
      "post": {
        "title": "Ruby is awesome",
        "content": "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec interdum a tellus sed finibus.",
        "published": false
      }
    },
    "response_headers": {
      "Authentication": "Token token=<token>"
    },
    "response": {
      "suceess": true,
      "message": "Successfully created"
    }
  }]
}
```

```
// docs/api/v1/posts/update.json
{
  "published": true,
  "name": "Update",
  "sort_order": 2,
  "end_point": "api/v1/posts/:id.json",
  "http_method": "PUT|PATCH",
  "params": [{
    "key": "post[title]",
    "required": true,
    "type": "String",
    "description": "Title of the post",
    "validations": ["Should be less than or equal to 40 characters"]
  }, {
    "key": "post[content]",
    "required": true,
    "type": "String",
    "description": "Content/Body of the post",
    "validations": ["Should be less than or equal to 300 characters"]
  }, {
    "key": "post[publsihed]",
    "required": true,
    "type": "Boolean",
    "description": "Published status of the post"
  }],
  "header": {
    "Authentication": "Token token=<token>",
    "Content-Type": "application/json"
  },
  "examples": [{
    "request_headers": {
      "Authentication": "Token token=<token>",
      "Content-Type": "application/json"
    },
    "request": {
      "post": {
        "title": "Ruby is awesome",
        "content": "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec interdum a tellus sed finibus.",
        "published": false
      }
    },
    "response_headers": {
      "Content-Type": "application/json"
    },
    "response": {
      "suceess": true,
      "message": "Successfully updated"
    }
  }]
}

```

```
//docs/api/v1/posts/delete.json
{
  "published": true,
  "name": "Destroy Post",
  "sort_order": 6,
  "end_point": "api/v1/posts/:id.json",
  "http_method": "DELETE",
  "header": {
    "Authentication": "Token token=<token>",
    "Content-Type": "application/json"
  },
  "examples": [{
    "request_headers": {
      "Authentication": "Token token=<token>",
      "Content-Type": "application/json"
    },
    "response": {
      "suceess": true,
      "message": "Successfully destroyed"
    }
  }]
}
```

## Documentation format reference


| Key | Description | Default | Example |
| --- | --- | --- | --- |
| `published` | Set this to false if you do not want to list this api | `true` | -- |
| `name` | Name of the api | --- | --- |
| `sort_order` | Order of the api to be listed | --- | --- |
| `end_point` | --- | --- | `"end_point": "/posts"` |
| `http_method` | The HTTP method of the API | --- | `"http_method": "GET"` |
| `params` | Parameters to be used | --- | `"params: [{ "key": "post['name']", "required": true, "type": "String", "notes": ["Name or title of the post"], "validations": ["should be less than or equal to 150 characters"] }]"` |
| `header` | headers to be used | --- | `"header: { "Authorization": "Token token=<token>", "Content-type": 'application/json' }"` |
| `examples` | Array of sample requests, responses and their headers | --- | `[{ "request_headers": { "Authorization": "Token token=<token>", "Content-type": 'application/json' }, "request": { "post": { "name": "I was scared" } } }, "response_headers": { "Content-type": 'application/json' }, "response": { "message": "Post was successfully created", "id": 101 } }]`


## License
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
