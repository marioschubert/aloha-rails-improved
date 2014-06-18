require 'active_support/core_ext/module/attribute_accessors'

module Aloha
  module Rails

    module Local

      mattr_accessor :local_base_url
      self.local_base_url = "/assets/aloha" # "http://local.aloha-editor.org/latest"

      mattr_accessor :local_script_url
      self.local_script_url = "#{self.local_base_url}/lib/aloha.js"

      mattr_accessor :local_stylesheet_url
      self.local_stylesheet_url = "#{self.local_base_url}/css/aloha.css"

      mattr_accessor :local_requirejs_url
      self.local_requirejs_url = "#{self.local_base_url}/lib/require.js"

      def aloha_requirejs_local
        options = {
            type: 'text/javascript',
            src: local_requirejs_url
        }
        content_tag :script, nil, options
      end

      def aloha_dependencies_local(options = {})
        aloha_requirejs_local
      end

      def aloha_local(options = {})
        aloha_script_tag_url(local_script_url, (options[:script] || {})) + aloha_stylesheet_tag_url(local_stylesheet_url, (options[:stylesheet] || {}))
      end

      def aloha_require_local(options = {})
        aloha_require(local_base_url, options)
      end
    end

  end
end
