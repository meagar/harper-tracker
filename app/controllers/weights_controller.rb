# frozen-string-literal: true

class WeightsController < CrudController
  def index_ordering
    WeighIn.order(weigh_time: :desc)
  end

  def record_link(_weigh_in)
    'Weigh-in'
  end

  def model_class
    WeighIn
  end

  def permitted_create_params
    %i(weigh_time weight notes)
  end
end
