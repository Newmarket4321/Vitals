<%@ Page Title="" Language="C#" MasterPageFile="~/AdminLTE.Master" AutoEventWireup="true" CodeBehind="Vitals_Doctor_Form.aspx.cs" Inherits="Vitals.Vitals_Doctor_Form" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
    <link href="Style/jquery-ui.css" rel="stylesheet" />
    <script src="Scripts/jquery-3.6.0.js"></script>
    <script src="Scripts/jquery-ui.js"></script>
    <script>
        window.onload = function () {
            if (document.getElementById("<%=C_Shortname.ClientID%>").value == "")
                document.getElementById("<%=C_Shortname.ClientID%>").style.border = '1px solid red';
            else
                document.getElementById("<%=C_Shortname.ClientID%>").style.border = '1px solid #ced4da';

            if (document.getElementById("<%=C_Lname.ClientID%>").value == "")
                document.getElementById("<%=C_Lname.ClientID%>").style.border = '1px solid red';
            else
                document.getElementById("<%=C_Lname.ClientID%>").style.border = '1px solid #ced4da';

            if (document.getElementById("<%=C_FName.ClientID%>").value == "")
                document.getElementById("<%=C_FName.ClientID%>").style.border = '1px solid red';
            else
                document.getElementById("<%=C_FName.ClientID%>").style.border = '1px solid #ced4da';


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
        $(document).ready(function () {
            $(function () {
                $("#<%=C_Shortname.ClientID%>").change(function () {
                    if (document.getElementById("<%=C_Shortname.ClientID%>").value == "")
                        document.getElementById("<%=C_Shortname.ClientID%>").style.border = '1px solid red';
                    else
                        document.getElementById("<%=C_Shortname.ClientID%>").style.border = '1px solid #ced4da';
                });
            });
        });

        $(document).ready(function () {
            $(function () {
                $("#<%=C_FName.ClientID%>").change(function () {
                    if (document.getElementById("<%=C_FName.ClientID%>").value == "")
                        document.getElementById("<%=C_FName.ClientID%>").style.border = '1px solid red';
                    else
                        document.getElementById("<%=C_FName.ClientID%>").style.border = '1px solid #ced4da';
                });
            });
        });
        $(document).ready(function () {
            $(function () {
                $("#<%=C_Lname.ClientID%>").change(function () {
                    if (document.getElementById("<%=C_Lname.ClientID%>").value == "")
                        document.getElementById("<%=C_Lname.ClientID%>").style.border = '1px solid red';
                    else
                        document.getElementById("<%=C_Lname.ClientID%>").style.border = '1px solid #ced4da';
                });
            });
        });

        function currentclick() {
            window.location.href = "Vitals_Doctor_Form.aspx";
        }
        $(document).ready(function () {
            $(function () {
                $("#regdate").datepicker();
                $("#DBirth").datepicker();

            });
        });
    </script>
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1>Doctors</h1>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="#">File Maintenance</a></li>
                        <li class="breadcrumb-item active">Doctors</li>
                    </ol>
                </div>
            </div>
        </div>
        <!-- /.container-fluid -->
    </section>
    <div class="row">
        <div class="col-md-6">
            <div class="form-group row float-left" style="margin-left: 35px;">
                <div class="form-group">
                    <asp:LinkButton ID="Backbtn" runat="server" CssClass="btn btn-info" Style="background-color: gray; border-color: gray;"
                        Visible="false" OnClick="Backbtn_Click">
                            <i class="fa fa-arrow-left"></i>&nbsp;Back</asp:LinkButton>
                </div>
            </div>
        </div>
        <div class="col-md-6">
            <div class="form-group row float-right" style="margin-right: 35px">
                <div class="form-group">
                    <asp:LinkButton ID="EditBtn" runat="server" CssClass="btn btn-info " Visible="false" OnClick="EditBtn_Click"><%----%>
                            <i class="fa fa-edit"></i>&nbsp;Edit</asp:LinkButton>
                    <asp:LinkButton ID="CancelBtn" runat="server" CssClass="btn btn-danger" Visible="false" OnClick="CancelBtn_Click"><%----%>
                            <i class="fa fa-times"></i>&nbsp;Cancel</asp:LinkButton>
                </div>
            </div>
        </div>
    </div>
    <!-- Main content -->
    <section class="content">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <div class="container-fluid">
            <div class="row">

                <div class="col-md-12">
                    <div class="card">
                        <div id="dvTab" class="card card-primary card-outline card-outline-tabs">
                            <div class="card-header p-0 border-bottom-0">
                                <ul class="nav nav-tabs" role="tablist">
                                    <li class="nav-item" onclick="currentclick();">
                                        <a class="nav-link active " href="#tab1" aria-controls="tab1" role="tab"
                                            aria-selected="true" data-toggle="pill">Current</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link " href="#tab2" aria-controls="tab2" role="tab"
                                            aria-selected="false" data-toggle="pill">History</a>
                                    </li>
                                </ul>
                            </div>
                            <!-- /.card-header -->
                            <asp:Label ID="lblMsg" runat="server" EnableViewState="False" ForeColor="Red"></asp:Label>
                            <div class="card-body">
                                <div class="tab-content">
                                    <div id="tab1" class="tab-pane fade show active" role="tabpanel">
                                        <div style="border: thin; border-color: black; color: #005595; font-family: Arial; font-size: 16px;">
                                            <div class="card card-info">
                                                <div class="card-header">
                                                    <h3 class="card-title">Doctors</h3>
                                                </div>
                                                <div class="card-body">

                                                    <div class="form-group row">
                                                        <div class="col-md-4">
                                                            <div class="form-group">

                                                                <asp:Label ID="Label10" runat="server" Text="Dr Short Name:"></asp:Label>
                                                                <asp:TextBox ID="C_Shortname" class="form-control" MaxLength="6" runat="server" placeholder="Short Name"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-4">
                                                            <div class="form-group">
                                                                <asp:Label ID="Label11" runat="server" Text="First Name:"></asp:Label>
                                                                <asp:TextBox ID="C_FName" class="form-control" MaxLength="24" runat="server" placeholder="First Name"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-4">
                                                            <div class="form-group">
                                                                <asp:Label ID="Label12" runat="server" Text="Last Name:"></asp:Label>
                                                                <asp:TextBox ID="C_Lname" class="form-control" MaxLength="20" runat="server" placeholder="Last Name"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="form-group row">
                                                        <div class="col-md-2">
                                                            <div class="form-group">
                                                                <asp:Label ID="Label14" runat="server" Text="House No.:"></asp:Label>
                                                                <asp:TextBox ID="C_HouseNo" class="form-control" MaxLength="35" runat="server" placeholder="House Number"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-10">
                                                            <div class="form-group">
                                                                <asp:Label ID="Label19" runat="server" Text="Street Address:"></asp:Label>
                                                                <asp:TextBox ID="C_StrAdd" class="form-control" MaxLength="35" runat="server" placeholder="Street Address"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="form-group row">
                                                        <div class="col-md-4">
                                                            <div class="form-group">
                                                                <asp:Label ID="Label20" runat="server" Text="Unit No.:"></asp:Label>
                                                                <asp:TextBox ID="C_Unitnum" class="form-control" MaxLength="6" runat="server" placeholder="Unit No."></asp:TextBox>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-8">
                                                            <asp:Label ID="Label13" runat="server" Text="Attendant:"></asp:Label>
                                                            <div class="form-group">
                                                                <asp:RadioButton ID="C_Doctor" Text="Doctor" runat="server" GroupName="Attendant" CssClass="icheck-primary d-inline" />
                                                                <asp:RadioButton ID="C_Corner" Text="Coroner" runat="server" GroupName="Attendant" CssClass="icheck-primary d-inline" />
                                                                <asp:RadioButton ID="C_Other" Text="Other" runat="server" GroupName="Attendant" CssClass="icheck-primary d-inline" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="form-group row">
                                                        <div class="col-md-6">
                                                            <div class="form-group">
                                                                <asp:Label ID="Label21" runat="server" Text="City:"></asp:Label>
                                                                <asp:TextBox ID="C_City" class="form-control" MaxLength="25" runat="server" placeholder="City"> </asp:TextBox>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <div class="form-group">
                                                                <asp:Label ID="Label22" runat="server" Text="Province:"></asp:Label>
                                                                <asp:TextBox ID="C_Province" class="form-control" MaxLength="20" runat="server" placeholder="Province"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="form-group row">

                                                        <div class="col-md-6">
                                                            <div class="form-group">
                                                                <asp:Label ID="Label23" runat="server" Text="Postal Code:"></asp:Label>
                                                                <asp:TextBox ID="C_PinCode" class="form-control" MaxLength="7" runat="server" placeholder="Postal Code"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <div class="form-group">
                                                                <asp:Label ID="Label24" runat="server" Text="Country:"></asp:Label>
                                                                <asp:TextBox ID="C_Country" class="form-control" MaxLength="15" runat="server" placeholder="Country"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="tab-pane fade" id="tab2" role="tabpanel">
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div style="margin-top: -20px; width: 100%; border: thin; border-color: black; padding: 15px 5px; color: #005595; font-family: Arial; font-size: 16px;">

                                                    <div class="form-group row">
                                                        <div class="col-md-12">
                                                            <div class="input-group">
                                                                <asp:TextBox ID="SearchDoctors" class="form-control" runat="server" placeholder="Search here....."></asp:TextBox>
                                                                <div class="input-group-append">

                                                                    <asp:Button ID="SearchDoc" runat="server" Text="Search" Class="btn btn-primary" BackColor="Gray" BorderColor="Gray" OnClick="SearchDoc_Click" />
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="form-group row">
                                                        <div class="col-md-12">
                                                            <div class="form-group">
                                                                <div id="grid" style="display: block" runat="server">
                                                                    <asp:UpdatePanel runat="server" ID="updatedeaths">
                                                                        <ContentTemplate>
                                                                            <asp:GridView ID="GridView1" runat="server" BorderStyle="None" GridLines="Horizontal"
                                                                                BorderColor="LightGray" AutoGenerateColumns="false"
                                                                                AllowPaging="True" PageSize="5" AllowSorting="true" CellPadding="3"
                                                                                CellSpacing="2" OnRowCommand="GridView1_RowCommand" OnPageIndexChanging="GridView1_PageIndexChanging"
                                                                                DataSourceID="SearchDoctor" CssClass="table table-condensed table-hover" Style="font-family: arial;">
                                                                                <Columns>

                                                                                    <asp:BoundField DataField="D_Reg_DR_No" HeaderText="ID" />
                                                                                    <asp:TemplateField HeaderText="Dr.Short Name">
                                                                                        <ItemTemplate>
                                                                                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("D_Short_Name") %>'></asp:Label>
                                                                                        </ItemTemplate>
                                                                                    </asp:TemplateField>
                                                                                    <asp:TemplateField HeaderText="Doctor Name">
                                                                                        <ItemTemplate>
                                                                                            <asp:Label ID="Label3" runat="server" Text='<%# Eval("D_Reg_Last_Name") %>'></asp:Label>&nbsp;
                                                                                    <asp:Label ID="Label4" runat="server" Text='<%# Eval("D_Reg_First_Name") %>'></asp:Label>&nbsp;
                                                                                        </ItemTemplate>
                                                                                    </asp:TemplateField>
                                                                                    <asp:TemplateField HeaderText="Street Address">
                                                                                        <ItemTemplate>
                                                                                            <asp:Label ID="Label5" runat="server" Text='<%# Eval("D_Reg_St_Name") %>'></asp:Label>
                                                                                        </ItemTemplate>
                                                                                    </asp:TemplateField>

                                                                                    <asp:ButtonField ButtonType="Link" Text="<i aria-hidden='true' class='fa fa-eye'></i> View" CommandName="ViewDetails"
                                                                                        ControlStyle-CssClass="btn btn-info btn-sm" />
                                                                                    <asp:ButtonField ButtonType="Link" Text="<i aria-hidden='true' class='fa fa-edit'></i> Edit" CommandName="Edit"
                                                                                        ControlStyle-CssClass="btn btn-info btn-sm" />
                                                                                    <asp:ButtonField ButtonType="Link" Text="<i aria-hidden='true' class='fa fa-trash-alt'></i> Delete" CommandName="dlt"
                                                                                        ControlStyle-CssClass="btn btn-danger btn-sm" />

                                                                                </Columns>
                                                                                <PagerStyle CssClass="pagination-ys" />
                                                                                <PagerSettings Mode="NumericFirstLast" FirstPageText="First" LastPageText="Last"
                                                                                    NextPageText="Next" PreviousPageText="Previous" PageButtonCount="10" Position="Bottom" />
                                                                            </asp:GridView>
                                                                        </ContentTemplate>
                                                                    </asp:UpdatePanel>

                                                                    <asp:SqlDataSource ID="SearchDoctor"
                                                                        SelectCommand="SearchDoctors" SelectCommandType="StoredProcedure"
                                                                        ConnectionString="<%$ ConnectionStrings:Vitals%>"
                                                                        runat="server"><%--DeleteCommand="DeleteDoctors" DeleteCommandType="StoredProcedure"--%>
                                                                        <SelectParameters>
                                                                            <asp:ControlParameter ControlID="SearchDoctors" Name="Searchstr" PropertyName="Text" Type="String"
                                                                                ConvertEmptyStringToNull="true" />
                                                                        </SelectParameters>
                                                                        <%-- <DeleteParameters>
                                                                            <asp:Parameter Name="D_RegDRNo" />
                                                                        </DeleteParameters>--%>
                                                                    </asp:SqlDataSource>

                                                                </div>

                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div id="Section2" style="display: none" runat="server">
                                                        <div class="card card-info">
                                                            <div class="card-header">
                                                                <h3 class="card-title">Funeral Home</h3>
                                                            </div>
                                                            <div class="card-body">
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
                                                                    <div class="col-md-2">
                                                                        <div class="form-group">
                                                                            <asp:Label ID="Label7" runat="server" Text="House No.:"></asp:Label>
                                                                            <asp:TextBox ID="HouseNo" class="form-control" MaxLength="35" runat="server" placeholder="House Number"></asp:TextBox>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-md-10">
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
                                                                    <div class="col-md-8">
                                                                        <asp:Label ID="Label6" runat="server" Text="Attendant:"></asp:Label>
                                                                        <div class="form-group">
                                                                            <asp:RadioButton ID="Doctor" Text="Doctor" runat="server" GroupName="Attendant" CssClass="icheck-primary d-inline" />
                                                                            <asp:RadioButton ID="Corner" Text="Corner" runat="server" GroupName="Attendant" CssClass="icheck-primary d-inline" />
                                                                            <asp:RadioButton ID="Other" Text="Other" runat="server" GroupName="Attendant" CssClass="icheck-primary d-inline" />
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
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <asp:HiddenField ID="hfTab" runat="server" />
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
