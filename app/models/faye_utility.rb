

class FayeUtility
  
  def self.log(msg, m_type = nil)
    $client.publish('/console', 'text' => msg)
  end
end