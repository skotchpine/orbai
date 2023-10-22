# Complete public openai API: https://beta.openai.com/docs/api-reference
class Orbai::HttpClient
  # Chat
  #   POST /chat/completions
  def chat_completions(**params) = post("/chat/completions", **params)

  # Completions
  #   POST /completions
  def completions(**params) = post("/completions", **params)

  # Edits
  #   POST /edits
  def edits(**params) = post("/edits", **params)

  # Images
  #   POST /images/generations
  def create_image(**params) = post("/images/generations", **params)
  #   POST /images/edits
  def create_image_edit(**params) = post("/images/edits", multipart: true, **params)
  #   POST /images/variations
  def create_image_variation(**params) = post("/images/variations", multipart: true, **params)

  # Embeddings
  #   POST /embeddings
  def create_embedding(**params) = post("/embeddings", **params)

  # Fine_tuning
  #
  #   POST /fine_tuning/jobs
  def create_fine_tuning_jobs(**params) = post("/fine_tuning/jobs", **params)
  #   GET /fine_tuning/jobs
  def list_fine_tuning_jobs(**params) = get("/fine_tuning/jobs", **params)
  #   GET /fine_tuning/jobs/{fine_tuning_job_id}
  def retrieve_fine_tuning_job(id, **params) = get("/fine_tuning/jobs/#{id}", **params)
  #   POST /fine_tuning/jobs/{fine_tuning_job_id}/cancel
  def cancel_fine_tuning_job(id, **params) = post("/fine_tuning/jobs/#{id}/cancel", **params)
  #   GET /fine_tuning/jobs/{fine_tuning_job_id}/events
  def list_fine_tuning_events(id, **params) = get("/fine_tuning/jobs/#{id}/events", **params)

  # Audio
  #   POST /audio/transcriptions
  def create_transcription(**params) = post("/audio/transcriptions", multipart: true, **params)
  #   POST /audio/translations
  def create_translation(**params) = post("/audio/translations", multipart: true, **params)

  # Files
  #   GET /files
  def list_files(**params) = get("/files", **params)
  #   POST /files
  def upload_file(**params) = post("/files", multipart: true, **params)
  #   DELETE /files/{file_id}
  def delete_file(id, **params) = delete("/files/#{id}", **params)
  #   GET /files/{file_id}
  def retrieve_file(id, **params) = get("/files/#{id}", **params)
  #   GET /files/{file_id}/content
  def file_content(id, **params) = get("/files/#{id}/content", **params)

  # Models
  #   GET /models
  def list_models(**params) = get("/models", **params)
  #   GET /models/{model}
  def retrieve_model(id, **params) = get("/models/#{id}", **params)
  #   DELETE /models/{model}
  def delete_model(id, **params) = delete("/models/#{id}", **params)

  # Moderations
  #   POST /moderations
  def create_moderation(**params) = post("/moderations", **params)
end
