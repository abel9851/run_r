class FullRecordsController < ApplicationController
  before_action :authenticate_user!

  def create
    full_record = FullRecord.new(permit_params)
    if full_record.save
      flash[:notice] = "フルのべストタイムを登録しました！"
      redirect_to new_record_path
    else
      redirect_to root_path
    end
  end

  def update
    full_record = FullRecord.where(user_id: current_user.id)
    if full_record.update(permit_params)
      flash[:notice] = "フルのべストタイムを編集しました！"
      redirect_to edit_record_path
    else
      redirect_to root_path
    end
  end

  def destroy
    full_record = FullRecord.where(user_id: current_user.id)
    full_record = full_record.ids
    full_record = FullRecord.find(full_record[0])
    if full_record.destroy
      flash[:notice] = "フルのべストタイムを削除しました！"
      redirect_to edit_record_path
    else
      redirect_to root_path
    end
  end

  private

  def permit_params
    params.permit(:hour_id, :minute_id, :second_id).merge(user_id: current_user.id)
  end
  
end