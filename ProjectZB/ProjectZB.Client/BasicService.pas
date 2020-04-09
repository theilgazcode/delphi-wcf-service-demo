// ************************************************************************ //
// The types declared in this file were generated from data read from the
// WSDL File described below:
// WSDL     : http://localhost:62653/BasicService.svc?wsdl
//  >Import : http://localhost:62653/BasicService.svc?wsdl>0
//  >Import : http://localhost:62653/BasicService.svc?xsd=xsd0
//  >Import : http://localhost:62653/BasicService.svc?xsd=xsd1
// Encoding : utf-8
// Version  : 1.0
// (9.04.2020 12:26:04 - - $Rev: 96726 $)
// ************************************************************************ //

unit BasicService;

interface

uses Soap.InvokeRegistry, Soap.SOAPHTTPClient, System.Types, Soap.XSBuiltIns;

const
  IS_OPTN = $0001;
  IS_NLBL = $0004;
  IS_REF  = $0080;


type

  // ************************************************************************ //
  // The following types, referred to in the WSDL document are not being represented
  // in this file. They are either aliases[@] of other types represented or were referred
  // to but never[!] declared in the document. The types from the latter category
  // typically map to predefined/known XML or Embarcadero types; however, they could also 
  // indicate incorrect WSDL documents that failed to declare or import a schema type.
  // ************************************************************************ //
  // !:string          - "http://www.w3.org/2001/XMLSchema"[Gbl]



  // ************************************************************************ //
  // Namespace : http://tempuri.org/
  // soapAction: http://tempuri.org/IBasicService/%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : document
  // use       : literal
  // binding   : BasicHttpBinding_IBasicService
  // service   : BasicService
  // port      : BasicHttpBinding_IBasicService
  // URL       : http://localhost:62653/BasicService.svc
  // ************************************************************************ //
  IBasicService = interface(IInvokable)
  ['{8C27CDD4-81BC-22E7-E405-47BB50CD83A5}']
    procedure DoWork; stdcall;
    function  HelloWorld(const name_: string): string; stdcall;
  end;

function GetIBasicService(UseWSDL: Boolean=System.False; Addr: string=''; HTTPRIO: THTTPRIO = nil): IBasicService;


implementation
  uses System.SysUtils;

function GetIBasicService(UseWSDL: Boolean; Addr: string; HTTPRIO: THTTPRIO): IBasicService;
const
  defWSDL = 'http://localhost:62653/BasicService.svc?wsdl';
  defURL  = 'http://localhost:62653/BasicService.svc';
  defSvc  = 'BasicService';
  defPrt  = 'BasicHttpBinding_IBasicService';
var
  RIO: THTTPRIO;
begin
  Result := nil;
  if (Addr = '') then
  begin
    if UseWSDL then
      Addr := defWSDL
    else
      Addr := defURL;
  end;
  if HTTPRIO = nil then
    RIO := THTTPRIO.Create(nil)
  else
    RIO := HTTPRIO;
  try
    Result := (RIO as IBasicService);
    if UseWSDL then
    begin
      RIO.WSDLLocation := Addr;
      RIO.Service := defSvc;
      RIO.Port := defPrt;
    end else
      RIO.URL := Addr;
  finally
    if (Result = nil) and (HTTPRIO = nil) then
      RIO.Free;
  end;
end;


initialization
  { IBasicService }
  InvRegistry.RegisterInterface(TypeInfo(IBasicService), 'http://tempuri.org/', 'utf-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(IBasicService), 'http://tempuri.org/IBasicService/%operationName%');
  InvRegistry.RegisterInvokeOptions(TypeInfo(IBasicService), ioDocument);
  { IBasicService.HelloWorld }
  InvRegistry.RegisterMethodInfo(TypeInfo(IBasicService), 'HelloWorld', '',
                                 '[ReturnName="HelloWorldResult"]', IS_OPTN or IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(IBasicService), 'HelloWorld', 'name_', 'name',
                                '', IS_NLBL);
  InvRegistry.RegisterParamInfo(TypeInfo(IBasicService), 'HelloWorld', 'HelloWorldResult', '',
                                '', IS_NLBL);

end.