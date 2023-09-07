require './decorator'

describe Decorator do
  context 'When testing Decorator class' do
    it 'Create a new instance of Decorator' do
      nameable = double('nameable', correct_name: 'maximum')
      decorator = Decorator.new(nameable)

      expect(decorator).to be_instance_of Decorator
      expect(decorator.correct_name).to eq 'maximum'
    end
  end
end

describe CapitalizeDecorator do
  context 'When testing CapitalizeDecorator class' do
    it 'Capitalize a name' do
      nameable = double('nameable', correct_name: 'maximum')
      capitalize_name = CapitalizeDecorator.new(nameable)

      expect(capitalize_name).to be_instance_of CapitalizeDecorator
      expect(capitalize_name.correct_name).to eql 'Maximum'
    end
  end
end

describe TrimmerDecorator do
  context 'When testing TrimmerDecorator class' do
    it 'Trim the name to maximun 10 characters' do
      nameable = double('nameable', correct_name: 'maximilianus')
      shorter_name = TrimmerDecorator.new(nameable)

      expect(shorter_name).to be_instance_of TrimmerDecorator
      expect(shorter_name.correct_name).to eql 'maximilian'
    end
  end
end
