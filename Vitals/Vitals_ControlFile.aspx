<%@ Page Title="" Language="C#" MasterPageFile="~/AdminLTE.Master" AutoEventWireup="true" CodeBehind="Vitals_ControlFile.aspx.cs" Inherits="Vitals.Vitals_ControlFile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
    <link href="Style/jquery-ui.css" rel="stylesheet" />
    <script src="Scripts/jquery-3.6.0.js"></script>
    <script src="Scripts/jquery-ui.js"></script>
    <script type="text/javascript">
         function isNumber(evt) {
            var iKeyCode = (evt.which) ? evt.which : evt.keyCode
            if (iKeyCode != 46 && iKeyCode > 31 && (iKeyCode < 48 || iKeyCode > 57))
                return false;

            return true;
        }
    </script>
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1>Vital Statistics (Vital Control File)</h1>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="#">File Maintenance</a></li>
                        <li class="breadcrumb-item active">Control File</li>
                    </ol>
                </div>
            </div>
        </div>
        <!-- /.container-fluid -->
    </section>
    <section class="content">
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
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <asp:Label ID="Label1" runat="server" Text="Last Number for Death Inside Town:"></asp:Label>
                                            <asp:TextBox ID="LastDeathInside" class="form-control" runat="server" placeholder="0" MaxLength="4" onkeypress="javascript:return isNumber(event)"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-md-2">
                                        <div class="form-group">
                                            <asp:Label ID="Label6" runat="server" Text="Year(Inside):"></asp:Label>
                                            <asp:TextBox ID="Year_Inside" class="form-control" runat="server" MaxLength="4" onkeypress="javascript:return isNumber(event)"></asp:TextBox>

                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <asp:Label ID="Label2" runat="server" Text="Last Number for Death Outside Town:"></asp:Label>
                                            <asp:TextBox ID="LastDeathOutside" class="form-control" runat="server" placeholder="0" MaxLength="4" onkeypress="javascript:return isNumber(event)"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-md-2">
                                        <div class="form-group">
                                            <asp:Label ID="Label16" runat="server" Text="Year(Outside):"></asp:Label>
                                            <asp:TextBox ID="Year_Outside" class="form-control" runat="server" MaxLength="4" onkeypress="javascript:return isNumber(event)"></asp:TextBox>

                                        </div>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <asp:Label ID="Label3" runat="server" Text="Last Number for Still Births."></asp:Label>
                                            <asp:TextBox ID="Stillbirths" class="form-control" runat="server" placeholder="0" MaxLength="4" onkeypress="javascript:return isNumber(event)"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <asp:Label ID="Label4" runat="server" Text="Last Number for Marriage:"></asp:Label>
                                            <asp:TextBox ID="LastMarriage" class="form-control" runat="server" placeholder="0" MaxLength="4" onkeypress="javascript:return isNumber(event)"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <asp:Label ID="Label7" runat="server" Text="GL Number:"></asp:Label>
                                            <asp:TextBox ID="GLNo" class="form-control" runat="server" placeholder="0" MaxLength="4" onkeypress="javascript:return isNumber(event)"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <asp:Label ID="Label8" runat="server" Text="GL Account Number:"></asp:Label>
                                            <asp:TextBox ID="GLActNo" class="form-control" runat="server" placeholder="0" MaxLength="4" onkeypress="javascript:return isNumber(event)"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <asp:Label ID="Label9" runat="server" Text="Burial Permit Price:"></asp:Label>
                                            <div class="input-group mb-3">
                                                <div class="input-group-prepend">
                                                    <span class="input-group-text">$</span>
                                                </div>
                                                <asp:TextBox ID="BurialPermitPrice" class="form-control" runat="server" placeholder="0.00" MaxLength="6" onkeypress="javascript:return isNumber(event)"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <asp:Label ID="Label10" runat="server" Text="Marriage Licence (Resident):"></asp:Label>
                                            <div class="input-group mb-3">
                                                <div class="input-group-prepend">
                                                    <span class="input-group-text">$</span>
                                                </div>
                                                <asp:TextBox ID="MarriageLicence1" class="form-control" runat="server"
                                                    placeholder="0.00" MaxLength="6" onkeypress="javascript:return isNumber(event)"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <asp:Label ID="Label5" runat="server" Text="Marriage Licence (Non Resident):"></asp:Label>
                                            <div class="input-group mb-3">
                                                <div class="input-group-prepend">
                                                    <span class="input-group-text">$</span>
                                                </div>
                                                <asp:TextBox ID="MarriageLicence2" class="form-control" runat="server"
                                                    placeholder="0.00" MaxLength="6" onkeypress="javascript:return isNumber(event)"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <asp:Label ID="Label11" runat="server" Text="Name of Town/City:"></asp:Label>
                                            <asp:TextBox ID="NameofTown" class="form-control" runat="server" placeholder="Name of Town/City" MaxLength="60"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <asp:Label ID="Label12" runat="server" Text="Name of Region/County:"></asp:Label>
                                            <asp:TextBox ID="NameofRegion" class="form-control" runat="server" placeholder="Name of Region/County" MaxLength="50"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <asp:Label ID="Label13" runat="server" Text="Register Number:"></asp:Label>
                                            <asp:TextBox ID="RegisterNumber" class="form-control" runat="server" placeholder="Register Number" MaxLength="20"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <asp:Label ID="Label14" runat="server" Text="Application Title:"></asp:Label>
                                            <asp:TextBox ID="ApplicationTitle" class="form-control" runat="server" placeholder="Application Title" MaxLength="50"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <asp:Label ID="Label15" runat="server" Text="Look up Province/State:"></asp:Label>
                                            <asp:DropDownList ID="province" class="form-control" runat="server"></asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                                
                        <asp:LinkButton ID="SubmitBtn" runat="server" CssClass="btn btn-info" OnClick="submit_Click">
                            <i class="fa fa-save"></i>&nbsp;Save</asp:LinkButton>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
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
