Role.find_or_create_by(name: 'Goalkeeper') do |role|
  Coefficient.find_or_create_by(role: role, name: 'Goalkeeper Stat 1', value: 2)
  Coefficient.find_or_create_by(role: role, name: 'Goalkeeper Stat 2', value: 3)
  Coefficient.find_or_create_by(role: role, name: 'Goalkeeper Stat 3', value: 4)
end

Role.find_or_create_by(name: 'Defender') do |role|
  Coefficient.find_or_create_by(role: role, name: 'Defender Stat 1', value: 2)
  Coefficient.find_or_create_by(role: role, name: 'Defender Stat 2', value: 3)
  Coefficient.find_or_create_by(role: role, name: 'Defender Stat 3', value: 4)
end

Role.find_or_create_by(name: 'Midfielder') do |role|
  Coefficient.find_or_create_by(role: role, name: 'Midfielder Stat 1', value: 2)
  Coefficient.find_or_create_by(role: role, name: 'Midfielder Stat 2', value: 3)
  Coefficient.find_or_create_by(role: role, name: 'Midfielder Stat 3', value: 4)
end

Role.find_or_create_by(name: 'Forward') do |role|
  Coefficient.find_or_create_by(role: role, name: 'Forward Stat 1', value: 2)
  Coefficient.find_or_create_by(role: role, name: 'Forward Stat 2', value: 3)
  Coefficient.find_or_create_by(role: role, name: 'Forward Stat 3', value: 4)
end

1..10.times do |i|
  Team.find_or_create_by(name: "Team #{i}") do |team|
    Player.find_or_create_by(first_name: "Goalkeeper#{i}", last_name: "Goalkeeper#{i}", team: team,
                             role: Role.find_by(name: 'Goalkeeper'))
    1..3.times do |j|
      Player.find_or_create_by(first_name: "Defender#{i}#{j}", last_name: "Defender#{i}#{j}", team: team,
                               role: Role.find_or_create_by(name: 'Defender'))
    end

    1..3.times do |j|
      Player.find_or_create_by(first_name: "Midfielder#{i}#{j}", last_name: "Midfielder#{i}#{j}", team: team,
                               role: Role.find_or_create_by(name: 'Midfielder'))
    end

    1..4.times do |j|
      Player.find_or_create_by(first_name: "Forward#{i}#{j}", last_name: "Forward#{i}#{j}", team: team,
                               role: Role.find_or_create_by(name: 'Forward'))
    end
  end
end


1..30.times do |i|
  team1 = Team.all.sample
  team2 = Team.all.where.not(id: team1.id).sample
  result = rand(2)
  game = Game.create(win_team: team1, second_team: team2, date: Time.now - rand(10).days, result: "#{result + rand(3) + 1}:#{result}", coefficient: rand(5))
  [ team1, team2 ].each do |team|
    team.players.each do |player|
      game_stat = GameStat.create(game: game, player: player)
      player.role.coefficients.each do |coefficient|
        GameStatRecord.create(game_stat: game_stat, coefficient: coefficient, value: rand(10))
      end
    end
  end
end
