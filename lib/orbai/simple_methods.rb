class << Orbai
  def query(prompt)
    response = http_client.chat_completions(model: 'gpt-3.5-turbo', messages: [
      {role:'system', content: 'Act as a helpful prompt.'},
      {role:'user', content: prompt},
    ])

    response['choices'].first['message']['content']
  end
end
