class Person
  attr_writer :secret

  def share_secret
    puts secret
  end

  private

  attr_reader :secret

end

person = Person.new
person.secret = "Shh... It's a secret!"
person.share_secret
