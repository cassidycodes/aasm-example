class Product < ActiveRecord::Base
  include AASM

  has_one :product_meta

  aasm column: 'state' do
    state :pending, initial: true
    state :published
    event :approve, after_commit: :create_meta_notify_product_owner do
      transitions from: :pending, to: :published
    end
  end

  private

  def create_meta_notify_product_owner
    meta = ProductMeta.create(product: self, note: 'A very good product.')
    Rails.logger.info(
      "product_meta id: #{meta.id} exists? #{ProductMeta.exists?(meta.id)}"
    )
    NotifyProductOwnerWorkerWorker.perform_async(meta.id)
    sleep 2
  end
end
