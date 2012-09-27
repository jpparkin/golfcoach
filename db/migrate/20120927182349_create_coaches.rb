class CreateCoaches < ActiveRecord::Migration
  def change
    create_table :coaches do |t|
      t.string :username
      t.string :hashed_password
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :image_url

      t.timestamps
    end
  end
end
