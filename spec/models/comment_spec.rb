require 'rails_helper'

describe Comment do
  describe '#create' do
   # 1. text, user_id, entry_idが存在すれば登録できること
    it "is valid with a text, user_id, entry_id" do
      user = create(:user)
      entry = create(:entry, user_id: user.id)
      comment = build(:comment, user_id: user.id, entry_id: entry.id)
      expect(comment).to be_valid
    end

    # 2. textが空では送れないこと
    it "is invalid without a text" do
      user = create(:user)
      entry = create(:entry, user_id: user.id)
      comment = build(:comment, text: nil, user_id: user.id, entry_id: entry.id)
      comment.valid?
      expect(comment.errors[:text]).to include("を入力してください")
    end

    # 3. textが101文字以上であれば登録できないこと
    it "is invalid with a text that has more than 101 characters " do
      user = create(:user)
      entry = create(:entry, user_id: user.id)
      comment = build(:comment, text: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", user_id: user.id, entry_id: entry.id)
      comment.valid?
      expect(comment.errors[:text]).to include("は100文字以内で入力してください")
    end

    # 4. nicknameが100文字以下では登録できること
    it "is valid with a text that has less than 100 characters " do
      user = create(:user)
      entry = create(:entry, user_id: user.id)
      comment = build(:comment, text: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", user_id: user.id, entry_id: entry.id)
      expect(comment).to be_valid
    end
  end
end