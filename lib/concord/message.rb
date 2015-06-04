require 'json'

module Concord
  class Message
    attr_reader :raw

    def initialize(raw)
      @raw = raw
    end

    def context
      @context ||= JSON.parse(raw['Body'])
    end

    def body
      @body ||= JSON.parse(context['Message'], quirks_mode: true)
    end

    def id
      raw['MessageId']
    end

    def receipt_handle
      raw['ReceiptHandle']
    end
  end
end
