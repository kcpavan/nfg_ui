# frozen_string_literal: true

module NfgUi
  module Bootstrap
    module Components
      # Base Component
      # Defines conventional, shared behavior across
      # Bootstrap components
      class Base
        # attr_accessor :traits,
        #               :as,
        #               :id,
        #               :options,
        #               :view_context,
        #               :data,
        #               :heading,
        #               :body,
        #               :name

        attr_accessor :options,
                      :view_context,
                      :id,
                      :data,
                      :body

        def initialize(component_options, view_context)
          p "====== (Bootstrap::Components::Base) self.class.name: #{self.class.name} method: #{__method__}"
          @options = defaults.merge!(component_options)
          @view_context = view_context
          @id = options.fetch(:id, nil)
          @data = options.fetch(:data, {})
          # @name = component_class_name_string.underscore.downcase
          @body = options.fetch(:body, '')
          # @heading = options.fetch(:heading, '')
          # @traits = options.fetch(:traits, [])
          # @id = options.fetch(:id, '')
          # byebug
        end

        def html_options
          p "====== (Bootstrap::Components::Base) self.class.name: #{self.class.name} method: #{__method__}"
          options.except(*non_html_attribute_options)
                 .merge!(class: css_classes,
                         data: data,
                         **assistive_html_attributes)
                 .reject { |_k, v| v.blank? } # prevent empty attributes from showing up
                                              # Example: <div class>Text</div>
        end

        private

        # This is used to help identify where to find partials for rendering components.
        #
        # Set the component family, e.g.: :breadcrumb
        # on any sibling components.
        #
        # For example:
        # BreadcrumbItem & Breadcrumb are members of the :breadcrumb component_family
        # def component_family
        #   nil
        # end

        def defaults
          p "====== (Bootstrap::Components::Base) self.class.name: #{self.class.name} method: #{__method__}"
          {
            # HTML Defaults
            class: '',
            id: (nil if id.present?),

            # Content
            # heading: (nil if heading.present?),
            body: (nil if body.present?),
            data: ({} if data.present?),

            # Configuration
            # traits: ([] if traits.present?)
          }
        end

        # Assigned on individual components as needed
        # Ex: { role: 'alert' }
        #
        # If aria assistive html is needed, see:
        # Bootstrap::Utilities::AriaAssistable
        # avoid passing aria to assistive_html_attributes directly
        def assistive_html_attributes
          p "====== (Bootstrap::Components::Base) self.class.name: #{self.class.name} method: #{__method__}"
          @assistive_html_attributes ||= {}
        end

        # Fallback component css class name.
        # Overwritten within individual classes for situations like
        # Button's css class is 'btn'...
        # Example: returns 'alert' from NfgUi::Bootstrap::Components::Alert
        def component_css_class
          p "====== (Bootstrap::Components::Base) self.class.name: #{self.class.name} method: #{__method__}"
          @component_css_class ||= component_class_name_string.underscore.dasherize.downcase
        end

        def component_class_name_string
          p "====== (Bootstrap::Components::Base) self.class.name: #{self.class.name} method: #{__method__}"
          self.class.name.demodulize.to_s
        end

        # Manage or adjust the css_classes of the component by
        # adding a new string of css classes to this method
        # ex: super.push('new-class')
        def css_classes
          p "====== (Bootstrap::Components::Base) self.class.name: #{self.class.name} method: #{__method__}"
          @css_classes ||= [component_css_class, options[:class]].join(' ').squish
        end

        # Remove attributes from html_options that shouldn't show up in the
        # html element, ex: <div body='should not be here'>
        def non_html_attribute_options
          p "====== (Bootstrap::Components::Base) self.class.name: #{self.class.name} method: #{__method__}"
          @non_html_attribute_options ||= %i[body heading traits]
        end

        # Avoid usage of this method, it will likely be
        # phased out as traits mature
        # def trait_css_classes
        #   ''
        # end
      end
    end
  end
end
