# frozen_string_literal: true

class StatFinder
  attr_reader :team_id, :date_from, :date_to, :role_id, :is_desc, :limit
  def initialize(team_id:, date_from:, date_to:, role_id:, order:, limit:)
    @team_id = team_id
    @date_from = parse_date(date_from)
    @date_to = parse_date(date_to)
    @role_id = role_id.to_i
    @is_desc = order == "desc"
    @limit = limit.to_i
  end

  def call
    teams = team_id.present? ? Team.where(id: team_id) : Team.all
    games_by_dates = Rails.cache.fetch([ "games", date_from, date_to, team_id ], expires_in: 15.minute) do
      Game.where(date: date_from..date_to)
    end
    games = games_by_dates.where(win_team: teams).or(Game.where(second_team: teams))
    stats = games.flat_map(&:stats)
    stats = stats.select { |stat| stat.player.role_id == role_id } if role_id
    stats.sort_by!(&:value)
    stats.reverse! if is_desc
    limit ? stats.first(limit) : stats
  end

  private

  def parse_date(date)
    date.present? ? Date.parse(date) : nil
  end
end
