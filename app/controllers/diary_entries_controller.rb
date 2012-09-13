class DiaryEntriesController < ApplicationController
  before_filter :authenticate_user!
  respond_to :html, :json

  def index
    @user = current_user
    @entries = @user.diary_entries

    respond_with(@entries)
  end

  def show
    @entry = DiaryEntry.find(params[:id])
    if @entry.user == current_user
      respond_with(@entry)
    else
      raise ActionController::RoutingError.new('Not Found')
    end
  end

  def new
    @diary_entry = DiaryEntry.new
  end

  def create
    @diary_entry = DiaryEntry.new(params[:diary_entry])
    @diary_entry.user_id = current_user.id
    @diary_entry.save

    redirect_to diary_entries_path
  end
end
