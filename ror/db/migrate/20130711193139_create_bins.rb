class CreateBins < ActiveRecord::Migration
  def change
    create_table :bins do |t|
      t.string :name

      t.timestamps
    end
  end
end
