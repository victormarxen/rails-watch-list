class AddReferenceToReviews < ActiveRecord::Migration[7.0]
  def change
    add_reference :reviews, :list
    add_foreign_key :reviews, :lists
  end
end
