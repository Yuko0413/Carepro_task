*  ER図、ワイヤーフレーム
* https://docs.google.com/presentation/d/1sIByIXo7z7BatT1AlgayihkRxQZzui5ypFmTy110etI/edit?usp=sharing

* 画面遷移図
* https://drive.google.com/file/d/1vNb5Pl-0L3tzJLXtR42_HfszNF5qt1ys/view?usp=sharing

* 要件定義
* https://docs.google.com/spreadsheets/d/1RgT9PrBQE0y6zW87PX5kByHksjAUUqbUdIcsemPBwgE/edit?usp=sharing

* 開発言語：ruby 3系（ruby 3.3.0 (2023-12-25 revision 5124f9ac75) [x86_64-linux]）
* Ruby on rails 6系（Rails 6.1.7.7）
* cloneして実行までは下記を参照ください。
* 
まずクローンするためのコマンドをgitに入力する。
$git clone [url]

クローンが完了したらブランチを切る。
$git checkout -b ブランチ名

ブランチを切ったらrailsをローカルで動かしていくためのソフトをインストールしていく。
$rbenv install

rbenvを使ってrailsのバージョンを指定
$rbenv local 2.6.6

Node.jsをローカル環境で動かすためのソフトをインストール
$brew install nodenv

$nodenv local v18.18.0

Gemfileをインストール
$bundle install --without production

yarnをインストールする
$yarn install

データベースの準備とサーバー立ち上げ
$rails db:migrate
$rails s

* https://madogiwa0124.hatenablog.com/entry/2017/03/26/133051
