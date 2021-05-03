<%@ Page Title="" Language="C#" MasterPageFile="~/Vitals.Master" AutoEventWireup="true" CodeBehind="Marriages.aspx.cs" Inherits="Vitals.Marriages" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.6/jquery.min.js" type="text/javascript"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"
        type="text/javascript"></script>
    <link href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css"
        rel="Stylesheet" type="text/css" />
    <script type="text/javascript">

        //$(document).ready(function () {
        //    $(function () {
        //        $("#DateIssued").datepicker();
        //        $("#DBirth").datepicker();
        //        $("#MarriageDate").datepicker();
        //        $("#JointDOB").datepicker();

        //    });
        //});
        $(function () {
            $("#DateIssued").datepicker({
                changeMonth: true,
                changeYear: true,
                dateFormat: 'yy-mm-dd',
                yearRange: '1900:+0'
            });
        });
        $(function () {
            $("#MarriageDate").datepicker({
                changeMonth: true,
                changeYear: true,
                dateFormat: 'yy-mm-dd',
                yearRange: '1900:+0'
            });
        });
        $(function () {
            $("#DBirth").datepicker({
                changeMonth: true,
                changeYear: true,
                dateFormat: 'yy-mm-dd',
                yearRange: '1900:+0',
                onSelect: function (dateString, DBirth) {
                    var type = "Applicant";
                    ValidateDOB(dateString, type);
                }
            });
        });
        $(function () {
            $("#JointDOB").datepicker({
                changeMonth: true,
                changeYear: true,
                dateFormat: 'yy-mm-dd',
                yearRange: '1900:+0',
                onSelect: function (dateString, DBirth) {
                    var type = "Joint Applicant";
                    ValidateDOB(dateString, type);
                }
            });
        });
        function ValidateDOB(dateString, type) {

            var lblError = $("#lblError");
            var parts = dateString.split("-");
            //dd - mm - yy
            //yy-mm-dd
            var dtDOB = new Date(parts[0] + "-" + parts[1] + "-" + parts[2]);

            var dtCurrent = new Date();
            var msg = "Please enter valid Date of birth.Eligibility 18 years ONLY!";
            var alertype = "danger";
            //lblError.html("Eligibility 18 years ONLY.")
            if (dtCurrent.getFullYear() - dtDOB.getFullYear() >= 18) {
                var Age = dtCurrent.getFullYear() - dtDOB.getFullYear()
                if (type == "Applicant")
                    document.getElementById("<%=Age.ClientID%>").value = Age;
                else if (type == "Joint Applicant")
                    document.getElementById("<%=JointAge.ClientID%>").value = Age;
                //alert(document.getElementById("<%=Age.ClientID%>").value +" = ");
            }
            if (dtCurrent.getFullYear() - dtDOB.getFullYear() < 18) {
                showMyDialog(msg, alertype)
                return false;
            }

            if (dtCurrent.getFullYear() - dtDOB.getFullYear() == 18) {
                //CD: 11/06/2018 and DB: 15/07/2000. Will turned 18 on 15/07/2018.
                if (dtCurrent.getMonth() < dtDOB.getMonth()) {
                    showMyDialog(msg, alertype)
                    return false;
                }
                if (dtCurrent.getMonth() == dtDOB.getMonth()) {
                    //CD: 11/06/2018 and DB: 15/06/2000. Will turned 18 on 15/06/2018.
                    if (dtCurrent.getDate() < dtDOB.getDate()) {
                        showMyDialog(msg, alertype)
                        return false;
                    }
                }
            }

            //lblError.html("");
            return true;
        }

        window.onload = function () {

            var selectedTab = $("#<%=hfTab.ClientID%>");

            var tabId = selectedTab.val() != "" ? selectedTab.val() : "tab1";
            $('#dvTab a[href="#' + tabId + '"]').tab('show');
            $("#dvTab a").click(function () {
                selectedTab.val($(this).attr("href").substring(1));

                if (selectedTab.val() == "tab2") {
                    document.getElementById("<%=SubmitBtn.ClientID%>").style.display = "none";
                }
                if (selectedTab.val() == "tab1") {
                    document.getElementById("<%=EditBtn.ClientID%>").style.display = "none";
                    document.getElementById("<%=SubmitBtn.ClientID%>").style.display = "block";
                }
            });
        }

        function currentclick() {
            window.location.href = "Marriages.aspx";

        }
        function check() {
            document.getElementById("<%=Joint_House_No.ClientID%>").value = document.getElementById("<%=House_No.ClientID%>").value;
            document.getElementById("<%=Street2.ClientID%>").value = document.getElementById("<%=Street.ClientID%>").value;
            document.getElementById("<%=Apt2.ClientID%>").value = document.getElementById("<%=Apt.ClientID%>").value;
            document.getElementById("<%=City2.ClientID%>").value = document.getElementById("<%=City.ClientID%>").value;
            document.getElementById("<%=Province2.ClientID%>").value = document.getElementById("<%=Province1.ClientID%>").value;
            document.getElementById("<%=Country2.ClientID%>").value = document.getElementById("<%=Country.ClientID%>").value;
            document.getElementById("<%=Pin2.ClientID%>").value = document.getElementById("<%=Postalcode.ClientID%>").value;
            document.getElementById("<%=Phone2.ClientID%>").value = document.getElementById("<%=Phone.ClientID%>").value;
        }
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
                /*content: '\002B';*/
                color: #005595;
                font-weight: bold;
                float: right;
                margin-left: 5px;
            }


        /*.header.active:after {
                content: "\2212";
            }*/

        .content {
            padding: 0 18px;
            max-height: 0;
            overflow: hidden;
            transition: max-height 0.2s ease-out;
            /*background-color: #f1f1f1;*/
        }
    </style>
    <div class="container">
        <div class="row" style="padding-top: 10%;">
            <div class="col-md-6">
                <div class="form-group row float-left" style="margin-left: 35px;">
                    <div class="form-group">
                        <asp:LinkButton ID="Backbtn" runat="server" CssClass="btn btn-small btn-primary"
                            Style="background-color: gray; border-color: gray;"
                            Visible="false">
                            <i class="fa fa-arrow-left"></i>&nbsp;Back</asp:LinkButton>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="form-group row float-right" style="margin-right: 35px;">
                    <div class="form-group">
                        <asp:LinkButton ID="EditBtn" OnClientClick="EditClick()" runat="server" CssClass="btn btn-small btn-primary"
                            Visible="false" OnClick="EditBtn_Click">
                            <i class="fa fa-edit"></i>&nbsp;Edit
                        </asp:LinkButton>
                        <asp:LinkButton ID="CancelBtn" runat="server" CssClass="btn btn-small btn-primary" OnClick="CancelBtn_Click" Visible="false">
                            <i class="fa fa-remove"></i>&nbsp;Cancel
                        </asp:LinkButton>
                    </div>
                </div>
            </div>
        </div>
        <div id="dvTab">
            <ul class="nav nav-tabs" role="tablist" style="margin-left: -1.5%; border-bottom: 0;">
                <!-- add data-toggle attribute to the anchors -->
                <li class="nav-item" onclick="currentclick();">
                    <a data-toggle="tab" aria-controls="tab1" class="nav-link active" href="#tab1">Current</a>
                </li>
                <li class="nav-item">
                    <a data-toggle="tab" aria-controls="tab2" class="nav-link " href="#tab2">History</a>
                </li>
            </ul>
            <div class="tab-content">
                <div id="tab1" class="tab-pane active" role="tabpanel">
                    <div align="center" class="form-head" style="width: 103%; margin-left: -1.5%; background-color: #777; color: white; padding: 10px; border: none; text-align: center; outline: none; font-size: 15px;">
                        <h3>Vital Statistics (Marriages)</h3>
                    </div>
                    <div class="row" style="border-left-style: groove; border-right-style: groove; border-bottom-style: groove; padding-right: 25px; padding-left: 25px">
                        <div class="col-md-12">
                            <asp:Table ID="Table2" runat="server" Width="110%" Style="margin-left: -5%; font-size: 10pt;">
                                <asp:TableRow>
                                    <asp:TableCell Style="padding: 15px; border-top-style: none;">
                                        <div class="col-md-12">
                                            <div style="margin-top: -20px; width: 100%; height: 65%; border: thin; border-color: black; padding: 15px 10px; color: #005595; font-family: Arial; font-size: 10pt;">

                                                <div class="form-group row">
                                                    <div class="col-md-4">
                                                        <asp:Label ID="Label1" runat="server" Text="Registration No.:"></asp:Label>
                                                        <div class="input-group">
                                                            <asp:TextBox ID="RegYear" class="form-control" runat="server" ReadOnly="true"></asp:TextBox>
                                                            <asp:TextBox ID="Regno" class="form-control" runat="server" ReadOnly="true"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-4">
                                                        <asp:Label ID="Label2" runat="server" Text="Cert.No:"></asp:Label>
                                                        <div class="input-group">
                                                            <asp:TextBox ID="CertLetter" class="form-control" runat="server"></asp:TextBox>
                                                            <asp:TextBox ID="CertNo" class="form-control" runat="server"></asp:TextBox>

                                                        </div>
                                                    </div>
                                                    <div class="col-md-4">
                                                        <div class="form-group">
                                                            <asp:Label ID="Label3" runat="server" Text="Date Issued:"></asp:Label>
                                                            <div class='input-group date'>
                                                                <asp:TextBox ID="DateIssued" class="form-control" ClientIDMode="Static" ReadOnly="true" runat="server" placeholder="yy-mm-dd">
                                             
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
                                                            <asp:Label ID="Label4" runat="server" Text="Proposed Date of Marriage:"></asp:Label>
                                                            <div class='input-group date'>
                                                                <asp:TextBox ID="MarriageDate" class="form-control" ClientIDMode="Static" runat="server" placeholder="yy-mm-dd">
                                             
                                                                </asp:TextBox>
                                                                <div class="input-group-prepend">
                                                                    <span class="input-group-text"><i class="fa fa-calendar"></i></span>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-4">
                                                        <div class="form-group">
                                                            <asp:Label ID="Label5" runat="server" Text="Proposed place of Marriage (town/city):"></asp:Label>
                                                            <asp:TextBox ID="CityofMarriage" class="form-control" runat="server"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-4">
                                                        <div class="form-group">
                                                            <asp:Label ID="Label6" runat="server" Text="Applicant(s):"></asp:Label>
                                                            <asp:DropDownList ID="Applicant" runat="server" class="form-control" AutoPostBack="true">
                                                                <asp:ListItem runat="server" Value="--Select--">--Select--</asp:ListItem>
                                                                <asp:ListItem Text="Applicant" Value="Applicant"></asp:ListItem>
                                                                <asp:ListItem Text="Joint Applicant" Value="Joint Applicant"></asp:ListItem>
                                                                <asp:ListItem Text="Both" Value="Both"></asp:ListItem>
                                                            </asp:DropDownList>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                        </div>
                                    </asp:TableCell>
                                </asp:TableRow>
                            </asp:Table>
                            <asp:Table ID="Table1" runat="server" Width="110%" Style="margin-left: -5%; font-size: 10pt;">
                                <asp:TableRow>
                                    <asp:TableCell Width="50%" Style="padding: 15px; border-right-style: groove; border-top-style: groove;">
                                        <div class="row" style="margin-bottom: 25px;">
                                            <div class="col-md-12">
                                                <div style="padding: 15px 10px; width: 100%; height: 65%; border: thin; border-color: black; color: #005595; font-family: Arial;">

                                                    <div class="header">
                                                        <asp:Label ID="Label67" runat="server" Text="Applicant" ForeColor="Black"></asp:Label>
                                                    </div>
                                                    <br />
                                                    <div class="form-group row">
                                                        <div class="col-md-4">
                                                            <div class="form-group">
                                                                <asp:Label ID="Label8" runat="server" Text="First Name:"></asp:Label>
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

                                                                <asp:DropDownList ID="MaritalStatus" runat="server" class="form-control">
                                                                    <asp:ListItem runat="server" Value="--Select--">--Select--</asp:ListItem>
                                                                    <asp:ListItem Text="Single" Value="S"></asp:ListItem>
                                                                    <asp:ListItem Text="Divorced" Value="D"></asp:ListItem>
                                                                    <asp:ListItem Text="Widowed" Value="W"></asp:ListItem>
                                                                </asp:DropDownList>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-5">
                                                            <div class="form-group">
                                                                <asp:Label ID="Label12" runat="server" Text="Date of Birth:"></asp:Label>
                                                                <div class='input-group date'>
                                                                    <asp:TextBox ID="DBirth" class="form-control" ClientIDMode="Static"
                                                                        runat="server" placeholder="yy-mm-dd">
                                                                    </asp:TextBox>
                                                                    <div class="input-group-prepend">
                                                                        <span class="input-group-text"><i class="fa fa-calendar"></i></span>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-3">
                                                            <div class="form-group">
                                                                <asp:Label ID="Label13" runat="server" Text="Age:"></asp:Label>
                                                                <asp:TextBox ID="Age" runat="server" class="form-control" placeholder="Age"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="form-group row">
                                                        <div class="col-md-6">
                                                            <div class="form-group">
                                                                <asp:Label ID="Label14" runat="server" Text="Country of Divorce:"></asp:Label>
                                                                <asp:TextBox ID="CountryofDivorce" runat="server" class="form-control" placeholder="Country of Divorce"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <div class="form-group">
                                                                <asp:Label ID="Label15" runat="server" Text="City of divorce(if in Canada):"></asp:Label>
                                                                <asp:TextBox ID="CityGranted" class="form-control" runat="server" placeholder="City Granted In"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="form-group row">
                                                        <div class="col-md-6">
                                                            <div class="form-group">
                                                                <asp:Label ID="Label16" runat="server" Text="Religious denomination:"></asp:Label>
                                                                <asp:TextBox ID="Religion" runat="server" class="form-control" placeholder="Religion"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="form-group row">
                                                        <div class="col-md-4">
                                                            <div class="form-group">
                                                                <asp:Label ID="Label17" runat="server" Text="Court File No.:"></asp:Label>
                                                                <asp:TextBox ID="CourtFileNo" runat="server" class="form-control" placeholder="Court File No"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-8">
                                                            <div class="form-group">
                                                                <asp:Label ID="Label18" runat="server" Text="Province of Birth (if outside Canada, Country):"></asp:Label>
                                                                <asp:TextBox ID="ProvinceofBirth" class="form-control" runat="server" placeholder="Province of Birth"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <br />
                                                    <div class="header">
                                                        <asp:Label ID="Label88" runat="server" Text="Parent's Information" ForeColor="Black"></asp:Label>
                                                    </div>
                                                    <br />
                                                    <div class="form-group row">
                                                        <div class="col-md-6">
                                                            <div class="form-group">
                                                                <asp:Label ID="Label28" runat="server" Text="Parent1 First Name:"></asp:Label>
                                                                <asp:TextBox ID="P1FName" runat="server" class="form-control" placeholder="First Name"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <div class="form-group">
                                                                <asp:Label ID="Label29" runat="server" Text="Parent1 Last Name:"></asp:Label>
                                                                <asp:TextBox ID="P1LName" runat="server" class="form-control" placeholder="Last Name"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="form-group row">
                                                        <div class="col-md-8">
                                                            <div class="form-group">
                                                                <asp:Label ID="Label30" runat="server" Text="Parent1 Birth Province (if outside Canada, Country):"></asp:Label>
                                                                <asp:TextBox ID="P1BirthProvince" runat="server" class="form-control" placeholder="Birth Province"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="form-group row">
                                                        <div class="col-md-6">
                                                            <div class="form-group">
                                                                <asp:Label ID="Label31" runat="server" Text="Parent2 First Name:"></asp:Label>
                                                                <asp:TextBox ID="P2FName" runat="server" class="form-control" placeholder="First Name"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <div class="form-group">
                                                                <asp:Label ID="Label32" runat="server" Text="Parent2 Last Name:"></asp:Label>
                                                                <asp:TextBox ID="P2LName" runat="server" class="form-control" placeholder="Last Name"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="form-group row">
                                                        <div class="col-md-8">
                                                            <div class="form-group">
                                                                <asp:Label ID="Label33" runat="server" Text="Parent2 Birth Province (if outside Canada, Country):"></asp:Label>
                                                                <asp:TextBox ID="P2BirthProvince" runat="server" class="form-control" placeholder="Birth Province"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="form-group row">
                                                        <div class="col-md-6">
                                                            <div class="form-group">
                                                                <asp:Label ID="Lbl34" runat="server" Text="Parent3 First Name:"></asp:Label>
                                                                <asp:TextBox ID="P3FName" runat="server" class="form-control" placeholder="First Name"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <div class="form-group">
                                                                <asp:Label ID="Lbl35" runat="server" Text="Parent3 Last Name:"></asp:Label>
                                                                <asp:TextBox ID="P3LName" runat="server" class="form-control" placeholder="Last Name"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="form-group row">
                                                        <div class="col-md-8">
                                                            <div class="form-group">
                                                                <asp:Label ID="Lbl36" runat="server" Text="Parent3 Birth Province (if outside Canada, Country):"></asp:Label>
                                                                <asp:TextBox ID="P3BirthProvince" runat="server" class="form-control" placeholder="Birth Province"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="form-group row">
                                                        <div class="col-md-6">
                                                            <div class="form-group">
                                                                <asp:Label ID="Label34" runat="server" Text="Parent4 First Name:"></asp:Label>
                                                                <asp:TextBox ID="P4FName" runat="server" class="form-control" placeholder="First Name"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <div class="form-group">
                                                                <asp:Label ID="Label35" runat="server" Text="Parent4 Last Name:"></asp:Label>
                                                                <asp:TextBox ID="P4LName" runat="server" class="form-control" placeholder="Last Name"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="form-group row">
                                                        <div class="col-md-8">
                                                            <div class="form-group">
                                                                <asp:Label ID="Label36" runat="server" Text="Parent4 Birth Province (if outside Canada, Country):"></asp:Label>
                                                                <asp:TextBox ID="P4BirthProvince" runat="server" class="form-control" placeholder="Birth Province"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="header">
                                                        <asp:Label ID="Label80" runat="server" Text="Address of Applicant" ForeColor="Black"></asp:Label>
                                                    </div>
                                                    <br />
                                                    <div class="form-group row">
                                                        <div class="col-md-4">
                                                            <div class="form-group">
                                                                <asp:Label ID="Label135" runat="server" Text="House No:"></asp:Label>
                                                                <asp:TextBox ID="House_No" class="form-control" runat="server" placeholder="House No"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-8">
                                                            <div class="form-group">
                                                                <asp:Label ID="Label20" runat="server" Text="Street:"></asp:Label>
                                                                <asp:TextBox ID="Street" class="form-control" runat="server" placeholder="Street"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="form-group row">
                                                        <div class="col-md-4">
                                                            <div class="form-group">
                                                                <asp:Label ID="Label21" runat="server" Text="Unit/Apt:"></asp:Label>
                                                                <asp:TextBox ID="Apt" class="form-control" runat="server" placeholder="Unit/Apt:"></asp:TextBox>
                                                            </div>
                                                        </div>
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

                                                    </div>
                                                    <div class="form-group row">
                                                        <div class="col-md-4">
                                                            <div class="form-group">
                                                                <asp:Label ID="Label22" runat="server" Text="Country:"></asp:Label>
                                                                <asp:TextBox ID="Country" class="form-control" runat="server" placeholder="Country"></asp:TextBox>
                                                            </div>
                                                        </div>
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
                                            </div>
                                        </div>
                                    </asp:TableCell>
                                    <asp:TableCell Width="60%" Style="padding: 15px; border-left-style: groove; border-top-style: groove;">
                                        <div class="row" style="margin-bottom: 25px;">
                                            <div class="col-md-12">
                                                <div style="padding: 15px 10px; width: 100%; height: 65%; border: thin; border-color: black; color: #005595; font-family: Arial;">

                                                    <div class="header">
                                                        <asp:Label ID="Label68" runat="server" Text="Joint Applicant" ForeColor="Black"></asp:Label>
                                                    </div>
                                                    <br />
                                                    <div class="form-group row">
                                                        <div class="col-md-4">
                                                            <div class="form-group">
                                                                <asp:Label ID="Label56" runat="server" Text="First Name:"></asp:Label>
                                                                <asp:TextBox ID="JointFirstname" runat="server" class="form-control" placeholder="First Name"></asp:TextBox>
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

                                                                <asp:DropDownList ID="JointStatus" runat="server" class="form-control">
                                                                    <asp:ListItem runat="server" Value="--Select--">--Select--</asp:ListItem>
                                                                    <asp:ListItem Text="Single" Value="S"></asp:ListItem>
                                                                    <asp:ListItem Text="Divorced" Value="D"></asp:ListItem>
                                                                    <asp:ListItem Text="Widowed" Value="W"></asp:ListItem>
                                                                </asp:DropDownList>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-5">
                                                            <div class="form-group">
                                                                <asp:Label ID="Label60" runat="server" Text="Death of Birth:"></asp:Label>
                                                                <div class='input-group date'>
                                                                    <asp:TextBox ID="JointDOB" class="form-control" ClientIDMode="Static" runat="server" placeholder="yy-mm-dd">
                                                                    </asp:TextBox>
                                                                    <div class="input-group-prepend">
                                                                        <span class="input-group-text"><i class="fa fa-calendar"></i></span>
                                                                    </div>
                                                                </div>
                                                            </div>

                                                        </div>
                                                        <div class="col-md-3">
                                                            <div class="form-group">
                                                                <asp:Label ID="Label61" runat="server" Text="Age:"></asp:Label>
                                                                <asp:TextBox ID="JointAge" runat="server" class="form-control" placeholder="Age"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="form-group row">
                                                        <div class="col-md-6">
                                                            <div class="form-group">
                                                                <asp:Label ID="Label62" runat="server" Text="Country of Divorce:"></asp:Label>
                                                                <asp:TextBox ID="JointCountryDivorce" runat="server" class="form-control" placeholder="Country of Divorce"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <div class="form-group">
                                                                <asp:Label ID="Label63" runat="server" Text="City of divorce(if in Canada):"></asp:Label>
                                                                <asp:TextBox ID="JointCity" class="form-control" runat="server" placeholder="City Granted In"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="form-group row">
                                                        <div class="col-md-6">
                                                            <div class="form-group">
                                                                <asp:Label ID="Label64" runat="server" Text="Religious denomination:"></asp:Label>
                                                                <asp:TextBox ID="JointReligion" runat="server" class="form-control" placeholder="Religion"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="form-group row">
                                                        <div class="col-md-4">
                                                            <div class="form-group">
                                                                <asp:Label ID="Label65" runat="server" Text="Court File No.:"></asp:Label>
                                                                <asp:TextBox ID="JointCourtFile" runat="server" class="form-control" placeholder="Court File No"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-8">
                                                            <div class="form-group">
                                                                <asp:Label ID="Label66" runat="server" Text="Province of Birth (if outside Canada, Country):"></asp:Label>
                                                                <asp:TextBox ID="JointProvinceBirth" class="form-control" runat="server" placeholder="Province of Birth"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <br />
                                                    <div class="header">
                                                        <asp:Label ID="Label117" runat="server" Text="Parent's Information" ForeColor="Black"></asp:Label>
                                                    </div>
                                                    <br />
                                                    <div class="form-group row">
                                                        <div class="col-md-6">
                                                            <div class="form-group">
                                                                <asp:Label ID="Label46" runat="server" Text="Parent1 First Name:"></asp:Label>
                                                                <asp:TextBox ID="P1FName1" runat="server" class="form-control" placeholder="First Name"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <div class="form-group">
                                                                <asp:Label ID="Label47" runat="server" Text="Parent1 Last Name:"></asp:Label>
                                                                <asp:TextBox ID="P1LName1" runat="server" class="form-control" placeholder="Last Name"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="form-group row">
                                                        <div class="col-md-8">
                                                            <div class="form-group">
                                                                <asp:Label ID="Label48" runat="server" Text="Parent1 Birth Province (if outside Canada, Country):"></asp:Label>
                                                                <asp:TextBox ID="P1BirthProvince1" runat="server" class="form-control" placeholder="Birth Province"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="form-group row">
                                                        <div class="col-md-6">
                                                            <div class="form-group">
                                                                <asp:Label ID="Label49" runat="server" Text="Parent2 First Name:"></asp:Label>
                                                                <asp:TextBox ID="P2FName2" runat="server" class="form-control" placeholder="First Name"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <div class="form-group">
                                                                <asp:Label ID="Label50" runat="server" Text="Parent2 Last Name:"></asp:Label>
                                                                <asp:TextBox ID="P2LName2" runat="server" class="form-control" placeholder="Last Name"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="form-group row">
                                                        <div class="col-md-8">
                                                            <div class="form-group">
                                                                <asp:Label ID="Label51" runat="server" Text="Parent2 Birth Province (if outside Canada, Country):"></asp:Label>
                                                                <asp:TextBox ID="P2BirthProvince2" runat="server" class="form-control" placeholder="Birth Province"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="form-group row">
                                                        <div class="col-md-6">
                                                            <div class="form-group">
                                                                <asp:Label ID="Label52" runat="server" Text="Parent3 First Name:"></asp:Label>
                                                                <asp:TextBox ID="P3FName3" runat="server" class="form-control" placeholder="First Name"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <div class="form-group">
                                                                <asp:Label ID="Label53" runat="server" Text="Parent3 Last Name:"></asp:Label>
                                                                <asp:TextBox ID="P3LName3" runat="server" class="form-control" placeholder="Last Name"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="form-group row">
                                                        <div class="col-md-8">
                                                            <div class="form-group">
                                                                <asp:Label ID="Label54" runat="server" Text="Parent3 Birth Province (if outside Canada, Country):"></asp:Label>
                                                                <asp:TextBox ID="P3BirthProvince3" runat="server" class="form-control" placeholder="Birth Province"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="form-group row">
                                                        <div class="col-md-6">
                                                            <div class="form-group">
                                                                <asp:Label ID="Lbl52" runat="server" Text="Parent4 First Name:"></asp:Label>
                                                                <asp:TextBox ID="P4FName4" runat="server" class="form-control" placeholder="First Name"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <div class="form-group">
                                                                <asp:Label ID="Lbl53" runat="server" Text="Parent4 Last Name:"></asp:Label>
                                                                <asp:TextBox ID="P4LName4" runat="server" class="form-control" placeholder="Last Name"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="form-group row">
                                                        <div class="col-md-8">
                                                            <div class="form-group">
                                                                <asp:Label ID="Lbl54" runat="server" Text="Parent4 Birth Province (if outside Canada, Country):"></asp:Label>
                                                                <asp:TextBox ID="P4BirthProvince4" runat="server" class="form-control" placeholder="Birth Province"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="header">
                                                        <asp:Label ID="Label109" runat="server" Text="Address of Joint Applicant" ForeColor="Black"></asp:Label>
                                                    </div>
                                                    <br />

                                                    <div class="form-group row">
                                                        <div class="col-md-3">
                                                            <div class="form-group">
                                                                <asp:CheckBox ID="Same" runat="server" Text="Same" Height="10%" onclick="check()" />
                                                            </div>
                                                        </div>
                                                        <div class="col-md-3">
                                                            <div class="form-group">
                                                                <asp:Label ID="Label136" runat="server" Text="House No:"></asp:Label>
                                                                <asp:TextBox ID="Joint_House_No" class="form-control" runat="server" placeholder="House No"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <div class="form-group">
                                                                <asp:Label ID="Label38" runat="server" Text="Street:"></asp:Label>
                                                                <asp:TextBox ID="Street2" class="form-control" runat="server" placeholder="Street"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="form-group row">
                                                        <div class="col-md-4">
                                                            <div class="form-group">
                                                                <asp:Label ID="Label39" runat="server" Text="Unit/Apt:"></asp:Label>
                                                                <asp:TextBox ID="Apt2" class="form-control" runat="server" placeholder="Unit/Apt:"></asp:TextBox>
                                                            </div>
                                                        </div>
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
                                                    </div>
                                                    <div class="form-group row">
                                                        <div class="col-md-4">
                                                            <div class="form-group">
                                                                <asp:Label ID="Label42" runat="server" Text="Country:"></asp:Label>
                                                                <asp:TextBox ID="Country2" class="form-control" runat="server" placeholder="Country"></asp:TextBox>
                                                            </div>
                                                        </div>
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
                                            </div>
                                        </div>
                                    </asp:TableCell>
                                </asp:TableRow>
                            </asp:Table>
                        </div>
                    </div>
                </div>

                <div id="tab2" class="tab-pane" role="tabpanel">
                    <div class="row" style="border-left-style: groove; border-right-style: groove; border-bottom-style: groove; padding-right: 25px; padding-left: 25px">
                        <div class="col-md-12" style="height: 70%; padding-bottom: 20px;">
                            <div align="center" class="form-head" style="width: 110%; margin-left: -5%; background-color: #777; color: white; padding: 10px; border: none; text-align: center; outline: none; font-size: 15px;">
                                <h3>Vital Statistics (Marriages)</h3>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="row">
                                <div class="col-md-12" style="padding-bottom: 20px;">
                                    <div class="input-group">
                                        <asp:TextBox ID="SearchApplicants" class="form-control" runat="server" placeholder="Search here....."></asp:TextBox>
                                        <div class="input-group-prepend">

                                            <asp:Button ID="SearchApp" runat="server" Text="Search" Class="btn btn-primary"
                                                BackColor="Gray" BorderColor="Gray" OnClick="SearchApp_Click" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div id="section" runat="server" style="display: none" runat="server">
                                <asp:Table ID="Table3" runat="server" Width="110%" Style="margin-left: -5%; font-size: 10pt;">
                                    <asp:TableRow>
                                        <asp:TableCell Style="padding: 15px; border-top-style: none;">
                                            <div class="col-md-12">
                                                <div style="margin-top: -20px; width: 100%; height: 65%; border: thin; border-color: black; padding: 15px 10px; color: #005595; font-family: Arial; font-size: 10pt;">

                                                    <div class="form-group row">
                                                        <div class="col-md-4">
                                                            <asp:Label ID="Label27" runat="server" Text="Registration No.:"></asp:Label>
                                                            <div class="input-group">
                                                                <asp:TextBox ID="H_RegYear" class="form-control" runat="server" ReadOnly="true"></asp:TextBox>
                                                                <asp:TextBox ID="H_Regno" class="form-control" runat="server" ReadOnly="true"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-4">
                                                            <asp:Label ID="Label37" runat="server" Text="Cert.No:"></asp:Label>
                                                            <div class="input-group">
                                                                <asp:TextBox ID="H_Certletter" class="form-control" runat="server" Text="G"></asp:TextBox>
                                                                <asp:TextBox ID="H_CertNo" class="form-control" runat="server"></asp:TextBox>

                                                            </div>
                                                        </div>
                                                        <div class="col-md-4">
                                                            <div class="form-group">
                                                                <asp:Label ID="Label45" runat="server" Text="Date Issued:"></asp:Label>
                                                                <div class='input-group date'>
                                                                    <asp:TextBox ID="H_DateIssued" class="form-control" ClientIDMode="Static" ReadOnly="true" runat="server" placeholder="yy-mm-dd">
                                             
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
                                                                <asp:Label ID="Label55" runat="server" Text="Proposed Date of Marriage:"></asp:Label>
                                                                <div class='input-group date'>
                                                                    <asp:TextBox ID="H_MarriageDate" class="form-control" ClientIDMode="Static" ReadOnly="true" runat="server" placeholder="yy-mm-dd">
                                             
                                                                    </asp:TextBox>
                                                                    <div class="input-group-prepend">
                                                                        <span class="input-group-text"><i class="fa fa-calendar"></i></span>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-4">
                                                            <div class="form-group">
                                                                <asp:Label ID="Label69" runat="server" Text="Proposed place of Marriage (town/city):"></asp:Label>
                                                                <asp:TextBox ID="H_CityofMarriage" class="form-control" runat="server"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-4">
                                                            <div class="form-group">
                                                                <asp:Label ID="Label70" runat="server" Text="Applicant(s):"></asp:Label>

                                                                <asp:DropDownList ID="H_Applicant" runat="server" class="form-control" AutoPostBack="true">
                                                                    <asp:ListItem runat="server" Value="--Select--">--Select--</asp:ListItem>
                                                                    <asp:ListItem Text="Applicant" Value="Applicant"></asp:ListItem>
                                                                    <asp:ListItem Text="Joint Applicant" Value="Joint Applicant"></asp:ListItem>
                                                                    <asp:ListItem Text="Both" Value="Both"></asp:ListItem>
                                                                </asp:DropDownList>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                            </div>
                                        </asp:TableCell>
                                    </asp:TableRow>
                                </asp:Table>
                                <asp:Table ID="Table4" runat="server" Width="110%" Style="margin-left: -5%; font-size: 10pt;">
                                    <asp:TableRow>
                                        <asp:TableCell Width="50%" Style="padding: 15px; border-right-style: groove; border-top-style: groove;">
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <div style="padding: 15px 10px; width: 100%; height: 65%; border: thin; border-color: black; color: #005595; font-family: Arial;">

                                                        <div class="header">
                                                            <asp:Label ID="Label71" runat="server" Text="Applicant" ForeColor="Black"></asp:Label>
                                                        </div>
                                                        <br />
                                                        <div class="form-group row">
                                                            <div class="col-md-4">
                                                                <div class="form-group">
                                                                    <asp:Label ID="Label72" runat="server" Text="First Name:"></asp:Label>
                                                                    <asp:TextBox ID="H_Fname" runat="server" class="form-control" placeholder="First Name"></asp:TextBox>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-4">
                                                                <div class="form-group">
                                                                    <asp:Label ID="Label73" runat="server" Text="Middle Name:"></asp:Label>
                                                                    <asp:TextBox ID="H_Mname" runat="server" class="form-control" placeholder="Middle Name"></asp:TextBox>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-4">
                                                                <div class="form-group">
                                                                    <asp:Label ID="Label74" runat="server" Text="Last Name:"></asp:Label>
                                                                    <asp:TextBox ID="H_Lname" runat="server" class="form-control" placeholder="Last Name"></asp:TextBox>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="form-group row">
                                                            <div class="col-md-4">
                                                                <div class="form-group">
                                                                    <asp:Label ID="Label75" runat="server" Text="Marital Status:"></asp:Label>

                                                                    <asp:DropDownList ID="H_MaritalStatus" runat="server" class="form-control">
                                                                        <asp:ListItem runat="server" Value="--Select--">--Select--</asp:ListItem>
                                                                        <asp:ListItem Text="Single" Value="S"></asp:ListItem>
                                                                        <asp:ListItem Text="Divorced" Value="D"></asp:ListItem>
                                                                        <asp:ListItem Text="Widowed" Value="W"></asp:ListItem>
                                                                    </asp:DropDownList>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-5">
                                                                <div class="form-group">
                                                                    <asp:Label ID="Label76" runat="server" Text="Date of Birth:"></asp:Label>
                                                                    <div class='input-group date'>
                                                                        <asp:TextBox ID="H_DBirth" class="form-control" ClientIDMode="Static"
                                                                            runat="server" placeholder="yy-mm-dd">
                                                                        </asp:TextBox>
                                                                        <div class="input-group-prepend">
                                                                            <span class="input-group-text"><i class="fa fa-calendar"></i></span>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-3">
                                                                <div class="form-group">
                                                                    <asp:Label ID="Label77" runat="server" Text="Age:"></asp:Label>
                                                                    <asp:TextBox ID="H_Age" runat="server" class="form-control" placeholder="Age"></asp:TextBox>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="form-group row">
                                                            <div class="col-md-6">
                                                                <div class="form-group">
                                                                    <asp:Label ID="Label78" runat="server" Text="Country of Divorce:"></asp:Label>
                                                                    <asp:TextBox ID="H_CountryofDivorce" runat="server" class="form-control" placeholder="Country of Divorce"></asp:TextBox>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <div class="form-group">
                                                                    <asp:Label ID="Label79" runat="server" Text="City of divorce(if in Canada):"></asp:Label>
                                                                    <asp:TextBox ID="H_CityGranted" class="form-control" runat="server" placeholder="City Granted In"></asp:TextBox>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="form-group row">
                                                            <div class="col-md-6">
                                                                <div class="form-group">
                                                                    <asp:Label ID="Label81" runat="server" Text="Religious denomination:"></asp:Label>
                                                                    <asp:TextBox ID="H_Religion" runat="server" class="form-control" placeholder="Religion"></asp:TextBox>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="form-group row">
                                                            <div class="col-md-4">
                                                                <div class="form-group">
                                                                    <asp:Label ID="Label82" runat="server" Text="Court File No.:"></asp:Label>
                                                                    <asp:TextBox ID="H_CourtFileNo" runat="server" class="form-control" placeholder="Court File No"></asp:TextBox>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-8">
                                                                <div class="form-group">
                                                                    <asp:Label ID="Label83" runat="server" Text="Province of Birth (if outside Canada, Country):"></asp:Label>
                                                                    <asp:TextBox ID="H_ProvinceofBirth" class="form-control" runat="server" placeholder="Province of Birth"></asp:TextBox>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <br />
                                                        <div class="header">
                                                            <asp:Label ID="Label84" runat="server" Text="Address of Applicant" ForeColor="Black"></asp:Label>
                                                        </div>
                                                        <br />
                                                        <div class="form-group row">
                                                            <div class="col-md-3">
                                                                <div class="form-group">
                                                                    <asp:Label ID="Label137" runat="server" Text="House No:"></asp:Label>
                                                                    <asp:TextBox ID="H_House_No" class="form-control" runat="server" placeholder="House No"></asp:TextBox>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-8">
                                                                <div class="form-group">
                                                                    <asp:Label ID="Label85" runat="server" Text="Street:"></asp:Label>
                                                                    <asp:TextBox ID="H_Street" class="form-control" runat="server" placeholder="Street"></asp:TextBox>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="form-group row">
                                                            <div class="col-md-4">
                                                                <div class="form-group">
                                                                    <asp:Label ID="Label86" runat="server" Text="Unit/Apt:"></asp:Label>
                                                                    <asp:TextBox ID="H_Apt" class="form-control" runat="server" placeholder="Unit/Apt:"></asp:TextBox>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-4">
                                                                <div class="form-group">
                                                                    <asp:Label ID="Label87" runat="server" Text="City:"></asp:Label>
                                                                    <asp:TextBox ID="H_City" class="form-control" runat="server" placeholder="City"></asp:TextBox>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-4">
                                                                <div class="form-group">
                                                                    <asp:Label ID="Label89" runat="server" Text="Province:"></asp:Label>
                                                                    <asp:DropDownList ID="H_Province1" class="form-control" runat="server"></asp:DropDownList>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="form-group row">
                                                            <div class="col-md-4">
                                                                <div class="form-group">
                                                                    <asp:Label ID="Label90" runat="server" Text="Country:"></asp:Label>
                                                                    <asp:TextBox ID="H_Country" class="form-control" runat="server" placeholder="Country"></asp:TextBox>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-4">
                                                                <div class="form-group">
                                                                    <asp:Label ID="Label91" runat="server" Text="Postal Code:"></asp:Label>
                                                                    <asp:TextBox ID="H_Postalcode" class="form-control" runat="server" placeholder="Postal Code"></asp:TextBox>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-4">
                                                                <div class="form-group">
                                                                    <asp:Label ID="Label92" runat="server" Text="Phone:"></asp:Label>
                                                                    <asp:TextBox ID="H_Phone" class="form-control" runat="server" placeholder="Phone"></asp:TextBox>
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <br />
                                                        <div class="header">
                                                            <asp:Label ID="Label93" runat="server" Text="Parent's Information" ForeColor="Black"></asp:Label>
                                                        </div>
                                                        <br />
                                                        <div class="form-group row">
                                                            <div class="col-md-6">
                                                                <div class="form-group">
                                                                    <asp:Label ID="Label94" runat="server" Text="Parent1 First Name:"></asp:Label>
                                                                    <asp:TextBox ID="H_P1FName" runat="server" class="form-control" placeholder="First Name"></asp:TextBox>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <div class="form-group">
                                                                    <asp:Label ID="Label95" runat="server" Text="Parent1 Last Name:"></asp:Label>
                                                                    <asp:TextBox ID="H_P1LName" runat="server" class="form-control" placeholder="Last Name"></asp:TextBox>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="form-group row">
                                                            <div class="col-md-8">
                                                                <div class="form-group">
                                                                    <asp:Label ID="Label96" runat="server" Text="Parent1 Birth Province (if outside Canada, Country):"></asp:Label>
                                                                    <asp:TextBox ID="H_P1BirthProvince" runat="server" class="form-control" placeholder="Birth Province"></asp:TextBox>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="form-group row">
                                                            <div class="col-md-6">
                                                                <div class="form-group">
                                                                    <asp:Label ID="Label97" runat="server" Text="Parent2 First Name:"></asp:Label>
                                                                    <asp:TextBox ID="H_P2FName" runat="server" class="form-control" placeholder="First Name"></asp:TextBox>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <div class="form-group">
                                                                    <asp:Label ID="Label98" runat="server" Text="Parent2 Last Name:"></asp:Label>
                                                                    <asp:TextBox ID="H_P2LName" runat="server" class="form-control" placeholder="Last Name"></asp:TextBox>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="form-group row">
                                                            <div class="col-md-8">
                                                                <div class="form-group">
                                                                    <asp:Label ID="Label99" runat="server" Text="Parent2 Birth Province (if outside Canada, Country):"></asp:Label>
                                                                    <asp:TextBox ID="H_P2BirthProvince" runat="server" class="form-control" placeholder="Birth Province"></asp:TextBox>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="form-group row">
                                                            <div class="col-md-6">
                                                                <div class="form-group">
                                                                    <asp:Label ID="Lbl100" runat="server" Text="Parent3 First Name:"></asp:Label>
                                                                    <asp:TextBox ID="H_P3FName" runat="server" class="form-control" placeholder="First Name"></asp:TextBox>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <div class="form-group">
                                                                    <asp:Label ID="Lbl101" runat="server" Text="Parent3 Last Name:"></asp:Label>
                                                                    <asp:TextBox ID="H_P3LName" runat="server" class="form-control" placeholder="Last Name"></asp:TextBox>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="form-group row">
                                                            <div class="col-md-8">
                                                                <div class="form-group">
                                                                    <asp:Label ID="Lbl102" runat="server" Text="Parent3 Birth Province (if outside Canada, Country):"></asp:Label>
                                                                    <asp:TextBox ID="H_P3BirthProvince" runat="server" class="form-control" placeholder="Birth Province"></asp:TextBox>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="form-group row">
                                                            <div class="col-md-6">
                                                                <div class="form-group">
                                                                    <asp:Label ID="Label100" runat="server" Text="Parent4 First Name:"></asp:Label>
                                                                    <asp:TextBox ID="H_P4FName" runat="server" class="form-control" placeholder="First Name"></asp:TextBox>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <div class="form-group">
                                                                    <asp:Label ID="Label101" runat="server" Text="Parent4 Last Name:"></asp:Label>
                                                                    <asp:TextBox ID="H_P4LName" runat="server" class="form-control" placeholder="Last Name"></asp:TextBox>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="form-group row">
                                                            <div class="col-md-8">
                                                                <div class="form-group">
                                                                    <asp:Label ID="Label102" runat="server" Text="Parent4 Birth Province (if outside Canada, Country):"></asp:Label>
                                                                    <asp:TextBox ID="H_P4BirthProvince" runat="server" class="form-control" placeholder="Birth Province"></asp:TextBox>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </asp:TableCell>
                                        <asp:TableCell Width="60%" Style="padding: 15px; border-top-style: groove;">
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <div style="padding: 15px 10px; width: 100%; height: 65%; border: thin; border-color: black; color: #005595; font-family: Arial;">

                                                        <div class="header">
                                                            <asp:Label ID="Label103" runat="server" Text="Joint Applicant" ForeColor="Black"></asp:Label>
                                                        </div>
                                                        <br />
                                                        <div class="form-group row">
                                                            <div class="col-md-4">
                                                                <div class="form-group">
                                                                    <asp:Label ID="Label104" runat="server" Text="First Name:"></asp:Label>
                                                                    <asp:TextBox ID="H_JointFirstname" runat="server" class="form-control" placeholder="First Name"></asp:TextBox>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-4">
                                                                <div class="form-group">
                                                                    <asp:Label ID="Label105" runat="server" Text="Middle Name:"></asp:Label>
                                                                    <asp:TextBox ID="H_JointMiddlename" runat="server" class="form-control" placeholder="Middle Name"></asp:TextBox>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-4">
                                                                <div class="form-group">
                                                                    <asp:Label ID="Label106" runat="server" Text="Last Name:"></asp:Label>
                                                                    <asp:TextBox ID="H_JointLastname" runat="server" class="form-control" placeholder="Last Name"></asp:TextBox>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="form-group row">
                                                            <div class="col-md-4">
                                                                <div class="form-group">
                                                                    <asp:Label ID="Label107" runat="server" Text="Marital Status:"></asp:Label>

                                                                    <asp:DropDownList ID="H_JointStatus" runat="server" class="form-control">
                                                                        <asp:ListItem runat="server" Value="--Select--">--Select--</asp:ListItem>
                                                                        <asp:ListItem Text="Single" Value="S"></asp:ListItem>
                                                                        <asp:ListItem Text="Divorced" Value="D"></asp:ListItem>
                                                                        <asp:ListItem Text="Widowed" Value="W"></asp:ListItem>
                                                                    </asp:DropDownList>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-5">
                                                                <div class="form-group">
                                                                    <asp:Label ID="Label108" runat="server" Text="Death of Birth:"></asp:Label>
                                                                    <div class='input-group date'>
                                                                        <asp:TextBox ID="H_JointDOB" class="form-control" ClientIDMode="Static" ReadOnly="true" runat="server" placeholder="yy-mm-dd">
                                                                        </asp:TextBox>
                                                                        <div class="input-group-prepend">
                                                                            <span class="input-group-text"><i class="fa fa-calendar"></i></span>
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                            </div>
                                                            <div class="col-md-3">
                                                                <div class="form-group">
                                                                    <asp:Label ID="Label110" runat="server" Text="Age:"></asp:Label>
                                                                    <asp:TextBox ID="H_JointAge" runat="server" class="form-control" placeholder="Age"></asp:TextBox>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="form-group row">
                                                            <div class="col-md-6">
                                                                <div class="form-group">
                                                                    <asp:Label ID="Label111" runat="server" Text="Country of Divorce:"></asp:Label>
                                                                    <asp:TextBox ID="H_JointCountryDivorce" runat="server" class="form-control" placeholder="Country of Divorce"></asp:TextBox>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <div class="form-group">
                                                                    <asp:Label ID="Label112" runat="server" Text="City of divorce(if in Canada):"></asp:Label>
                                                                    <asp:TextBox ID="H_JointCity" class="form-control" runat="server" placeholder="City Granted In"></asp:TextBox>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="form-group row">
                                                            <div class="col-md-6">
                                                                <div class="form-group">
                                                                    <asp:Label ID="Label113" runat="server" Text="Religious denomination:"></asp:Label>
                                                                    <asp:TextBox ID="H_JointReligion" runat="server" class="form-control" placeholder="Religion"></asp:TextBox>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="form-group row">
                                                            <div class="col-md-4">
                                                                <div class="form-group">
                                                                    <asp:Label ID="Label114" runat="server" Text="Court File No.:"></asp:Label>
                                                                    <asp:TextBox ID="H_JointCourtFile" runat="server" class="form-control" placeholder="Court File No"></asp:TextBox>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-8">
                                                                <div class="form-group">
                                                                    <asp:Label ID="Label115" runat="server" Text="Province of Birth (if outside Canada, Country):"></asp:Label>
                                                                    <asp:TextBox ID="H_JointProvinceBirth" class="form-control" runat="server" placeholder="Province of Birth"></asp:TextBox>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <br />
                                                        <div class="header">
                                                            <asp:Label ID="Label116" runat="server" Text="Address of Joint Applicant" ForeColor="Black"></asp:Label>
                                                        </div>
                                                        <br />

                                                        <div class="form-group row">
                                                            <div class="col-md-2">
                                                                <div class="form-group">
                                                                    <asp:CheckBox ID="H_Same" runat="server" Text="Same" />
                                                                </div>
                                                            </div>
                                                            <div class="col-md-3">
                                                                <div class="form-group">
                                                                    <asp:Label ID="Label138" runat="server" Text="House No:"></asp:Label>
                                                                    <asp:TextBox ID="H_Joint_House_No" class="form-control" runat="server" placeholder="House No"></asp:TextBox>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-7">
                                                                <div class="form-group">
                                                                    <asp:Label ID="Label118" runat="server" Text="Street:"></asp:Label>
                                                                    <asp:TextBox ID="H_Street2" class="form-control" runat="server" placeholder="Street"></asp:TextBox>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="form-group row">

                                                            <div class="col-md-4">
                                                                <div class="form-group">
                                                                    <asp:Label ID="Label119" runat="server" Text="Unit/Apt:"></asp:Label>
                                                                    <asp:TextBox ID="H_Apt2" class="form-control" runat="server" placeholder="Unit/Apt:"></asp:TextBox>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-4">
                                                                <div class="form-group">
                                                                    <asp:Label ID="Label120" runat="server" Text="City:"></asp:Label>
                                                                    <asp:TextBox ID="H_City2" class="form-control" runat="server" placeholder="City"></asp:TextBox>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-4">
                                                                <div class="form-group">
                                                                    <asp:Label ID="Label121" runat="server" Text="Province:"></asp:Label>
                                                                    <asp:DropDownList ID="H_Province2" class="form-control" runat="server"></asp:DropDownList>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="form-group row">
                                                            <div class="col-md-4">
                                                                <div class="form-group">
                                                                    <asp:Label ID="Label122" runat="server" Text="Country:"></asp:Label>
                                                                    <asp:TextBox ID="H_Country2" class="form-control" runat="server" placeholder="Country"></asp:TextBox>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-4">
                                                                <div class="form-group">
                                                                    <asp:Label ID="Label123" runat="server" Text="Postal Code:"></asp:Label>
                                                                    <asp:TextBox ID="H_Pin2" class="form-control" runat="server" placeholder="Postal Code"></asp:TextBox>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-4">
                                                                <div class="form-group">
                                                                    <asp:Label ID="Label124" runat="server" Text="Phone:"></asp:Label>
                                                                    <asp:TextBox ID="H_Phone2" class="form-control" runat="server" placeholder="Phone"></asp:TextBox>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <br />
                                                        <div class="header">
                                                            <asp:Label ID="Label125" runat="server" Text="Parent's Information" ForeColor="Black"></asp:Label>
                                                        </div>
                                                        <br />
                                                        <div class="form-group row">
                                                            <div class="col-md-6">
                                                                <div class="form-group">
                                                                    <asp:Label ID="Label126" runat="server" Text="Parent1 First Name:"></asp:Label>
                                                                    <asp:TextBox ID="H_P1FName1" runat="server" class="form-control" placeholder="First Name"></asp:TextBox>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <div class="form-group">
                                                                    <asp:Label ID="Label127" runat="server" Text="Parent1 Last Name:"></asp:Label>
                                                                    <asp:TextBox ID="H_P1LName1" runat="server" class="form-control" placeholder="Last Name"></asp:TextBox>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="form-group row">
                                                            <div class="col-md-8">
                                                                <div class="form-group">
                                                                    <asp:Label ID="Label128" runat="server" Text="Parent1 Birth Province (if outside Canada, Country):"></asp:Label>
                                                                    <asp:TextBox ID="H_P1BirthProvince1" runat="server" class="form-control" placeholder="Birth Province"></asp:TextBox>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="form-group row">
                                                            <div class="col-md-6">
                                                                <div class="form-group">
                                                                    <asp:Label ID="Label129" runat="server" Text="Parent2 First Name:"></asp:Label>
                                                                    <asp:TextBox ID="H_P2FName2" runat="server" class="form-control" placeholder="First Name"></asp:TextBox>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <div class="form-group">
                                                                    <asp:Label ID="Label130" runat="server" Text="Parent2 Last Name:"></asp:Label>
                                                                    <asp:TextBox ID="H_P2LName2" runat="server" class="form-control" placeholder="Last Name"></asp:TextBox>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="form-group row">
                                                            <div class="col-md-8">
                                                                <div class="form-group">
                                                                    <asp:Label ID="Label131" runat="server" Text="Parent2 Birth Province (if outside Canada, Country):"></asp:Label>
                                                                    <asp:TextBox ID="H_P2BirthProvince2" runat="server" class="form-control" placeholder="Birth Province"></asp:TextBox>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="form-group row">
                                                            <div class="col-md-6">
                                                                <div class="form-group">
                                                                    <asp:Label ID="Label132" runat="server" Text="Parent3 First Name:"></asp:Label>
                                                                    <asp:TextBox ID="H_P3FName3" runat="server" class="form-control" placeholder="First Name"></asp:TextBox>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <div class="form-group">
                                                                    <asp:Label ID="Label133" runat="server" Text="Parent3 Last Name:"></asp:Label>
                                                                    <asp:TextBox ID="H_P3LName3" runat="server" class="form-control" placeholder="Last Name"></asp:TextBox>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="form-group row">
                                                            <div class="col-md-8">
                                                                <div class="form-group">
                                                                    <asp:Label ID="Label134" runat="server" Text="Parent3 Birth Province (if outside Canada, Country):"></asp:Label>
                                                                    <asp:TextBox ID="H_P3BirthProvince3" runat="server" class="form-control" placeholder="Birth Province"></asp:TextBox>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="form-group row">
                                                            <div class="col-md-6">
                                                                <div class="form-group">
                                                                    <asp:Label ID="Lbl32" runat="server" Text="Parent4 First Name:"></asp:Label>
                                                                    <asp:TextBox ID="H_P4FName4" runat="server" class="form-control" placeholder="First Name"></asp:TextBox>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <div class="form-group">
                                                                    <asp:Label ID="Lbl33" runat="server" Text="Parent4 Last Name:"></asp:Label>
                                                                    <asp:TextBox ID="H_P4LName4" runat="server" class="form-control" placeholder="Last Name"></asp:TextBox>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="form-group row">
                                                            <div class="col-md-8">
                                                                <div class="form-group">
                                                                    <asp:Label ID="Lbl3" runat="server" Text="Parent4 Birth Province (if outside Canada, Country):"></asp:Label>
                                                                    <asp:TextBox ID="H_P4BirthProvince4" runat="server" class="form-control" placeholder="Birth Province"></asp:TextBox>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </asp:TableCell>
                                    </asp:TableRow>
                                </asp:Table>

                            </div>
                            <div class="form-group row">
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <div id="grid" style="display: block" runat="server">
                                            <asp:GridView ID="GridView1" runat="server" BorderStyle="None" GridLines="Horizontal"
                                                BorderColor="LightGray" AutoGenerateColumns="false"
                                                PageIndex="5" AllowPaging="True" AllowCustomPaging="True" CellPadding="3"
                                                CellSpacing="2" Width="100%" OnRowCommand="GridView1_RowCommand"
                                                DataSourceID="SearchApplicant" CssClass="table table-condensed table-hover"
                                                Style="font-size: 10pt; font-family: arial;">
                                                <Columns>
                                                    <%--"--%>

                                                    <asp:BoundField DataField="M_Reg_Year" HeaderText="Year" />
                                                    <asp:BoundField DataField="M_Reg_No" HeaderText="Registration No." />
                                                    <asp:BoundField DataField="M_Reg_Letter" HeaderText="Cert No" />
                                                    <asp:BoundField DataField="M_Reg_Cert_No" HeaderText="Cert" />

                                                    <asp:TemplateField HeaderText="Applicant Name">
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label4" runat="server" Text='<%# Eval("M_Reg_First_Name_F") %>'></asp:Label>,&nbsp;
                                                                <asp:Label ID="Label3" runat="server" Text='<%# Eval("M_Reg_Last_Name_F") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Joint Applicant Name">
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label5" runat="server" Text='<%# Eval("M_Reg_First_Name_M") %>'></asp:Label>,&nbsp;
                                                                <asp:Label ID="Label7" runat="server" Text='<%# Eval("M_Reg_Last_Name_M") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:ButtonField ButtonType="Button" Text="ViewDetails" CommandName="ViewDetails" ControlStyle-CssClass="btn btn-primary"
                                                        ControlStyle-BackColor="#507CD1" ControlStyle-ForeColor="White" ControlStyle-Font-Size="15px" />
                                                    <asp:ButtonField ButtonType="Button" Text="Edit" CommandName="Edit" ControlStyle-CssClass="btn btn-primary fa fa-pencil"
                                                        ControlStyle-BackColor="#005595" ControlStyle-ForeColor="White" ControlStyle-Font-Size="15px" />

                                                </Columns>

                                            </asp:GridView>
                                            <asp:SqlDataSource ID="SearchApplicant"
                                                SelectCommand="SearchMarriage" SelectCommandType="StoredProcedure"
                                                ConnectionString="<%$ ConnectionStrings:Vitals%>"
                                                runat="server">
                                                <SelectParameters>
                                                    <asp:ControlParameter ControlID="SearchApplicants" Name="Searchstr" PropertyName="Text" Type="String"
                                                        ConvertEmptyStringToNull="true" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>


            </div>
            <asp:HiddenField ID="hfTab" runat="server" />
        </div>

        <div class="row" style="padding-top: 15px;">
            <div class="col-md-12">
                <div class="form-group" align="center">
                    <asp:LinkButton ID="SubmitBtn" runat="server" CssClass="btn  btn-primary" OnClick="SubmitBtn_Click">
                            <i class="fa fa-save"></i>&nbsp;Save</asp:LinkButton>
                </div>
            </div>
        </div>


    </div>
    <script src="Content/bootstrap-notify-3.1.3/bootstrap-notify-3.1.3/dist/bootstrap-notify.min.js"></script>
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
        function showMyDialog(msg, alertype) {

            $.notify({
                // options
                message: msg
            }, {
                    // settings
                    type: alertype,
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
