class NotifyProductOwnerWorkerWorker
  include Sidekiq::Worker

  def perform(product_meta_id)
    meta = ProductMeta.find(product_meta_id)
    logger.info(meta.note)
  end
end
