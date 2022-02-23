class Comment
  def self.create(content:, post_id:, user_id: nil)
    comment = DatabaseConnection.query(
      "INSERT INTO comments(content, post_id, user_id) values($1, $2, $3) RETURNING id, content, post_id, user_id;",
      [content, post_id, user_id]
    ).first
    wrap_relation_in_object(comment)
  end

  def self.where(post_id:)
    comments = DatabaseConnection.query("SELECT * FROM comments WHERE post_id=$1", [post_id])
    comments.map { |comment| wrap_relation_in_object(comment) }

  end

  attr_reader :id, :content, :post_id, :user_id

  def initialize(id:, content:, post_id:, user_id: nil)
    @id = id
    @content = content
    @post_id = post_id
    @user_id = user_id
  end

  private

  def self.wrap_relation_in_object(rel)
    Comment.new(id: rel['id'], content: rel['content'], post_id: rel['post_id'], user_id: rel['user_id'])
  end



end