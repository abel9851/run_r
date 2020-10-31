class VdotsController < ApplicationController
  # 走力レベルの取得などまとめてある
  include Vdots

  def index
    # 走力レベルの指標（タイム・推奨ペース）をすべて取得
    @vdot_records = VdotRecord.all
    @vdot_paces = VdotPace.all

    # 自分がログインしているか、他ユーザーのparamsが存在すれば、userのidを取得
    # ※そのユーザーに走力レベルが存在すれば、該当箇所マーキングするのに使用
    @user = User.find_by(id: params[:user_id]) if params[:user_id]

    # get_recordメソッドに渡す引数（他ユーザーまたは、自分）を分岐
    if params[:user_id]
      user_id = params[:user_id]
    elsif user_signed_in?
      user_id = current_user.id
    end

    # 各ベストタイムのレコードを取得
    get_record(user_id)

    # 登録してある5kmのベストタイムを元に、5kmの走力レベルを取得
    get_five_vdot

    # 登録してある10kmのベストタイムを元に、10kmの走力レベルを取得
    get_ten_vdot

    # 登録してあるハーフのベストタイムを元に、ハーフの走力レベルを取得
    get_half_vdot

    # 登録してあるフルのベストタイムを元に、フルの走力レベルを取得
    get_full_vdot
  end
end
