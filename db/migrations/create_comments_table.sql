CREATE TABLE comments(id serial primary key, content varchar(200), post_id integer REFERENCES posts(id), user_id integer REFERENCES users(id));