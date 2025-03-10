describe Hubspot::Config do
  describe ".configure" do
    it "sets the access token config" do
      access_token = "foobar"

      config = Hubspot::Config.configure(access_token: access_token)

      expect(config.access_token).to eq(access_token)
    end

    it "changes the base_url" do
      base_url = "https://api.hubapi.com/v2"

      config = Hubspot::Config.configure(base_url: base_url, access_token: 'foobar')

      expect(config.base_url).to eq(base_url)
    end

    it "sets a default value for base_url" do
      config = Hubspot::Config.configure(access_token: 'foobar')

      expect(config.base_url).to eq("https://api.hubapi.com")
    end

    it "sets a value for portal_id" do
      portal_id = "62515"

      config = Hubspot::Config.configure(
        access_token: 'foobar',
        portal_id: portal_id
      )

      expect(config.portal_id).to eq(portal_id)
    end

    it "raises when an authentication approach is not provided" do
      expect {
        Hubspot::Config.configure({})
      }.to raise_error(Hubspot::ConfigurationError)
    end

    it "raises when two authentication approaches are provided" do
      expect {
        Hubspot::Config.configure({
          hapikey: "123abc",
          access_token: "456def",
        })
      }.to raise_error(Hubspot::ConfigurationError)
    end

    context 'hapikey deprecation' do
      it "sets the hapikey config and sends a deprecation warning" do
        previous, $stderr = $stderr, StringIO.new

        hapikey = 'demo'
        config = Hubspot::Config.configure(hapikey: hapikey)
        expect(config.hapikey).to eq(hapikey)
        expect($stderr.string).to include 'please use access_token instead.'
      ensure
        $stderr = previous
      end
    end
  end

  describe ".reset!" do
    it "resets the config values" do
      Hubspot::Config.configure(access_token: "123abc", portal_id: "456def")

      Hubspot::Config.reset!

      expect(Hubspot::Config.access_token).to be nil
      expect(Hubspot::Config.portal_id).to be nil
    end
  end

  describe ".ensure!" do
    context "when a specified parameter is missing" do
      it "raises an error" do
        Hubspot::Config.configure(access_token: "123abc")

        expect {
          Hubspot::Config.ensure!(:portal_id)
        }.to raise_error(Hubspot::ConfigurationError)
      end
    end

    context "when all specified parameters are present" do
      it "does not raise an error" do
        Hubspot::Config.configure(access_token: "123abc", portal_id: "456def")

        expect {
          Hubspot::Config.ensure!(:portal_id)
        }.not_to raise_error
      end
    end
  end
end
