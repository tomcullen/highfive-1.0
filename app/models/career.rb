class Career < ActiveRecord::Base
  has_many :user_career_joins
  has_many :users, through: :user_career_joins
end

def proper_name
  "#{title}, #{category}"
end