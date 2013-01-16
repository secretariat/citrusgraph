class CreateDiagrams < ActiveRecord::Migration
  def change
    create_table :diagrams do |t|
      t.string :legend
      t.integer :val

      t.timestamps
    end
  end
end
