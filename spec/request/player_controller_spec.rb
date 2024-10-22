require 'rails_helper'

RSpec.describe PlayerController, type: :request do
  describe 'show' do
    let(:roles) { FactoryBot.create_list(:role, 5) }
    let(:teams) { FactoryBot.create_list(:team, 5) }
    let!(:players) { FactoryBot.create_list(:player, 5, team: teams.sample, role: roles.sample) }

    let(:subject_id) { players.sample.id }
    let(:id_path) { "/player/#{(subject_id)}" }
    let(:incorrect_id_path) { "/player/0" }

    context 'serialized data' do
      include_examples "serialized show response without pagination", PlayerSerializer, Player
    end
  end
end
