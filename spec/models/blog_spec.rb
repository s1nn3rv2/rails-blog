require 'rails_helper'

RSpec.describe Blog, type: :model do
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:visibility) }
  it { is_expected.to validate_presence_of(:user_id) }

  it { is_expected.to have_db_column(:id).of_type(:integer) }
  it { is_expected.to have_db_column(:visibility).of_type(:integer) }

  it { should belong_to(:user) }
end
