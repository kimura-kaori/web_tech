# データを受け取り、返却するCGIプログラムの起動
require 'cgi'
cgi = CGI.new

# データを受け取った後、HTMLの形式でレスポンスを返す
cgi.out("type" => "text/html", "charset" => "UTF-8") {
  # 情報の目印とした"goya"のデータを cgi['goya']と言う記述で取り出し、ローカル変数に代入する
  #これはどこに繋がってる？
  get = cgi['goya']

  # ここの
  # HTMLでレスポンスを返却する
  "<html>
    <body>
      <p>ゴーヤの大きさと売った相手の情報は下記になります</p>
      文字列：#{get}

    </body>
  </html>"
}

# goya.rbは、下記のリクエストの受け取り先

# <% result = connection.exec("SELECT * FROM crops WHERE NOT (give_for = '自家消費') ;") %>
# <% data = [] %>
#
# <% result.each do |record| %>
#   <%  data << "ゴーヤの大きさ：#{record["weight"]}　売った相手：#{record["give_for"]}" %>
# <% end %>
#
#
# <form action="goya.cgi" method="POST">
#    下記のボタンを押すと、ゴーヤを売った相手の情報ページに飛びます<br><br>
#    <!-- valueには、送りたいデータを代入する -->
#    <!-- name="goya"を、情報の目印とする -->
#   <input type="text" name="goya" value="<%= data.join(' ') %>">
#        <!-- 送信をクリックすると、goya.cgi（goya.rb)に飛ぶ -->
#   <input type="submit" name="送信" >
#
# </form>
#
# <% result = connection.exec("SELECT * FROM crops WHERE quality = false;") %>
# <% data = [] %>
#
# <% result.each do |record| %>
#  <%  data << "ゴーヤの大きさ：#{record["weight"]}　売った相手：#{record["give_for"]}" %>
# <% end %>
# <!-- form action="kgoya.cgi"で、kadai.rbに飛んでる -->
# <form action="goya.cgi" method="POST">
#    下記のボタンを押すと、ゴーヤの品質情報ページに飛びます<br><br>
#    <!-- valueには、送りたいデータを代入する -->
#    <!-- name="goya"を、情報の目印とする -->
#   <input type="text" name="goya" value="<%= data.join(' ') %>">
#   <!-- input type="submit"をクリックさせた時、リクエストを受け付けている。 -->
#   <input type="submit" name="送信" >
#
# </form>
