# frozen-string-literal: true

class FeedingsController < CrudController
  protected

  def permitted_create_params
    %i(amount left_breast right_breast formula milk notes)
  end

  def create_params
    super.tap do |p|
      p[:start_time] = extract_time_param(:feeding)
    end
  end

  def default_attributes
    { left_breast: 15, right_breast: 15 }
  end

  def record_link(feeding)
    "<a href=\"#{url_for(feeding)}\">#{l(feeding.start_time, format: :short_time)} feeding</a>"
  end
end
