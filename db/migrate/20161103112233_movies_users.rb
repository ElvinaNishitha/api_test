class MoviesUsers < ActiveRecord::Migration
  def change
  	 create_table :movies_users, id: false do |t|
      t.belongs_to :movies_id
      t.belongs_to :users_id
  end
    end
end
