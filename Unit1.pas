(*


The MIT License (MIT)

Copyright (c) 2016 Guotou

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.


*)







unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ShellAPI, StdCtrls, jpeg, ExtCtrls;

type
  TfrmMain = class(TForm)
    lblTop: TLabel;
    lblIpAddr: TLabel;
    edtIpAddr: TEdit;
    edtCIAFile: TEdit;
    lblCIAFile: TLabel;
    btnBrowse: TButton;
    lblStpMin1: TLabel;
    lblStp3: TLabel;
    btnStart: TButton;
    btnExit: TButton;
    lblVer: TLabel;
    imgLogo: TImage;
    lblExtInfo: TLabel;
    lblStp0: TLabel;
    dlgOpen: TOpenDialog;
    procedure btnBrowseClick(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
    procedure edtIpAddrChange(Sender: TObject);
    procedure btnStartClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

  ipAddr: string;        //ip��ַ
  filePath: string;          //·��
  ipWithPath: string;       //����ȫip��ַ+�ļ�
  path:string;

implementation

{$R *.dfm}


//���CIA�ļ�
procedure TfrmMain.btnBrowseClick(Sender: TObject);
begin
  dlgOpen.Filter:='CIA�ļ�(*.cia)|*.cia';
  dlgOpen.Execute;
  filePath:=dlgOpen.GetNamePath;
  edtCIAFile.Text:=dlgOpen.FileName;  //���ļ�����·��д���ı���
end;


//�˳�
procedure TfrmMain.btnExitClick(Sender: TObject);
begin
  Application.Terminate
end;


//ip��ַ�����
procedure TfrmMain.edtIpAddrChange(Sender: TObject);
begin
  ipAddr:= edtIpAddr.Text
end;




//��ʼ���䰴ť
procedure TfrmMain.btnStartClick(Sender: TObject);
begin
  ipWithPath:= PChar(ipAddr)+' '+dlgOpen.FileName;       //����ip+�ļ���
    if MessageBox(0,'��ʼ���䣿','ȷ��',MB_ICONINFORMATION+MB_OkCancel)=ID_OK then          //ȷ��
      begin


        ShellExecute(Handle,'open','sockfilego.exe',PChar(ipWithPath),PChar(path),SW_SHOWNORMAL);      //ʹ��sockfilego����


      end;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
        path:=GetCurrentDir + '\';
end;

end.


