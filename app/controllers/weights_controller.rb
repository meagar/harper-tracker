# frozen-string-literal: true

class WeightsController < CrudController
  def model_class
    WeighIn
  end

  def record_link(_weigh_in)
    'Weigh-in'
  end

  def permitted_create_params
    super + %i(weigh_time weight)
  end
end
