Sequel::Model.plugin :active_model

module Trestle
  module Adapters
    module SequelAdapter
      def collection(params={})
        admin.model.dataset
      end

      def find_instance(params)
        admin.model[params[:id]]
      end

      def build_instance(params={})
        admin.model.new(params)
      end

      def update_instance(instance, params)
        instance.set(params)
      end

      def save_instance(instance)
        instance.save
      end

      def delete_instance(instance)
        instance.destroy
      end

      def to_param(instance)
        instance
      end

      def unscope(scope)
        scope.unfiltered
      end

      def merge_scopes(scope, other)
        scope.where(id: other.select(:id))
      end

      def sort(collection, field, order)
        collection.order(Sequel.send(order, field))
      end

      def paginate(collection, params)
        collection = Kaminari.paginate_array(collection.to_a) unless collection.respond_to?(:page)
        collection.page(params[:page])
      end

      def count(collection)
        collection.count
      end

      def default_attributes
        reflections = admin.model.association_reflections
        admin.model.db_schema.map do |column_name, column_attrs|
          if reflection = reflections[column_name]
            Attribute::Association.new(admin, column_name, reflection.to_h[:orig_opts][:class_name].safe_constantize)
          else
            Attribute.new(admin, column_name, column_attrs[:type])
          end
        end
      end
    end
  end
end
