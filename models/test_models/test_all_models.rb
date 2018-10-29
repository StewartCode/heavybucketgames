require("minitest/autorun")
require( 'pry-byebug' )
require_relative("../customer.rb")
require_relative("../game.rb")
require_relative("../interest.rb")
require_relative("../space.rb")

class TestAllModels < MiniTest::Test

  def setup
    @game1 = Game.new({
      "title" => "time fist",
      "genre" => "comedy adventure",
      "release_date" => "01/01/2019"
    })
    @game1.save

  @space = Space.new({
            "jumper_spaces" => 20,
            "timefist_spaces" => 20
    })
  @space.save

  end

  def test_spaces()
      result = @space.jumper_spaces_left(-1)
      assert_equal(19, result)
  end

  def test_spaces_2()
      result = @space.timefist_spaces_left(1)
      assert_equal(21, result)
  end


end

# binding.pry
# nil
