class AddReviewsToRefineryProductions < ActiveRecord::Migration
  def change
    add_column :refinery_productions, :reviews, :text
  end
end
