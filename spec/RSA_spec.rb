require_relative '../lib/RSA'
RSpec.describe RSA do
    crypt = RSA.new(3233,17,413)
	it "encrypt mimi5025" do
		c = crypt.encrypt("mimi5025")
    	expect(crypt.decrypt(c)).to eq("mimi5025")
    end 
	it "n work" do
		expect(crypt.n()).to eq(3233)
	end
	it "e work" do
		expect(crypt.e()).to eq(17)
	end
	it "d work" do
		expect(crypt.d()).to eq(413)
	end
	
end 
