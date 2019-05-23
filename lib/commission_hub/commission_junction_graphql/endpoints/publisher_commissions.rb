module CommissionHub
  module CommissionJunctionGraphql
    module Endpoints
      class PublisherCommissions < CommissionHub::Endpoint
        
        def call(request_params={})
          raise ArgumentError.new('the argument forPublishers is required') unless request_params.key? :forPublishers
          connection.class.post(full_uri, body: query(request_params), headers: { "Authorization" => authorization_token })
        end

        private
        def authorization_token
          connection.settings.authorization_token
        end

        def query(params)
          %Q{
            {
              publisherCommissions(#{ build_query_params(params) }) {
                count
                maxCommissionId
                payloadComplete
                records {
                  actionStatus
                  actionTrackerId
                  actionTrackerName
                  actionType
                  advertiserId
                  advertiserName
                  aid
                  clickDate
                  clickReferringURL
                  commissionId
                  concludingBrowser
                  concludingDeviceName
                  concludingDeviceType
                  country
                  coupon
                  eventDate
                  initiatingBrowser
                  initiatingDeviceName
                  initiatingDeviceType
                  isCrossDevice
                  items {
                    commissionItemId
                    discountAdvCurrency
                    discountPubCurrency
                    discountUsd
                    itemListId
                    perItemSaleAmountAdvCurrency
                    perItemSaleAmountPubCurrency
                    perItemSaleAmountUsd
                    quantity
                    situations
                    sku
                    totalCommissionAdvCurrency
                    totalCommissionPubCurrency
                    totalCommissionUsd
                  }
                  lockingDate
                  orderDiscountAdvCurrency
                  orderDiscountOrigCurrency
                  orderDiscountPubCurrency
                  orderDiscountUsd
                  orderId
                  original
                  originalActionId
                  postingDate
                  pubCommissionAmountPubCurrency
                  pubCommissionAmountUsd
                  publisherId
                  publisherName
                  reviewedStatus
                  saleAmountAdvCurrency
                  saleAmountPubCurrency
                  saleAmountUsd
                  shopperId
                  sid
                  siteToStoreOffer
                  situations
                  source
                  verticalAttributes {
                    age
                    applicationStatus
                    apr
                    aprTransfer
                    aprTransferTime
                    bookingDate
                    bookingStatus
                    bookingValuePostTax
                    bookingValuePreTax
                    brand
                    brandId
                    businessUnit
                    campaignId
                    campaignName
                    carOptions
                    category
                    city
                    class
                    confirmationNumber
                    contractLength
                    contractType
                    countryCode
                    couponDiscount
                    couponType
                    creditLine
                    creditQuality
                    creditReport
                    cruiseType
                    custCountry
                    custPostCode
                    custSegment
                    custStatus
                    custType
                    delivery
                    destCity
                    destCountry
                    destState
                    domestic
                    dropoffIata
                    dropoffId
                    duration
                    endDateTime
                    flightFareType
                    flightOptions
                    flightType
                    flyerMiles
                    fundedAmount
                    genre
                    guests
                    iata
                    introductoryApr
                    introductoryAprTime
                    itemId
                    itemName
                    itemType
                    itineraryId
                    lifestage
                    location
                    loyaltyEarned
                    loyaltyLevel
                    loyaltyRedeemed
                    loyaltyStatus
                    minBalance
                    minDeposit
                    minStayDuration
                    noCancellation
                    orCity
                    orCountry
                    orState
                    paidAtBookingPostTax
                    paidAtBookingPreTax
                    paymentMethod
                    paymentModel
                    pickupIata
                    pickupId
                    platformId
                    port
                    preorder
                    prepaid
                    prequalify
                    promotion
                    promotionAmount
                    quantity
                    rating
                    rooms
                    roomType
                    serviceType
                    shipName
                    startDateTime
                    state
                    subscriptionFee
                    subscriptionLength
                    transferFee
                    travelType
                    tripType
                    upsell
                  }
                  websiteId
                  websiteName
                }
              }
            }
          }
        end

        def build_query_params(params)
          params.map { |k, v| "#{k}: \"#{v}\"" }.join(', ')
        end
      end
    end
  end
end


