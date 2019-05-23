module CommissionHub
  module CommissionJunctionGraphql
    class Connection < CommissionHub::Connection

      def_endpoint :publisher_commissions, 'query', class: :PublisherCommissions
      
      def initialize(settings)
        @settings = settings
      end

    end
  end
end

