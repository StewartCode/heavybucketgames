require("minitest/autorun")
require_relative("../customer.rb")
require_relative("../game.rb")
require_relative("../interest.rb")

class TestAllModels < MiniTest::Test

  def setup
    @game1 = Game.new({
      "title" => "time fist",
      "genre" => "comedy adventure",
      "release_date" => "01/01/2019",
      "jumper_spaces" => 20,
      "timefist_spaces" => 20
    })
    @game1.save

  end


  def test_spaces()
      result = @game1.jumper_spaces_left(-1)
      assert_equal(19, result)
  end

  def test_spaces_2()
      result = @game1.timefist_spaces_left(1)
      assert_equal(21, result)
  end


end
