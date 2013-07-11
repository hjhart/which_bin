require 'spec_helper'

describe '/items.json' do
  let(:bin) { Bin.create(name: "Compost") }
  let!(:item) { Item.create(name: "eggs", bin: bin, notes: "Egg Shells and the box go in the compost bin" ) }

  it 'should return an items expected bin' do
    get 'items.json?q=eggs'
    response.should be_success
    json = response.body
    JSON.parse(json).should eq({
      "id" => item.id,
      "bin_id" => bin.id,
      "notes" => "Egg Shells and the box go in the compost bin",
      "name" => "eggs"
    })
  end
end