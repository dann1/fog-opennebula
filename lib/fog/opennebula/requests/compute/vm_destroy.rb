module Fog

  module Compute

    class OpenNebula

      class Real

        def vm_destroy(id)
          vmpool = ::OpenNebula::VirtualMachinePool.new(client)
          vmpool.info(-2, id, id, -1)

          vmpool.each do |vm|
            # true => delete and recreate vm
            vm.delete(false)
          end
        end

      end

      class Mock

        def vm_destroy(id)
          response = Excon::Response.new
          response.status = 200

          data['vms'].each do |vm|
            data['vms'].delete(vm) if vm['id'] == id
          end
          true
        end

      end

    end

  end

end
