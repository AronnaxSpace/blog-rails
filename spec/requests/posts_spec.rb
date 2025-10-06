describe "/posts", type: :request do
  let(:user) { create(:user) }
  let(:blog_post) { create(:post) }
  let(:valid_params) do
    {
      title: "New Post",
      content: "New Post Content"
    }
  end
  let(:invalid_params) { { content: "" } }

  describe "GET /" do
    it "returns a success response" do
      get root_path
      expect(response).to be_successful
    end
  end

  describe "GET /posts/:id" do
    it "returns a success response" do
      get post_path(blog_post)
      expect(response).to be_successful
    end
  end

  describe "GET /posts/new" do
    before do
      sign_in user
    end

    it "returns a success response" do
      get new_post_path
      expect(response).to be_successful
    end
  end

  describe "GET /posts/:id/edit" do
    before do
      sign_in user
    end

    it "returns a success response" do
      get edit_post_path(blog_post)
      expect(response).to be_successful
    end
  end

  describe "POST /posts" do
    before do
      sign_in user
    end

    context "with valid params" do
      it "creates a new post" do
        expect {
          post posts_path, params: { post: valid_params }
        }.to change(Post, :count).by(1)
      end
    end

    context "with invalid params" do
      it "does not create a new post" do
        expect {
          post posts_path, params: { post: invalid_params }
        }.to change(Post, :count).by(0)
      end
    end
  end

  describe "PATCH /posts/:id" do
    before do
      sign_in user
    end

    let(:updated_params) { { content: "Updated Post Content" } }

    it "updates the post" do
      expect {
        patch post_path(blog_post), params: { post: updated_params }
      }.to change { blog_post.reload.content }.to(updated_params[:content])
    end
  end

  describe "DELETE /posts/:id" do
    before do
      blog_post
      sign_in user
    end

    it "deletes the post" do
      expect { delete post_path(blog_post) }.to change(Post, :count).by(-1)
    end
  end
end
