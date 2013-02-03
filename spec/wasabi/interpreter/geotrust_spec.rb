require "spec_helper"

describe Wasabi::Interpreter do
  context "with: geotrust.wsdl" do

    subject(:interpreter) { new_interpreter(:geotrust) }

    it "knows the SOAP endpoint" do
      endpoint = "https://test-api.geotrust.com:443/webtrust/query.jws"
      expect(interpreter.soap_endpoint).to eq(endpoint)
    end

    it "knows the target namespace" do
      namespace = "http://api.geotrust.com/webtrust/query"
      expect(interpreter.target_namespace).to eq(namespace)
    end

    it "knows whether elements should be namespaced" do
      pending "elementFormDefault belongs to a schema. needs to be refactored!"
      expect(interpreter.element_form_default).to eq(:qualified)
    end

    it "knows the available operations" do
      operation = {
        :get_quick_approver_list => {
          :input       => ["s1", "GetQuickApproverList"],
          :output      => ["s1", "GetQuickApproverListResponse"],
          :soap_action => ""
        }
      }

      expect(interpreter).to have(2).operations
      expect(interpreter.operations).to include(operation)
    end

  end
end
