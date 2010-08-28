module WorkflowsHelper
  def generate_graph(role, tracker)
    edges = role.workflows.inject("") do |edge, workflow| 
      workflow.tracker_id == tracker.id ? "#{edge}#{workflow.old_status}->#{workflow.new_status};" : edge 
    end
    
    "http://chart.apis.google.com/chart?cht=gv&chl=digraph{#{CGI.escape(edges.gsub(/ /, '_').toutf8)}}&chs=500x500"
  end
end

