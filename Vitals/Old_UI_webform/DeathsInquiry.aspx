<%@ Page Title="" Language="C#" MasterPageFile="~/Vitals.Master" AutoEventWireup="true" CodeBehind="DeathsInquiry.aspx.cs" Inherits="Vitals.DeathsInquiry" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <style>
    .header {
        background-color: #f1f1f1;
        color: white;
        cursor: pointer;
        padding: 18px;
        width: 100%;
        border: none;
        text-align: left;
        outline: none;
        font-size: 15px;
    }

        .active, .header:hover {
            /*background-color: #555;*/
        }

        .header:after {
            content: '\002B';
            color: #005595;
            font-weight: bold;
            float: right;
            margin-left: 5px;
        }

    .active:after {
        content: "\2212";
    }

    .content {
        padding: 0 18px;
        max-height: 0;
        overflow: hidden;
        transition: max-height 0.2s ease-out;
        /*background-color: #f1f1f1;*/
    }
</style>
    <div class="container">
        <div class="row" style="margin-bottom:25px;">
            <div class="col-md-12">
                <div align="center" style="width: 100%; height: 70%; padding: 15px 20px; margin-top: 100px;">
                    <div class="form-head form-group" style="background-color: #777; color: white; padding: 10px; width: 100%; border: none; text-align: center; outline: none; font-size: 15px;">
                        <h3>Vital Statistics (Deaths Inquiry)</h3>
                    </div>
                </div>
            </div>
            <div class="col-md-12">
                <div style="margin-top: -20px; width: 100%; height: 65%; border: thin; border-color: black; padding: 15px 20px; color: #005595; font-family: Arial; font-size: 16px;">
                    <div class="form-group row">
                        <div class="col-md-4">
                            <div class="form-group">
                                <asp:Label ID="Label1" runat="server" Text="Registration No.:"></asp:Label>
                                <asp:TextBox ID="Regno" class="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <asp:Label ID="Label2" runat="server" Text="Billable:"></asp:Label>
                                <asp:TextBox ID="Billable" class="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <asp:Label ID="Label3" runat="server" Text="Reg Date:"></asp:Label>
                                <asp:TextBox ID="regdate" class="form-control" runat="server" placeholder="MM/DD/YYY"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <div class="header">
                        <asp:Label ID="Label4" runat="server" Text="Deceased Information" ForeColor="Black"></asp:Label>
                    </div>
                    <div class="content">
                        <div class="form-group row">
                            <div class="col-md-4">
                                <div class="form-group">
                                    <asp:Label ID="Label5" runat="server" Text="Fisrt Name:"></asp:Label>
                                    <asp:TextBox ID="Fname" runat="server" class="form-control" placeholder="First Name"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <asp:Label ID="Label6" runat="server" Text="Middle Name:"></asp:Label>
                                    <asp:TextBox ID="Mname" runat="server" class="form-control" placeholder="Middle Name"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <asp:Label ID="Label7" runat="server" Text="Last Name:"></asp:Label>
                                    <asp:TextBox ID="Lname" runat="server" class="form-control" placeholder="Last Name"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="form-group row">
                            <div class="col-md-4">
                                <div class="form-group">
                                    <asp:Label ID="Label8" runat="server" Text="Sex"></asp:Label>
                                    &nbsp;
                            <asp:TextBox ID="Sex" class="form-control" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <asp:Label ID="Label9" runat="server" Text="Death of Birth:"></asp:Label>
                                    <asp:TextBox ID="DBirth" class="form-control" runat="server" placeholder="MM/DD/YYY"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <asp:Label ID="Label10" runat="server" Text="Municipality:"></asp:Label>
                                    <asp:TextBox ID="Municipality" class="form-control" runat="server"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="form-group row">
                            <div class="col-md-4">
                                <div class="form-group">
                                    <asp:Label ID="Label11" runat="server" Text="Place of Death:"></asp:Label>
                                    <asp:TextBox ID="PlaceDeath" class="form-control" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-8">
                                <div class="form-group">
                                    <asp:Label ID="Label12" runat="server" Text="Cause of Death(Optional):"></asp:Label>
                                    <asp:TextBox ID="CauseDeath" class="form-control" runat="server"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                    </div>
                    <br />
                    <div class="header">
                        <asp:Label ID="Label13" runat="server" Text="Address of Place of Death" ForeColor="Black"></asp:Label>
                    </div>
                    <div class="content">
                        <div class="form-group row">
                            <div class="col-md-8">
                                <div class="form-group">
                                    <asp:Label ID="Label14" runat="server" Text="Street:"></asp:Label>
                                    <asp:TextBox ID="Street" class="form-control" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <asp:Label ID="Label15" runat="server" Text="Form 17 Req?:"></asp:Label>
                                    <asp:TextBox ID="Form17" class="form-control" runat="server"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="form-group row">
                            <div class="col-md-4">
                                <div class="form-group">
                                    <asp:Label ID="Label16" runat="server" Text="Unit/Apt:"></asp:Label>
                                    <asp:TextBox ID="Apt" class="form-control" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <asp:Label ID="Label17" runat="server" Text="City:"></asp:Label>
                                    <asp:TextBox ID="City" class="form-control" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <asp:Label ID="Label18" runat="server" Text="Province:"></asp:Label>
                                    <asp:TextBox ID="Province" class="form-control" runat="server"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="form-group row">
                            <div class="col-md-4">
                                <div class="form-group">
                                    <asp:Label ID="Label19" runat="server" Text="Country:"></asp:Label>
                                    <asp:TextBox ID="Country" class="form-control" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <asp:Label ID="Label20" runat="server" Text="Postal Code:"></asp:Label>
                                    <asp:TextBox ID="Postalcode" class="form-control" runat="server"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        
                        
                    </div>
                </div>
            </div>
        </div>
    </div>
   <script>
        var coll = document.getElementsByClassName("header");
        var i;

        for (i = 0; i < coll.length; i++) {
            coll[i].addEventListener("click", function () {
                this.classList.toggle("active");
                var content = this.nextElementSibling;
                if (content.style.maxHeight) {
                    content.style.maxHeight = null;
                } else {
                    content.style.maxHeight = content.scrollHeight + "px";
                }
            });
        }
    </script>
</asp:Content>
