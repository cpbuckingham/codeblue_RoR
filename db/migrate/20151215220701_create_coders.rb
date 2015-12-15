class CreateCoders < ActiveRecord::Migration
  def change
    create_table :coders do |t|
      t.text :name
      t.text :email
      t.text :github_username

      t.timestamps null: false
    end
  end
end
