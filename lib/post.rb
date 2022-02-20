class Post

  def self.all
    posts = DatabaseConnection.query("SELECT * FROM posts;")
    posts.map { |post| object_relation(post) }
  end

  def self.create(content:)
    post = DatabaseConnection.query("INSERT INTO posts(content, created_at) VALUES($1) RETURNING id, content, created_at;", [content, time_now]).first
    return object_relation(post)
  end

  def self.find(id:)
    post = DatabaseConnection.query("SELECT * FROM posts WHERE id=$1", [id]).first
    return object_relation(post)
  end

  def self.update(id:, content:)
    post = DatabaseConnection.query("UPDATE posts SET content=$1 WHERE id=$2", [content, id])
  end

  attr_reader :id, :content, :created_at

  def initialize(id:, content:, created_at:)
    @id = id
    @content = content
    @created_at = created_at
  end

  private

  def self.time_now
  end

  def self.object_relation(post)
    Post.new(id: post["id"], content: post["content"], created_at: post["created_at"])
  end

end