
Sequel.migration do
  change do
    create_table(:categories) do
      primary_key :id, unique: true
      String :name, null: false
    end
  end
end
