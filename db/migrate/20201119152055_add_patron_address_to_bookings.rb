class AddPatronAddressToBookings < ActiveRecord::Migration[6.0]
  def change
    add_column :bookings, :patron_address, :string
  end
end
