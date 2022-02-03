# frozen_string_literal: true

describe User, type: :model do
  it { is_expected.to validate_presence_of :email }

  it { is_expected.to have_db_column(:email).of_type(:string).with_options(null: false) }
end
