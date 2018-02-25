desc "Create 5 teams for initial seeds"
task create_teams: :environment do

  team_names = ['Westwood Girls Basketball', 'Oak Mountain Boys Soccer', 'Littleton Thunder', 'Golden Rockets Softball', 'Longmont Rockies Baseball']
  team_count_before = Team.count

  5.times do |i|
    new_team_code = Faker::Number.unique.number(3)
    team = Team.where(name: team_names[i]).first_or_create do |new_team|
      new_team.team_code = new_team_code
    end
  end

  puts "#{Team.count - team_count_before} New Teams Created! On the first run, this should be 5."
end
