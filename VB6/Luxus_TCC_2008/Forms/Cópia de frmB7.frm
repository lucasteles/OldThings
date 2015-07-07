VERSION 5.00
Object = "{5E9E78A0-531B-11CF-91F6-C2863C385E30}#1.0#0"; "MSFLXGRD.OCX"
Begin VB.Form frmB8 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Busca transportadora"
   ClientHeight    =   4485
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   6750
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   4485
   ScaleWidth      =   6750
   ShowInTaskbar   =   0   'False
   Begin VB.Frame Frame4 
      Caption         =   "Busca"
      Height          =   855
      Left            =   120
      TabIndex        =   2
      Top             =   120
      Width           =   4095
      Begin VB.TextBox txtbuscas 
         Height          =   315
         Left            =   1800
         MaxLength       =   50
         TabIndex        =   4
         Top             =   360
         Width           =   2175
      End
      Begin VB.ComboBox cmbBusca 
         Height          =   315
         ItemData        =   "C�pia de frmB7.frx":0000
         Left            =   240
         List            =   "C�pia de frmB7.frx":000D
         TabIndex        =   3
         Text            =   "R. Social"
         Top             =   360
         Width           =   1455
      End
   End
   Begin VB.CommandButton Command2 
      Caption         =   "Cancel"
      Height          =   375
      Left            =   2040
      TabIndex        =   1
      Top             =   3960
      Width           =   1575
   End
   Begin VB.CommandButton Command1 
      Caption         =   "OK"
      Height          =   375
      Left            =   120
      TabIndex        =   0
      Top             =   3960
      Width           =   1815
   End
   Begin MSFlexGridLib.MSFlexGrid flexClientes 
      Height          =   2655
      Left            =   120
      TabIndex        =   5
      Top             =   1080
      Width           =   6495
      _ExtentX        =   11456
      _ExtentY        =   4683
      _Version        =   393216
      Cols            =   4
      BackColorFixed  =   14737632
      BackColorBkg    =   12632256
      FormatString    =   "Codigo     | Razao Social                                         |Cnpj                    | Telefone           "
   End
End
Attribute VB_Name = "frmB8"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()

frmPed_Trans.mskCod_Ped_Trans.PromptInclude = False
frmPed_Trans.txtRazaoSocial = Empty
frmPed_Trans.mskCod_Ped_Trans = flexClientes.TextMatrix(flexClientes.Row, 0)
frmPed_Trans.cmdBuscar_Cod_Trans = True
frmPed_Trans.mskCod_Ped_Trans.PromptInclude = True

Unload Me
End Sub
Private Sub Command2_Click()
Unload Me
End Sub

Private Sub flexClientes_DblClick()
frmPed_Trans.mskCod_Ped_Trans.PromptInclude = False
frmPed_Trans.txtRazaoSocial = Empty
frmPed_Trans.mskCod_Ped_Trans = flexClientes.TextMatrix(flexClientes.Row, 0)
frmPed_Trans.cmdBuscar_Cod_Trans = True
frmPed_Trans.mskCod_Ped_Trans.PromptInclude = True

Unload Me

End Sub

Private Sub Form_Activate()
Call trans
End Sub

Private Sub Form_Load()
            Call trans
          actskin.ApplySkin Me.hWnd
             actskin2.ApplySkin (Command1.hWnd)
             actskin2.ApplySkin (Command2.hWnd)
            Call carregar_lista

End Sub
Private Sub carregar_lista()
  With flexClientes
            
            Dim cont1 As Integer
            cont1 = 1
            .Rows = cont1 + 1
            If tabelas.EOF = False Or tabelas.BOF = False Then
            tabelas.MoveFirst
            
            .TextMatrix(cont1, 0) = tabelas!codigo
            .TextMatrix(cont1, 1) = tabelas!razaosocial
            .TextMatrix(cont1, 2) = tabelas!cnpj
            .TextMatrix(cont1, 3) = tabelas!telefone
            
            While cont1 <> Empty
            cont1 = cont1 + 1
            tabelas.MoveNext
            If tabelas.EOF = False Then
            .Rows = cont1 + 1
            .TextMatrix(cont1, 0) = tabelas!codigo
            .TextMatrix(cont1, 1) = tabelas!razaosocial
            .TextMatrix(cont1, 2) = tabelas!cnpj
            .TextMatrix(cont1, 3) = tabelas!telefone

            Else
            cont1 = Clear
            End If
            Wend
            
             End If
            End With
           
End Sub
Private Sub Form_Unload(Cancel As Integer)
frmPed_Trans.Enabled = True
End Sub

Private Sub txtbuscas_Change()
               If cmbBusca = "R. Social" Then
            tabelas.Close
            tabelas.Open "select * from TRANSPORTADORA where razaosocial like '" & Replace(Replace(txtbuscas, "'", "''"), Chr(34), "") & "%' order by codigo"
            Call carregar_lista
            ElseIf cmbBusca = "Telefone" Then
             tabelas.Close
             tabelas.Open "select * from TRANSPORTADORA where telefone like '" & Replace(Replace(txtbuscas, "'", "''"), Chr(34), "") & "%' order by codigo"
            Call carregar_lista
            ElseIf cmbBusca = "CNPJ" Then
            tabelas.Close
             tabelas.Open "select * from TRANSPORTADORA where cnpj like '" & Replace(Replace(txtbuscas, "'", "''"), Chr(34), "") & "%' order by codigo"
            End If
End Sub
