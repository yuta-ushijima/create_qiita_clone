class DeviseTokenAuthCreateUsers < ActiveRecord::Migration[5.2]
  def self.up
    change_table :users, bulk: true do |t|
      ## Required
      t.string :provider, null: false, default: "email"
      t.string :uid, null: false, default: ""

      ## Recoverable
      t.boolean :allow_password_change, default: false

      ## User Info
      t.string :image

      ## Tokens
      t.text :tokens

      # updates the user table immediately with the above defaults
      User.reset_column_information
      # finds all existing users and updates them.
      # if you change the default values above you'll also have to change them here below:
      User.find_each do |user|
        user.uid = user.email
        user.provider = "email"
        user.save!
      end
    end
  end

  def self.down
    remove_columns :users, :provider, :uid, :allow_password_change, :image, :tokens
  end
end
