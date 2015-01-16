# encoding: utf-8

class ElectricSlide
  class AgentStrategy
    class LongestIdle
      def initialize
        @free_agents = [] # Needed to keep track of waiting order
      end

      # Checks whether an agent is available to take a call
      # @return [Boolean] True if an agent is available
      def agent_available?
        @free_agents.count > 0
      end

      # Assigns the first available agent, marking the agent :busy
      # @return {Agent}
      def checkout_agent
        @free_agents.shift
      end

      def <<(agent)
        @free_agents << agent unless @free_agents.include?(agent)
      end

      def delete(agent)
        @free_agents.delete(agent)
      end
    end
  end
end
