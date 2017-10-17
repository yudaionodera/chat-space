class RemoveMemberIdFromGroups < ActiveRecord::Migration[5.0]
  def change
    remove_column :groups, :member_id, :string
  end
end
