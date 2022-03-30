# pgライブラリを使用する
require 'pg'

# PG::connect(dbname: "goya")により、rubyからgoyaDBに接続し
# 接続したという情報をconnectionという名前の変数に格納する
connection = PG::connect(dbname: "goya")
connection.internal_encoding = "UTF-8"

begin
  # connection変数を使いPostgreSQLを操作する
  # .execで、goyaDBに"select weight, give_for from crops;"
  # のSQLの命令文を直接実行し、その結果をresult変数に格納する

  #ここでdbname: "goya"のcropsテーブルの全カラムを取得している
  #どのデータを抽出表示するかはここでは指定していない。
  result = connection.exec("SELECT * FROM crops;")
  # result = connection.exec("select weight, give_for from crops;")

  # 取り出した各行を処理する
  result.each do |record|
      # 各行を取り出し、putsでターミナル上に出力する
      # 重さの表示をする必要"weight"の箇所は、そのまま重さが表示されているが、
      # この重さと譲渡先と表示されている対象が全て品質が悪いもの（false）のgoyaの情報ということ？
      # データの型がweight
      puts "ゴーヤの大きさ：#{record["weight"]}　売った相手：#{record["give_for"]}"
  end

ensure
  # 最後に.finishでデータベースへのコネクションを切断する
  connection.finish
end
