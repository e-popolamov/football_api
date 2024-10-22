require 'rails_helper'

RSpec.describe GameStatResult do
  describe 'validate result count' do
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
          create(:game_stat, :with_game_stat_records, game: game, player: player)
        end
        team2.players.each do |player|
          create(:game_stat, :with_game_stat_records, game: game, player: player)
        end
      end
    end

    context 'call' do
      it 'all values filled' do
        GameStatResult.new(game_list1.first.id).call
        expect(game_list1.first.stats.pluck(:value).any?(&:blank?)).to be_falsey
      end

      context 'specified result' do
        before do
          game_list1.map { |game| game.stats.update_all(value: 1) }
          Coefficient.all.update_all(value: 1)
        end
        # 2 person * 4 role * 2 commands = 16
        it 'sum result for 2 teams' do
          expect(game_list1.first.stats.pluck(:value).sum).to eq(16)
        end

        it 'sum result for 1 teams for 1 game' do
          res = game_list1.first.stats.where(player_id: team1.players.ids).pluck(:value).sum
          expect(res).to eq(8)
        end

        # 5 games * 8 score per game = 40 total for 1 team
        it 'sum result for 1 teams for 2 game' do
          res = 0
          game_list1.each do |game|
            res += game.stats.where(player_id: team1.players.ids).pluck(:value).sum
          end
          expect(res).to eq(40)
        end
      end
    end
  end
end
