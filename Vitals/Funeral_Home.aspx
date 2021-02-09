<%@ Page Title="" Language="C#" MasterPageFile="~/Vitals.Master" AutoEventWireup="true" CodeBehind="Funeral_Home.aspx.cs" Inherits="Vitals.Funeral_Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
    <div class="container">
         
        <div class="row" style="padding-top: 15%;">
              <div class="col-md-6">
                <div class="form-group row float-left" style="margin-left: 35px;">
                    <div class="form-group">
                        <asp:LinkButton ID="Backbtn" runat="server" CssClass="btn btn-small btn-primary" style="background-color:gray;border-color:gray;"
                            OnClick="Backbtn_Click" Visible="false">
                            <i class="fa fa-arrow-left"></i>&nbsp;Back</asp:LinkButton>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="form-group row float-right" style="margin-right: 35px;">
                    <div class="form-group">
                        <asp:LinkButton ID="SubmitBtn" runat="server" CssClass="btn btn-small btn-primary" OnClick="submit_Click">
                            <i class="fa fa-save"></i>&nbsp;Save</asp:LinkButton>
                    </div>
                </div>
            </div>
             
            <div class="col-md-12">
                <div align="center" style="width: 100%; height: 70%; padding: 15px 20px; ">
                    <div class="form-head form-group" style="background-color: #777; color: white; padding: 10px; width: 100%; border: none; text-align: center; outline: none; font-size: 15px;">
                        <h3>Funeral Home</h3>
                    </div>
                </div>
            </div>
            <div class="col-md-12">
                <div style="margin-top: -20px; overflow: scroll; width: 100%; height: 80%; border: thin; border-color: black; padding: 15px 20px; color: #005595; font-family: Arial; font-size: 16px;">
                    <asp:Label ID="lblMsg" runat="server" EnableViewState="False" ForeColor="Red"></asp:Label><br />
                    <div class="form-group row">
                        <%--<div class="col-md-4">
                            <div class="form-group">
                                <asp:Label ID="Label1" runat="server" Text="Counter:"></asp:Label>
                                <asp:TextBox ID="Counter" class="form-control" runat="server" placeholder="Counter"></asp:TextBox>
                            </div>
                        </div>--%>
                        <div class="col-md-6">
                            <div class="form-group">
                                <asp:Label ID="Label2" runat="server" Text="Short Name:"></asp:Label>
                                <asp:TextBox ID="Shortname" class="form-control" runat="server" placeholder="Short Name"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <asp:Label ID="Label3" runat="server" Text="A/R Acct No."></asp:Label>
                                <asp:TextBox ID="Acctno" class="form-control" runat="server" placeholder="A/R Acct No"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-md-12">
                            <div class="form-group">
                                <asp:Label ID="Label4" runat="server" Text="Funeral Home:"></asp:Label>
                                <asp:TextBox ID="FuneralHome" class="form-control" runat="server" placeholder="Funeral Home"></asp:TextBox>
                            </div>
                        </div>
                    </div>

                    <div class="form-group row">
                        <div class="col-md-3">
                            <div class="form-group">
                                <asp:Label ID="Label7" runat="server" Text="House No:"></asp:Label>
                                <asp:TextBox ID="House_No" class="form-control" runat="server" placeholder="House No"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="form-group">
                                <asp:Label ID="Label9" runat="server" Text="House Qual No:"></asp:Label>
                                <asp:TextBox ID="House_Qual_No" class="form-control" runat="server" placeholder="House Qual No"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <asp:Label ID="Label5" runat="server" Text="Street Address:"></asp:Label>
                                <asp:TextBox ID="StrAdd" class="form-control" runat="server" placeholder="Street Address"></asp:TextBox>
                            </div>
                        </div>

                    </div>
                    <div class="form-group row">
                        <div class="col-md-4">
                            <div class="form-group">
                                <asp:Label ID="Label6" runat="server" Text="Unit No.:"></asp:Label>
                                <asp:TextBox ID="Unitnum" class="form-control" runat="server" placeholder="Unit No."></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <asp:Label ID="Label17" runat="server" Text="City:"></asp:Label>
                                <asp:TextBox ID="City" class="form-control" runat="server" placeholder="City"> </asp:TextBox>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <asp:Label ID="Label18" runat="server" Text="Province:"></asp:Label>
                                <asp:TextBox ID="Province" class="form-control" runat="server" placeholder="Province"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <asp:Label ID="Label16" runat="server" Text="Postal Code:"></asp:Label>
                                <asp:TextBox ID="PostalCode" class="form-control" runat="server" placeholder="Postal Code"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <asp:Label ID="Label8" runat="server" Text="Country:"></asp:Label>
                                <asp:TextBox ID="Country" class="form-control" runat="server" placeholder="Country"></asp:TextBox>
                            </div>
                        </div>
                    </div>

                    <%--<div class="form-group row">
                        <div class="col-md-12">
                            <div class="form-group" style="text-align: right">
                                <asp:Button runat="server" ID="submit" Text="Save" CssClass="btn btn-primary" OnClick="submit_Click" />

                            </div>
                        </div>
                    </div>--%>
                </div>
            </div>
        </div>
    </div>
    <script src="Content/bootstrap-notify-3.1.3/bootstrap-notify-3.1.3/dist/bootstrap-notify.min.js"></script>
    <script type="text/javascript">
        function showMyDialog(msg) {

            $.notify({
                // options
                message: msg
            }, {
                    // settings
                    type: 'danger',
                    placement:
                    {
                        from: "top",
                        align: "center"

                    },
                    delay: 0,
                    timer: 0

                });
        }
    </script>
</asp:Content>
