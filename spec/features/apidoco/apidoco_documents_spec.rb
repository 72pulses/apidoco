require 'rails_helper'

RSpec.feature 'Documents', type: :feature do
  describe 'attributes' do
    FileUtils.rm_rf("#{Rails.root}/docs")
    FileUtils.mkdir_p(Rails.root.join('docs', 'api', 'v1', 'currencies'))
    File.open(Rails.root.join('docs', 'api', 'v1', 'currencies', 'index.json'), 'w') do |line|
      line.puts('{"published":true,"sort_order":100,"name":"IndexCategories","end_point":"api/exercises/:exercise_id/categories.json","http_method":"GET","params":[],"examples":[{"request":{},"response":{"exercise_name":"2017Basegame#1(UnitedStates)","categories":{"active":[{"id":1,"assignment_id":29,"name":"Apr26#1","o_m_cost_growth_rate":0.01},{"id":2,"assignment_id":22,"name":"Sea","o_m_cost_growth_rate":1.01}],"inactive":[{"id":3,"name":"Ground","can_delete":false},{"id":4,"name":"SOF","can_delete":false},{"id":5,"name":"NuclearForces","can_delete":false},{"id":6,"name":"Space/Cyber/Comms","can_delete":false},{"id":7,"name":"Logistics&Basing","can_delete":false},{"id":8,"name":"MissileDefense","can_delete":false},{"id":9,"name":"Munitions","can_delete":false},{"id":10,"name":"R&D","can_delete":false},{"id":11,"name":"Readiness","can_delete":false},{"id":12,"name":"Test","o_m_cost_growth_rate":1.07,"formula_models":[{"id":42,"name":"ManualEntry","cost_category":{"id":1,"name":"Procurement"}},{"id":43,"name":"ManualEntry","cost_category":{"id":2,"name":"O&M"}}],"can_delete":true}]}}}]}')
    end
  end
end
