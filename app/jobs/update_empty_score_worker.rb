# frozen_string_literal: true

class UpdateEmptyScoreWorker
  include Sidekiq::Worker

  queue_as :default

  def perform
    GameStat.where(value: nil).joins(:game).map(&:game).uniq.each do |game|
      GameStatResult.new(game.id).call
    end
  end
end
