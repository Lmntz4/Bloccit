describe Vote do
  describe "validations" do
    describe "value validation" do
      it "only allows -1 or 1 as values" do
        a = Vote.new(value: 1)
        expect(a.valid?).to eq(true)
        b = Vote.new(value: -1)
        expect(b.valid?).to eq(true)
        c = Vote.new(value: 5)
        expect(c.valid?).to eq(false)
      end
    end
  end
end