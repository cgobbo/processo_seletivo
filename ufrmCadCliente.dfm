object frmCadCliente: TfrmCadCliente
  Left = 0
  Top = 0
  Caption = 'Cadastro de Clientes'
  ClientHeight = 449
  ClientWidth = 775
  Color = clWindow
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pgcCliente: TPageControl
    Left = 0
    Top = 0
    Width = 775
    Height = 449
    ActivePage = tabEmail
    Align = alClient
    HotTrack = True
    TabOrder = 0
    OnChanging = pgcClienteChanging
    object tabLista: TTabSheet
      Caption = '&1 Clientes'
      object grdCliente: TDBGrid
        Left = 0
        Top = 23
        Width = 767
        Height = 398
        Hint = 'Bot'#227'o Insert para inserir'
        Align = alClient
        DataSource = dtsCliente
        ParentShowHint = False
        ReadOnly = True
        ShowHint = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnDblClick = grdClienteDblClick
        OnKeyDown = grdClienteKeyDown
        Columns = <
          item
            Expanded = False
            FieldName = 'nome'
            Width = 245
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'identidade'
            Width = 110
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'cpf'
            Width = 90
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'telefone'
            Width = 110
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'email'
            Width = 150
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'id_cliente'
            Width = 38
            Visible = True
          end>
      end
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 767
        Height = 23
        Align = alTop
        Alignment = taRightJustify
        BevelOuter = bvNone
        Color = clBtnShadow
        ParentBackground = False
        TabOrder = 1
        object DBNavigator4: TDBNavigator
          Left = 0
          Top = 0
          Width = 377
          Height = 23
          DataSource = dtsCliente
          VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete]
          Align = alLeft
          TabOrder = 0
          ExplicitHeight = 33
        end
      end
    end
    object tabManutencao: TTabSheet
      Caption = '&2 Manuten'#231#227'o'
      ImageIndex = 1
      object gpbEndereco: TGroupBox
        Left = 0
        Top = 184
        Width = 767
        Height = 237
        Align = alClient
        Caption = 'Endere'#231'o'
        TabOrder = 1
        object pnlBotoesEnd: TPanel
          Left = 2
          Top = 15
          Width = 763
          Height = 23
          Align = alTop
          Alignment = taRightJustify
          BevelOuter = bvNone
          Color = clBtnShadow
          ParentBackground = False
          TabOrder = 0
          ExplicitTop = 9
          object DBNavigator2: TDBNavigator
            Left = 0
            Top = 0
            Width = 313
            Height = 23
            DataSource = dtsEndereco
            VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete]
            Align = alLeft
            TabOrder = 0
          end
        end
        object grdEndereco: TDBGrid
          Left = 2
          Top = 38
          Width = 763
          Height = 197
          Align = alClient
          DataSource = dtsEndereco
          ReadOnly = True
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          OnDblClick = grdEnderecoDblClick
          Columns = <
            item
              Expanded = False
              FieldName = 'id_end'
              Width = 40
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'cep'
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'logradouro'
              Width = 200
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'numero'
              Width = 45
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'complemento'
              Width = 150
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'bairro'
              Width = 150
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'cidade'
              Width = 150
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'estado'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'pais'
              Width = 150
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'id_cliente'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'unidade'
              Width = 64
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ibge'
              Width = 81
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'gia'
              Width = 54
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'id_cliente'
              Visible = True
            end>
        end
      end
      object gpbCliente: TGroupBox
        Left = 0
        Top = 0
        Width = 767
        Height = 184
        Align = alTop
        Caption = 'Cliente'
        TabOrder = 0
        ExplicitTop = 9
        object Label1: TLabel
          Left = 77
          Top = 56
          Width = 27
          Height = 13
          Caption = 'Nome'
          FocusControl = DBEdit1
        end
        object Label2: TLabel
          Left = 24
          Top = 96
          Width = 52
          Height = 13
          Caption = 'Identidade'
          FocusControl = DBEdit2
        end
        object Label3: TLabel
          Left = 144
          Top = 96
          Width = 19
          Height = 13
          Caption = 'CPF'
          FocusControl = DBEdit3
        end
        object Label4: TLabel
          Left = 24
          Top = 136
          Width = 42
          Height = 13
          Caption = 'Telefone'
          FocusControl = DBEdit4
        end
        object Label5: TLabel
          Left = 144
          Top = 136
          Width = 28
          Height = 13
          Caption = 'E-mail'
          FocusControl = DBEdit5
        end
        object Label6: TLabel
          Left = 24
          Top = 56
          Width = 33
          Height = 13
          Caption = 'C'#243'digo'
          FocusControl = DBEdit6
        end
        object DBEdit1: TDBEdit
          Left = 77
          Top = 72
          Width = 660
          Height = 21
          DataField = 'nome'
          DataSource = dtsCliente
          TabOrder = 0
        end
        object DBEdit2: TDBEdit
          Left = 24
          Top = 112
          Width = 110
          Height = 21
          DataField = 'identidade'
          DataSource = dtsCliente
          TabOrder = 1
        end
        object DBEdit3: TDBEdit
          Left = 144
          Top = 112
          Width = 90
          Height = 21
          DataField = 'cpf'
          DataSource = dtsCliente
          TabOrder = 2
        end
        object DBEdit4: TDBEdit
          Left = 24
          Top = 152
          Width = 110
          Height = 21
          DataField = 'telefone'
          DataSource = dtsCliente
          TabOrder = 3
        end
        object DBEdit5: TDBEdit
          Left = 144
          Top = 152
          Width = 593
          Height = 21
          DataField = 'email'
          DataSource = dtsCliente
          TabOrder = 4
        end
        object DBEdit6: TDBEdit
          Left = 24
          Top = 72
          Width = 52
          Height = 21
          TabStop = False
          Color = 11516864
          DataField = 'id_cliente'
          DataSource = dtsCliente
          ReadOnly = True
          TabOrder = 5
        end
        object pnlBotoesCli: TPanel
          Left = 2
          Top = 15
          Width = 763
          Height = 33
          Align = alTop
          Alignment = taRightJustify
          BevelOuter = bvNone
          Color = clBtnShadow
          ParentBackground = False
          TabOrder = 6
          object DBNavigator1: TDBNavigator
            Left = 0
            Top = 0
            Width = 313
            Height = 33
            DataSource = dtsCliente
            VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbPost, nbCancel]
            Align = alLeft
            TabOrder = 0
          end
        end
      end
    end
    object tabEndereco: TTabSheet
      Caption = 'tabEndereco'
      ImageIndex = 2
      object GroupBox1: TGroupBox
        Left = 0
        Top = 0
        Width = 767
        Height = 421
        Align = alClient
        Caption = 'Endere'#231'o'
        TabOrder = 0
        DesignSize = (
          767
          421)
        object Label7: TLabel
          Left = 16
          Top = 16
          Width = 19
          Height = 13
          Caption = 'CEP'
          FocusControl = DBEdit7
        end
        object Label8: TLabel
          Left = 16
          Top = 56
          Width = 55
          Height = 13
          Caption = 'Logradouro'
          FocusControl = DBEdit8
        end
        object Label9: TLabel
          Left = 570
          Top = 56
          Width = 37
          Height = 13
          Caption = 'N'#250'mero'
          FocusControl = DBEdit9
        end
        object Label10: TLabel
          Left = 16
          Top = 96
          Width = 65
          Height = 13
          Caption = 'Complemento'
          FocusControl = DBEdit10
        end
        object Label11: TLabel
          Left = 16
          Top = 136
          Width = 28
          Height = 13
          Caption = 'Bairro'
          FocusControl = DBEdit11
        end
        object Label12: TLabel
          Left = 16
          Top = 176
          Width = 33
          Height = 13
          Caption = 'Cidade'
          FocusControl = DBEdit12
        end
        object Label13: TLabel
          Left = 417
          Top = 176
          Width = 33
          Height = 13
          Caption = 'Estado'
        end
        object Label14: TLabel
          Left = 16
          Top = 216
          Width = 19
          Height = 13
          Caption = 'Pa'#237's'
          FocusControl = DBEdit14
        end
        object DBEdit7: TDBEdit
          Left = 16
          Top = 32
          Width = 108
          Height = 21
          TabStop = False
          Color = 11516864
          DataField = 'cep'
          DataSource = dtsEndereco
          ReadOnly = True
          TabOrder = 0
        end
        object DBEdit8: TDBEdit
          Left = 16
          Top = 72
          Width = 553
          Height = 21
          DataField = 'logradouro'
          DataSource = dtsEndereco
          TabOrder = 1
        end
        object DBEdit9: TDBEdit
          Left = 570
          Top = 72
          Width = 55
          Height = 21
          DataField = 'numero'
          DataSource = dtsEndereco
          TabOrder = 2
        end
        object DBEdit10: TDBEdit
          Left = 16
          Top = 112
          Width = 200
          Height = 21
          DataField = 'complemento'
          DataSource = dtsEndereco
          TabOrder = 3
        end
        object DBEdit11: TDBEdit
          Left = 16
          Top = 152
          Width = 400
          Height = 21
          DataField = 'bairro'
          DataSource = dtsEndereco
          TabOrder = 4
        end
        object DBEdit12: TDBEdit
          Left = 16
          Top = 192
          Width = 400
          Height = 21
          DataField = 'localidade'
          DataSource = dtsEndereco
          TabOrder = 5
        end
        object DBEdit14: TDBEdit
          Left = 16
          Top = 232
          Width = 400
          Height = 21
          DataField = 'pais'
          DataSource = dtsEndereco
          TabOrder = 7
        end
        object DBComboBox1: TDBComboBox
          Left = 417
          Top = 192
          Width = 42
          Height = 21
          DataField = 'uf'
          DataSource = dtsEndereco
          Items.Strings = (
            'AC'
            'AL'
            'AP'
            'AM'
            'BA'
            'CE'
            'DF'
            'ES'
            'GO'
            'MA'
            'MT'
            'MS'
            'MG'
            'PA'
            'PB'
            'PR'
            'PE'
            'PI'
            'RJ'
            'RN'
            'RS'
            'RO'
            'RR'
            'SC'
            'SP'
            'SE'
            'TO')
          TabOrder = 6
          TabStop = False
        end
        object Panel1: TPanel
          Left = 1
          Top = 260
          Width = 764
          Height = 23
          Alignment = taRightJustify
          Anchors = [akLeft, akTop, akRight]
          BevelOuter = bvNone
          Color = clBtnShadow
          ParentBackground = False
          TabOrder = 8
          object DBNavigator3: TDBNavigator
            Left = 0
            Top = 0
            Width = 313
            Height = 23
            DataSource = dtsEndereco
            VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbPost, nbCancel]
            Align = alLeft
            TabOrder = 0
          end
        end
      end
    end
    object tabEmail: TTabSheet
      Caption = 'tabEmail'
      ImageIndex = 3
      object lblHost: TLabel
        Left = 3
        Top = 48
        Width = 26
        Height = 13
        Caption = 'Host:'
        Color = clBtnFace
        ParentColor = False
      end
      object lblFrom: TLabel
        Left = 19
        Top = 11
        Width = 59
        Height = 13
        Caption = 'From e-Mail:'
        Color = clBtnFace
        ParentColor = False
      end
      object lblFromName: TLabel
        Left = 308
        Top = 10
        Width = 58
        Height = 13
        Caption = 'From Name:'
        Color = clBtnFace
        ParentColor = False
      end
      object lblUser: TLabel
        Left = 19
        Top = 103
        Width = 56
        Height = 13
        Caption = 'User Name:'
        Color = clBtnFace
        ParentColor = False
      end
      object lblPassword: TLabel
        Left = 308
        Top = 103
        Width = 50
        Height = 13
        Caption = 'Password:'
        Color = clBtnFace
        ParentColor = False
      end
      object lblPort: TLabel
        Left = 308
        Top = 56
        Width = 24
        Height = 13
        Caption = 'Port:'
        Color = clBtnFace
        ParentColor = False
      end
      object lblTipoAutenticacao: TLabel
        Left = 380
        Top = 57
        Width = 90
        Height = 13
        Caption = 'Tipo Autentica'#231#227'o:'
        Color = clBtnFace
        ParentColor = False
      end
      object lblDefaultCharset: TLabel
        Left = 19
        Top = 148
        Width = 80
        Height = 13
        Caption = 'Default Charset:'
        Color = clBtnFace
        ParentColor = False
      end
      object lbl1: TLabel
        Left = 308
        Top = 148
        Width = 62
        Height = 13
        Caption = 'IDE Charset:'
        Color = clBtnFace
        ParentColor = False
      end
      object Label15: TLabel
        Left = 22
        Top = 197
        Width = 126
        Height = 13
        Caption = 'Para e-Mail (AddAddress):'
        Color = clBtnFace
        ParentColor = False
      end
      object lblAdressName: TLabel
        Left = 329
        Top = 197
        Width = 56
        Height = 13
        Caption = 'Para Nome:'
        Color = clBtnFace
        ParentColor = False
      end
      object Label16: TLabel
        Left = 22
        Top = 287
        Width = 160
        Height = 13
        Caption = 'Mensagem (Alt Body modo texto)'
        Color = clBtnFace
        ParentColor = False
      end
      object Label17: TLabel
        Left = 22
        Top = 242
        Width = 90
        Height = 13
        Caption = 'Assunto (Subject):'
        Color = clBtnFace
        ParentColor = False
      end
      object edtHost: TEdit
        Left = 19
        Top = 74
        Width = 283
        Height = 21
        TabOrder = 0
        Text = 'smtp.empresa.com.br'
      end
      object edtFrom: TEdit
        Left = 19
        Top = 29
        Width = 283
        Height = 21
        TabOrder = 1
        Text = 'fulano@empresa.com.br'
      end
      object edtFromName: TEdit
        Left = 308
        Top = 29
        Width = 283
        Height = 21
        TabOrder = 2
        Text = 'Fula do Tal'
      end
      object edtUser: TEdit
        Left = 19
        Top = 121
        Width = 283
        Height = 21
        TabOrder = 3
        Text = 'fulano@empresa.com.br'
      end
      object edtPassword: TEdit
        Left = 308
        Top = 121
        Width = 283
        Height = 21
        PasswordChar = '@'
        TabOrder = 4
        Text = 'fulano@empresa.com.br'
      end
      object chkMostraSenha: TCheckBox
        Left = 364
        Top = 102
        Width = 77
        Height = 17
        Caption = 'Mostrar?'
        TabOrder = 5
      end
      object edtPort: TEdit
        Left = 308
        Top = 74
        Width = 58
        Height = 21
        TabOrder = 6
        Text = '587'
      end
      object btnSalvar: TButton
        Left = 19
        Top = 384
        Width = 194
        Height = 25
        Caption = 'Salvar Configura'#231#227'o'
        TabOrder = 7
        OnClick = btnSalvarClick
      end
      object chkTLS: TCheckBox
        Left = 380
        Top = 76
        Width = 45
        Height = 17
        Caption = 'TLS'
        TabOrder = 8
      end
      object chkSSL: TCheckBox
        Left = 431
        Top = 76
        Width = 45
        Height = 17
        Caption = 'SSL'
        TabOrder = 9
      end
      object cbbDefaultCharset: TComboBox
        Left = 19
        Top = 167
        Width = 283
        Height = 21
        Style = csDropDownList
        TabOrder = 10
      end
      object cbbIdeCharSet: TComboBox
        Left = 308
        Top = 168
        Width = 283
        Height = 21
        Style = csDropDownList
        TabOrder = 11
      end
      object edtAddressEmail: TEdit
        Left = 22
        Top = 215
        Width = 301
        Height = 21
        TabOrder = 12
        Text = 'fulano@empresa.com.br'
      end
      object edtAddressName: TEdit
        Left = 329
        Top = 215
        Width = 219
        Height = 21
        TabOrder = 13
        Text = 'Fulano de Tal'
      end
      object edtSubject: TEdit
        Left = 22
        Top = 260
        Width = 301
        Height = 21
        TabOrder = 14
        Text = 'Teste de Envio '#193#201#205#211#218#199#231#225#233#237#250#243' - 0'
      end
      object mAltBody: TMemo
        Left = 23
        Top = 305
        Width = 300
        Height = 64
        Lines.Strings = (
          'Linha 1'
          'Linha 2'
          '   Teste de e-mail'
          #193#201#205#211#218#231#199#227#194)
        TabOrder = 15
        WordWrap = False
      end
    end
  end
  object memCliente: TFDMemTable
    BeforeInsert = memClienteBeforeInsert
    BeforePost = memClienteBeforePost
    AfterPost = memClienteAfterPost
    BeforeCancel = memClienteBeforeCancel
    AfterScroll = memClienteAfterScroll
    OnNewRecord = memClienteNewRecord
    IndexFieldNames = 'id_cliente;nome'
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired]
    UpdateOptions.CheckRequired = False
    Left = 488
    object memClientenome: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'nome'
      Size = 100
    end
    object memClienteidentidade: TStringField
      DisplayLabel = 'Identidade'
      FieldName = 'identidade'
      Size = 14
    end
    object memClientecpf: TStringField
      DisplayLabel = 'CPF'
      FieldName = 'cpf'
      OnValidate = memClientecpfValidate
      EditMask = '000.000.000-00;0;_'
      Size = 11
    end
    object memClientetelefone: TStringField
      DisplayLabel = 'Telefone'
      FieldName = 'telefone'
      EditMask = '!\(99\)00000-0009999;0;_'
      Size = 14
    end
    object memClienteemail: TStringField
      DisplayLabel = 'E-mail'
      FieldName = 'email'
      OnValidate = memClienteemailValidate
      Size = 100
    end
    object memClienteid_cliente: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'id_cliente'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
  end
  object memEndereco: TFDMemTable
    BeforePost = memEnderecoBeforePost
    AfterPost = memEnderecoAfterPost
    BeforeCancel = memEnderecoBeforeCancel
    BeforeDelete = memEnderecoBeforeDelete
    AfterScroll = memEnderecoAfterScroll
    OnNewRecord = memEnderecoNewRecord
    IndexFieldNames = 'id_cliente;id_end'
    MasterSource = dtsCliente
    MasterFields = 'id_cliente'
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired]
    UpdateOptions.CheckRequired = False
    Left = 600
    object memEnderecoid_end: TSmallintField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'id_end'
    end
    object memEnderecocep: TStringField
      Tag = 1
      DisplayLabel = 'CEP'
      DisplayWidth = 9
      FieldName = 'cep'
      EditMask = '00000\-000;0;_'
      Size = 8
    end
    object memEnderecologradouro: TStringField
      Tag = 1
      DisplayLabel = 'Logradouro'
      FieldName = 'logradouro'
      Size = 80
    end
    object memEndereconumero: TStringField
      DisplayLabel = 'N'#250'mero'
      FieldName = 'numero'
      Size = 10
    end
    object memEnderecocomplemento: TStringField
      Tag = 1
      DisplayLabel = 'Complemento'
      FieldName = 'complemento'
      Size = 40
    end
    object memEnderecobairro: TStringField
      Tag = 1
      DisplayLabel = 'Bairro'
      FieldName = 'bairro'
      Size = 80
    end
    object memEnderecolocalidade: TStringField
      Tag = 1
      DisplayLabel = 'Cidade'
      FieldName = 'localidade'
      Size = 80
    end
    object memEnderecouf: TStringField
      Tag = 1
      DisplayLabel = 'Estado'
      FieldName = 'uf'
      Size = 2
    end
    object memEnderecopais: TStringField
      DisplayLabel = 'Pa'#237's'
      FieldName = 'pais'
      Size = 80
    end
    object memEnderecounidade: TStringField
      Tag = 1
      DisplayLabel = 'Unidade'
      FieldName = 'unidade'
    end
    object memEnderecoibge: TStringField
      Tag = 1
      DisplayLabel = 'C'#243'digo IBGE'
      FieldName = 'ibge'
    end
    object memEnderecogia: TStringField
      Tag = 1
      DisplayLabel = 'Gia'
      FieldName = 'gia'
    end
    object memEnderecoid_cliente: TIntegerField
      DisplayLabel = 'C'#243'd. Cliente'
      FieldName = 'id_cliente'
    end
  end
  object dtsCliente: TDataSource
    DataSet = memCliente
    Left = 528
  end
  object dtsEndereco: TDataSource
    DataSet = memEndereco
    Left = 640
  end
  object ACBrValidador1: TACBrValidador
    IgnorarChar = './-'
    Left = 392
  end
  object ACBrMail1: TACBrMail
    Host = '127.0.0.1'
    Port = '25'
    SetSSL = False
    SetTLS = False
    Attempts = 3
    DefaultCharset = UTF_8
    IDECharset = CP1252
    Left = 496
    Top = 102
  end
end
