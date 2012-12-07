require_dependency "brightcontent/application_controller"

module Brightcontent
  class BaseController < ApplicationController
    inherit_resources
    helper_method :list_fields, :form_fields

    def show
      redirect_to action: :edit
    end

    def create
      create! { polymorphic_url(resource_class) }
    end

    def update
      update! { polymorphic_url(resource_class) }
    end

    def destroy
      destroy! { polymorphic_url(resource_class) }
    end

    private

    def collection
      get_collection_ivar ||= end_of_association_chain.paginate(page: params[:page], per_page: per_page)
    end

    def per_page
      30
    end

    def list_fields
      form_fields
    end

    def form_fields
      resource_class.column_names - %w{id created_at updated_at password_digest}
    end

  end
end
