require 'spec_helper'

describe IssuesController do

  def valid_attributes
    { 
      name: "Simple test",
      image: fixture_file_upload('/images/test.jpg', 'image/jpeg'),
      questions_attributes: {'0' => {body: 'Is it my question?'}}
    }
  end

  before(:each) do
    @user = FactoryGirl.create(:user)
    sign_in @user
  end

  describe "GET index" do
    it "assigns all issues as @issues" do
      issue = Issue.create! valid_attributes
      get :index, {}
      assigns(:issues).should eq([issue])
    end
  end

  describe "GET show" do
    it "assigns the requested issue as @issue" do
      issue = @user.issues.create! valid_attributes
      get :show, {:id => issue.to_param}
      assigns(:issue).should eq(issue)
    end
  end

  describe "GET new" do
    it "assigns a new issue as @issue" do
      get :new, {}
      assigns(:issue).should be_a_new(Issue)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Issue" do
        expect {
          post :create, {:issue => valid_attributes}
        }.to change(Issue, :count).by(1)
      end

      it "assigns a newly created issue as @issue" do
        post :create, {:issue => valid_attributes}
        assigns(:issue).should be_a(Issue)
        assigns(:issue).should be_persisted
      end

      it "redirects to the created issue" do
        post :create, {:issue => valid_attributes}
        response.should redirect_to(Issue.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved issue as @issue" do
        Issue.any_instance.stub(:save).and_return(false)
        post :create, {:issue => {}}
        assigns(:issue).should be_a_new(Issue)
      end

      it "re-renders the 'new' template" do
        Issue.any_instance.stub(:save).and_return(false)
        post :create, {:issue => {}}
        response.should render_template("new")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested issue" do
      issue = @user.issues.create! valid_attributes
      expect {
        delete :destroy, {:id => issue.to_param}
      }.to change(Issue, :count).by(-1)
    end

    it "redirects to the issues list" do
      issue = @user.issues.create! valid_attributes
      delete :destroy, {:id => issue.to_param}
      response.should redirect_to(issues_url)
    end
  end

end
