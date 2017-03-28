class AddSlugToBlogKhrystynaKolyadas < ActiveRecord::Migration
  def change
    add_column :blog_khrystyna_kolyadas, :slug, :string
    add_index :blog_khrystyna_kolyadas, :slug, unique: true
  end
end
