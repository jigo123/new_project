class RenameAcceptTermsToTerms < ActiveRecord::Migration
  def self.up
    remove_column :users, :accept_terms
    add_column :users, :terms, :integer, :default => 0
  end

  def self.down
    remove_column :users, :terms
    add_column :users, :accept_terms, :integer, :default => 0
  end
end
