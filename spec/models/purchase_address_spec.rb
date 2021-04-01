require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  before do
    @user = FactoryBot.create(:user, email: 'test2@example')
    @item = FactoryBot.create(:item)
    @purchase_address = FactoryBot.build(:purchase_address, item_id: @item.id, user_id: @user.id)
    sleep(1)
  end
  describe '購入情報の保存' do
    context '購入情報が保存できる場合' do
      it '必要事項が全てあれば保存ができること' do
        expect(@purchase_address).to be_valid
      end
      it '建物名が空の場合でも保存できること' do
        @purchase_address.building = ''
        expect(@purchase_address).to be_valid
      end
    end
    context '購入情報が保存できない場合' do
      it 'post_codeが空では保存できないこと' do
        @purchase_address.post_code = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Post code can't be blank")
      end
      it 'post_codeにハイフンがなければ保存できないこと' do
        @purchase_address.post_code = '1234567'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Post code is invalid')
      end
      it 'shipping_area_idが空では保存できないこと' do
        @purchase_address.shipping_area_id = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Shipping area can't be blank")
      end
      it 'shipping_are_idの1(--)を選択すると保存できないこと' do
        @purchase_address.shipping_area_id = 1
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Shipping area can't be blank")
      end
      it 'municipalityが空では保存できないこと' do
        @purchase_address.municipality = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Municipality can't be blank")
      end
      it 'addressが空では保存できないこと' do
        @purchase_address.address = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Address can't be blank")
      end
      it 'telephoneが空では保存できないこと' do
        @purchase_address.telephone = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Telephone can't be blank")
      end
      it 'telephoneは英数混合では登録できないこと' do
        @purchase_address.telephone = 'a0a0a0a0a0a'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Telephone is invalid')
      end
      it 'telephoneは12桁以上では登録できないこと' do
        @purchase_address.telephone = '000000000000'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Telephone is invalid')
      end
      it 'tokenが空では保存できないこと' do
        @purchase_address.token = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
      end
      it 'user_idが空の場合では保存できないこと' do
        @purchase_address.user_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空の場合では保存できないこと' do
        @purchase_address.item_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
