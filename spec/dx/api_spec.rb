# frozen_string_literal: true

RSpec.describe DX::Api do
  it "has a version number" do
    expect(DX::Api::VERSION).not_to be nil
  end

  describe "::host_name" do
    after { DX::Api.host_name = nil }

    it "can be overwritten" do
      expect { DX::Api.host_name = "https://example.com" }.to change(DX::Api, :host_name)
        .from("https://api.dnanexus.com").to("https://example.com")
    end

    it "resets to the default value when set to nil" do
      DX::Api.host_name = "https://example.com"
      expect { DX::Api.host_name = nil }.to change(DX::Api, :host_name)
        .from("https://example.com").to("https://api.dnanexus.com")
    end
  end
end
