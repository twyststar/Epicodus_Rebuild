class CreateWeeks < ActiveRecord::Migration[5.1]
  def change
    create_table :weeks do |t|
      t.column :timeframe, :string
      t.column :description, :string
      t.column :course_id, :integer
    end
  end
end
