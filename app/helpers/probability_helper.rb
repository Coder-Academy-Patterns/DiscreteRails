module ProbabilityHelper
  def link_toggling_in_step(id:, step_index:, sets:)
    set = sets[step_index] || Set.new
    included = set.include?(id)

    q = sets.map.with_index do |set, i|
      if i == step_index
        unless set.include?(id)
          set = set | [id]
        else
          set = set - [id]
        end
      end
      chars = set.map(&:to_s)
      chars.sort.join
      #set.map(&:to_s).sort }
    end.join('~')

    link_to id, { q: q }, { class: included ? 'positive' : 'negative' }
  end
end
