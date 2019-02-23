unit mainunit;
//***************************************************************************************
//  Description: Contains the main user interface for FileSpector.
//    File Name: mainunit.pas
//
//---------------------------------------------------------------------------------------
//                          C O P Y R I G H T
//---------------------------------------------------------------------------------------
//           Copyright (c) 2019 by Frank Voorburg   All rights reserved
//
//   This software has been carefully tested, but is not guaranteed for any particular
// purpose. The author does not offer any warranties and does not guarantee the accuracy,
//   adequacy, or completeness of the software and is not responsible for any errors or
//              omissions or the results obtained from use of the software.
//
//---------------------------------------------------------------------------------------
//                            L I C E N S E
//---------------------------------------------------------------------------------------
// This file is part of LazPolKit. LazPolKit is free software: you can redistribute
// it and/or modify it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or (at your option) any
// later version.
//
// LazPolKit is distributed in the hope that it will be useful, but WITHOUT ANY
// WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
// PARTICULAR PURPOSE. See the GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License along with this
// program.  If not, see <http://www.gnu.org/licenses/>.
//
//***************************************************************************************
{$IFDEF FPC}
{$MODE objfpc}{$H+}
{$ENDIF}

interface
//***************************************************************************************
// Includes
//***************************************************************************************
uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls, Process;


//***************************************************************************************
// Type Definitions
//***************************************************************************************
type

  { TMainForm }

  TMainForm = class(TForm)
    BtnRun: TButton;
    EdtCommand: TEdit;
    GbxInput: TGroupBox;
    GbxOutput: TGroupBox;
    LblCommand: TLabel;
    MmoOutput: TMemo;
    procedure BtnRunClick(Sender: TObject);
  private

  public

  end;


//***************************************************************************************
// Global data declarations
//***************************************************************************************
var
  MainForm: TMainForm;


implementation

{$R *.lfm}

{ TMainForm }

//***************************************************************************************
// NAME:           BtnRunClick
// PARAMETER:      Sender Source of the event.
// RETURN VALUE:   none
// DESCRIPTION:    Event handler that gets called when the button is clicked.
//
//***************************************************************************************
procedure TMainForm.BtnRunClick(Sender: TObject);
var
  Process: TProcess;
begin
  Process := TProcess.Create(nil);
  Process.CommandLine := EdtCommand.Text;
  Process.Options := [poWaitOnExit, poUsePipes, poStdErrToOutPut];
  Process.Execute;
  MmoOutput.Lines.LoadFromStream(Process.Output);
end; //*** end of BtnRunClick ***

end.
//******************************** end of mainunit.pas **********************************

