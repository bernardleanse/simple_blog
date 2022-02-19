def setup_db_connection
  if ENV['RACK_ENV'] == 'test'
    DatabaseConnection.connect('simple_blog_test') 
  else
    DatabaseConnection.connect('simple_blog')
  end
end