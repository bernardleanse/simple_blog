def truncate_test_tables
  DatabaseConnection.query("TRUNCATE posts;")
end