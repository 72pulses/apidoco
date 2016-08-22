#
# ApidocoGenerator
#
# @author sufinsha
#
class ApidocoGenerator < Rails::Generators::Base
  desc 'This generator creates empty folder for api versions'
  def create_apidoco_folder
    resource = args[0]

    resource_actions = actions(args[1..-1])

    resource_actions.each do |action|
      create_file "#{Rails.root}/docs/#{file_name(resource, action)}.json",
                  file_content(resource, action)
    end
  end

  private

  def actions(args)
    return args if args.present?

    [:show, :index, :create, :update, :destroy]
  end

  def default_end_points_with_method(action)
    end_points_with_method = {
      index: {
        endpoint: '/',
        method: 'GET'
      },
      show: {
        endpoint: '/:id',
        method: 'GET'
      },
      create: {
        endpoint: '/',
        method: 'POST'
      },
      update: {
        endpoint: '/:id',
        method: 'PUT|PATCH'
      },
      destroy: {
        endpoint: '/:id',
        method: 'DELETE'
      }
    }
    end_points_with_method[action] || {}
  end

  def api_name(resource, action)
    "#{action.to_s.titleize} #{resource.singularize.titleize}"
  end

  def file_name(resource, action)
    "#{resource}/#{action.to_s}.json"
  end

  def resource_name(resource)
    resource.split('/').last
  end

  def file_content(resource, action)
    endpoint_with_method = default_end_points_with_method(action)
    name = api_name(resource_name(resource), action)
    <<-FILE
      {
        "name": "#{name}",
        "end_point": "#{endpoint_with_method[:endpoint]}",
        "http_method": "#{endpoint_with_method[:method]}",
        "params": [],
        "examples": [{
          "request": {},
          "response": {}
        }]
      }
    FILE
  end
end
