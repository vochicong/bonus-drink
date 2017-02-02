require File.expand_path(File.dirname(__FILE__) + '/../bonus_drink')

describe BonusDrink do
  it { expect(BonusDrink.total_count_for(-1)).to eq 0 }
  it { expect(BonusDrink.total_count_for(0)).to eq 0 }
  it { expect(BonusDrink.total_count_for(1)).to eq 1 }
  it { expect(BonusDrink.total_count_for(3)).to eq 4 }
  it { expect(BonusDrink.total_count_for(11)).to eq 16 }
  it { expect(BonusDrink.total_count_for(100)).to eq 149 }

  it { expect(BonusDrink.drink_and_exchange_recursive(-1)).to eq({empty: 0, drank: 0}) }
  it { expect(BonusDrink.drink_and_exchange_recursive(0)).to eq({empty: 0, drank: 0}) }
  it { expect(BonusDrink.drink_and_exchange_recursive(1)).to eq({empty: 1, drank: 1}) }
  it { expect(BonusDrink.drink_and_exchange_recursive(2)).to eq({empty: 2, drank: 2}) }
  it { expect(BonusDrink.drink_and_exchange_recursive(3)).to eq({empty: 1, drank: 4}) }
  it { expect(BonusDrink.drink_and_exchange_recursive(4)).to eq({empty: 2, drank: 5}) }
  it { expect(BonusDrink.drink_and_exchange_recursive(5)).to eq({empty: 1, drank: 7}) }
  it { expect(BonusDrink.drink_and_exchange_recursive(11)).to eq({empty: 1, drank: 16}) }
  it { expect(BonusDrink.drink_and_exchange_recursive(100)).to eq({empty: 2, drank: 149}) }

  (-10..1000).each do |n|
    it do
      expect(BonusDrink.drink_and_exchange_recursive(n)).to eq BonusDrink.drink_and_exchange_induction(n)
    end
  end

end
