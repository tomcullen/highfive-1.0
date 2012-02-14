class UserCareerJoin < ActiveRecord::Base
  belongs_to :user
  belongs_to :career
end
