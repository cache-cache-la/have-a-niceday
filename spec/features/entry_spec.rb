# require 'rails_helper'

# feature 'entry', type: :feature do
#   let(:user) { create(:user) }

#   scenario 'post entry' do
#     # ログイン前には投稿ボタンがない
#     visit root_path
#     expect(page).to have_no_content('新規投稿')

#     # ログイン処理
#     visit new_user_session_path
#     fill_in 'user_email', with: user.email
#     fill_in 'user_password', with: user.password
#     find('input[value="Log in"]').click
#     expect(current_path).to eq root_path
#     expect(page).to have_content('新規投稿')

#     # 記事の投稿
#     expect {
#       click_link('新規投稿')
#       expect(current_path).to eq new_entry_path
#       fill_in 'title', with: 'フィーチャスペックのテスト'
#       fill_in 'text', with: 'フィーチャスペックのテストを行っています'
#       find('input[type="submit"]').click
#     }.to change(Entry, :count).by(1)
#   end

# end