require 'rails_helper'

RSpec.describe StatController, type: :request do
  describe '#index' do
    let(:team1) { create(:team) }
    let(:team2) { create(:team) }
    let(:game_list1) { create_list(:game, 5, win_team: team1, second_team: team2) }

    before do
      list_role = create_list(:role, 4)
      list_role.each do |role|
        create_list(:player, 2, role: role, team: team1)
        create_list(:player, 2, role: role, team: team2)
      end
      game_list1.each do |game|
        team1.players.each do |player|
          create(:game_stat, :with_game_stat_records, game: game, player: player, value: Faker::Number.non_zero_digit)
        end
        team2.players.each do |player|
          create(:game_stat, :with_game_stat_records, game: game, player: player, value: Faker::Number.non_zero_digit)
        end
      end
    end

    context 'find using params' do
      it 'sort desc' do
        get '/stats', params: { team_id: team1.id, role_id: team1.players.first.role_id,
                                order: 'desc', limit: 5, date_from: game_list1.first.date - 1.year,
                                date_to: game_list1.last.date + 1.year }
        expect(response).to have_http_status(:success)
        json = JSON.parse(response.body)
        expect(json["data"].first["value"]).to be > (json["data"].last["value"])
      end

      it 'sort asc' do
        get '/stats', params: { team_id: team1.id, role_id: team1.players.first.role_id,
                                order: 'asc', limit: 5, date_from: game_list1.first.date - 1.year,
                                date_to: game_list1.last.date + 1.year }
        json = JSON.parse(response.body)
        expect(json["data"].first["value"]).to be < (json["data"].last["value"])
      end

      it 'limit' do
        get '/stats', params: { team_id: team1.id, role_id: team1.players.first.role_id,
                                order: 'desc', limit: 4, date_from: game_list1.first.date - 1.year,
                                date_to: game_list1.last.date + 1.year }
        json = JSON.parse(response.body)
        expect(json["data"].count).to be(4)
      end

      it "needed role" do
        get '/stats', params: { team_id: team1.id, role_id: team1.players.first.role_id,
                                order: 'desc', limit: 5, date_from: game_list1.first.date - 1.year,
                                date_to: game_list1.last.date + 1.year }
        json = JSON.parse(response.body)
        expect(json["data"].map { |d| d["player"]["role_id"] }.uniq.first).to be_equal(team1.players.first.role.id)
      end
    end
  end
end
