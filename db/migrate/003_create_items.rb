
Sequel.migration do
  change do
    create_table(:items) do
      primary_key :id, unique: true
      foreign_key :category_id, :categories, null: false
      String :name, null: false
      String :price, null: false
      String :currency, null: false
      String :color, null: false
    end
  end
end
