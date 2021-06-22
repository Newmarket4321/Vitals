<%@ Page Title="" Language="C#" MasterPageFile="~/AdminLTE.Master" AutoEventWireup="true" CodeBehind="MarriagesApplicationVerification_Report.aspx.cs" Inherits="Vitals.MarriagesApplicationVerification_Reportaspx" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
    <link href="Style/jquery-ui.css" rel="stylesheet" />
    <script src="Scripts/jquery-3.5.1.js"></script>
    <script src="Scripts/jquery-ui.js"></script>
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
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <asp:Label ID="Label1" runat="server" Text="Please enter Registraion year of Marriage"></asp:Label>
                                            <asp:TextBox ID="Mrgyear" class="form-control" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <asp:Label ID="Label2" runat="server" Text="Please enter Registraion Number"></asp:Label>
                                            <asp:TextBox ID="MrgNumber" class="form-control" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    
                                    <asp:LinkButton ID="SubmitBtn" runat="server" CssClass="btn btn-info" OnClick="SubmitBtn_Click">
                                                <i class="fa fa-save"></i>&nbsp;Generate Report
                                    </asp:LinkButton>
                                </div>
                                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

                                <rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Arial Black"
                                    Font-Size="7pt" InteractiveDeviceInfos="(Collection)" ShowParameterPrompts="false" ShowBackButton="false" ShowZoomControl="false"
                                    WaitMessageFont-Names="Arial Black" WaitMessageFont-Size="12pt" Width="100%">
                                    <LocalReport ReportPath="Reports/MarriageApplicationVerification.rdlc">
                                        <DataSources>
                                            <rsweb:ReportDataSource DataSourceId="ObjectDataSource1" Name="ApplicationVerification" />
                                        </DataSources>
                                    </LocalReport>
                                </rsweb:ReportViewer>
                                <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}"
                                    SelectMethod="ApplicationVerification" TypeName="Vitals.Reports.MarriagesTableAdapters.MrgApplicationVerification">
                                    <SelectParameters>
                                        <asp:Parameter Name="MRegYear" Type="Int32" />
                                        <asp:Parameter Name="MRegNo" Type="Int32" />
                                    </SelectParameters>
                                </asp:ObjectDataSource>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
