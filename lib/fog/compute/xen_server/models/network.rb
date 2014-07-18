module Fog
  module Compute
    class XenServer
      module Models
        class Network < Fog::Model
          # API Reference here:
          # http://docs.vmd.citrix.com/XenServer/6.2.0/1.0/en_gb/api/?c=network

          provider_class :network

          identity :reference

          attribute :allowed_operations
          attribute :blobs
          attribute :bridge
          attribute :current_operations
          attribute :default_locking_mode
          attribute :description,         :aliases => :name_description,  :default => ''
          attribute :mtu,                 :aliases => :MTU
          attribute :name,                :aliases => :name_label,        :default => ''
          attribute :other_config,                                        :default => {}
          attribute :tags
          attribute :uuid

          has_many :pifs,  :pifs,         :aliases => :PIFs
          has_many :vifs,  :vifs,         :aliases => :VIFs

          def save
            requires :name
            ref = service.create_network name, attributes
            merge_attributes service.networks.get(ref).attributes
            true
          end
        end
      end
    end
  end
end