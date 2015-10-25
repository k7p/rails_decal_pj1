class AddHealthToPokemons < ActiveRecord::Migration
  def change
    add_column :pokemons, :Health, :integer
  end
end
