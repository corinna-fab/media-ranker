class RenamePizzaVotesToVoteCount < ActiveRecord::Migration[6.0]
  def change
    rename_column :pizzas, :votes, :vote_count 
  end
end
