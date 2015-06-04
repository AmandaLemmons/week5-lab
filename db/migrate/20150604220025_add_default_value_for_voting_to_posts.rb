class AddDefaultValueForVotingToPosts < ActiveRecord::Migration
  def change
    change_column_default :posts, :votes, default: 0
  end
end
