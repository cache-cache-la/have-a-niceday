require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

CarrierWave.configure do |config|
  if Rails.env.production?
    config.storage = :fog
    config.fog_provider = 'fog/aws'
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: Rails.application.credentials.aws[:access_key_id],
      aws_secret_access_key: Rails.application.credentials.aws[:secret_access_key],
      region: 'ap-northeast-1'
      }

    config.fog_directory  = 'haveaniceday2020'
    config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/haveaniceday2020'

  else
    config.storage :file # 開発環境ではpublic/uploades下に保存
    config.enable_processing = false if Rails.env.test? #test環境では処理をスキップ
  end

  # 日本語ファイル名の設定
  CarrierWave::SanitizedFile.sanitize_regexp = /[^[:word:]\.\-\+]/

end