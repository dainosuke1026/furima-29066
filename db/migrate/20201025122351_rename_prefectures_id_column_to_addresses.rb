class RenamePrefecturesIdColumnToAddresses < ActiveRecord::Migration[6.0]
  def change
    rename_column :addresses, :prefectures_id, :prefecture_id
  end
end
