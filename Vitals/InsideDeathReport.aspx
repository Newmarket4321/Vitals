<%@ Page Title="" Language="C#" MasterPageFile="~/AdminLTE.Master" AutoEventWireup="true" CodeBehind="InsideDeathReport.aspx.cs" Inherits="Vitals.InsideDeathReport" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
    <link href="Style/jquery-ui.css" rel="stylesheet" />
    <script src="Scripts/jquery-3.5.1.js"></script>
    <script src="Scripts/jquery-ui.js"></script>
     <script>
         window.onload = function () {
              if (document.getElementById("<%=Deathyear.ClientID%>").value == "")
                document.getElementById("<%=Deathyear.ClientID%>").style.border = '1px solid red';
            else
                document.getElementById("<%=Deathyear.ClientID%>").style.border = '1px solid #ced4da';

            if (document.getElementById("<%=MonthFrom.ClientID%>").value == "")
                document.getElementById("<%=MonthFrom.ClientID%>").style.border = '1px solid red';
            else
                document.getElementById("<%=MonthFrom.ClientID%>").style.border = '1px solid #ced4da';

            if (document.getElementById("<%=MonthTo.ClientID%>").value == "")
                document.getElementById("<%=MonthTo.ClientID%>").style.border = '1px solid red';
            else
                 document.getElementById("<%=MonthTo.ClientID%>").style.border = '1px solid #ced4da';

             if (document.getElementById("<%=Type.ClientID%>").value == "")
                document.getElementById("<%=Type.ClientID%>").style.border = '1px solid red';
            else
                document.getElementById("<%=Type.ClientID%>").style.border = '1px solid #ced4da';

         }
          $(document).ready(function () {
            $(function () {
                $("#<%=Deathyear.ClientID%>").change(function () {
                    if (document.getElementById("<%=Deathyear.ClientID%>").value == "")
                        document.getElementById("<%=Deathyear.ClientID%>").style.border = '1px solid red';
                    else
                        document.getElementById("<%=Deathyear.ClientID%>").style.border = '1px solid #ced4da';
                });
            });
         });
         $(document).ready(function () {
            $(function () {
                $("#<%=MonthFrom.ClientID%>").change(function () {
                    if (document.getElementById("<%=MonthFrom.ClientID%>").value == "")
                        document.getElementById("<%=MonthFrom.ClientID%>").style.border = '1px solid red';
                    else
                        document.getElementById("<%=MonthFrom.ClientID%>").style.border = '1px solid #ced4da';
                });
            });
         });
          $(document).ready(function () {
            $(function () {
                $("#<%=MonthTo.ClientID%>").change(function () {
                    if (document.getElementById("<%=MonthTo.ClientID%>").value == "")
                        document.getElementById("<%=MonthTo.ClientID%>").style.border = '1px solid red';
                    else
                        document.getElementById("<%=MonthTo.ClientID%>").style.border = '1px solid #ced4da';
                });
            });
         });
          $(document).ready(function () {
            $(function () {
                $("#<%=Type.ClientID%>").change(function () {
                    if (document.getElementById("<%=Type.ClientID%>").value == "")
                        document.getElementById("<%=Type.ClientID%>").style.border = '1px solid red';
                    else
                        document.getElementById("<%=Type.ClientID%>").style.border = '1px solid #ced4da';
                });
            });
        });
     </script>

    <div class="container">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <div style="border: thin; border-color: black; color: #005595; font-family: Arial; font-size: 16px;">
                        <div class="card card-info">
                            <div class="card-header">
                                <h3 class="card-title">Control File</h3>
                            </div>
                            <div class="card-body">
                                <div class="form-group row">
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <asp:Label ID="Label1" runat="server" Text="Year of Death"></asp:Label>
                                            <asp:TextBox ID="Deathyear" class="form-control" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <asp:Label ID="Label2" runat="server" Text="Month From"></asp:Label>
                                            <asp:TextBox ID="MonthFrom" class="form-control" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <asp:Label ID="Label3" runat="server" Text="Month To"></asp:Label>
                                            <asp:TextBox ID="MonthTo" class="form-control" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                     <div class="col-md-3">
                                        <div class="form-group">
                                            <asp:Label ID="Label4" runat="server" Text="Type"></asp:Label>
                                            <asp:TextBox ID="Type" class="form-control" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                      <asp:LinkButton ID="SubmitBtn" runat="server" CssClass="btn btn-info" OnClick="SubmitBtn_Click">
                            <i class="fa fa-save"></i>&nbsp;Generate Report</asp:LinkButton>
                                </div>
                                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

                                <rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Arial Black"
                                    Font-Size="7pt" InteractiveDeviceInfos="(Collection)" ShowParameterPrompts="true" ShowBackButton="false" 
                                    ShowZoomControl="false"  WaitMessageFont-Names="Arial Black" WaitMessageFont-Size="12pt" Width="100%">
                                    <LocalReport ReportPath="Reports/InsideDeath.rdlc">
                                        <DataSources>
                                            <rsweb:ReportDataSource DataSourceId="ObjectDataSource1" Name="Inside_Death" />
                                        </DataSources>
                                    </LocalReport>
                                </rsweb:ReportViewer>
                                <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}" 
                                    SelectMethod="GetData" TypeName="Vitals.Report_InsideDeathsTableAdapters.ReportInsideDeathTableAdapter">
                                    <SelectParameters>
                                        <asp:Parameter Name="DeathYear" Type="Int32" />
                                        <asp:Parameter Name="MonthFrom" Type="String" />
                                        <asp:Parameter Name="MonthTo" Type="String" />
                                        <asp:Parameter Name="Type" Type="String" />
                                    </SelectParameters>
                                </asp:ObjectDataSource>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
      <script>
      
        function showMyDialog(msg, alertype) {
            $(function () {
                toastr[alertype](msg, alertype,
                    {
                        positionClass: "toast-top-center",
                        closeButton: true,
                        timeOut: 0,
                        extendedTimeOut: 0,

                    })
            });

        }
    </script>
</asp:Content>