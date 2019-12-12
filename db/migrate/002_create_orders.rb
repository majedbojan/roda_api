
Sequel.migration do
  change do
    create_table(:orders) do
      primary_key :id, unique: true
      foreign_key :user_id, :users, null: false
      foreign_key :item_id, :items, null: false
      String :name, null: false
      String :address, null: false
    end
  end
end
