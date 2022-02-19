class Post

  def self.all
    posts = DatabaseConnection.query("SELECT * FROM posts;")
    posts.map { |post| Post.new(id: post['id'], content: post['content']) }
  end

  def self.create(content:)
    post = DatabaseConnection.query("INSERT INTO posts(content) VALUES($1) RETURNING id, content;", [content]).first
    return Post.new(id: post["id"], content: post["content"])
  end

  attr_reader :id, :content

  def initialize(id:, content:)
    @id = id
    @content = content
  end
end