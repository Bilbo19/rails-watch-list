class RemoveMovieFromTableList < ActiveRecord::Migration[7.0]
  def change
    remove_reference :lists, :movie, foreign_key: true
  end
end
