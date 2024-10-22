RSpec.shared_examples "serialized response without pagination" do |serializer, data_class|
  it '#index response' do
    get path
    expect(response).to have_http_status(:ok)
    response_body = JSON.parse(response.body)
    expect(response_body).to eq(data_class.all.map { |obj| serializer.new(obj).serializable_hash }.map(&:stringify_keys))
  end
end
