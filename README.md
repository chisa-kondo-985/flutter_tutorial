# flutter_tutorial

このプロジェクトには、PSP 株式会社の Flutter の入門課題の自分の回答をアップロードしています。

## 課題リスト

◼️ 課題 1-1:レイアウトを変える

- 背景の色を変える（例えばピンク）
- 文字（’You have pushed the button this many times:’）のサイズを大きくする
- 画面の上半分の真ん中に文字、下半分の真ん中に数字が表示されるようにする

  <img src="demo_images/layout1.png" width="200">
  <br><br>

◼️ 課題 1-2: レイアウトを変える

- 文字の部分を入力フォームに変更
- 数字の部分を「次へ」ボタンに変更
- 数字を入力して「次へ」ボタンを押すと、違うページに画面遷移して入力した文字が画面中央に表示されるようにする
- 数字以外の文字を入力すると、入力エラーのダイアログを出す

  <img src="demo_images/question1-2.gif" width="200">
  <br><br>

◼️ 課題 2: データ入力画面を作る

- 氏名（入力フォーム）、性別（ラジオボタン）、出身地（CupertinoPicker）の入力欄と「次へ」ボタンを作成する
- それぞれの情報を入力して「次へ」ボタンを押すと、違うページに画面遷移して入力した情報がすべて表示されるようにする
- 名前（テキストフィールド）、性別（ラジオボタン）、出身地（CupertinoPicker）が選択されていない時にフォームを送信できないようにする

  <img src="demo_images/question2_bug_fixed.gif" width="200">
  <br><br>

◼️ 課題 3: データ入力画面の値保持

- sharedPreferences ライブラリを使って、入力された情報をスマホに保存できるようにする
- アプリを落としてまた開いたときに保存した情報を取り出して、氏名・性別・出身地の入力欄に表示させる
- （コメントアウトしていますが）sharedPreferences に保存した情報を消せるようにする

  <img src="demo_images/question3.gif" width="200">
  <br><br>

◼️ 課題 4: 一覧・詳細表示画面を作る

- 好きなバンドを３つから４つ挙げ、グループ名のリストを一覧表示する
- それぞれのグループ名をタップすると、画面遷移してそのグループの詳細情報が表示される
- 各グループの詳細表示で表示する情報：
  - グループ名
  - グループの画像
  - 結成年
  - メンバー情報：
    - メンバーの名前
    - 年齢
    - 担当楽器やパート
- バンドグループとメンバーはそれぞれクラスを作成する
- Enum クラスを使用して、バントの役割を定義する
- 役割ごとに表示を変更する（今回は役割ごとにアイコンをつけることにしました）

  <img src="demo_images/question4_fixed_compressed.gif" width="200">
  <br><br>

◼️ 課題 5: 住所検索

- 住所検索 API(https://zipcloud.ibsnet.co.jp/doc/api)を利用する
- 入力フォームに郵便番号を入力して「検索」ボタンを押すと、検索結果の住所が表示される

  <img src="demo_images/question5.gif" width="200">
  <br><br>

◼️ 課題 6:

- アプリを開いたときに API 通信を行い、リンク(https://jsonplaceholder.typicode.com/users)を用いて JSON データを取得して一覧表示をする
- タップして詳細画面へ遷移する
- リストにソート機能をつける（ソートの方法やメソッドは Enum クラスで管理する）

  <img src="demo_images/question6-2.gif" width="200">
  <br><br>

## リンク集

- [Flutter の入門課題](https://note.com/psp_tech/n/n4fb6bf4afc4a)
- [トレーナーの方の解答例の解説](https://note.com/psp_tech/n/n458b782a5242)
