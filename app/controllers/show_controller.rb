class ShowController < ApplicationController
  def shops
    sql_query = "SELECT * FROM shops LIMIT 10"
    @shops = ActiveRecord::Base.connection.execute(sql_query)
  end

  def clients
    sql_query = "SELECT * FROM clients LIMIT 10"
    @clients = ActiveRecord::Base.connection.execute(sql_query)
  end

  def employees
    sql_query = "SELECT e.full_name, e.email, e.phone_number, e.date_of_birth, e.salary, s.address
 FROM employees as e, shops as s WHERE s.id = e.shop_id LIMIT 10"
    @employees = ActiveRecord::Base.connection.execute(sql_query)
  end

  def purchases
    sql_query = "SELECT c.full_name client, p.date, p.total_cost, e.full_name emp, p.payment_method
                 FROM clients c, purchases p, employees e
                 WHERE c.id = p.client_id and e.id = p.employee_id LIMIT 10 "
    @purchases = ActiveRecord::Base.connection.execute(sql_query)
  end

  def cakes
    sql_query = "SELECT * FROM cakes LIMIT 10"
    @cakes = ActiveRecord::Base.connection.execute(sql_query)
  end

  def purchase_details
    sql_query = "SELECT c.full_name client, ca.name cake, pd.sale_amount am, ca.cost, pd.intermediate_cost ic, p.total_cost total
                 FROM purchases p, purchase_details pd, clients c, cakes ca
                 WHERE c.id = p.client_id and p.id = pd.purchase_id and pd.cake_id = ca.id LIMIT 100"
    @purchase_details = ActiveRecord::Base.connection.execute(sql_query)

  end

  def reviews
    sql_query = "SELECT c.full_name client, ca.name cake, r.date, r.rating, r.comment
                 FROM reviews r, clients c, cakes ca
                 WHERE c.id = r.client_id and r.cake_id = ca.id LIMIT 10 OFFSET 100"
    @reviews = ActiveRecord::Base.connection.execute(sql_query)
  end
  def main;end
end
