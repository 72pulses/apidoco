module Apidoco
  class ApplicationRecord < ActiveRecord::Base
    self.abstract_class = true
  end
end
