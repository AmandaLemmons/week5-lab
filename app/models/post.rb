class Post < ActiveRecord::Base

  validates :title, presence: true
  validates :link, presence: true


  def initialize
    @vote 

  end



end
