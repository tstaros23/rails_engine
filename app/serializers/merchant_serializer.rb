class MerchantSerializer
    include JSONAPI::Serializer
    attributes :name, :count
end
