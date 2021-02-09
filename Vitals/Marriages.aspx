<%@ Page Title="" Language="C#" MasterPageFile="~/Vitals.Master" AutoEventWireup="true" CodeBehind="Marriages.aspx.cs" Inherits="Vitals.Marriages" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="Style/jquery-ui.css" rel="stylesheet" />
    <script src="Scripts/jquery-3.5.1.js"></script>
    <script src="Scripts/jquery-ui.js"></script>
    <script>

        $(document).ready(function () {
            $(function () {
                $("#DateIssued").datepicker();
                $("#DBirth").datepicker();
                $("#MarriageDate").datepicker();
                $("#JointDOB").datepicker();

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
        <div class="row" style="padding-top: 15%;" >
                <div class="col-md-12">
                    <div class="form-group" align="right" style="padding-right:35px;">
                       <%-- <asp:Button runat="server" ID="submit" Text="Save" CssClass="btn btn-primary"  />--%>
                        <asp:LinkButton ID="SubmitBtn" runat="server"  CssClass="btn btn-small btn-primary">
                            <i class="fa fa-save"></i>&nbsp;Save</asp:LinkButton>
                    </div>
                </div>
            </div>
        <ul class="nav nav-tabs" role="tablist" style=" margin-bottom: -65px; margin-left: 35px; border-bottom: 0;">
            <!-- add data-toggle attribute to the anchors -->
            <li class="nav-item"><a data-toggle="tab" class="nav-link active" href="#menu1">Applicant</a></li>
            <li class="nav-item"><a data-toggle="tab" class="nav-link" href="#menu2">Joint Applicant</a></li>
        </ul>
        <div class="tab-content">
            <div id="menu1" class="container tab-pane active">
                <div class="row" style="margin-bottom: 25px;">
                    <div class="col-md-12">
                        <div align="center" style="width: 100%; height: 70%; padding: 15px 20px;">
                            <div class="form-head form-group" style="background-color: #777; color: white; padding: 10px; width: 100%; border: none; text-align: center; outline: none; font-size: 15px;">
                                <h3>Vital Statistics (Marriages)</h3>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div style="margin-top: -20px; width: 100%; height: 65%; border: thin; border-color: black; padding: 15px 20px; color: #005595; font-family: Arial; font-size: 16px;">
                            <div class="form-group row">
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <asp:Label ID="Label1" runat="server" Text="Registration No.:"></asp:Label>
                                        <asp:TextBox ID="Regno" ReadOnly="true" class="form-control" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <asp:Label ID="Label2" runat="server" Text="Cert.No:"></asp:Label>
                                    <div class="input-group">
                                        <asp:TextBox ID="CertNo" class="form-control" runat="server" Text="G"></asp:TextBox>
                                        <asp:TextBox ID="CertName" class="form-control" runat="server"></asp:TextBox>

                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <asp:Label ID="Label3" runat="server" Text="Date Issued:"></asp:Label>
                                        <div class='input-group date'>
                                            <asp:TextBox ID="DateIssued" class="form-control" ClientIDMode="Static" ReadOnly="true" runat="server" placeholder="MM/DD/YYY">
                                             
                                            </asp:TextBox>
                                            <div class="input-group-prepend">
                                                <span class="input-group-text"><i class="fa fa-calendar"></i></span>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>
                            <div class="form-group row">
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <asp:Label ID="Label4" runat="server" Text="Marriage Date:"></asp:Label>
                                        <div class='input-group date'>
                                            <asp:TextBox ID="MarriageDate" class="form-control" ClientIDMode="Static" ReadOnly="true" runat="server" placeholder="MM/DD/YYY">
                                             
                                            </asp:TextBox>
                                            <div class="input-group-prepend">
                                                <span class="input-group-text"><i class="fa fa-calendar"></i></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <asp:Label ID="Label5" runat="server" Text="City of Marriage:"></asp:Label>
                                        <asp:TextBox ID="CityofMarriage" class="form-control" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <asp:Label ID="Label6" runat="server" Text="Applicant(s):"></asp:Label>
                                        <%--<asp:DropDownList ID="Applicant" runat="server"></asp:DropDownList>
                                        <asp:TextBox ID="textbox1" class="form-control" runat="server"></asp:TextBox>--%>
                                        <asp:DropDownList ID="Applicant" runat="server" class="form-control" AutoPostBack="true">
                                            <asp:ListItem runat="server" Value="--Select--">--Select--</asp:ListItem>
                                            <asp:ListItem Text="Applicant" Value="Applicant"></asp:ListItem>
                                            <asp:ListItem Text="Joint Applicant" Value="Joint Applicant"></asp:ListItem>
                                            <asp:ListItem Text="Both" Value="Both"></asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                            </div>

                            <div class="header">
                                <asp:Label ID="Label7" runat="server" Text="Applicant" ForeColor="Black"></asp:Label>
                            </div>
                            <div class="content">

                                <div class="form-group row">
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <asp:Label ID="Label8" runat="server" Text="Fisrt Name:"></asp:Label>
                                            <asp:TextBox ID="Fname" runat="server" class="form-control" placeholder="First Name"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <asp:Label ID="Label9" runat="server" Text="Middle Name:"></asp:Label>
                                            <asp:TextBox ID="Mname" runat="server" class="form-control" placeholder="Middle Name"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <asp:Label ID="Label10" runat="server" Text="Last Name:"></asp:Label>
                                            <asp:TextBox ID="Lname" runat="server" class="form-control" placeholder="Last Name"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <asp:Label ID="Label11" runat="server" Text="Marital Status:"></asp:Label>
                                            <%-- <asp:DropDownList ID="MaritalStatus" runat="server"></asp:DropDownList>
                                            <asp:TextBox ID="textbox" runat="server" class="form-control"></asp:TextBox>--%>
                                            <asp:DropDownList ID="MaritalStatus" runat="server" class="form-control" AutoPostBack="true">
                                                <asp:ListItem runat="server" Value="--Select--">--Select--</asp:ListItem>
                                                <asp:ListItem Text="Single" Value="S"></asp:ListItem>
                                                <asp:ListItem Text="Divorced" Value="D"></asp:ListItem>
                                                <asp:ListItem Text="Widowed" Value="W"></asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <asp:Label ID="Label12" runat="server" Text="Death of Birth:"></asp:Label>
                                            <div class='input-group date'>
                                                <asp:TextBox ID="DBirth" class="form-control" ClientIDMode="Static" ReadOnly="true" runat="server" placeholder="MM/DD/YYY">
                                                </asp:TextBox>
                                                <div class="input-group-prepend">
                                                    <span class="input-group-text"><i class="fa fa-calendar"></i></span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <asp:Label ID="Label13" runat="server" Text="Age:"></asp:Label>
                                            <asp:TextBox ID="Age" runat="server" class="form-control" placeholder="Age"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <asp:Label ID="Label14" runat="server" Text="Country of Divorce:"></asp:Label>
                                            <asp:TextBox ID="CountryofDivorce" runat="server" class="form-control" placeholder="Country of Divorce"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <asp:Label ID="Label15" runat="server" Text="City Granted In:"></asp:Label>
                                            <asp:TextBox ID="CityGranted" class="form-control" runat="server" placeholder="City Granted In"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <asp:Label ID="Label16" runat="server" Text="Religion:"></asp:Label>
                                            <asp:TextBox ID="Religion" runat="server" class="form-control" placeholder="Religion"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <asp:Label ID="Label17" runat="server" Text="Court File No.:"></asp:Label>
                                            <asp:TextBox ID="CourtFileNo" runat="server" class="form-control" placeholder="Court File No"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <asp:Label ID="Label18" runat="server" Text="Province of Birth:"></asp:Label>
                                            <asp:TextBox ID="ProvinceofBirth" class="form-control" runat="server" placeholder="Province of Birth"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <br />
                            <div class="header">
                                <asp:Label ID="Label19" runat="server" Text="Address of Applicant" ForeColor="Black"></asp:Label>
                            </div>
                            <div class="content">

                                <div class="form-group row">
                                    <div class="col-md-8">
                                        <div class="form-group">
                                            <asp:Label ID="Label20" runat="server" Text="Street:"></asp:Label>
                                            <asp:TextBox ID="Street" class="form-control" runat="server" placeholder="Street"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <asp:Label ID="Label21" runat="server" Text="Unit/Apt:"></asp:Label>
                                            <asp:TextBox ID="Apt" class="form-control" runat="server" placeholder="Unit/Apt:"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <asp:Label ID="Label23" runat="server" Text="City:"></asp:Label>
                                            <asp:TextBox ID="City" class="form-control" runat="server" placeholder="City"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <asp:Label ID="Label24" runat="server" Text="Province:"></asp:Label>
                                            <asp:DropDownList ID="Province1" class="form-control" runat="server"></asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <asp:Label ID="Label22" runat="server" Text="Country:"></asp:Label>
                                            <asp:TextBox ID="Country" class="form-control" runat="server" placeholder="Country"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <asp:Label ID="Label25" runat="server" Text="Postal Code:"></asp:Label>
                                            <asp:TextBox ID="Postalcode" class="form-control" runat="server" placeholder="Postal Code"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <asp:Label ID="Label26" runat="server" Text="Phone:"></asp:Label>
                                            <asp:TextBox ID="Phone" class="form-control" runat="server" placeholder="Phone"></asp:TextBox>
                                        </div>
                                    </div>

                                </div>
                            </div>
                            <br />
                            <div class="header">
                                <asp:Label ID="Label27" runat="server" Text="Parent's Information" ForeColor="Black"></asp:Label>
                            </div>
                            <div class="content">
                                <div class="form-group row">
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <asp:Label ID="Label28" runat="server" Text="Parent1 Fisrt Name:"></asp:Label>
                                            <asp:TextBox ID="P1FName" runat="server" class="form-control" placeholder="First Name"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <asp:Label ID="Label29" runat="server" Text="Parent1 Last Name:"></asp:Label>
                                            <asp:TextBox ID="P1LName" runat="server" class="form-control" placeholder="Last Name"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <asp:Label ID="Label30" runat="server" Text="Parent1 Birth Province:"></asp:Label>
                                            <asp:TextBox ID="P1BirthProvince" runat="server" class="form-control" placeholder="Birth Province"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <asp:Label ID="Label31" runat="server" Text="Parent2 Fisrt Name:"></asp:Label>
                                            <asp:TextBox ID="P2FName" runat="server" class="form-control" placeholder="First Name"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <asp:Label ID="Label32" runat="server" Text="Parent2 Last Name:"></asp:Label>
                                            <asp:TextBox ID="P2LName" runat="server" class="form-control" placeholder="Last Name"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <asp:Label ID="Label33" runat="server" Text="Parent2 Birth Province:"></asp:Label>
                                            <asp:TextBox ID="P2BirthProvince" runat="server" class="form-control" placeholder="Birth Province"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <asp:Label ID="Label34" runat="server" Text="Parent3 Fisrt Name:"></asp:Label>
                                            <asp:TextBox ID="P3FName" runat="server" class="form-control" placeholder="First Name"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <asp:Label ID="Label35" runat="server" Text="Parent3 Last Name:"></asp:Label>
                                            <asp:TextBox ID="P3LName" runat="server" class="form-control" placeholder="Last Name"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <asp:Label ID="Label36" runat="server" Text="Parent3 Birth Province:"></asp:Label>
                                            <asp:TextBox ID="P3BirthProvince" runat="server" class="form-control" placeholder="Birth Province"></asp:TextBox>
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
                                <h3>Vital Statistics (Marriages)</h3>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div style="margin-top: -20px; width: 100%; height: 65%; border: thin; border-color: black; padding: 15px 20px; color: #005595; font-family: Arial; font-size: 16px;">

                            <div class="form-group row">
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <asp:Label ID="Label56" runat="server" Text="Fisrt Name:"></asp:Label>
                                        <asp:TextBox ID="JointFisrtname" runat="server" class="form-control" placeholder="First Name"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <asp:Label ID="Label57" runat="server" Text="Middle Name:"></asp:Label>
                                        <asp:TextBox ID="JointMiddlename" runat="server" class="form-control" placeholder="Middle Name"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <asp:Label ID="Label58" runat="server" Text="Last Name:"></asp:Label>
                                        <asp:TextBox ID="JointLastname" runat="server" class="form-control" placeholder="Last Name"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group row">
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <asp:Label ID="Label59" runat="server" Text="Marital Status:"></asp:Label>
                                        <%-- <asp:DropDownList ID="MaritalStatus" runat="server"></asp:DropDownList>
                                            <asp:TextBox ID="textbox" runat="server" class="form-control"></asp:TextBox>--%>
                                        <asp:DropDownList ID="JointStatus" runat="server" class="form-control" AutoPostBack="true">
                                            <asp:ListItem runat="server" Value="--Select--">--Select--</asp:ListItem>
                                            <asp:ListItem Text="Single" Value="S"></asp:ListItem>
                                            <asp:ListItem Text="Divorced" Value="D"></asp:ListItem>
                                            <asp:ListItem Text="Widowed" Value="W"></asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <asp:Label ID="Label60" runat="server" Text="Death of Birth:"></asp:Label>
                                        <div class='input-group date'>
                                            <asp:TextBox ID="JointDOB" class="form-control" ClientIDMode="Static" ReadOnly="true" runat="server" placeholder="MM/DD/YYY">
                                            </asp:TextBox>
                                            <div class="input-group-prepend">
                                                <span class="input-group-text"><i class="fa fa-calendar"></i></span>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <asp:Label ID="Label61" runat="server" Text="Age:"></asp:Label>
                                        <asp:TextBox ID="JointAge" runat="server" class="form-control" placeholder="Age"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group row">
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <asp:Label ID="Label62" runat="server" Text="Country of Divorce:"></asp:Label>
                                        <asp:TextBox ID="JointCountryDivorce" runat="server" class="form-control" placeholder="Country of Divorce"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <asp:Label ID="Label63" runat="server" Text="City Granted In:"></asp:Label>
                                        <asp:TextBox ID="JointCity" class="form-control" runat="server" placeholder="City Granted In"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <asp:Label ID="Label64" runat="server" Text="Religion:"></asp:Label>
                                        <asp:TextBox ID="JointReligion" runat="server" class="form-control" placeholder="Religion"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <asp:Label ID="Label65" runat="server" Text="Court File No.:"></asp:Label>
                                        <asp:TextBox ID="JointCourtFile" runat="server" class="form-control" placeholder="Court File No"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <asp:Label ID="Label66" runat="server" Text="Province of Birth:"></asp:Label>
                                        <asp:TextBox ID="JointProvinceBirth" class="form-control" runat="server" placeholder="Province of Birth"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <br />
                            <div class="header">
                                <asp:Label ID="Label37" runat="server" Text="Address of Joint Applicant" ForeColor="Black"></asp:Label>
                            </div>
                            <div class="content">
                                <div class="form-group row">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <asp:CheckBox ID="CheckBox1" runat="server" Text="Same" />
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-md-8">
                                        <div class="form-group">
                                            <asp:Label ID="Label38" runat="server" Text="Street:"></asp:Label>
                                            <asp:TextBox ID="Street2" class="form-control" runat="server" placeholder="Street"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <asp:Label ID="Label39" runat="server" Text="Unit/Apt:"></asp:Label>
                                            <asp:TextBox ID="Apt2" class="form-control" runat="server" placeholder="Unit/Apt:"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <asp:Label ID="Label40" runat="server" Text="City:"></asp:Label>
                                            <asp:TextBox ID="City2" class="form-control" runat="server" placeholder="City"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <asp:Label ID="Label41" runat="server" Text="Province:"></asp:Label>
                                            <asp:DropDownList ID="Province2" class="form-control" runat="server"></asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <asp:Label ID="Label42" runat="server" Text="Country:"></asp:Label>
                                            <asp:TextBox ID="Country2" class="form-control" runat="server" placeholder="Country"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <asp:Label ID="Label43" runat="server" Text="Postal Code:"></asp:Label>
                                            <asp:TextBox ID="Pin2" class="form-control" runat="server" placeholder="Postal Code"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <asp:Label ID="Label44" runat="server" Text="Phone:"></asp:Label>
                                            <asp:TextBox ID="Phone2" class="form-control" runat="server" placeholder="Phone"></asp:TextBox>
                                        </div>
                                    </div>

                                </div>
                            </div>

                            <br />
                            <div class="header">
                                <asp:Label ID="Label45" runat="server" Text="Parent's Information" ForeColor="Black"></asp:Label>
                            </div>
                            <div class="content">
                                <div class="form-group row">
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <asp:Label ID="Label46" runat="server" Text="Parent1 Fisrt Name:"></asp:Label>
                                            <asp:TextBox ID="P1FName1" runat="server" class="form-control" placeholder="First Name"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <asp:Label ID="Label47" runat="server" Text="Parent1 Last Name:"></asp:Label>
                                            <asp:TextBox ID="P1LName1" runat="server" class="form-control" placeholder="Last Name"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <asp:Label ID="Label48" runat="server" Text="Parent1 Birth Province:"></asp:Label>
                                            <asp:TextBox ID="P1BirthProvince1" runat="server" class="form-control" placeholder="Birth Province"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <asp:Label ID="Label49" runat="server" Text="Parent2 Fisrt Name:"></asp:Label>
                                            <asp:TextBox ID="P2FName2" runat="server" class="form-control" placeholder="First Name"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <asp:Label ID="Label50" runat="server" Text="Parent2 Last Name:"></asp:Label>
                                            <asp:TextBox ID="P2LName2" runat="server" class="form-control" placeholder="Last Name"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <asp:Label ID="Label51" runat="server" Text="Parent2 Birth Province:"></asp:Label>
                                            <asp:TextBox ID="P2BirthProvince2" runat="server" class="form-control" placeholder="Birth Province"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <asp:Label ID="Label52" runat="server" Text="Parent3 Fisrt Name:"></asp:Label>
                                            <asp:TextBox ID="P3FName2" runat="server" class="form-control" placeholder="First Name"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <asp:Label ID="Label53" runat="server" Text="Parent3 Last Name:"></asp:Label>
                                            <asp:TextBox ID="P3LName2" runat="server" class="form-control" placeholder="Last Name"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <asp:Label ID="Label54" runat="server" Text="Parent3 Birth Province:"></asp:Label>
                                            <asp:TextBox ID="P3BirthProvince2" runat="server" class="form-control" placeholder="Birth Province"></asp:TextBox>
                                        </div>
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
    </script>
</asp:Content>
