require 'squeel'

namespace :export do
  desc 'Export to QIF format'
  task :qif => :environment do
    # categories
    Category.where{category_type.in(['expense', 'income', 'credit'])}.each do |c|
      ct = 'I'
      ct = 'E' if c.category_type == 'expense'
      puts <<-HEREDOC
!Type:Cat
N#{c.name}
#{ct}
^
HEREDOC
    end

    # accounts
    Account.where{account_type.in(['saving', 'cash'])}.each do |a|
      atype  = 'Bank' if a.account_type == 'saving'
      atype  = 'Cash' if a.account_type == 'cash'
      amount = "%.2f" % a.initial_amount

      puts <<-HEREDOC
!Account
N#{a.name}
T#{atype}
^
HEREDOC

      puts <<-HEREDOC
!Type:#{atype}
D#{a.created_at.strftime("%Y-%m-%d")}
T#{amount}
CX
POpening Balance
L[#{a.name}]
^
HEREDOC

      # expenses
      Transaction.joins{category}.where{category.category_type.in(['expense', 'income', 'credit'])}.joins{account}.where{account.id.eq(my{a.id})}.each do |e|
        cost = "%.2f" % e.amount
        cost = "-%.2f" % e.amount if e.transaction_type == 'expense'

        puts <<-HEREDOC
D#{e.transaction_date.strftime("%Y-%m-%d")}
T#{cost}
CX
P#{e.title}
L#{e.category.name}
^
HEREDOC
      end

      # transfers
      Transfer.joins{from_account}.where{from_account.id.eq(my{a.id})}.each do |e|
        amount = "-%.2f" % e.amount

        puts <<-HEREDOC
D#{e.transfer_date.strftime("%Y-%m-%d")}
T#{amount}
CX
P#{e.title}
L[#{e.to_account.name}]
^
HEREDOC
      end
    end
  end
end
