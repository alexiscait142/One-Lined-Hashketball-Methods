require 'pry'

def game_hash
  {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => [
        {:player_name => "Alan Anderson",
        :number => 0,
        :shoe => 16,
        :points => 22,
        :rebounds => 12,
        :assists => 12,
        :steals => 3,
        :blocks => 1,
        :slam_dunks => 1},
        {:player_name => "Reggie Evans",
        :number => 30,
        :shoe => 14,
        :points => 12,
        :rebounds => 12,
        :assists => 12,
        :steals => 12,
        :blocks => 12,
        :slam_dunks => 7},
        {:player_name => "Brook Lopez",
        :number => 11,
        :shoe => 17,
        :points => 17,
        :rebounds => 19,
        :assists => 10,
        :steals => 3,
        :blocks => 1,
        :slam_dunks => 15},
        {:player_name => "Mason Plumlee",
        :number => 1,
        :shoe => 19,
        :points => 26,
        :rebounds => 11,
        :assists => 6,
        :steals => 3,
        :blocks => 8,
        :slam_dunks => 5},
        {:player_name => "Jason Terry",
        :number => 31,
        :shoe => 15,
        :points => 19,
        :rebounds => 2,
        :assists => 2,
        :steals => 4,
        :blocks => 11,
        :slam_dunks => 1}
        ]
    },
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => [
        {:player_name => "Jeff Adrien",
        :number => 4,
        :shoe => 18,
        :points => 10,
        :rebounds => 1,
        :assists => 1,
        :steals => 2,
        :blocks => 7,
        :slam_dunks => 2},
        {:player_name => "Bismack Biyombo",
        :number => 0,
        :shoe => 16,
        :points => 12,
        :rebounds => 4,
        :assists => 7,
        :steals => 22,
        :blocks => 15,
        :slam_dunks => 10},
        {:player_name => "DeSagna Diop",
        :number => 2,
        :shoe => 14,
        :points => 24,
        :rebounds => 12,
        :assists => 12,
        :steals => 4,
        :blocks => 5,
        :slam_dunks => 5},
        {:player_name => "Ben Gordon",
        :number => 8,
        :shoe => 15,
        :points => 33,
        :rebounds => 3,
        :assists => 2,
        :steals => 1,
        :blocks => 1,
        :slam_dunks => 0},
        {:player_name => "Kemba Walker",
        :number => 33,
        :shoe => 15,
        :points => 6,
        :rebounds => 12,
        :assists => 12,
        :steals => 7,
        :blocks => 5,
        :slam_dunks => 12},
        ]
    }
  }
end

#USE HELPER METHODS!!!

def home_team
  game_hash[:home][:players]
end

def away_team
  game_hash[:away][:players]
end

def all_players
  home_team.concat(away_team)
end

#concat will combine separate arrays, flatten will combine array of arrays

def num_points_scored player_name
  all_players.find{|player| player[:player_name] == player_name}[:points]
end

def shoe_size player_name
  all_players.find{|player| player[:player_name] == player_name}[:shoe]
end

def big_shoe_rebounds
  all_players.max_by{|player| player[:shoe]}[:rebounds]
end

def home
  home_array = []
  home_array << game_hash[:home]
end

def away
  away_array = []
  away_array << game_hash[:away]
end

def all_teams
  away.concat(home)
end




# def color_hash
#   hash = {}
#   hash[game_hash[:home][:team_name]] = game_hash[:home][:colors]
#   hash
# end

def team_colors(team_name)
  all_teams.find{|place| place[:team_name] == team_name}[:colors]
end

def team_names
  game_hash.map{|place, data| data[:team_name]}
end

def home_hash
  hash = {}
  hash[game_hash[:home][:team_name]] = game_hash[:home][:players]
  hash
end

def away_hash
  hash = {}
  hash[game_hash[:away][:team_name]] = game_hash[:away][:players]
  hash
end


def teams_hash
  home_hash.merge(away_hash)
end


def player_numbers(team_name)
  teams_hash[team_name].map{|team| team[:number]}
end

def home_players_hash
  hash = {}
  game_hash[:home][:players].map do |player, stat|
    hash[player[:player_name]] = player.tap{|key| key.delete(:player_name)}
  end
  hash
end

def away_players_hash
  hash = {}
  game_hash[:away][:players].map do |player, stat|
    hash[player[:player_name]] = player.tap{|key| key.delete(:player_name)}
  end
  hash
end

def all_players_hash
  home_players_hash.merge(away_players_hash)
end


def player_stats(player_name)
  all_players_hash[player_name]
end

def most_points_scored
  all_players.max_by{|stat| stat[:points]}[:player_name]
end

def home_points
  teams_hash["Brooklyn Nets"].reduce(0){|memo, stat| memo += stat[:points]}
end

def away_points
  teams_hash["Charlotte Hornets"].reduce(0){|memo, stat| memo += stat[:points]}
end

def points_hash
  hash = {
    game_hash[:home][:team_name] => home_points ,
    game_hash[:away][:team_name] => away_points
}
hash
end


def winning_team
  points_hash.max_by{|team, points| points}[0]
end

def name_array
  all_players.map{|stat| stat[:player_name]}
end

def player_with_longest_name
  name_array.max_by{|stat| stat.length}
end

def home_player_stats
  game_hash[:home][:players].each{|player|}
end

def away_player_stats
  game_hash[:away][:players].each{|player|}
end

def all_player_stats
  home_player_stats.concat(away_player_stats)
end

def most_steals
  all_player_stats.max_by{|stat| stat[:steals]}[:player_name]
end

def long_name_steals_a_ton?
  most_steals == player_with_longest_name
end



# def num_points_scored(name)
#   game_hash.each do |place, team_data|
#     team_data.each do |attribute, info|
#       if attribute == :players
#         info.each do |player|
#           if player[:player_name] == name
#             return player[:points]
#           end
#         end
#       end
#     end
#   end
# end

# def shoe_size(name)
#   game_hash.each do |place, team_data|
#     team_data.each do |attribute, info|
#       if attribute == :players
#         info.each do |player|
#           if player[:player_name] == name
#             return player[:shoe]
#           end
#         end
#       end
#     end
#   end
# end

# def team_colors(team)
#   game_hash.each do |place, team_data|
#     if team_data[:team_name] == team
#       return team_data[:colors]
#     end
#   end
# end

# def team_names
#   names = []
#   game_hash.each do |place, team_data|
#     names << team_data[:team_name]
#   end
#   names
# end

# def player_numbers(team)
#   numbers = []
#   game_hash.each do |place, team_data|
#     if team_data[:team_name] == team
#       team_data.each do |attribute, info|
#         if attribute == :players
#           info.each do |player|
#           numbers << player[:number]
#         end
#         end
#       end
#     end
#   end
#   numbers
# end

# def player_stats(name)
#   stats = {}
#   game_hash.each do |place, team_data|
#     team_data.each do |attribute, info|
#       if attribute == :players
#         info.each do |player|
#           if player[:player_name] == name
#             stats = player.delete_if do |key, value|
#               key == :player_name
#             end
#           end
#         end
#       end
#     end
#   end
#   stats
# end

# def big_shoe_rebounds
#   size = 0
#   rebounds= 0
#   game_hash.each do |place, team_data|
#     team_data.each do |attribute, info|
#       if attribute == :players
#         info.each do |player|
#           if player[:shoe] > size
#             size = player[:shoe]
#             rebounds = player[:rebounds]
#           end
#         end
#       end
#     end
#   end
#   rebounds
# end

# def most_points_scored
#   points = 0 
#   max_player = nil
#   game_hash.each do |place, team_data|
#     team_data.each do |attribute, info|
#       if attribute == :players
#         info.each do |player|
#           if player[:points] > points 
#             points = player[:points]
#             max_player = player[:player_name]
#           end
#         end
#       end
#     end
#   end
#   max_player
# end

# def winning_team
#   away_points = 0
#   home_points = 0
#   winner = nil
#   game_hash[:away][:players].each do |player, stat|
#     away_points += player[:points]
#   end
#   game_hash[:home][:players].each do |player, stat|
#     home_points += player[:points]
#   end
#   if away_points > home_points
#     winner = game_hash[:away][:team_name]
#   elsif home_points > away_points
#     winner = game_hash[:home][:team_name]
#   end
#   winner
# end

# def player_with_longest_name
#   longest = 0 
#   longest_name = nil
#   game_hash.each do |place, team_data|
#     team_data.each do |attribute, info|
#       if attribute == :players
#         info.each do |player|
#           if player[:player_name].length > longest
#             longest = player[:player_name].length
#             longest_name = player[:player_name]
#           end
#         end
#       end
#     end
#   end
#   longest_name
# end

# def long_name_steals_a_ton?
#   most_steals = 0
#   most_steals_name = nil
#   game_hash.each do |place, team_data|
#     team_data.each do |attribute, info|
#       if attribute == :players
#         info.each do |player|
#           if player[:steals] > most_steals
#             most_steals = player[:steals]
#             most_steals_name = player[:player_name]
#           end
#         end
#       end
#     end
#   end
#   most_steals_name == player_with_longest_name
# end