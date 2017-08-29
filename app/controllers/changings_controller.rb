# frozen-string-literal: true

class ChangingsController < CrudController
  protected

  def index_ordering
    Changing.order(change_time: :desc)
  end

  def record_link(changing)
    "<a href=\"#{url_for(changing)}\">#{l(changing.change_time, format: :short_time)} diaper change</a>"
  end

  def permitted_create_params
    %i(poop pee notes)
  end

  def create_params
    super.tap do |p|
      p[:change_time] = extract_time_param(:changing)
    end
  end
end
