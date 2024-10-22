require 'rails_helper'

RSpec.describe RoleController, type: :request do
  describe '#index' do
    let!(:roles) { FactoryBot.create_list(:role, 5) }
    let(:path) { roles_path }

    let(:subject_id) { roles.sample.id }
    let(:id_path) { "/role/#{subject_id}" }
    let(:incorrect_id_path) { "/role/0" }

    context 'serialized data' do
      include_examples "serialized response without pagination", RoleSerializer, Role
      include_examples "serialized show response without pagination", RoleSerializer, Role
    end
  end
end
