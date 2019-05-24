class AddCocktailDbIdToCocktails < ActiveRecord::Migration[5.2]
  def change
    add_column :cocktails, :cocktail_db_id, :string
  end
end
