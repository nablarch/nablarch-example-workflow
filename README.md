# nablarch-example-workflow

| master | develop |
|:-----------|:------------|
|[![Build Status](https://travis-ci.org/nablarch/nablarch-example-workflow.svg?branch=master)](https://travis-ci.org/nablarch/nablarch-example-workflow)|[![Build Status](https://travis-ci.org/nablarch/nablarch-example-workflow.svg?branch=develop)](https://travis-ci.org/nablarch/nablarch-example-workflow)|

# 実行手順 

## ビルド

``` sh
mvn clean package
```

データベースのセットアップとアプリケーションのビルドが実行されます。

## アプリケーション実行

```
mvn waitt:run
```

APサーバが起動し、ブラウザが立ち上がります。


# 本アプリケーションで使用するライブラリに関する補足説明

## H2 Database

このアプリケーションは[H2 Database](www.h2database.com/)を使用しています。
DB接続情報は、pom.xmlの`properties`セクションを参照してください。

## Lombok

このアプリケーションは[Lombok](https://projectlombok.org/)を使用しています。

IDEを使用する場合は、お使いのIDEに応じてLombokプラグインをインストールしてください。

- [IntelliJ IDEA](https://projectlombok.org/setup/intellij)
- [Eclipse](https://projectlombok.org/setup/eclipse)


IDEを使用せずにMavenでビルドおよび実行する場合は、プラグインは不要です。
