<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="KonverteringTemperaturer.Default" ViewStateMode="Disabled" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Css/Css.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">

    <div id="All">

        <h1>Convert Temperature</h1>

        <div><!--Skapar en div som kommmer innehålla text-->

            <asp:ValidationSummary ID="ValidationSummary1" 
                runat="server" 
                CssClass="Red" 
                />

            <!--Skapar här första rutan med input-->
            <asp:Label ID="TempStart" 
                runat="server" 
                Text="Start Temperature:" 
                CssClass="Green">

            </asp:Label>

            <div><!--Skapar en div i diven för att få textbx under labeln!-->
                <asp:TextBox ID="EnterTempStart" 
                    runat="server" 
                    CssClass="Box1" 
                    ControlToValidate="EnterTempStart" 
                    MinimumValue="EnterTempStart">

                </asp:TextBox>
                <%-- Sätter här de olika validerings verktygen för start temperaturen --%>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" 
                    Text="*" 
                    runat="server" 
                    ErrorMessage="This Field Can't be Empty" 
                    Display="Dynamic" 
                    ControlToValidate="EnterTempStart">

                </asp:RequiredFieldValidator>

                <asp:CompareValidator ID="CompareValidator1" 
                    Text="*" 
                    runat="server" 
                    ErrorMessage="Must be a Valid Number!" 
                    Operator="DataTypeCheck" 
                    Display="Dynamic" 
                    ControlToValidate="EnterTempStart" 
                    Type="Integer">

                </asp:CompareValidator>

            </div>

            <!--Skapar andra rutan med input-->
            <asp:Label ID="TempEnd" 
                runat="server" 
                Text="Stop temperature:" 
                CssClass="Red">

            </asp:Label>
            <%-- Sätter här validerings verktygen för slut temperaturen --%>
            <div>
                <asp:TextBox ID="EnterTempEnd" 
                    runat="server" 
                    CssClass="Box2" 
                    ControlToValidate="EnterTempEnd">

                </asp:TextBox>
                
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" 

                    Text="*" runat="server" 
                    ErrorMessage="This Field Can't be Empty" 
                    Display="Dynamic" 
                    ControlToValidate="EnterTempEnd">

                </asp:RequiredFieldValidator>

                <asp:CompareValidator ID="CompareValidator2" 
                    Text="*" 
                    runat="server" 
                    ErrorMessage="Must Be Bigger Than Start Temperature!" 
                    ControlToCompare="EnterTempStart" 
                    Operator="GreaterThan" 
                    Display="Dynamic" 
                    ControlToValidate="EnterTempEnd" 
                    Type="Integer">

                </asp:CompareValidator>

            </div>

            <!--Skapar tredje rutan med input-->
            <asp:Label ID="TempDifference" 
                runat="server" 
                Text="Enter the temperature jump:">

            </asp:Label>

            <div>
                <asp:TextBox ID="EnterTempJump" 
                    runat="server" 
                    CssClass="Box3" 
                    ControlToValidate="EnterTempJump">

                </asp:TextBox>
                <%-- Sätter validerings verktygen för steg temperaturen! --%>
                <asp:RangeValidator ID="RangeValidator1" 
                    Text="*" 
                    runat="server" 
                    ErrorMessage="Must Be Between 1 and 100" 
                    ControlToValidate="EnterTempJump" 
                    Display="Dynamic" 
                    MaximumValue="100" 
                    MinimumValue="1" 
                    Type="Integer">

                </asp:RangeValidator>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" 
                    Text="*" runat="server" 
                    ErrorMessage="This Field Can't be Empty" 
                    Display="Dynamic" 
                    ControlToValidate="EnterTempJump">

                </asp:RequiredFieldValidator>

                <%--<asp:CompareValidator ID="CompareValidator3" runat="server" ErrorMessage="Must be a Valid Number!" Operator="GreaterThan" Display="Dynamic" ControlToValidate="EnterTempJump"></asp:CompareValidator>--%>
            
            </div>

        </div>
          
        <div>

            <!--Skapar texten med kryssrutorna!-->
            <asp:Label ID="ChangeCTF" 
                runat="server" 
                Text="Choose type to convert:">

            </asp:Label>

            <div>
                <asp:RadioButton ID="EntryC" 
                    GroupName="radiobutton"
                    runat="server" 
                    Text="Celsius to Fahrenheit" 
                    Checked="True" 
                    />
            </div>

            <div>
                <asp:RadioButton ID="EntryF" 
                    GroupName="radiobutton"
                    runat="server" 
                    Text="Fahrenheit to Celsius"
                    />
            </div>

        </div>

        <div>

            <!--SKapar knappen som ska konvertera-->
            <asp:Button ID="ConvertCelsius" 
                runat="server" 
                Text="Convert" 
                OnClick="Convert_Click"
                 />

            <asp:Button ID="ConvertFahrenheit" 
                runat="server" 
                Text="Convert" 
                />

        </div>

        <div>

            <!--SKapar här tabellen som ska presenteras senare!-->
            <asp:Table ID="Presentation" 
                runat="server" 
                CssClass="Table"
                Visible="False">

            </asp:Table>
        </div>

    </div>
    </form>
</body>
</html>
