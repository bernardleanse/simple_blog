require 'comment'

describe Comment do

  describe '.create' do
    it 'creates a comment' do
      user = User.create(username: 'user', password: '123', confirm_password: '123')
      post = Post.create(content: 'hello', user_id: user.id)
      comment = Comment.create(content: 'hello test comment', post_id: post.id, user_id: user.id)
      
      db_data = DatabaseConnection.query("SELECT * FROM comments WHERE id=$1;", [comment.id])

      p db_data.first

      expect(comment).to be_a Comment
      expect(comment.id).to eq db_data.first['id']
      expect(comment.content).to eq db_data.first['content']
    end
  end

end