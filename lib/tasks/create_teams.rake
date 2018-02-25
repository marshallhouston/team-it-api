desc "Create 5 teams for initial seeds"
task create_teams: :environment do

  team_names = ['Westwood Girls Basketball', 'Oak Mountain Boys Soccer', 'Littleton Thunder', 'Golden Rockets Softball', 'Longmont Rockies Baseball']
  team_count_before = Team.count

  5.times do |i|
    Team.find_or_create_by(name: team_names[i])
  end

  puts "#{Team.count - team_count_before} New Teams Created! On the first run, this should be 5."
end
