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
    con.exec("create table users(id serial primary key, username varchar(20) unique, password varchar(200));")
    con.exec("ALTER TABLE posts ADD user_id integer REFERENCES users(id);")
    con.exec("CREATE TABLE comments(id serial primary key, content varchar(200), post_id integer REFERENCES posts(id), user_id integer REFERENCES users(id));")
  end
end