class NumberSystemsController < ApplicationController
  def index
    @active_n = params[:n].to_i
    @base2_rows = NumberSystems.create_table(base: 2, row_count: 20)
    @base8_rows = NumberSystems.create_table(base: 8, row_count: 20)
    @base10_rows = NumberSystems.create_table(base: 10, row_count: 20)
    @base16_rows = NumberSystems.create_table(base: 16, row_count: 20)
  end
end
