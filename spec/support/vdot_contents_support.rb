module VdotContents
  def vdot_contents(user)
    # 目安ペース説明のdropdownがある
    expect(page).to have_content('目安ペースの説明')
    # 走力レベル一覧・このvdot30中身（各距離・記録）がある
    expect(page).to have_content('vdot：30')
    expect(page).to have_content('5km')
    expect(page).to have_content('10km')
    expect(page).to have_content('ハーフ')
    expect(page).to have_content('フル')
    expect(page).to have_content('30分')
    expect(page).to have_content('40秒')
    expect(page).to have_content('63分')
    expect(page).to have_content('46秒')
    expect(page).to have_content('2時間')
    expect(page).to have_content('21分')
    expect(page).to have_content('04秒')
    expect(page).to have_content('4時間')
    expect(page).to have_content('49分')
    expect(page).to have_content('17秒')
    # 練習目安ペース一覧・このvdot30の中身（各ペースの種類・ペース）がある
    expect(page).to have_content('J')
    expect(page).to have_content('M')
    expect(page).to have_content('T-40')
    expect(page).to have_content('T-20')
    expect(page).to have_content('7:52')
    expect(page).to have_content('6:51')
    expect(page).to have_content('6:36')
    expect(page).to have_content('6:24')
    expect(page).to have_content('/km')
  end
end