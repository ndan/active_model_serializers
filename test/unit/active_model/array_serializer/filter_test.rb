require 'test_helper'

module ActiveModel
  class ArraySerializer
    class FilterOptionsTest < Minitest::Test
      def setup
        @profile1 = Profile.new({ name: 'Name 1', description: 'Description 1', comments: 'Comments 1' })
        @profile2 = Profile.new({ name: 'Name 2', description: 'Description 2', comments: 'Comments 2' })
      end

      def test_only_option
        @serializer = ArraySerializer.new([@profile1, @profile2], only: :name)
        assert_equal([
          { name: 'Name 1' },
          { name: 'Name 2' }
        ], @serializer.as_json)
      end

      def test_except_option
        @serializer = ArraySerializer.new([@profile1, @profile2], except: :comments)
        assert_equal([
          { name: 'Name 1', description: 'Description 1' },
          { name: 'Name 2', description: 'Description 2' }
        ], @serializer.as_json)
      end
    end
  end
end
