require 'spec_helper'

RSpec.describe 'CommissionHubCJGraphQL' do
  before do
    CommissionHub.setup do |config|
      config.setup :commission_junction_graphql do |c|
        c.base_uri = 'https://commissions.api.cj.com'
        c.authorization_token = ENV['CJ_API_KEY']
      end
    end
  end

  let(:connection) { CommissionHub.initialize_connection(:commission_junction_graphql) }

  context '.publisher_commissions(mapper:, request_params:)' do
    subject do
      s = nil
      VCR.use_cassette("publisher_commissions", record: :new_episodes) do
        connection.publisher_commissions(mapper: ->(r){ JSON.parse r }, request_params: { forPublishers: ENV['CJ_PUBLISHER_ID'] }) do |result|
          s = result
        end
      end
      s
    end

    it 'raise argument error if forPublisher is not present' do
      expect { connection.publisher_commissions(mapper: ->(r){ JSON.parse r }, request_params: {}) }.to raise_error(ArgumentError)
    end

    it 'returns number of of commissions' do
      expect(subject.dig('data', 'publisherCommissions', 'count')).to eq(55)
    end

    it 'returns max commission ID' do
      expect(subject.dig('data', 'publisherCommissions', 'maxCommissionId')).to eq("2480887623")
    end

    it 'returns payloadComplete field' do
      expect(subject.dig('data', 'publisherCommissions', 'payloadComplete')).to eq(true)
    end

    context 'records' do
      it 'should be and array' do
        expect(subject.dig('data', 'publisherCommissions', 'records')).to be_a(Array)
      end

      it 'size should be equal publisherCommissions.count' do
        expect(subject.dig('data', 'publisherCommissions', 'records').count).to eq(subject.dig('data', 'publisherCommissions', 'count'))
      end
    end
  end
end