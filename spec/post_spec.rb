require 'post'

describe Post do
  describe ".create" do
    it "commits post to test_database" do
      post = Post.create(content: 'my test post')
      saved_post = DatabaseConnection.query("SELECT * FROM posts;", []).first
      expect(saved_post['content']).to eq("my test post")
    end
  end

  describe ".all" do
    it "returns all posts" do
      Post.create(content: 'hello')
      Post.create(content: 'goodbye')
      expect(Post.all.first.content).to eq 'hello'
      expect(Post.all.last.content).to eq 'goodbye'
    end
  end
end