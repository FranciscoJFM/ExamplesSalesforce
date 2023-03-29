public with sharing class ExampleConectionSAP_CC{ 
  @AuraEnabled//5540743069
  public static List<WrapExampleSap> getValuesSap(){
      List<WrapExampleSap> wrapReturn = new List<WrapExampleSap>(); 
      
      HttpRequest req = new HttpRequest();
      req.setEndpoint('String body=<?xml version="1.0" encoding="utf-8"?>'+
      '<asx:abap version="1.0" xmlns:asx="http://www.sap.com/abapxml">'+
        '<asx:values>'+
          '<T_MATERIALS>'+
            '<item>'+
              '<MATNR>10001</MATNR>'+
              '<WERKS>1001</WERKS>'+
              '<LGORT>01</LGORT>'+
              '<MEINS>EA</MEINS>'+
              '<ERDAT>2022-05-24</ERDAT>'+
              '<VERPR>10.00</VERPR>'+
            '</item>'+
            '<item>'+
              '<MATNR>10002</MATNR>'+
              '<WERKS>2005</WERKS>'+
              '<LGORT>01</LGORT>'+
              '<MEINS>EA</MEINS>'+
              '<ERDAT>2022-05-20</ERDAT>'+
              '<VERPR>15.00</VERPR>'+
            '</item>'+
            '<item>'+
             '<MATNR>10003</MATNR>'+
              '<WERKS>2007</WERKS>'+
              '<LGORT>01</LGORT>'+
              '<MEINS>EA</MEINS>'+
              '<ERDAT>2022-05-11</ERDAT>'+
              '<VERPR>20.00</VERPR>'+
            '</item>'+
          '</T_MATERIALS>'+
        '</asx:values>'+
      '</asx:abap>'
      );
      req.setMethod('GET');
      
      // Uncomment and update this section to provide the correct credentials
      /*
      String username = 'your-username';
      String password = 'your-password';
      Blob headerValue = Blob.valueOf(username + ':' + password);
      String authorizationHeader ='Basic ' + EncodingUtil.base64Encode(headerValue);
      req.setHeader('Authorization', authorizationHeader);
      */
      
      req.setHeader('Content-Type', 'text/xml');
      req.setHeader('Charset', 'utf-8');
      Http http = new Http();

    req.setTimeout(120000);
      
      try {
          HTTPResponse res = http.send(req);
          if (res.getStatusCode() >= 200 && res.getStatusCode() < 300) {
              Dom.Document doc = res.getBodyDocument();
              Dom.XMLNode address = doc.getRootElement(); 
              for(Dom.XMLNode child : address.getChildElements()) {
                  for(Dom.XMLNode child2 : child.getChildElements()) {
                      for(Dom.XMLNode child3 : child2.getChildElements()) {
                          WrapExampleSap wrapExampleSap = new WrapExampleSap(child3);
                          wrapReturn.add(wrapExampleSap); 
                      }
                  }
              }
          } else {
       System.debug('Error example: HTTP response code ' + res.getStatusCode());
          }
      } catch (Exception e) {
        System.debug('Error example' + e.getStackTraceString()); 
      }
      
      return wrapReturn;
  }

  public class WrapExampleSap {

      @AuraEnabled public String matnr {get;set;}
      @AuraEnabled public String werks {get;set;}
      @AuraEnabled public String lgort {get;set;}
      @AuraEnabled public String meins {get;set;}
      @AuraEnabled public String erdat {get;set;}
      @AuraEnabled public String verpr {get;set;}

   
      public WrapExampleSap(Dom.XMLNode child) {
          this.matnr = child.getChildElement('MATNR', null) != null ? child.getChildElement('MATNR', null).getText() : '';
          this.werks = child.getChildElement('MATNR', null) != null ? child.getChildElement('MATNR', null).getText() : '';
          this.lgort = child.getChildElement('LGORT', null) != null ? child.getChildElement('LGORT', null).getText() : '';
          this.meins = child.getChildElement('MEINS', null) != null ? child.getChildElement('MEINS', null).getText() : '';
          this.erdat = child.getChildElement('ERDAT', null) != null ? child.getChildElement('ERDAT', null).getText() : '';
          this.verpr = child.getChildElement('VERPR', null) != null ? child.getChildElement('VERPR', null).getText() : '';
      }
  }
}







