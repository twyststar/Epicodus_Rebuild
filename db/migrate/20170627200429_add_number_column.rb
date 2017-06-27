class AddNumberColumn < ActiveRecord::Migration[5.1]
  def change
    add_column(:lessons, :number, :integer)
    add_column(:lessons, :description, :string)
  end
end
