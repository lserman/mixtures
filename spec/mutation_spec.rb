describe 'Attribute mutation' do

  let(:record) do
    Record.new.tap do |r|
      r.email = 'test'
    end
  end

  it 'mutates with explicit values' do
    mutated = mutate record, email: 'test123'
    expect(mutated.email).to eq 'test123'
  end

  it 'saves the record after mutation' do
    mutated = mutate record, email: 'test123'
    expect(mutated).to be_saved
  end

  it 'yields the record before saving' do
    mutated = mutate(record, email: 'test123') do |record|
      expect(record.email).to eq 'test123'
      expect(record).to_not be_saved
      record.email = 'test456'
    end
    expect(mutated.email).to eq 'test456'
    expect(mutated).to be_saved
  end

  it 'mutates with the EmailMutator' do
    mutated = mutate record, :email
    expect(mutated.email).to match /(.*)@(.*)\.com/
  end

end