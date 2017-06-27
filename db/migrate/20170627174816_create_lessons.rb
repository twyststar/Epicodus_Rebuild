class CreateLessons < ActiveRecord::Migration[5.1]
  def change
    create_table :lessons do |t|
      t.column :title, :string
      t.column :content, :string
      t.column :week_id, :integer
    end
  end
end
