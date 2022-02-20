require 'pg'

task :create_databases do
  ['simple_blog', 'simple_blog_test'].each do |db|
    PG.connect.exec("CREATE DATABASE #{db}")
  end
end

task :drop_databases do
  ['simple_blog', 'simple_blog_test'].each do |db|
    PG.connect.exec("DROP DATABASE #{db}")
  end
end

task :migrate do
  ['simple_blog', 'simple_blog_test'].each do |db|
    con = PG.connect(dbname: db)
    con.exec("CREATE TABLE posts(id serial primary key, content varchar(200), created_at timestamp);")
  end
end