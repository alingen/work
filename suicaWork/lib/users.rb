class User

  attr_accessor :age, :gender

  def initialize(age:, gender:)
    @age = age
    @gender = gender
  end

  # def self.create_users(array)
  #   array.map do |n|
  #     User.new(n)
  #   end
  # end

end