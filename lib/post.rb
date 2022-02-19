class Post
  def self.create(content:)
    post = DatabaseConnection.query("INSERT INTO posts(content) VALUES($1) RETURNING id, content;", [content]).first
    return Post.new(id: post["id"], content: post["content"])
  end

  def initialize(id:, content:)
    @id = id
    @content = content
  end
end