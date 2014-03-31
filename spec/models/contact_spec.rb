require 'spec_helper'

describe Contact do
  it { should validate_presence_of :name }
  it { should validate_presence_of :phone }
  it { should validate_presence_of :email }
end
