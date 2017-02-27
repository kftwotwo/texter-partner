require 'rails_helper'

describe Contact do
  it { should have_db_column :name }
  it { should have_db_column :number }
end
