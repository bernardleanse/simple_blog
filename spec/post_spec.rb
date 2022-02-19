require 'post'

describe Post do
  describe ".create" do
    it "commits post to test_database" do
      post = Post.create(content: 'my test post')
      saved_post = DatabaseConnection.query("SELECT * FROM posts;", []).first
      expect(saved_post['content']).to eq("my test post")
    end
  end
end