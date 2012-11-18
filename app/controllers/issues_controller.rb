class IssuesController < ApplicationController
  before_filter :authenticate_user!, except: [:index]
  
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

    respond_to do |format|
      format.html
      format.json { render json: @issue }
    end
  end

  def edit
    @issue = Issue.find(params[:id])
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

  def update
    @issue = current_user.issues.find(params[:id])

    respond_to do |format|
      if @issue.update_attributes(params[:issue])
        format.html { redirect_to @issue, notice: 'Issue was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
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
end
