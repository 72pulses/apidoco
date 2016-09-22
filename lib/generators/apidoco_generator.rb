#
# ApidocoGenerator
#
# @author sufinsha
#
class ApidocoGenerator < Rails::Generators::Base
  desc 'This generator creates empty folder for api versions'
  def create_apidoco_folder
    resource = args[0]
    p 'ssssssssssssssssssssssssssssssssssss'

    resource_actions = actions(args[1..-1])

    resource_actions.each do |action|
      p action
      create_file "#{Rails.root}/docs/#{file_name(resource, action)}",
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
        endpoint: '.json', method: 'GET', collection: true
      },
      show: {
        endpoint: '/:id.json', method: 'GET', collection: false
      },
      create: {
        endpoint: '.json', method: 'POST', collection: true
      },
      update: {
        endpoint: '/:id.json', method: 'PUT|PATCH', collection: false
      },
      destroy: {
        endpoint: '/:id.json', method: 'DELETE', collection: false
      }
    }
    end_points_with_method[action] || {}
  end

  def api_name(resource, action)
    endpoint_with_method = default_end_points_with_method(action.intern)
    resource_title = if endpoint_with_method[:collection]
                       resource.pluralize.titleize
                     else
                       resource.singularize.titleize
                     end
    "#{action.to_s.titleize} #{resource_title}"
  end

  def file_name(resource, action)
    "#{resource}/#{action}.json"
  end

  def resource_name(resource)
    resource.split('/').last
  end

  def file_content(resource, action)
    endpoint_with_method = default_end_points_with_method(action.intern)
    name = api_name(resource_name(resource), action)
    <<-FILE
{
  "name": "#{name}",
  "end_point": "#{resource}#{endpoint_with_method[:endpoint]}",
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
