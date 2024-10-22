RSpec.shared_examples "paginated serialized show response" do |serializer, data_class|
  context 'correct data' do
    it '#show :id response' do
      get id_path
      expect(response).to have_http_status(:ok)
      response_body = JSON.parse(response.body)
      expect(response_body["data"]).to eq(serializer.new(data_class.find(subject_id)).serializable_hash.stringify_keys)
    end
  end

  context 'incorrect data' do
    it '#show :id response' do
      get incorrect_id_path
      expect(response).to have_http_status(:not_found)
    end
  end
end
