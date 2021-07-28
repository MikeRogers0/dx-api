RSpec.describe DX::Api::Request do
  let(:api_token) { "" }
  let(:path) { "" }

  describe "#uri" do
    after { DX::Api.host_name = nil }

    it "uses the configurable DX::Api.host_name as it's base host" do
      expect { DX::Api.host_name = "https://example.com" }.to change { DX::Api::Request.new(api_token: api_token, path: path).uri }
        .from(URI("https://api.dnanexus.com/")).to(URI("https://example.com/"))
    end
  end
end
