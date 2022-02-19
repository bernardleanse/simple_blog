require 'pg'

task :create_databases do
  ['simple_blog', 'simple_blog_test'].each do |db|
    PG.connect.exec("CREATE DATABASE #{db}")
  end
end