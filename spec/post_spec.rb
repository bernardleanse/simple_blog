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

  describe ".find" do
    it "finds by id" do
      post = Post.create(content: 'hello')
      found_post = Post.find(id: post.id)
      expect(found_post.content).to eq 'hello'
    end
  end

  describe ".update" do
    it "edits the post" do
      post = Post.create(content: 'hello')
      Post.update(id: post.id, content: 'helloooo')
      fetched_post = DatabaseConnection.query("SELECT * FROM posts WHERE id=$1", [post.id]).first
      expect(fetched_post['content']).to eq "helloooo"
    end
  end
end