class Post < ActiveRecord::Base

  validates :link, presence: true
  validates :title, presence: true


  def up_vote
    
  end




  def down_vote
  end


end
