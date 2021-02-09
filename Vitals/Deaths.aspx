<%@ Page Title="" Language="C#" MasterPageFile="~/Vitals.Master" AutoEventWireup="true" CodeBehind="Deaths.aspx.cs" Inherits="Vitals.Deaths" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <link href="Style/jquery-ui.css" rel="stylesheet" />
    <script src="Scripts/jquery-3.5.1.js"></script>
    <script src="Scripts/jquery-ui.js"></script>
    <script>

        $(document).ready(function () {
            $(function () {
                $("#regdate").datepicker();
                $("#DBirth").datepicker();

            });
        });
    </script>
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


            .header.active:after {
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
        <div class="row" style="padding-top: 15%;">
            <div class="col-md-12" >
                <div class="form-group row float-right" style="margin-right: 35px">
                     <div class="form-group">
                    <asp:LinkButton ID="SubmitBtn" runat="server" CssClass="btn btn-small btn-primary ">
                            <i class="fa fa-save"></i>&nbsp;Save</asp:LinkButton>

                    <asp:LinkButton ID="AddDoc" runat="server" CssClass="btn btn-small btn-primary" OnClick="AddDoc_Click" >
                            <i class="fa fa-plus"></i>&nbsp;Add A Doctor</asp:LinkButton>

                    <asp:LinkButton ID="AddFun" runat="server" CssClass="btn btn-small btn-primary" OnClick="AddFun_Click">
                            <i class="fa fa-plus"></i>&nbsp;Add A Funeral Home</asp:LinkButton>
                         </div>
                </div>
            </div>
        </div>
        <ul class="nav nav-tabs" role="tablist" style="margin-bottom: -65px; margin-left: 35px; border-bottom: 0;">
            <!-- add data-toggle attribute to the anchors -->
            <li class="nav-item"><a data-toggle="tab" class="nav-link active" href="#menu1">Deaths</a></li>
            <li class="nav-item"><a data-toggle="tab" class="nav-link " href="#menu2">Death Inquiry</a></li>
            <li class="nav-item"><a data-toggle="tab" class="nav-link " href="#menu3">Add A Doctor</a></li>
            <li class="nav-item"><a data-toggle="tab" class="nav-link " href="#menu4">Add A Funeral Home</a></li>
        </ul>
        <div class="tab-content">
            <div id="menu1" class="container tab-pane active">
                <div class="row" style="margin-bottom: 25px;">
                    <div class="col-md-12">
                        <div align="center" style="width: 100%; height: 70%; padding: 15px 20px;">
                            <div class="form-head form-group" style="background-color: #777; color: white; padding: 10px; width: 100%; border: none; text-align: center; outline: none; font-size: 15px;">
                                <h3>Vital Statistics (Deaths)</h3>
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
                                        &nbsp;
                                <asp:DropDownList ID="Billable" runat="server" class="form-control" AutoPostBack="true">
                                    <asp:ListItem runat="server" Value="--Select--">--Select--</asp:ListItem>
                                    <asp:ListItem Text="Yes" Value="Yes"></asp:ListItem>
                                    <asp:ListItem Text="No" Value="No"></asp:ListItem>
                                </asp:DropDownList>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <asp:Label ID="Label3" runat="server" Text="Reg Date:"></asp:Label>
                                        <div class='input-group date'>
                                            <asp:TextBox ID="regdate" class="form-control" ClientIDMode="Static" ReadOnly="true" runat="server" placeholder="MM/DD/YYY">
                                             
                                            </asp:TextBox>
                                            <div class="input-group-prepend">
                                                <span class="input-group-text"><i class="fa fa-calendar"></i></span>
                                            </div>
                                        </div>
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
                                            <asp:DropDownList ID="sex" runat="server" class="form-control" AutoPostBack="true">
                                                <asp:ListItem runat="server" Value="--Select--">--Select--</asp:ListItem>
                                                <asp:ListItem runat="server" Value="M">Male</asp:ListItem>
                                                <asp:ListItem runat="server" Valu="F">Female</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <asp:Label ID="Label9" runat="server" Text="Death of Birth:"></asp:Label>
                                            <div class="input-group">
                                                <asp:TextBox ID="DBirth" class="form-control" ClientIDMode="Static" ReadOnly="true" runat="server" placeholder="MM/DD/YYY"></asp:TextBox>

                                                <div class="input-group-prepend">
                                                    <span class="input-group-text"><i class="fa fa-calendar"></i></span>
                                                </div>
                                            </div>
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
                                <div class="form-group row">
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <asp:Label ID="Label21" runat="server" Text="Funeral Home Code:"></asp:Label>
                                            <asp:DropDownList ID="FuneralCode" runat="server" class="form-control"></asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <asp:Label ID="Label22" runat="server" Text="Doctor:"></asp:Label>
                                            <asp:DropDownList ID="Doctor" runat="server" class="form-control"></asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-md-6">
                                        <div class="form-group" style="text-align: right">
                                            <asp:Button runat="server" ID="submit" Text="Save" CssClass="btn btn-primary" />

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
            <div id="menu2" class="container tab-pane fade">

                <div class="row" style="margin-bottom: 25px;">
                    <div class="col-md-12">
                        <div align="center" style="width: 100%; height: 70%; padding: 15px 20px;">
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
                                        <asp:Label ID="Label23" runat="server" Text="Registration No.:"></asp:Label>
                                        <asp:TextBox ID="TextBox1" class="form-control" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <asp:Label ID="Label24" runat="server" Text="Billable:"></asp:Label>
                                        <asp:TextBox ID="TextBox2" class="form-control" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <asp:Label ID="Label25" runat="server" Text="Reg Date:"></asp:Label>
                                        <div class='input-group date'>
                                            <asp:TextBox ID="TextBox3" class="form-control" ClientIDMode="Static" ReadOnly="true" runat="server" placeholder="MM/DD/YYY">
                                             
                                            </asp:TextBox>
                                            <div class="input-group-prepend">
                                                <span class="input-group-text"><i class="fa fa-calendar"></i></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="header">
                                <asp:Label ID="Label26" runat="server" Text="Deceased Information" ForeColor="Black"></asp:Label>
                            </div>
                            <div class="content">
                                <div class="form-group row">
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <asp:Label ID="Label27" runat="server" Text="Fisrt Name:"></asp:Label>
                                            <asp:TextBox ID="TextBox4" runat="server" class="form-control" placeholder="First Name"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <asp:Label ID="Label28" runat="server" Text="Middle Name:"></asp:Label>
                                            <asp:TextBox ID="TextBox5" runat="server" class="form-control" placeholder="Middle Name"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <asp:Label ID="Label29" runat="server" Text="Last Name:"></asp:Label>
                                            <asp:TextBox ID="TextBox6" runat="server" class="form-control" placeholder="Last Name"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <asp:Label ID="Label30" runat="server" Text="Sex"></asp:Label>
                                            &nbsp;
                            <asp:TextBox ID="TextBox7" class="form-control" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <asp:Label ID="Label31" runat="server" Text="Death of Birth:"></asp:Label>
                                            <div class='input-group date'>
                                                <asp:TextBox ID="TextBox8" class="form-control" ClientIDMode="Static" ReadOnly="true" runat="server" placeholder="MM/DD/YYY">
                                             
                                                </asp:TextBox>
                                                <div class="input-group-prepend">
                                                    <span class="input-group-text"><i class="fa fa-calendar"></i></span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <asp:Label ID="Label32" runat="server" Text="Municipality:"></asp:Label>
                                            <asp:TextBox ID="TextBox9" class="form-control" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <asp:Label ID="Label33" runat="server" Text="Place of Death:"></asp:Label>
                                            <asp:TextBox ID="TextBox10" class="form-control" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-md-8">
                                        <div class="form-group">
                                            <asp:Label ID="Label34" runat="server" Text="Cause of Death(Optional):"></asp:Label>
                                            <asp:TextBox ID="TextBox11" class="form-control" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <br />
                            <div class="header">
                                <asp:Label ID="Label35" runat="server" Text="Address of Place of Death" ForeColor="Black"></asp:Label>
                            </div>
                            <div class="content">
                                <div class="form-group row">
                                    <div class="col-md-8">
                                        <div class="form-group">
                                            <asp:Label ID="Label36" runat="server" Text="Street:"></asp:Label>
                                            <asp:TextBox ID="TextBox12" class="form-control" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <asp:Label ID="Label37" runat="server" Text="Form 17 Req?:"></asp:Label>
                                            <asp:TextBox ID="TextBox13" class="form-control" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <asp:Label ID="Label38" runat="server" Text="Unit/Apt:"></asp:Label>
                                            <asp:TextBox ID="TextBox14" class="form-control" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <asp:Label ID="Label39" runat="server" Text="City:"></asp:Label>
                                            <asp:TextBox ID="TextBox15" class="form-control" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <asp:Label ID="Label40" runat="server" Text="Province:"></asp:Label>
                                            <asp:TextBox ID="TextBox16" class="form-control" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <asp:Label ID="Label41" runat="server" Text="Country:"></asp:Label>
                                            <asp:TextBox ID="TextBox17" class="form-control" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <asp:Label ID="Label42" runat="server" Text="Postal Code:"></asp:Label>
                                            <asp:TextBox ID="TextBox18" class="form-control" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>


                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div id="menu3" class="container tab-pane fade">
                <div class="row" style="margin-bottom: 25px;">
                    <div class="col-md-12">
                        <div align="center" style="width: 100%; height: 70%; padding: 15px 20px;">
                            <div class="form-head form-group" style="background-color: #777; color: white; padding: 10px; width: 100%; border: none; text-align: center; outline: none; font-size: 15px;">
                                <h3>Vital Statistics (Doctors)</h3>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div style="margin-top: -20px; width: 100%; border: thin; border-color: black; padding: 15px 20px; color: #005595; font-family: Arial; font-size: 16px;">
                            <asp:Label ID="lblMsg" runat="server" EnableViewState="False" ForeColor="Red"></asp:Label><br />
                            <div class="form-group row">
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <asp:Label ID="Label43" runat="server" Text="Dr Short Name:"></asp:Label>
                                        <asp:TextBox ID="Shortname" class="form-control" MaxLength="6" runat="server" placeholder="Short Name"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <asp:Label ID="Label44" runat="server" Text="First Name:"></asp:Label>
                                        <asp:TextBox ID="TextBox19" class="form-control" MaxLength="24" runat="server" placeholder="First Name"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <asp:Label ID="Label45" runat="server" Text="Last Name:"></asp:Label>
                                        <asp:TextBox ID="TextBox20" class="form-control" MaxLength="20" runat="server" placeholder="Last Name"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group row">
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <asp:Label ID="Label46" runat="server" Text="Doctor Number:"></asp:Label>
                                        <asp:TextBox ID="TextBox21" class="form-control" runat="server" placeholder="Doctor Number"></asp:TextBox>
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
                                        <asp:Label ID="Label47" runat="server" Text="House No.:"></asp:Label>
                                        <asp:TextBox ID="HouseNo" class="form-control" MaxLength="35" runat="server" placeholder="House Number"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-2">
                                    <div class="form-group">
                                        <asp:Label ID="Label48" runat="server" Text="House Qual No:"></asp:Label>
                                        <asp:TextBox ID="HouseQualNo" class="form-control" MaxLength="35" runat="server" placeholder="House Qual Number"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-8">
                                    <div class="form-group">
                                        <asp:Label ID="Label49" runat="server" Text="Street Address:"></asp:Label>
                                        <asp:TextBox ID="StrAdd" class="form-control" MaxLength="35" runat="server" placeholder="Street Address"></asp:TextBox>
                                    </div>
                                </div>

                            </div>
                            <div class="form-group row">
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <asp:Label ID="Label50" runat="server" Text="Unit No.:"></asp:Label>
                                        <asp:TextBox ID="Unitnum" class="form-control" MaxLength="6" runat="server" placeholder="Unit No."></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <asp:Label ID="Label51" runat="server" Text="City:"></asp:Label>
                                        <asp:TextBox ID="TextBox22" class="form-control" MaxLength="25" runat="server" placeholder="City"> </asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <asp:Label ID="Label52" runat="server" Text="Province:"></asp:Label>
                                        <asp:TextBox ID="TextBox23" class="form-control" MaxLength="20" runat="server" placeholder="Province"></asp:TextBox>
                                    </div>
                                </div>

                            </div>
                            <div class="form-group row">

                                <div class="col-md-6">
                                    <div class="form-group">
                                        <asp:Label ID="Label53" runat="server" Text="Postal Code:"></asp:Label>
                                        <asp:TextBox ID="PinCode" class="form-control" MaxLength="7" runat="server" placeholder="Postal Code"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <asp:Label ID="Label54" runat="server" Text="Country:"></asp:Label>
                                        <asp:TextBox ID="TextBox24" class="form-control" MaxLength="15" runat="server" placeholder="Country"></asp:TextBox>
                                    </div>
                                </div>
                            </div>


                            <div class="form-group row">
                                <div class="col-md-6">
                                    <div class="form-group" style="text-align: right">
                                        <asp:Button runat="server" ID="Button2" Text="Save" CssClass="btn btn-primary" />

                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div id="menu4" class="container tab-pane fade">

                <div class="row" style="margin-bottom: 25px;">
                    <div class="col-md-12">
                        <div align="center" style="width: 100%; height: 70%; padding: 15px 20px;">
                            <div class="form-head form-group" style="background-color: #777; color: white; padding: 10px; width: 100%; border: none; text-align: center; outline: none; font-size: 15px;">
                                <h3>Vital Statistics (Funeral Home)</h3>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div style="margin-top: -20px; width: 100%; height: 80%; border: thin; border-color: black; padding: 15px 20px; color: #005595; font-family: Arial; font-size: 16px;">
                            <asp:Label ID="Label55" runat="server" EnableViewState="False" ForeColor="Red"></asp:Label><br />
                            <div class="form-group row">
                                <%--<div class="col-md-4">
                            <div class="form-group">
                                <asp:Label ID="Label1" runat="server" Text="Counter:"></asp:Label>
                                <asp:TextBox ID="Counter" class="form-control" runat="server" placeholder="Counter"></asp:TextBox>
                            </div>
                        </div>--%>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <asp:Label ID="Label56" runat="server" Text="Short Name:"></asp:Label>
                                        <asp:TextBox ID="TextBox25" class="form-control" runat="server" placeholder="Short Name"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <asp:Label ID="Label57" runat="server" Text="A/R Acct No."></asp:Label>
                                        <asp:TextBox ID="Acctno" class="form-control" runat="server" placeholder="A/R Acct No"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group row">
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <asp:Label ID="Label58" runat="server" Text="Funeral Home:"></asp:Label>
                                        <asp:TextBox ID="FuneralHome" class="form-control" runat="server" placeholder="Funeral Home"></asp:TextBox>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group row">
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <asp:Label ID="Label59" runat="server" Text="House No:"></asp:Label>
                                        <asp:TextBox ID="House_No" class="form-control" runat="server" placeholder="House No"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <asp:Label ID="Label60" runat="server" Text="House Qual No:"></asp:Label>
                                        <asp:TextBox ID="House_Qual_No" class="form-control" runat="server" placeholder="House Qual No"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <asp:Label ID="Label61" runat="server" Text="Street Address:"></asp:Label>
                                        <asp:TextBox ID="TextBox26" class="form-control" runat="server" placeholder="Street Address"></asp:TextBox>
                                    </div>
                                </div>

                            </div>
                            <div class="form-group row">
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <asp:Label ID="Label62" runat="server" Text="Unit No.:"></asp:Label>
                                        <asp:TextBox ID="TextBox27" class="form-control" runat="server" placeholder="Unit No."></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <asp:Label ID="Label63" runat="server" Text="City:"></asp:Label>
                                        <asp:TextBox ID="TextBox28" class="form-control" runat="server" placeholder="City"> </asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <asp:Label ID="Label64" runat="server" Text="Province:"></asp:Label>
                                        <asp:TextBox ID="TextBox29" class="form-control" runat="server" placeholder="Province"></asp:TextBox>
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
                                        <asp:Label ID="Label65" runat="server" Text="Postal Code:"></asp:Label>
                                        <asp:TextBox ID="TextBox30" class="form-control" runat="server" placeholder="Postal Code"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <asp:Label ID="Label66" runat="server" Text="Country:"></asp:Label>
                                        <asp:TextBox ID="TextBox31" class="form-control" runat="server" placeholder="Country"></asp:TextBox>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group row">
                                <div class="col-md-12">
                                    <div class="form-group" style="text-align: right">
                                        <asp:Button runat="server" ID="Button3" Text="Save" CssClass="btn btn-primary" />

                                    </div>
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
        //function notbillble() {
        //    // alert("yes");
        //    document.getElementById("Billable").checked = false;
        //    $("#Billable").prop("checked,false");
        //}
        //function billble() {
        //    //alert("yes");
        //}
    </script>
</asp:Content>
