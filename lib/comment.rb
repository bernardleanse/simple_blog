class Comment
  def self.create(content:, post_id:, user_id: nil)
    comment = DatabaseConnection.query(
      "INSERT INTO comments(content, post_id, user_id) values($1, $2, $3) RETURNING id, content, post_id, user_id;",
      [content, post_id, user_id]
    ).first
    Comment.new(id: comment['id'], content: comment['content'], post_id: comment['post_id'], user_id: comment['user_id'])
  end

  attr_reader :id, :content, :post_id, :user_id

  def initialize(id:, content:, post_id:, user_id: nil)
    @id = id
    @content = content
    @post_id = post_id
    @user_id = user_id
  end


end