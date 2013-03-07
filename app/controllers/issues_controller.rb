class IssuesController < ApplicationController
  before_filter :authenticate_user!, except: [:index]
  before_filter :fix_paperclip, only: [:create, :update]

  def index
    @issues = Issue.all
  end

  def show
    @issue = Issue.find(params[:id])

    unless current_user.completed_issue?(@issue)
      render 'questions', layout: 'questions'
    end
  end

  def new
    @issue = Issue.new
    @issue.questions.build
  end

  def create
    @issue = current_user.issues.new(params[:issue])

    if @issue.save
      redirect_to @issue, notice: 'Issue was successfully created.'
    else
      render action: 'new'
    end
  end

  def destroy
    @issue = current_user.issues.find(params[:id])
    @issue.destroy

    redirect_to issues_url
  end

  def answer
    params[:answers].each {|index, body| Answer.create(question_id: index, body: body)}
    Complete.create(user_id: current_user.id, issue_id: params[:id])

    redirect_to :back
  end

  private

  def fix_paperclip
    params[:issue][:image].original_filename.gsub!(/:/, '') unless params[:issue][:image].blank?
  end
end
