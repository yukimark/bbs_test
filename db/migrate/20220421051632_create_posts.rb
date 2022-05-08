class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    # テーブルやカラムに関する説明を書いておいた方がわかりやすいです
    # 例：create_table :posts, comment: '投稿' do |t|
    create_table :posts do |t|
      # モデル見ると必須項目っぽかったのでmigrationファイルの方でもnull :falseを書いておくとDBの方でも必須項目になってくれます
      # t.string :name, null: false, comment: '名称'
      t.string :name
      t.text :text

      t.timestamps

      # t.datetime :deleted_atみたいなのを入れとくと論理削除もできます
      # 物理削除と論理削除について https://qiita.com/mailok1212/items/c5a1682e4f02eb0aea71
    end
  end
end
