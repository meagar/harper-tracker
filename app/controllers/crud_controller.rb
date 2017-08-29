# frozen-string-literal: true

class CrudController < ApplicationController
  before_action :require_user

  before_action :find_singular_record, only: %i(show edit update destroy)

  include ApplicationHelper

  def index
    self.plural = index_ordering
  end

  def show
  end

  def new
    self.singular = model_class.new(default_attributes)
  end

  def create
    self.singular = model_class.new(create_params)

    if singular.save
      redirect_to :root, notice: "#{record_link(singular)} created"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if singular.update(update_params)
      redirect_to :root, notice: "#{record_link(singular)} updated"
    else
      render :new
    end
  end

  def destroy
    singular.destroy
    redirect_to :root, notice: "#{model_class.name} deleted"
  end

  protected

  def model_class
    controller_name.singularize.titleize.constantize
  end

  def index_ordering
    model_class.order(id: :desc)
  end

  def singular_record_name
    controller_name.singularize
  end

  def plural_record_name
    controller_name
  end

  def record_link(_)
    raise 'define me in sub class'
  end

  def find_singular_record
    self.singular = model_class.find(params[:id])
  end

  def permitted_create_params
    raise 'Define me in sub-class'
  end

  def permitted_update_params
    permitted_create_params
  end

  def create_params
    params.require(singular_record_name).permit(*permitted_create_params)
  end

  def update_params
    create_params
  end

  def default_attributes
    {}
  end

  private

  def singular=(value)
    instance_variable_set("@#{singular_record_name}", value)
  end

  def singular
    instance_variable_get("@#{singular_record_name}")
  end

  def plural=(value)
    instance_variable_set("@#{plural_record_name}", value)
  end

  def plural
    instance_variable_get("@#{plural_record_name}")
  end

end
