<h1>Listing expenses</h1>
 
<table>
  <tr>
    <th>Expense</th>
    <th>Amount</th>
  </tr>
 
  <% @fixed_monthly_expenses.each do |fixed_monthly_expense| %>
    <tr>
      <td><%= fixed_monthly_expense.expense %></td>
      <td><%= fixed_monthly_expense.amount %></td>
    </tr>
  <% end %>
</table>
