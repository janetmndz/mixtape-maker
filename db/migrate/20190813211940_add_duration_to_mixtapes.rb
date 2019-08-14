class AddDurationToMixtapes < ActiveRecord::Migration[5.2]
  def change
    add_column :mixtapes, :duration, :integer, :default => 0
  end
end
