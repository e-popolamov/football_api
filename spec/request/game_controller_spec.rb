require 'rails_helper'

RSpec.describe GameController, type: :request do
  describe '#index' do
    let(:team1) { create(:team) }
    let(:team2) { create(:team) }
    let(:game1) { create(:game, win_team: team1, second_team: team2) }
    let(:game2) { create(:game, win_team: team2, second_team: team1) }

    let(:subject_id) { game2.id }
    let(:path) { games_path }
    let(:id_path) { "/game/#{subject_id}" }
    let(:incorrect_id_path) { "/game/0" }

    context 'serialized data' do
      # include_examples "serialized response without pagination", GameSerializer, Game
      # include_examples "serialized show response without pagination", GameSerializer, Game
    end
  end
end
