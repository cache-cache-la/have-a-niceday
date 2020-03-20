require 'rails_helper'

describe EntriesController do
  let(:user) { create(:user) }

  # 1. indexアクションで配列の要素を降順で取り出せるか、該当のviewが返ってくるか
  describe 'GET #index' do

    it "populates an array of entries ordered by created_at DESC" do
      entries = create_list(:entry, 3)
      get :index
      expect(assigns(:entries)).to match(entries.sort{ |a, b| b.created_at <=> a.created_at } )
    end

    it "renders the :index template" do
      get :index
      expect(response).to render_template :index
    end
  end

  # 2. newアクションで該当のviewが返ってくるか
  describe 'GET #new' do
    it "renders the :new template" do
      get :new
      expect(response).to render_template :new
    end
  end

  # 3. createアクションでログイン／非ログイン
  describe '#create' do
    let(:params) { { user_id: user.id, entry: attributes_for(:entry) } }

    # 3-1. ログイン
    context 'log in' do
      before do
        login user
      end
      # 3-1-1. 投稿の保存ができたら
      context 'can save' do
        subject {
          post :create,
          params: params
        }

        it 'count up entry' do
          expect{ subject }.to change(Entry, :count).by(1)
        end

        it 'redirects to root_path' do
          subject
          expect(response).to redirect_to(root_path)
        end
      end
      # 3-1-2. 投稿の保存に失敗したら
      context 'can not save' do
        let(:invalid_params) { { user_id: user.id, entry: attributes_for(:entry, title: nil, text: nil) } }

        subject {
          post :create,
          params: invalid_params
        }

        it 'does not count up' do
          expect{ subject }.not_to change(Entry, :count)
        end

        it 'redirects to new_entry_path' do
          subject
          expect(response).to redirect_to(new_entry_path)
        end
      end
    end

    # # 3-2. 非ログイン
    # context 'not log in' do
    #   it 'redirects to new_user_session_path' do
    #     post :create, params: params
    #     expect(response).to redirect_to(new_user_session_path)
    #   end
    # end
  end

  # 4. editアクションでインスタンス変数に期待の値が入っているか、該当のviewが返ってくるか
  describe 'GET #edit' do
    it "assigns the requested entry to @entry" do
      entry = create(:entry)
      get :edit, params: { id: entry }
      expect(assigns(:entry)).to eq entry
    end

    it "renders the :edit template" do
      entry = create(:entry)
      get :edit, params: { id: entry }
      expect(response).to render_template :edit
    end
  end

end