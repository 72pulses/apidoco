class DocumentationBuilder
  def self.create(doc_hash)
    FileUtils.rm_rf("#{Rails.root}/docs")
    FileUtils.mkdir_p(Rails.root.join('docs', 'api', 'v1', 'currencies'))
    File.open(Rails.root.join('docs', 'api', 'v1', 'currencies', '1.json'), 'w') do |line|
      line.puts(doc_hash.to_json)
    end
  end
end
