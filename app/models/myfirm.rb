class Myfirm < ActiveRecord::Base
  belongs_to :user
  belongs_to :company
end
