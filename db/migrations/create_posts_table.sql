CREATE TABLE posts(id serial primary key, content varchar(200), created_at timestamp, user_id integer REFERENCES users(id));