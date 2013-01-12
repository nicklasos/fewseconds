class IssuesController < ApplicationController
  before_filter :authenticate_user!, except: [:index]
  before_filter :fix_paperclip, only: [:create, :update]
  
  def index
    @issues = Issue.all

    respond_to do |format|
      format.html
      format.json { render json: @issues }
    end
  end

  def show
    @issue = Issue.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render json: @issue }
    end
  end

  def new
    @issue = Issue.new
    @issue.questions.build

    respond_to do |format|
      format.html
      format.json { render json: @issue }
    end
  end

  def create
    @issue = current_user.issues.new(params[:issue])

    respond_to do |format|
      if @issue.save
        format.html { redirect_to @issue, notice: 'Issue was successfully created.' }
        format.json { render json: @issue, status: :created, location: @issue }
      else
        format.html { render action: "new" }
        format.json { render json: @issue.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @issue = current_user.issues.find(params[:id])
    @issue.destroy

    respond_to do |format|
      format.html { redirect_to issues_url }
      format.json { head :no_content }
    end
  end

  private

  def fix_paperclip
    params[:issue][:image].original_filename.gsub!(/:/, '') unless params[:issue][:image].blank?
  end
end