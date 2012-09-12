class DiaryEntriesController < ApplicationController
  before_filter :authenticate_user!

  def index
    @user = current_user

    @entries = @user.diary_entries
  end

  def new
    @user = current_user
    @diary_entry = @user.diary_entries.build
  end

  def create
    @diary_entry = DiaryEntry.new(params[:diary_entry])
    @diary_entry.save

    # should check @diary_entry.user == current_user
    # else anyone can post as another user...

    redirect_to diary_entries_path
  end
end
