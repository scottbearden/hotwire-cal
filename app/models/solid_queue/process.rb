module SolidQueue
  class Process < ApplicationRecord
    # Assuming these are the required attributes
    attr_accessor :name, :status, :last_run_at, :kind, :pid, :hostname, :supervisor_id

    # Placeholder for the register method
    # def self.register
    #   # Implementation of the register method
    # end
  end
end
