require_relative './spec_helper'

describe "Company" do
  let(:company) {Company.new(name: "Mango Inc.", url: "example.com")}

  it "can instantiate a new instance" do
    expect(Company.new.is_a?(Object)).to eq(true)
  end

  it "can instantiate with a name and url" do

    expect(company.name).to eq("Mango Inc.")
    expect(company.url).to eq("example.com")
  end

  it "can be saved to the database" do
    company.url = "example.com"

    expect(company.save).to eq(true)
  end

  it "can instantiate and save at the same time with create" do
    temp_company = Company.create(name: "Acorn Squash", url: "test.com")

    expect(Company.all.last.name).to eq("Acorn Squash")
  end

  it "can find an Artist by name" do
    c1 = Company.create(name: "temp1", url: "test1.com")
    c2 = Company.create(name: "temp2", url: "test2.com")
    c3 = Company.create(name: "temp3", url: "test3.com")
    

    expect(Company.find_by(name: "temp2")).to eq(c2)
  end

  it "finds companies w/ multiple positions" do
    # the normal case
    # corner cases: nil, empty sets, ...?
   expect(Company.have_multiple_positions.count).to eq(0)

   cnew = Company.create(name: "new", url: "example2.com")
   p1 = Position.create(company: cnew)
   expect(Company.have_multiple_positions.count).to eq(0)

   p2 = Position.create(company: cnew)
   expect(Company.have_multiple_positions.count).to eq(1)
  end

end