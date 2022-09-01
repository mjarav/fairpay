class AddRatingToReviews < ActiveRecord::Migration[6.1]
  def change
    add_column :reviews, :rating, :integer, default: 0, null: false
  end
end
