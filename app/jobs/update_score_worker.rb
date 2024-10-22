# frozen_string_literal: true

class UpdateScoreWorker
  include Sidekiq::Worker

  queue_as :default

  def perform(*args)
    return if args[:game_id].nil?

    GameStatResult.new(args[:game_id]).call
  end
end
