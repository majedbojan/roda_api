Sequel.migration do
  change do
    create_table(:users) do
      primary_key :id, unique: true
      String :name, null: false
      String :email, unique: true, null: false
      String :password_hash, null: false
    end
  end
end
