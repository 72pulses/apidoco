#
# ApidocoGenerator
#
# @author sufinsha
#
class ApidocoGenerator < Rails::Generators::Base
  desc 'This generator creates empty folder for api versions'
  def create_apidoco_folder
    create_file "#{Rails.root}/docs/#{args[0]}.json", <<-FILE
      {
        "name": 'API Name',
        "end_point": 'URL for the API',
        "http_method": 'GET|POST|PUT|DELETE|PATCH',
        "params": [],
        "examples": [{
          "request": {},
          "response": {}
        }]
      }
    FILE
  end
end
