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

      # Asserts that the provided address is one of those in the list of to recipients
      # If you provide a block, it will be used to obtain the recipient. If you need to use
      # block approach more than once within the same context, use should_have_to_recipients
      # instead
      def should_have_to_recipient(recipient=nil, &block)
        should "have #{recipient || 'some email address'} as a to recipient" do
          recipient = self.instance_eval(&block) if block_given?
          assert_contains @email.to, recipient
        end
      end

      # Asserts that all of the to recipients match those in the provided list.
      # If you provide a block, it will be used to obtain the list of recipients.
      def should_have_to_recipients(recipient_list=nil, &block)
        handle_a_list("to recipients", :to, recipient_list, &block)
      end

      # Asserts that all of the from addresses match those in the provided list.
      # If you provide a block, it will be used to obtain the list of from addresses.
      def should_have_from(from_list=nil, &block)
        handle_a_list("from", :from, from_list, &block)
      end

      # Asserts that all of the reply to addresses match those in the provided list.
      # If you provide a block, it will be used to obtain the list of from addresses.
      def should_have_reply_to(reply_to_list=nil, &block)
        handle_a_list("reply to's", :reply_to, reply_to_list, &block)
      end

    private
      def handle_a_list(named, accessed_as, expected=nil, &block)
        should "have #{named}" do
          expected = self.instance_eval(&block) if block_given?
          assert_same_elements Array(expected), @email.send(accessed_as)
        end
      end
    end # Shoulda
  end # ActionMailer
end # Thumblemonks

ActionMailer::TestCase.extend(Thumblemonks::ActionMailer::Shoulda)
