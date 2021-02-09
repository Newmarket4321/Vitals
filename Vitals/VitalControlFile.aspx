<%@ Page Title="" Language="C#" MasterPageFile="~/Vitals.Master" AutoEventWireup="true" CodeBehind="VitalControlFile.aspx.cs" Inherits="Vitals.VitalControlFile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div align="center" style="width: 100%; height: 70%; padding: 15px 20px; margin-top: 50px;">
                    <div class="form-head form-group" style="background-color: #777; color: white; padding: 18px; width: 100%; border: none; text-align: center; outline: none; font-size: 15px;">
                        <h3>Vital Control File</h3>
                    </div>
                </div>
            </div>
            <div class="col-md-12">
                <div style="margin-top: -20px; width: 100%; border: thin; border-color: black; padding: 15px 20px; color: #005595; font-family: Arial; font-size: 16px;">
                    <asp:Label ID="lblMsg" runat="server" EnableViewState="False" ForeColor="Red"></asp:Label><br />
                    <div class="form-group row">
                        <div class="col-md-4">
                            <div class="form-group">
                                <asp:Label ID="Label1" runat="server" Text="Last Number for Death Inside Town:"></asp:Label>
                                <asp:TextBox ID="LastDeathInside" class="form-control" runat="server" placeholder="0"></asp:TextBox>

                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <asp:Label ID="Label2" runat="server" Text="Last Number for Death Outside Town:"></asp:Label>
                                <asp:TextBox ID="LastDeathOutside" class="form-control" runat="server" placeholder="0"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <asp:Label ID="Label3" runat="server" Text="Last Number for Still Births."></asp:Label>
                                <asp:TextBox ID="Lastbirths" class="form-control" runat="server" placeholder="0"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-md-4">
                            <div class="form-group">
                                <asp:Label ID="Label4" runat="server" Text="Last Number for Marriage:"></asp:Label>
                                <asp:TextBox ID="LastMarriage" class="form-control" runat="server" placeholder="0"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <asp:Label ID="Label5" runat="server" Text="Last Number for Birth Registration:"></asp:Label>
                                <asp:TextBox ID="LastBirthRegistration" class="form-control" runat="server" placeholder="0"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <asp:Label ID="Label6" runat="server" Text="Last Number for Incomplete Reg."></asp:Label>
                                <asp:TextBox ID="LastIncompleteReg" class="form-control" runat="server" placeholder="0"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <asp:Label ID="Label7" runat="server" Text="GL Number:"></asp:Label>
                                <asp:TextBox ID="GLNo" class="form-control" runat="server" placeholder="0"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <asp:Label ID="Label8" runat="server" Text="GL Account Number:"></asp:Label>
                                <asp:TextBox ID="GLActNo" class="form-control" runat="server" placeholder="0"></asp:TextBox>
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
                                    <%--<input type="text" class="form-control" aria-label="Amount (to the nearest dollar)">--%>
                                    <asp:TextBox ID="BurialPermitPrice" class="form-control" runat="server" placeholder="0.00"></asp:TextBox>
                                    <%--<div class="input-group-append">
                                        <span class="input-group-text">.00</span>
                                    </div>--%>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <asp:Label ID="Label10" runat="server" Text="Marriage Certificate Price:"></asp:Label>
                                <%-- <asp:TextBox ID="MarriageCertificatePrice" class="form-control" runat="server" 
                                    placeholder="Marriage Certificate Price" ></asp:TextBox>--%>
                                <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text">$</span>
                                    </div>
                                    <%--<input type="text" class="form-control" aria-label="Amount (to the nearest dollar)">--%>
                                    <asp:TextBox ID="MarriageCertificatePrice" class="form-control" runat="server"
                                        placeholder="0.00"></asp:TextBox>
                                    <%--<div class="input-group-append">
                                        <span class="input-group-text">.00</span>
                                    </div>--%>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <asp:Label ID="Label11" runat="server" Text="Name of Town/City:"></asp:Label>
                                <asp:TextBox ID="NameofTown" class="form-control" runat="server" placeholder="Name of Town/City"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-md-4">
                            <div class="form-group">
                                <asp:Label ID="Label12" runat="server" Text="Name of Region/County:"></asp:Label>
                                <asp:TextBox ID="NameofRegion" class="form-control" runat="server" placeholder="Name of Region/County"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <asp:Label ID="Label13" runat="server" Text="Register Number:"></asp:Label>
                                <asp:TextBox ID="RegisterNumber" class="form-control" runat="server" placeholder="Register Number"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <asp:Label ID="Label14" runat="server" Text="Application Title:"></asp:Label>
                                <asp:TextBox ID="ApplicationTitle" class="form-control" runat="server" placeholder="Application Title"></asp:TextBox>
                            </div>
                        </div>
                    </div>

                    <div class="form-group row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <asp:Label ID="Label15" runat="server" Text="Look up Province/State:"></asp:Label>
                                <asp:DropDownList ID="province" class="form-control" runat="server"></asp:DropDownList>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-md-6">
                            <div class="form-group" style="text-align: right">
                                <asp:Button runat="server" ID="submit" Text="Save" CssClass="btn btn-primary"
                                    OnClick="submit_Click" />

                            </div>
                        </div>
                    </div>
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
        if ($('#GLActNo').val() == '') {
            $('#GLActNo').css('border-color', 'red');
        }
        else {
            $('#GLActNo').css('border-color', '');
        }
        //function textchange() {
        //    if (document.getElementById('MarriageCertificatePrice').value == '$0.00') {
        //        alert("");
        //    }}
//            jQuery('#MarriageCertificatePrice').on('input', function () {
//                 alert("");
//    // do your stuff
//});

    </script>
</asp:Content>
