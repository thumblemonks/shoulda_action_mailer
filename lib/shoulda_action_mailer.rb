module Thumblemonks
  module ActionMailer
    # Every macro here assumes an instance variable named @email is defined and
    # is an instance of a TMail object.
    module Shoulda
      # Tries to match the provided subject with that of the email's. Regular
      # expressions are valid inputs.
      # 
      #   should_have_subject 'Hello world'
      # 
      # If a block is provided, the result of calling it will
      # be used as the expected subject.
      # 
      #   should_have_subject { "What's going on #{@person.name}?" }
      def should_have_subject(subject=nil, &block)
        should "have subject" do
          subject = self.instance_eval(&block) if block_given?
          assert_match subject, @email.subject
        end
      end

      # Asserts that the provided address is one of those in the list of to recipients.
      # 
      #   should_have_to_recipient "foo@bar.baz"
      # 
      # If you provide a block, it will be used to obtain the recipient. If you need to use
      # block approach more than once within the same context, use should_have_to_recipients
      # instead.
      # 
      #   should_have_to_recipient { @person.email }
      def should_have_to_recipient(recipient=nil, &block)
        should "have #{recipient || 'some email address'} as a to recipient" do
          recipient = self.instance_eval(&block) if block_given?
          assert_contains @email.to, recipient
        end
      end

      # Asserts that all of the to recipients match those in the provided list. 
      # 
      #   should_have_to_recipients ["foo@bar.baz", "ma@pa.biz"]
      # 
      # If you provide a block, it will be used to obtain the expected list of recipients.
      # 
      #   should_have_to_recipients { @network.people.map(&:email) }
      def should_have_to_recipients(recipient_list=nil, &block)
        handle_a_list("to recipients", :to, recipient_list, &block)
      end

      # Asserts that all of the from addresses match those in the provided list. You can provide a
      # single email address or an array of email addresses.
      # 
      #   should_have_from "foo@bar.baz"
      #   should_have_from ["foo@bar.baz", "ma@pa.biz"]
      # 
      # If you provide a block, it will be used to obtain the list of from addresses.
      #
      #   should_have_from { @person.email }
      #   should_have_from { [@network.owner.email, @you.mom.email] }
      def should_have_from(from_list=nil, &block)
        handle_a_list("from", :from, from_list, &block)
      end

      # Asserts that all of the reply to addresses match those in the provided list. You can provide a
      # single email address or an array of email addresses.
      # 
      #   should_have_reply_to "foo@bar.baz"
      #   should_have_reply_to ["foo@bar.baz", "ma@pa.biz"]
      # 
      # If you provide a block, it will be used to obtain the list of reply to addresses.
      #
      #   should_have_reply_to { @person.email }
      #   should_have_reply_to { [@network.owner.email, @you.mom.email] }
      def should_have_reply_to(reply_to_list=nil, &block)
        handle_a_list("reply to's", :reply_to, reply_to_list, &block)
      end

      # Asserts that the email body matches the value provided.
      # 
      #   should_match_body /Sincerely,\nYour Mom/
      #   should_match_body %r[Dear John,]
      #   should_match_body "this is the entire email body" # bascially like an assert_equal
      #
      # If you provide a block, it will be used to get the expression that will be matched
      # against the email body. You must provide a namespace for the test in this case, so
      # test name collisions can be avoided (because we're assuming you're going to do this
      # more than once within a context).
      #
      #   should_match_body("salutation") { %r[Dear #{@person.name}] }
      def should_match_body(matcher_or_name, &block)
        should "match body to #{matcher_or_name}" do
          matcher_or_name = self.instance_eval(&block) if block_given?
          assert_match matcher_or_name, @email.body
        end
      end

    private
      def handle_a_list(named, accessed_as, expected=nil, &block)
        should "have #{named}" do
          expected = self.instance_eval(&block) if block_given?
          assert_same_elements Array(expected), Array(@email.send(accessed_as))
        end
      end
    end # Shoulda
  end # ActionMailer
end # Thumblemonks

ActionMailer::TestCase.extend(Thumblemonks::ActionMailer::Shoulda)
