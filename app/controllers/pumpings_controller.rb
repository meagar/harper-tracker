# frozen-string-literal: true

class PumpingsController < CrudController
  protected

  def permitted_create_params
    super + %i(left right pump_time)
  end

  def create_params
    super.tap do |p|
      p[:pump_time] = extract_time_param(:pumping)
    end
  end

  def record_link(pumping)
    "<a href=\"#{url_for(pumping)}\">#{l(pumping.pump_time, format: :short_time)} pumping</a>"
  end
end
