<%@ Page Title="" Language="C#" MasterPageFile="~/Vitals.Master" AutoEventWireup="true" CodeBehind="Doctors.aspx.cs" Inherits="Vitals.Doctors" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>

    <%--  <script src="template/vendor/bootstrap/js/bootstrap.min.js"></script>
    <script src="Content/bootstrap-notify-3.1.3/bootstrap-notify-3.1.3/dist/bootstrap-notify.min.js"></script>--%>
    <div class="container">
        <div class="row" style="padding-top: 15%;">
            <div class="col-md-6">
                <div class="form-group row float-left" style="margin-left: 35px;">
                    <div class="form-group">
                        <asp:LinkButton ID="Backbtn" runat="server" CssClass="btn btn-small btn-primary" Style="background-color: gray; border-color: gray;"
                            OnClick="Backbtn_Click" Visible="false">
                            <i class="fa fa-arrow-left"></i>&nbsp;Back</asp:LinkButton>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="form-group row float-right" style="margin-right: 35px;">
                    <div class="form-group">
                        <asp:LinkButton ID="SubmitBtn" runat="server" CssClass="btn btn-small btn-primary">
                            <i class="fa fa-save"></i>&nbsp;Save</asp:LinkButton>
                        <asp:LinkButton ID="EditBtn" runat="server" CssClass="btn btn-small btn-primary" Visible="false" OnClick="EditBtn_Click">
                            <i class="fa fa-edit"></i>&nbsp;Edit</asp:LinkButton>
                        <asp:LinkButton ID="CancelBtn" runat="server" CssClass="btn btn-small btn-primary" Visible="false" OnClick="CancelBtn_Click" >
                            <i class="fa fa-remove"></i>&nbsp;Cancel</asp:LinkButton>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div align="center" style="width: 100%; height: 40%; padding: 15px 20px;">
                    <div class="form-head form-group" style="background-color: #777; color: white; padding: 10px; width: 100%; border: none; text-align: center; outline: none; font-size: 15px;">
                        <h3>Doctors</h3>
                    </div>
                </div>
            </div>
            <div class="col-md-12">
                <div style="margin-top: -20px; width: 100%; border: thin; border-color: black; padding: 15px 20px; color: #005595; font-family: Arial; font-size: 16px;">
                    <asp:Label ID="lblMsg" runat="server" EnableViewState="False" ForeColor="Red"></asp:Label><br />
                    <div class="form-group row">
                        <div class="col-md-12">
                            <div class="input-group">
                                <asp:TextBox ID="Searchtext" class="form-control" runat="server" placeholder="Search here....."></asp:TextBox>
                                <div class="input-group-prepend">
                                        <asp:Button ID="Search" runat="server" Text="Search" Class="btn btn-primary" BackColor="Gray" BorderColor="Gray" OnClick="Search_Click"  />
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-md-4">
                            <div class="form-group">
                                <asp:Label ID="Label1" runat="server" Text="Dr Short Name:"></asp:Label>
                                <asp:TextBox ID="Shortname" class="form-control" MaxLength="6" runat="server" placeholder="Short Name"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <asp:Label ID="Label2" runat="server" Text="First Name:"></asp:Label>
                                <asp:TextBox ID="FName" class="form-control" MaxLength="24" runat="server" placeholder="First Name"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <asp:Label ID="Label3" runat="server" Text="Last Name:"></asp:Label>
                                <asp:TextBox ID="Lname" class="form-control" MaxLength="20" runat="server" placeholder="Last Name"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-md-4">
                            <div class="form-group">
                                <asp:Label ID="Label4" runat="server" Text="Doctor Number:"></asp:Label>
                                <asp:TextBox ID="DocNum" class="form-control" runat="server" placeholder="Doctor Number"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-md-2">
                            <div class="form-group">
                                <asp:Label ID="Label7" runat="server" Text="House No.:"></asp:Label>
                                <asp:TextBox ID="HouseNo" class="form-control" MaxLength="35" runat="server" placeholder="House Number"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-md-2">
                            <div class="form-group">
                                <asp:Label ID="Label6" runat="server" Text="House Qual No:"></asp:Label>
                                <asp:TextBox ID="HouseQualNo" class="form-control" MaxLength="35" runat="server" placeholder="House Qual Number"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-md-8">
                            <div class="form-group">
                                <asp:Label ID="Label5" runat="server" Text="Street Address:"></asp:Label>
                                <asp:TextBox ID="StrAdd" class="form-control" MaxLength="35" runat="server" placeholder="Street Address"></asp:TextBox>
                            </div>
                        </div>

                    </div>
                    <div class="form-group row">
                        <div class="col-md-4">
                            <div class="form-group">
                                <asp:Label ID="Label8" runat="server" Text="Unit No.:"></asp:Label>
                                <asp:TextBox ID="Unitnum" class="form-control" MaxLength="6" runat="server" placeholder="Unit No."></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <asp:Label ID="Label17" runat="server" Text="City:"></asp:Label>
                                <asp:TextBox ID="City" class="form-control" MaxLength="25" runat="server" placeholder="City"> </asp:TextBox>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <asp:Label ID="Label18" runat="server" Text="Province:"></asp:Label>
                                <asp:TextBox ID="Province" class="form-control" MaxLength="20" runat="server" placeholder="Province"></asp:TextBox>
                            </div>
                        </div>

                    </div>
                    <div class="form-group row">

                        <div class="col-md-6">
                            <div class="form-group">
                                <asp:Label ID="Label16" runat="server" Text="Postal Code:"></asp:Label>
                                <asp:TextBox ID="PinCode" class="form-control" MaxLength="7" runat="server" placeholder="Postal Code"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <asp:Label ID="Label9" runat="server" Text="Country:"></asp:Label>
                                <asp:TextBox ID="Country" class="form-control" MaxLength="15" runat="server" placeholder="Country"></asp:TextBox>
                            </div>
                        </div>
                    </div>


                   <%-- <div class="form-group row">
                        <div class="col-md-6">
                            <div class="form-group" style="text-align: right">
                                <asp:Button runat="server" ID="submit" Text="Save" CssClass="btn btn-primary"
                                    OnClick="submit_Click" />

                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group" style="text-align: left">
                                <asp:Button runat="server" ID="Button1" Text="Read XML" CssClass="btn btn-primary"
                                    OnClick="Button1_Click" />

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
