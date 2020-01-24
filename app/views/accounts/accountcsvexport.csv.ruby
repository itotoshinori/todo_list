require 'csv'
# bomを作成
bom = %w(EF BB BF).map { |e| e.hex.chr }.join
# generateで引数にbomを渡してあげる
csv_file = CSV.generate(bom) do |csv|
  csv << ["会計一覧"]
  csv << ["タイトル", "期限","完了日","会計登録日", "出費額","区分","備考"]
  @accounts.each do |b|
      csv << [b.todo.title, b.todo.term, b.todo.finishday,b.registrationdate,b.amount,b.item,b.remark]
  end
end