unit ufrmCadCliente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  ComCtrls, Grids, DBGrids, StdCtrls, Mask, DBCtrls, ExtCtrls, ACBrBase,
  ACBrValidador, uRequisicao,
  FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.Dialogs, Data.DB, System.JSON, ACBrMail,
  System.IniFiles, System.StrUtils, XMLDoc, XMLIntf, System.TypInfo;

type

  TfrmCadCliente = class(TForm)
    memCliente: TFDMemTable;
    memClientenome: TStringField;
    memClienteidentidade: TStringField;
    memClientecpf: TStringField;
    memClientetelefone: TStringField;
    memClienteemail: TStringField;
    memEndereco: TFDMemTable;
    memEnderecoid_end: TSmallintField;
    memEnderecocep: TStringField;
    memEnderecologradouro: TStringField;
    memEndereconumero: TStringField;
    memEnderecocomplemento: TStringField;
    memEnderecobairro: TStringField;
    memEnderecolocalidade: TStringField;
    memEnderecouf: TStringField;
    memEnderecopais: TStringField;
    pgcCliente: TPageControl;
    tabLista: TTabSheet;
    tabManutencao: TTabSheet;
    grdCliente: TDBGrid;
    dtsCliente: TDataSource;
    dtsEndereco: TDataSource;
    memClienteid_cliente: TIntegerField;
    memEnderecoid_cliente: TIntegerField;
    gpbEndereco: TGroupBox;
    gpbCliente: TGroupBox;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    pnlBotoesCli: TPanel;
    DBNavigator1: TDBNavigator;
    pnlBotoesEnd: TPanel;
    DBNavigator2: TDBNavigator;
    grdEndereco: TDBGrid;
    ACBrValidador1: TACBrValidador;
    tabEndereco: TTabSheet;
    GroupBox1: TGroupBox;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    Label9: TLabel;
    DBEdit9: TDBEdit;
    Label10: TLabel;
    DBEdit10: TDBEdit;
    Label11: TLabel;
    DBEdit11: TDBEdit;
    Label12: TLabel;
    DBEdit12: TDBEdit;
    Label13: TLabel;
    Label14: TLabel;
    DBEdit14: TDBEdit;
    DBComboBox1: TDBComboBox;
    memEnderecounidade: TStringField;
    memEnderecoibge: TStringField;
    memEnderecogia: TStringField;
    Panel1: TPanel;
    DBNavigator3: TDBNavigator;
    Panel2: TPanel;
    DBNavigator4: TDBNavigator;
    ACBrMail1: TACBrMail;
    tabEmail: TTabSheet;
    lblHost: TLabel;
    lblFrom: TLabel;
    lblFromName: TLabel;
    lblUser: TLabel;
    lblPassword: TLabel;
    lblPort: TLabel;
    lblTipoAutenticacao: TLabel;
    lblDefaultCharset: TLabel;
    lbl1: TLabel;
    edtHost: TEdit;
    edtFrom: TEdit;
    edtFromName: TEdit;
    edtUser: TEdit;
    edtPassword: TEdit;
    chkMostraSenha: TCheckBox;
    edtPort: TEdit;
    btnSalvar: TButton;
    chkTLS: TCheckBox;
    chkSSL: TCheckBox;
    cbbDefaultCharset: TComboBox;
    cbbIdeCharSet: TComboBox;
    edtAddressEmail: TEdit;
    Label15: TLabel;
    lblAdressName: TLabel;
    edtAddressName: TEdit;
    edtSubject: TEdit;
    mAltBody: TMemo;
    Label16: TLabel;
    Label17: TLabel;
    procedure grdClienteDblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure memClientecpfValidate(Sender: TField);
    procedure memClienteemailValidate(Sender: TField);
    procedure memClienteAfterPost(DataSet: TDataSet);
    procedure memClienteNewRecord(DataSet: TDataSet);
    procedure memEnderecoNewRecord(DataSet: TDataSet);
    procedure memClienteAfterScroll(DataSet: TDataSet);
    procedure memEnderecoAfterScroll(DataSet: TDataSet);
    procedure grdClienteKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure memEnderecoBeforePost(DataSet: TDataSet);
    procedure memEnderecoBeforeCancel(DataSet: TDataSet);
    procedure memEnderecoBeforeDelete(DataSet: TDataSet);
    procedure pgcClienteChanging(Sender: TObject; var AllowChange: Boolean);
    procedure memClienteBeforeInsert(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure memClienteBeforeCancel(DataSet: TDataSet);
    procedure memClienteBeforePost(DataSet: TDataSet);
    procedure grdEnderecoDblClick(Sender: TObject);
    procedure memEnderecoAfterPost(DataSet: TDataSet);
    procedure btnSalvarClick(Sender: TObject);
  private
    { Private declarations }
    function retira_mascara(pstr: string; pun_mask: string): string;
    procedure get_cep_endereco(pCEP: string);
    procedure JSonToMem(pJson: TJSONObject);
    procedure EnviarEmail;
    procedure GravarConfiguracao;
    procedure GravarConfiguracaoTela;
    procedure LerConfiguracaoINI;
    procedure SalvarXML(file_name: string);
    procedure AjustaParametrosDeEnvio;
  public
    { Public declarations }
  end;

var
  frmCadCliente: TfrmCadCliente;

implementation

{$R *.dfm}

procedure TfrmCadCliente.FormCreate(Sender: TObject);
var
  m: TMailCharset;
begin
  cbbDefaultCharset.Items.Clear;
  for m := Low(TMailCharset) to High(TMailCharset) do
    cbbDefaultCharset.Items.Add(GetEnumName(TypeInfo(TMailCharset), integer(m)));
  cbbDefaultCharset.ItemIndex := 0;
  cbbIdeCharSet.Items.Assign(cbbDefaultCharset.Items);
  cbbIdeCharSet.ItemIndex := 0;

  tabLista.TabVisible:= False;
  tabManutencao.TabVisible:= False;
  tabEndereco.TabVisible:= False;
  tabEmail.TabVisible:= False;

  pgcCliente.ActivePage:= tabLista;

  memCliente.Open;
  memEndereco.Open;
end;

procedure TfrmCadCliente.FormShow(Sender: TObject);
var IniFile: string;
begin
  IniFile:= ChangeFileExt(Application.ExeName, '.ini');
  LerConfiguracaoINI;
  grdCliente.SetFocus;
  if not FileExists(IniFile) then
    pgcCliente.ActivePage:= tabEmail;
end;

procedure TfrmCadCliente.AjustaParametrosDeEnvio;
begin
  ACBrMail1.From := edtFrom.text;
  ACBrMail1.FromName := edtFromName.text;
  ACBrMail1.Host := edtHost.text; // troque pelo seu servidor smtp
  ACBrMail1.Username := edtUser.text;
  ACBrMail1.Password := edtPassword.text;
  ACBrMail1.Port := edtPort.text; // troque pela porta do seu servidor smtp
  ACBrMail1.SetTLS := chkTLS.Checked;
  ACBrMail1.SetSSL := chkSSL.Checked;  // Verifique se o seu servidor necessita SSL
  ACBrMail1.DefaultCharset := TMailCharset(cbbDefaultCharset.ItemIndex);
  ACBrMail1.IDECharset := TMailCharset(cbbIdeCharSet.ItemIndex);
  ACBrMail1.AddAddress(edtAddressEmail.text, edtAddressName.text);
  ACBrMail1.Subject:= edtSubject.Text;
  ACBrMail1.Body.Add(mAltBody.Text);
end;

procedure TfrmCadCliente.btnSalvarClick(Sender: TObject);
begin
  GravarConfiguracaoTela;
  pgcCliente.ActivePage:= tabLista;
end;

procedure TfrmCadCliente.EnviarEmail;
var
  Dir, ArqXML: string;
  MS: TMemoryStream;
  P, N: Integer;
begin
  Dir := ExtractFilePath(ParamStr(0));
  ArqXML := 'Cliente_'+ memClientenome.AsString + '.xml';
  SalvarXML(ArqXML);
  //
  ACBrMail1.Clear;
  ACBrMail1.IsHTML := false;
  //
  AjustaParametrosDeEnvio;
  MS := TMemoryStream.Create;
  try
    MS.LoadFromFile(Dir + ArqXML);
    ACBrMail1.AddAttachment(MS, ArqXML);
  finally
    MS.Free;
  end;
  ACBrMail1.Send(False);
  //
  DeleteFile(Dir + ArqXML);
end;

procedure TfrmCadCliente.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  memEndereco.Close;
  memCliente.Close;

  Action:= caFree;
end;

procedure TfrmCadCliente.grdClienteDblClick(Sender: TObject);
begin
  pgcCliente.ActivePage:= tabManutencao;
end;

procedure TfrmCadCliente.grdClienteKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_INSERT then
  begin
    pgcCliente.ActivePage:= tabManutencao;
    memCliente.Append;
  end;
end;

procedure TfrmCadCliente.grdEnderecoDblClick(Sender: TObject);
begin
  pgcCliente.ActivePage:= tabEndereco;
  memEndereco.Edit;
end;

procedure TfrmCadCliente.JSonToMem(pJson: TJSONObject);
var i: Integer;
    field: TField;
begin
//  memEndereco.Append;
  for I := 0 to memEndereco.Fields.Count - 1 do
  begin
    field:= memEndereco.Fields[i];
    if field.Tag > 0 then
    begin
      if field.FieldName = 'cep' then
        memEndereco.FieldByName(field.FieldName).AsString:= retira_mascara(pJson.GetValue(LowerCase(field.FieldName)).Value,'.-')
      else
        memEndereco.FieldByName(field.FieldName).AsString:= pJson.GetValue(LowerCase(field.FieldName)).Value;
    end;
  end;
end;

procedure TfrmCadCliente.LerConfiguracaoINI;
var
  IniFile: string;
  Ini: TIniFile;
begin
  IniFile := ChangeFileExt(Application.ExeName, '.ini');
  Ini := TIniFile.Create(IniFile);
  try
    edtFrom.text := Ini.readString('Email', 'From', 'fulano@empresa.com.br');
    edtFromName.text := Ini.readString('Email', 'FromName', 'Fulano de Tal');
    edtHost.text := Ini.readString('Email', 'Host', 'smtp.empresa.com.br');
    edtPort.text := Ini.readString('Email', 'Port', '587');
    edtUser.text := Ini.readString('Email', 'User', 'fulano@empresa.com.br');
    edtPassword.text := Ini.readString('Email', 'Pass', 'Sua_Senha_123');
    chkTLS.Checked := Ini.ReadBool('Email', 'TLS', true);
    chkSSL.Checked := Ini.ReadBool('Email', 'SSL', true);
    cbbDefaultCharset.ItemIndex := Ini.ReadInteger('Email', 'DefaultCharset', 27);
    cbbIdeCharSet.ItemIndex := Ini.ReadInteger('Email', 'IdeCharset', 15);

    edtAddressEmail.text:= Ini.ReadString('Email', 'AddressEmail', '');
    edtAddressName.text:= Ini.ReadString('Email', 'AddressName', '');
    edtSubject.text:= Ini.ReadString('Email', 'Subject', 'Teste');
    mAltBody.text:= Ini.ReadString('Email', 'Body', '');
  finally
    Ini.Free;
  end;
end;

procedure TfrmCadCliente.memClienteAfterPost(DataSet: TDataSet);
begin
  pgcCliente.ActivePage:= tabLista;
  //enviar e-mail
  EnviarEmail;
end;

procedure TfrmCadCliente.memClienteAfterScroll(DataSet: TDataSet);
begin
  pnlBotoesCli.Caption:= inttostr(DataSet.RecNo) + '/' +inttostr(DataSet.RecordCount) + ' ';
end;

procedure TfrmCadCliente.memClienteBeforeCancel(DataSet: TDataSet);
begin
  pgcCliente.ActivePage:= tabLista;
end;

procedure TfrmCadCliente.memClienteBeforeInsert(DataSet: TDataSet);
begin
  pgcCliente.ActivePage:= tabManutencao;
end;

procedure TfrmCadCliente.memClienteBeforePost(DataSet: TDataSet);
begin
  Self.Perform(WM_NEXTDLGCTL,0,0);
  if memClientenome.AsString = '' then
  begin
    memClientenome.FocusControl;
    MessageDlg('Nome é de preenchimento obrigatório, corrija!',mtError,[mbOk],0);
    Abort;
  end;
end;

procedure TfrmCadCliente.memClientecpfValidate(Sender: TField);
var msg: string;
begin
  if Sender.AsString = '' then
    Exit;
  msg := ValidarCPF(Sender.AsString);
  if msg <> '' then
    raise Exception.Create(msg);
end;

procedure TfrmCadCliente.memClienteemailValidate(Sender: TField);
var msg: string;
begin
  if Sender.AsString = '' then
    Exit;
  msg := ValidarEmail(Sender.AsString);
  if msg <> '' then
    raise Exception.Create(msg);
end;

procedure TfrmCadCliente.memClienteNewRecord(DataSet: TDataSet);
begin
  DataSet.FieldByName('id_cliente').AsInteger := DataSet.RecordCount + 1;
  DataSet.FieldByName('nome').FocusControl;
end;

procedure TfrmCadCliente.memEnderecoAfterPost(DataSet: TDataSet);
begin
  memCliente.Edit;
end;

procedure TfrmCadCliente.memEnderecoAfterScroll(DataSet: TDataSet);
begin
  pnlBotoesCli.Caption:= inttostr(DataSet.RecNo) + '/' +inttostr(DataSet.RecordCount) + ' ';
end;

procedure TfrmCadCliente.memEnderecoBeforeCancel(DataSet: TDataSet);
begin
  pgcCliente.ActivePage:= tabManutencao;
end;

procedure TfrmCadCliente.memEnderecoBeforeDelete(DataSet: TDataSet);
begin
  pgcCliente.ActivePage:= tabManutencao;
end;

procedure TfrmCadCliente.memEnderecoBeforePost(DataSet: TDataSet);
begin
  pgcCliente.ActivePage:= tabManutencao;
end;

procedure TfrmCadCliente.memEnderecoNewRecord(DataSet: TDataSet);
var Value: string;
begin
  Self.Perform(WM_NEXTDLGCTL,0,0);
  if memClientenome.AsString = '' then
  begin
    memClientenome.FocusControl;
    MessageDlg('Nome é de preenchimento obrigatório, corrija!',mtError,[mbOk],0);
    Abort;
  end;

  pgcCliente.ActivePage:= tabEndereco;

  repeat
    InputQuery('Consulta de CEP', 'Informe o CEP', Value);
    Value:= retira_mascara(Trim(Value), '.-');
  until (Value = '') or (Length(Value) = 8);
  if Value <> '' then
    get_cep_endereco(Value)
  else
  begin
    memEndereco.Cancel;
    Abort;
  end;

  DataSet.FieldByName('id_cliente').AsInteger := memCliente.FieldByName('id_cliente').AsInteger;
  DataSet.FieldByName('id_end').AsInteger := DataSet.RecordCount + 1;
  DataSet.FieldByName('pais').AsString := 'Brasil';

  if memCliente.State in dsEditModes then
  begin
    memCliente.AfterPost:= nil;
    memCliente.Post;
    memCliente.AfterPost:= memClienteAfterPost;
    pgcCliente.ActivePage:= tabEndereco;
    memEndereco.Edit;
  end;
  memEndereconumero.FocusControl;
end;

procedure TfrmCadCliente.pgcClienteChanging(Sender: TObject; var AllowChange: Boolean);
var Value: string;
begin
  if pgcCliente.ActivePage = tabLista then
    grdCliente.SetFocus
  else if pgcCliente.ActivePage = tabEndereco then
  begin
    if memCliente.State in dsEditModes then
      memCliente.Post;
    repeat
      InputQuery('Consulta de CEP', 'Informe o CEP', Value);
      Value:= retira_mascara(Trim(Value), '.-');
    until (Value = '') or (Length(Value) = 8);
    if Value <> '' then
      get_cep_endereco(Value)
    else
      memEndereco.Cancel;
  end;
end;

function TfrmCadCliente.retira_mascara(pstr, pun_mask: string): string;
Var str : string;
    i : integer;
begin
  str := '';
  for i := 1 to length(pstr) do
  begin
    if Pos(pstr[i],pun_mask) = 0 then
      str:= str + pstr[i];
  end;
  Result:= str;
end;

procedure TfrmCadCliente.SalvarXML(file_name: string);
var XMLDocument: TXMLDocument;
  NodeTabela, NodeRegistro, NodeEndereco: IXMLNode;
  I: Integer;
  field: TField;
begin
  XMLDocument := TXMLDocument.Create(Self);
  try
    XMLDocument.Active := True;
    NodeTabela := XMLDocument.AddChild('Cliente');
    NodeRegistro := NodeTabela.AddChild('Registro');
    //cliente
    for I := 0 to memCliente.Fields.Count - 1 do
    begin
      field:= memCliente.Fields[i];
      NodeRegistro.ChildValues[field.FieldName]:= field.Value;
    end;
    //endereço
    memEndereco.First;
    while not memEndereco.Eof do
    begin
      NodeEndereco := NodeRegistro.AddChild('Endereco');
      for I := 0 to memEndereco.Fields.Count - 1 do
      begin
        field:= memEndereco.Fields[i];
        NodeEndereco.ChildValues[field.FieldName] := field.Value;
      end;
      memEndereco.Next;
    end;
    //
    XMLDocument.SaveToFile(file_name);
  finally
    XMLDocument.Free;
  end;
end;

procedure TfrmCadCliente.get_cep_endereco(pCEP: string);
var URL       : String;
    CEP       : string;
    Retorno   : TJSONObject;
    Requisicao: TRequisicao;
begin
  CEP:= frmCadCliente.retira_mascara(Trim(pCEP), '.-');
  if CEP = '' then
    Exit;
  url:= StringReplace('https://viacep.com.br/ws/*URL*/json/','*URL*',CEP,[rfReplaceAll]);
  Requisicao:= TRequisicao.Create;
  try
    Retorno:= Requisicao.GET(URL);
    JSonToMem(Retorno);
  finally
    FreeAndNil(Requisicao);
  end;
end;

procedure TfrmCadCliente.GravarConfiguracao;
var
  IniFile: string;
  Ini: TIniFile;
begin
  IniFile := ChangeFileExt(Application.ExeName, '.ini');
  Ini := TIniFile.Create(IniFile);
  try
    Ini.WriteString('Email', 'From', ACBrMail1.From);
    Ini.WriteString('Email', 'FromName', ACBrMail1.FromName);
    Ini.WriteString('Email', 'Host', ACBrMail1.Host);
    Ini.WriteString('Email', 'Port', ACBrMail1.Port);
    Ini.WriteString('Email', 'User', ACBrMail1.Username);
    Ini.WriteString('Email', 'Pass', ACBrMail1.Password);
    Ini.WriteBool('Email', 'TLS', ACBrMail1.SetTLS);
    Ini.WriteBool('Email', 'SSL', ACBrMail1.SetSSL);
    Ini.WriteInteger('Email', 'DefaultCharset', 0);
    Ini.WriteInteger('Email', 'IdeCharset', 0);
    //
    Ini.WriteString('Email', 'Subject', ACBrMail1.Subject);
  finally
    Ini.Free;
  end;
end;

procedure TfrmCadCliente.GravarConfiguracaoTela;
var
  IniFile: string;
  Ini: TIniFile;
begin
  IniFile := ChangeFileExt(Application.ExeName, '.ini');
  Ini := TIniFile.Create(IniFile);
  try
    Ini.WriteString('Email', 'From', edtFrom.text);
    Ini.WriteString('Email', 'FromName', edtFromName.text);
    Ini.WriteString('Email', 'Host', edtHost.text);
    Ini.WriteString('Email', 'Port', edtPort.text);
    Ini.WriteString('Email', 'User', edtUser.text);
    Ini.WriteString('Email', 'Pass', edtPassword.text);
    Ini.WriteBool('Email', 'TLS', chkTLS.Checked);
    Ini.WriteBool('Email', 'SSL', chkSSL.Checked);
    Ini.WriteInteger('Email', 'DefaultCharset', cbbDefaultCharset.ItemIndex);
    Ini.WriteInteger('Email', 'IdeCharset', cbbIdeCharSet.ItemIndex);

    Ini.WriteString('Email', 'AddressEmail', edtAddressEmail.text);
    Ini.WriteString('Email', 'AddressName', edtAddressName.text);
    Ini.WriteString('Email', 'Subject', edtSubject.text);
    Ini.WriteString('Email', 'Body', mAltBody.text);
  finally
    Ini.Free;
  end;
end;

end.
