# frozen_string_literal: true

RSpec.describe CheckoutService do
  subject(:order) { described_class.new(promotional_rules) }

  let(:product_scraf) { create(:product, :scarf) }
  let(:product_cufflinks) { create(:product, :cufflinks) }
  let(:product_dress) { create(:product, :dress) }
  let(:promotional_item) { create(:promotional_item, product: product_scraf) }
  let(:promotional_order) { create(:promotional_order) }
  let(:promotional_rules) { PromotionalRulesService.call }

  before(:each) do
    product_scraf && product_cufflinks && product_dress
    promotional_item
    promotional_order
  end

  describe ".new" do
    it "creates new basket" do
      expect { order }.to change { Basket.count }.by(1)
    end
  end

  describe ".scan" do
    subject(:scan) { order.scan(product_code) }

    context "when product code exist" do
      let(:product_code) { product_cufflinks.code }

      it "adds product to basket" do
        expect { scan }.to change { BasketProduct.count }.by(1)
        expect(order.basket.products).to include(product_cufflinks)
      end
    end

    context "when product code not exist" do
      let(:product_code) { "i'm not real code" }

      it "raises error" do
        expect { scan }.to raise_error(ActiveRecord::RecordNotFound, "Couldn't find Product")
      end
    end
  end

  describe ".total" do
    subject(:total) { order.total }
    context "whent test case 1" do
      before(:each) do
        order.scan("001")
        order.scan("002")
        order.scan("003")
      end

      it { is_expected.to eq("£66.78") }
    end

    context "whent test case 2" do
      before do
        order.scan("001")
        order.scan("003")
        order.scan("001")
      end

      it { is_expected.to eq("£36.95") }
    end

    context "whent test case 3" do
      before do
        order.scan("001")
        order.scan("002")
        order.scan("001")
        order.scan("003")
      end

      it { is_expected.to eq("£73.76") }
    end
  end
end
