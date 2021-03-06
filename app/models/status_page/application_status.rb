module StatusPage
  class ApplicationStatus < Status
    def check
      super
      StatusPage.checks.each do |klass_name|
        status = klass_name.constantize.check
        @errors   += status.errors
        @warnings += status.warnings
      end
    end

    def simulate_error
      @errors << "Simulated error"
    end

    def simulate_warning
      @warnings << "Simulated warning"
    end
  end
end
