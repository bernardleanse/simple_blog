class Post

  def self.all
    posts = DatabaseConnection.query("SELECT * FROM posts;")
    posts.map { |post| object_relation(post) }
  end

  def self.create(content:)
    post = DatabaseConnection.query("INSERT INTO posts(content) VALUES($1) RETURNING id, content;", [content]).first
    return object_relation(post)
  end

  def self.find(id:)
    post = DatabaseConnection.query("SELECT * FROM posts WHERE id=$1", [id]).first
    return object_relation(post)
  end

  def self.update(id:, content:)
    post = DatabaseConnection.query("UPDATE posts SET content=$1 WHERE id=$2", [content, id])

  end

  attr_reader :id, :content

  def initialize(id:, content:)
    @id = id
    @content = content
  end

  private

  def self.object_relation(post)
    Post.new(id: post["id"], content: post["content"])
  end

end