# frozen_string_literal: true

class GameStatResult < StatResult
  def call
    game.stats.map do |stat|
      result = 0
      stat.records.map do |record|
        result += record.coefficient.value * record.value
      end
      coef = stat.game.coefficient.present? ? stat.game.coefficient : 1
      stat.update(value: result.round(BASE_ROUNDS) * coef)
    end
  end
end
