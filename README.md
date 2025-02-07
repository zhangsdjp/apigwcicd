# CICD example
## 概要
- [AWS Lambda 統合を選択するチュートリアル](https://docs.aws.amazon.com/ja_jp/apigateway/latest/developerguide/getting-started-with-lambda-integration.html)を対象としたCICDパイプラインを作成するサンプルです
## 前提条件
- 操作可能なAWSアカウントがあること
## パイプライン構築手順
張頼んだ

## パイプラインステージ概要
### Source
- CodeCommitからソースコードを取得しビルドします
### Analyze
- ソースコードをSonarQubeを利用して静的解析を実施します。QualityGateの基準に満たないものはパイプラインが失敗します
### Build
- 資材を対象をビルドします
### Build-Deploy
- ？？？

### Deploy

# 【内部】
## 疑問メモ
- 「承認」ボタンでDeployするって作ってなかったっけ？
