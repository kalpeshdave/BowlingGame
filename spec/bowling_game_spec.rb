require File.expand_path( File.dirname(__FILE__) + '/../lib/bowling_game')

describe BowlingGame do

  describe "#new with invalid input" do

    it "should raise an error message when no input" do
      expect { BowlingGame.new }.to raise_error("Please provie valid input score for each run")
    end

    it "should raise an error message withthout required number of inout" do
      expect { BowlingGame.new 1,2,3,4,7,10 }.to raise_error("Please provie valid input score for each run")
    end

    it "should raise an error message when wrong input" do
      expect { BowlingGame.new 1,3,2,4,4,5,10,2,3,4,6,1,8,1,9,0,1,7,3,7 }.to raise_error("For each frame knocked pins should not exceeds 10")
    end
  end

  describe "#knockdown_score with valid input" do
    before :each do
      @score = BowlingGame.new(1,3,2,4,4,5,10,0,3,4,6,1,8,1,9,0,1,7,3,7).knockdown_score
    end

    it "should be an object of BowlingGame" do
      expect(@score).to eq(86)
    end

  end

end
