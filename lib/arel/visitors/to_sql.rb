def compile node, &block
  accept(node, Arel::Collectors::SQLString.new, &block).value
end