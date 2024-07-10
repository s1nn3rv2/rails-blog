class CoAuthor < ApplicationRecord
  belongs_to :user
  belongs_to :blog

  PERMISSIONS = {
    read: 0b001,
    write: 0b010,
    admin: 0b100
  }.freeze

  def add_permission(permission)
    self.permission |= PERMISSIONS[permission]
  end

  def remove_permission(permission)
    self.permission &= ~PERMISSIONS[permission]
  end

  def has_permission?(permission)
    (self.permission & PERMISSIONS[permission]) == PERMISSIONS[permission]
  end
end
