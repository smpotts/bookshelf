module Types
  class MutationType < Types::BaseObject
    field :create_author, Types::AuthorType, mutation: Mutations::CreateAuthor

    field :update_author, Boolean, null: false, description: "Updates an author" do
      argument :author, Types::AuthorInputType, required: true
    end

    def update_author(author:)
      existing = Author.where(id: author[:id]).first
      existing&.update(author.to_h)
    end

    field :delete_author, Boolean, null: false, description: "Deletes an author" do
      argument :id, ID, required: true
    end

    def delete_author(id:)
      Author.where(id: id).destroy_all
      true
    end
  end
end
