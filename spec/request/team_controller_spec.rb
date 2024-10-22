require 'rails_helper'

RSpec.describe TeamController, type: :request do
  describe '#index #show' do
    let!(:teams) { FactoryBot.create_list(:team, 5) }
    let(:subject_id) { teams.sample.id }
    let(:path) { '/teams' }
    let(:id_path) { "/team/#{(subject_id)}" }
    let(:incorrect_id_path) { "/team/0" }

    context 'serialized data' do
      include_examples "paginated serialized response", TeamSerializer, Team
    end
  end
end
