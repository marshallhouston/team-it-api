desc "Create 5 teams for initial seeds"
task create_teams: :environment do

  phone_numbers = ["555-555-0000", "555-555-1111", "555-555-2222", "555-555-3333", "555-555-4444"]
  team_count_before = Team.count

  5.times do |i|
    Team.find_or_create_by(name: "Team ##{i}", phone: phone_numbers[i - 1])
  end

  puts "#{Team.count - team_count_before} New Teams Created! On the first run, this should be 5."
end
