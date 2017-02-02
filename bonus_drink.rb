class BonusDrink
  def self.total_count_for(amount, verbose = true)
    puts "最初に購入した飲み物の本数: #{amount}" if verbose
    # res = drink_and_exchange_recursive(amount, 0, 0, verbose)
    res = drink_and_exchange_induction(amount)
    puts "＝＞答え： トータルで飲める: #{res[:drank]}本、未交換空き缶: #{res[:empty]}本残り" if verbose

    res[:drank]
  end

  # 新しい飲み物は全部飲んで、
  # 空き缶が3本以上あったら交換して、
  # 飲んだ本数を再帰で計算する。
  #
  # == Parameters:
  # nFull:: 新しい（飲んでいない）缶の本数
  # nEmpty:: 手元にある、未交換の空き缶の本数
  # nDrank:: トータルで飲める本数
  #
  # == Returns:
  # トータルで飲める本数
  def self.drink_and_exchange_recursive(nFull, nEmpty = 0, nDrank = 0, verbose = false)
    puts "新しい缶: #{fixWidth(nFull)}本、　未交換空き缶: #{fixWidth(nEmpty)}本、　トータルで飲める: #{fixWidth(nDrank)}本" if verbose
    if nFull > 0 then
      drink_and_exchange_recursive(0, nEmpty + nFull, nDrank + nFull, verbose)
    elsif nEmpty >= 3 then
      drink_and_exchange_recursive(nEmpty/3, nEmpty%3, nDrank, verbose)
    else
      {
          empty: nEmpty,
          drank: nDrank
      }
    end
  end

  # 数学帰納法で高速計算
  def self.drink_and_exchange_induction(nFull)
    if nFull > 0 then
      {
          empty: if nFull%2 == 0 then 2 else 1 end,
          drank: nFull + (nFull-1)/2
      }
    else
      {
          empty: 0,
          drank: 0
      }
    end
  end

  #  数値を3桁幅で出力
  def self.fixWidth( num )
    sprintf("%3d", num)
  end

end
