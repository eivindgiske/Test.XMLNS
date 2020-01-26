// Welcome to your new AL extension.
// Remember that object names and IDs should be unique across all extensions.
// AL snippets start with t*, like tpageext - give them a try and happy coding!

pageextension 50100 CustomerListExt extends "Customer List"
{
    trigger OnOpenPage();
    begin
        testXMl;
    end;

    local procedure TestXML()
    var
        testXmldoc: XmlDocument;
        testXmlNode: XmlNode;
        testXmlElement: XmlElement;
        outputString: Text;
        xmlnsmgr: XmlNamespaceManager;
        xmlstring: Text;
    begin
        xmlstring := '<Soap:Envelope xmlns:Soap="http://schemas.xmlsoap.org/soap/envelope/"><Soap:Body><PostInvtPick_Result xmlns="urn:microsoft-dynamics-schemas/codeunit/WMSFunctions"><postedInvtPickNo>BPLU000017</postedInvtPickNo><salesShipmentNo>189501</salesShipmentNo></PostInvtPick_Result></Soap:Body></Soap:Envelope>';
        XmlDocument.ReadFrom(xmlstring, testXmldoc);

        xmlNsMgr.AddNamespace('soap', 'http://schemas.xmlsoap.org/soap/envelope/');
        xmlnsmgr.AddNamespace('urn', 'microsoft-dynamics-schemas/codeunit/WMSFunctions'); //Noe sånt?
        testXmldoc.SelectSingleNode('//soap:Envelope/soap:Body/PostInvtPick_Result/postedInvtPickNo', xmlNsMgr, testXmlNode);
        testXmlElement := testXmlNode.AsXmlElement();
        outputString := testXmlElement.InnerText();
        message(outputString)
    end;
}
