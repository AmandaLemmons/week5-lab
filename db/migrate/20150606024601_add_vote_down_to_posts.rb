class AddVoteDownToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :vote_down, :integer
  end
end
