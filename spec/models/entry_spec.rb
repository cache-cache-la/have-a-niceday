require 'rails_helper'

describe Entry do
  describe '#create' do
   # 1. titleとtext、user_idが存在すれば投稿できること
    it "is valid with a title, text" do
      entry = build(:entry)
      expect(entry).to be_valid
    end

    # 2. titleが空では投稿できないこと
    it "is invalid without a title" do
      entry = build(:entry, title: nil)
      entry.valid?
      expect(entry.errors[:title]).to include("を入力してください")
    end

    # 3. textが空では投稿できないこと
    it "is invalid without a text" do
      entry = build(:entry, text: nil)
      entry.valid?
      expect(entry.errors[:text]).to include("を入力してください")
    end

    # 4. titleが51文字以上であれば投稿できないこと
    it "is invalid with a title that has more than 51 characters " do
      entry = build(:entry, title: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
      entry.valid?
      expect(entry.errors[:title]).to include("は50文字以内で入力してください")
    end

    # 5. titleが50文字以下なら投稿できること
    it "is valid with a title that has less than 50 characters " do
      entry = build(:entry, title: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
      expect(entry).to be_valid
    end

    # 6. textが256文字以上であれば投稿できないこと
    it "is invalid with a title that has more than 256 characters " do
      entry = build(:entry, text: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
      entry.valid?
      expect(entry.errors[:text]).to include("は255文字以内で入力してください")
    end

    # 7. textが255文字以下なら投稿できること
    it "is valid with a title that has less than 255 characters " do
      entry = build(:entry, text: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
      expect(entry).to be_valid
    end
  end
end