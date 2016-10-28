# Fidor git prepare-commit-msg hook
#
# Autom. prepends git commit messages with ticket type and ticket id based on
# the current branch name (assuming naming convention has been followed).
#
# Naming convention for branches:
# {ticket type}/{ticket id}-{ticket title in param-case}
# Ex: feature/ADIBLO-84-the meaning of life
# Ex: hotfix/ADIBLO-85-fixes-super-important-feature
#
# Only applies when using:
# $ git commit -m "message"
# $ git commit -F path/to/message.txt
# $ git commit
#
# Except it is a:
# - merge commit
# - squash commit
#
# Example:
# assuming current branch name is: feature/ADIBLO-1-some-ticket-title
# $ git commit -m "Adds some stuff"
# commit message is now: ADIBLO-1: Adds some stuff
module Overcommit
  module Hook
    module CommitMsg
      class AddTicketId < Base
        VALID_TICKET_TYPES = %w(feature hotfix)

        def run
          branch_name = `git symbolic-ref --short HEAD`
          ticket_type, ticket_id = branch_name.scan(/(\w+)\/(\w+-\d+)/).flatten

          may_apply_hook =
            VALID_TICKET_TYPES.include?(ticket_type) &&
            ticket_id &&
            [nil, 'message'].include?(ARGV[1])

          if may_apply_hook
            prefix = "#{ticket_id.upcase}: "

            # Skip if commit Ticket ID is already present (this fixes a problem
            # with `git commit --amend`).
            unless commit_message.start_with?(prefix)
              `sed -i.bak -e "1s/^/#{prefix}/" #{commit_message_file}`
            end
          end

          :pass
        end
      end
    end
  end
end
