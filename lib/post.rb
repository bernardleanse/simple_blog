class Post

  def self.all
    posts = DatabaseConnection.query("SELECT * FROM posts;")
    posts.map { |post| object_relation(post) }
  end

  def self.create(content:, user_id: nil)
    post = DatabaseConnection.query("INSERT INTO posts(content, created_at, user_id) VALUES($1, $2, $3) RETURNING id, content, created_at, user_id;", [content, Time.now, user_id]).first
    return object_relation(post)
  end

  def self.find(id:)
    post = DatabaseConnection.query("SELECT * FROM posts WHERE id=$1", [id]).first
    return object_relation(post)
  end

  def self.update(id:, content:)
    post = DatabaseConnection.query("UPDATE posts SET content=$1 WHERE id=$2", [content, id])
  end

  def self.delete(id:)
    DatabaseConnection.query("DELETE FROM posts WHERE id=$1", [id])
  end


  attr_reader :id, :content, :created_at, :user_id

  def initialize(id:, content:, created_at:, user_id: nil)
    @id = id
    @content = content
    @created_at = created_at
    @user_id = user_id
  end

  def author
    User.find(id: @user_id)
  end

  def comments
    Comment.where(post_id: @id)
  end
 
  private

  def self.object_relation(post)
    Post.new(id: post["id"], content: post["content"], created_at: post["created_at"], user_id: post["user_id"])
  end

end