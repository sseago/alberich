require "alberich/engine"

module Alberich
  mattr_accessor :user_class
  mattr_accessor :groups_for_user_method
  mattr_accessor :user_group_class
  mattr_accessor :permissioned_object_classes
  mattr_accessor :additional_privilege_scopes
  mattr_accessor :require_user_method
end
