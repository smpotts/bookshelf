class Types::UserType < Types::BaseObject
  description "A user"

  field :id, ID, null: false
  field :email, String, null: true
  field :is_superadmin, Boolean, null: true

  def self.visibile?(context)
    !!context[:current_user]
  end
end
