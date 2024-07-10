require 'rails_helper'

RSpec.describe User, type: :model do
  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to validate_presence_of(:password) }
  it { is_expected.to validate_uniqueness_of(:email).case_insensitive }
  it { is_expected.to allow_value('example@example.com').for(:email) }
  it { is_expected.not_to allow_value('invalid_email').for(:email) }

  it { is_expected.to have_db_column(:id).of_type(:integer) }
  it { is_expected.to have_db_column(:email).of_type(:string).with_options(null: false) }
  it { is_expected.to have_db_column(:encrypted_password).of_type(:string).with_options(null: false) }
  it { is_expected.to have_db_column(:reset_password_token).of_type(:string) }
  it { is_expected.to have_db_column(:reset_password_sent_at).of_type(:datetime) }
  it { is_expected.to have_db_column(:remember_created_at).of_type(:datetime) }
  it { is_expected.to have_db_column(:created_at).of_type(:datetime).with_options(null: false) }
  it { is_expected.to have_db_column(:updated_at).of_type(:datetime).with_options(null: false) }

  it { should have_many(:blogs).dependent(:destroy) }
  it { should have_many(:posts)}
  it { should have_one(:profile).dependent(:destroy) }

  let(:user) { create(:user) }

  it 'should have a profile' do
    expect(user.profile).not_to be_nil
  end
end
