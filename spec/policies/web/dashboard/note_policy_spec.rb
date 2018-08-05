# frozen_string_literal: true

# frozen_literal_string: true

require 'rails_helper'

describe Dashboard::NotePolicy do
  subject { described_class.new(user, nil) }

  context 'current user has role staff or mentor' do
    let(:user) { create(:user, :active, :staff_or_mentor) }

    it { is_expected.to permit_action(:new) }
    it { is_expected.to permit_action(:create) }
  end

  context 'current user has role author or developer' do
    let(:user) { create(:user, :active, :developer_or_author) }

    it { is_expected.not_to permit_action(:new) }
    it { is_expected.not_to permit_action(:create) }
  end
end