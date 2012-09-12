class DiaryEntriesController < ApplicationController
  def index
    @entries = DiaryEntry.all
  end
end
