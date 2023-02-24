class FillUserRefInRooms < ActiveRecord::Migration[5.1]
  def change
    def up
      execute <<-SQL
      UPDATE rooms
      SET user_id = (SELECT users.id FROM users WHERE users.name = 'default')
      SQL

      change_column :rooms, :user_id, :integer, null: false

      add_foreign_key :rooms, :users
    end

    def down
      remove_foreign_key :rooms, :users

      change_column :rooms, :user_id, :integer, null: true

      execute <<-SQL
      UPDATE rooms
      SET user_id = NULL
      SQL
    end
  end
end
