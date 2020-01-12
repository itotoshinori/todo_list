require 'csv'

# bomを作成
bom = %w(EF BB BF).map { |e| e.hex.chr }.join
# generateで引数にbomを渡してあげる
csv_file = CSV.generate(bom) do |csv|
  csv << ["TodoList"]
  csv << ["タイトル", "期限","完了日", "出費額"]
  @todos.each do |b|
      csv << [b.title, b.term, b.finishday,b.accounts.sum(:amount).to_s]
  end
end