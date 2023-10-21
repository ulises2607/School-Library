require_relative '../person' 

describe Person do
  let(:person) { Person.new(25, 'John Doe', parent_permission: true, id: 123) }

  it 'has a name' do
    expect(person.name).to eq('John Doe')
  end

  it 'has an age' do
    expect(person.age).to eq(25)
  end

  it 'has an ID' do
    expect(person.id).to eq(123)
  end

  it 'has parent permission' do
    expect(person.parent_permission).to be_truthy
  end

  it 'has an empty rentals array' do
    expect(person.rentals).to be_empty
  end

  it 'can check if of age' do
    expect(person.of_age?).to be_truthy
  end

  it 'can check if it can use services' do
    expect(person.can_use_services?).to be_truthy
  end

  it 'can add a rental' do
    rental = double('Rental')
    person.add_rental(rental)
    expect(person.rentals).to include(rental)
  end

  it 'returns the correct name' do
    expect(person.correct_name).to eq('John Doe')
  end
end
