<%@ Page Title="" Language="C#" MasterPageFile="~/AdminLTE.Master" AutoEventWireup="true" CodeBehind="Invoice_Report.aspx.cs" Inherits="Vitals.Invoice_Report" %>

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
            if (document.getElementById("<%=StartDate.ClientID%>").value == "")
                document.getElementById("<%=StartDate.ClientID%>").style.border = '1px solid red';
            else
                document.getElementById("<%=StartDate.ClientID%>").style.border = '1px solid #ced4da';

            if (document.getElementById("<%=EndDate.ClientID%>").value == "")
                document.getElementById("<%=EndDate.ClientID%>").style.border = '1px solid red';
            else
                document.getElementById("<%=EndDate.ClientID%>").style.border = '1px solid #ced4da';

            if (document.getElementById("<%=SigninName.ClientID%>").value == "")
                document.getElementById("<%=SigninName.ClientID%>").style.border = '1px solid red';
            else
                document.getElementById("<%=SigninName.ClientID%>").style.border = '1px solid #ced4da';



        }
        $(document).ready(function () {
            $(function () {
                $("#<%=StartDate.ClientID%>").change(function () {
                    if (document.getElementById("<%=StartDate.ClientID%>").value == "")
                        document.getElementById("<%=StartDate.ClientID%>").style.border = '1px solid red';
                    else
                        document.getElementById("<%=StartDate.ClientID%>").style.border = '1px solid #ced4da';
                });
            });
        });
        $(document).ready(function () {
            $(function () {
                $("#<%=EndDate.ClientID%>").change(function () {
                    if (document.getElementById("<%=EndDate.ClientID%>").value == "")
                        document.getElementById("<%=EndDate.ClientID%>").style.border = '1px solid red';
                    else
                        document.getElementById("<%=EndDate.ClientID%>").style.border = '1px solid #ced4da';
                });
            });
        });
        $(document).ready(function () {
            $(function () {
                $("#<%=SigninName.ClientID%>").change(function () {
                    if (document.getElementById("<%=SigninName.ClientID%>").value == "")
                        document.getElementById("<%=SigninName.ClientID%>").style.border = '1px solid red';
                    else
                        document.getElementById("<%=SigninName.ClientID%>").style.border = '1px solid #ced4da';
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
                                <h3 class="card-title">Invoice</h3>
                            </div>
                            <div class="card-body">
                                <div class="form-group row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <asp:Label ID="Label1" runat="server" Text="Please Enter Start Date MM-DD-YYYY"></asp:Label>
                                            <asp:TextBox ID="StartDate" class="form-control" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <asp:Label ID="Label2" runat="server" Text="Please Enter End Date MM-DD-YYYY"></asp:Label>
                                            <asp:TextBox ID="EndDate" class="form-control" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <asp:Label ID="Label3" runat="server" Text="Please Enter Signin Name"></asp:Label>
                                            <asp:TextBox ID="SigninName" class="form-control" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <asp:LinkButton ID="SubmitBtn" runat="server" CssClass="btn btn-info" OnClick="SubmitBtn_Click">
                                                <i class="fa fa-save"></i>&nbsp;Generate Report
                                </asp:LinkButton>
                                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

                                <rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Arial Black"
                                    Font-Size="7pt" InteractiveDeviceInfos="(Collection)" ShowParameterPrompts="false" ShowBackButton="false" ShowZoomControl="false"
                                    WaitMessageFont-Names="Arial Black" WaitMessageFont-Size="12pt" Width="100%">
                                    <LocalReport ReportPath="Reports/Invoice.rdlc">
                                        <DataSources>
                                            <rsweb:ReportDataSource DataSourceId="ObjectDataSource1" Name="Invoice" />
                                        </DataSources>
                                    </LocalReport>
                                </rsweb:ReportViewer>
                                <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}"
                                    SelectMethod="GetData" TypeName="Vitals.InvoiceReportTableAdapters.ReportInvoiceTableAdapter">
                                    <SelectParameters>
                                        <asp:Parameter Name="StartDate" Type="DateTime" />
                                        <asp:Parameter Name="EndDate" Type="DateTime" />
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
