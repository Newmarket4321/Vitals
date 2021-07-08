<%@ Page Title="" Language="C#" MasterPageFile="~/AdminLTE.Master" AutoEventWireup="true" CodeBehind="Vitals_Death_Form.aspx.cs" Inherits="Vitals.A_Test_AdminLTE" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <meta name="selected_nav_tab" content="Deaths" />
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
    <link href="Style/jquery-ui.css" rel="stylesheet" />
    <script src="Scripts/jquery-3.6.0.js"></script>
    <script src="Scripts/jquery-ui.js"></script>

    <script>

        window.onload = function () {

            var selectedTab = $("#<%=hfTab.ClientID%>");
            //  var str = window.location.href.slice(window.location.href.indexOf('?') + 1).split('&');
            if (document.getElementById("<%=Fname.ClientID%>").value == "")
                document.getElementById("<%=Fname.ClientID%>").style.border = '1px solid red';
            else
                document.getElementById("<%=Fname.ClientID%>").style.border = '1px solid #ced4da';

            if (document.getElementById("<%=DDeath.ClientID%>").value == "")
                document.getElementById("<%=DDeath.ClientID%>").style.border = '1px solid red';
            else
                document.getElementById("<%=DDeath.ClientID%>").style.border = '1px solid #ced4da';

            var tabId = selectedTab.val() != "" ? selectedTab.val() : "tab1";
            $('#dvTab a[href="#' + tabId + '"]').tab('show');
            $("#dvTab a").click(function () {
                selectedTab.val($(this).attr("href").substring(1));
                // alert($(this).attr("href").substring(1));
                document.getElementById("<%=hfTab.ClientID%>").val = $(this).attr("href").substring(1);
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
                $("#<%=Fname.ClientID%>").change(function () {
                    if (document.getElementById("<%=Fname.ClientID%>").value == "")
                        document.getElementById("<%=Fname.ClientID%>").style.border = '1px solid red';
                    else
                        document.getElementById("<%=Fname.ClientID%>").style.border = '1px solid #ced4da';
                });
            });
        });

        $(document).ready(function () {
            $(function () {
                $("#<%=DDeath.ClientID%>").change(function () {
                    if (document.getElementById("<%=DDeath.ClientID%>").value == "")
                        document.getElementById("<%=DDeath.ClientID%>").style.border = '1px solid red';
                    else
                        document.getElementById("<%=DDeath.ClientID%>").style.border = '1px solid #ced4da';
                });
            });
        });

        function currentclick() {
            window.location.href = "Vitals_Death_Form.aspx";
        }
        $(document).ready(function () {
            $('td').hover(function () {
                $('tr').each(function () {
                    $(this).removeClass('tdonhover');
                });
                $(this).parent().addClass('tdonhover');
            });
        });
        $(document).ready(function () {
            $(function () {
                $("#regdate").datepicker();
                $("#DDeath").datepicker();

            });
        });

        $(document).ready(function () {
            $(function () {
                $("#<%=Same.ClientID%>").click(function () {
                    if ($(this).is(':checked')) {
                        document.getElementById("<%=DHouseNo.ClientID%>").value = document.getElementById("<%=HouseNo.ClientID%>").value;
                        document.getElementById("<%=DStreet.ClientID%>").value = document.getElementById("<%=Street.ClientID%>").value;
                        document.getElementById("<%=DUnit.ClientID%>").value = document.getElementById("<%=Unit.ClientID%>").value;
                        document.getElementById("<%=DCity.ClientID%>").value = document.getElementById("<%=City.ClientID%>").value;
                        document.getElementById("<%=DProvince.ClientID%>").value = document.getElementById("<%=Province.ClientID%>").value;
                        document.getElementById("<%=DCountry.ClientID%>").value = document.getElementById("<%=Country.ClientID%>").value;
                        document.getElementById("<%=DPostalcode.ClientID%>").value = document.getElementById("<%=Postalcode.ClientID%>").value;
                    }
                    else {
                        document.getElementById("<%=DHouseNo.ClientID%>").value = "";
                        document.getElementById("<%=DStreet.ClientID%>").value = "";
                        document.getElementById("<%=DUnit.ClientID%>").value = "";
                        document.getElementById("<%=DCity.ClientID%>").value = "";
                        document.getElementById("<%=DProvince.ClientID%>").value = "";
                        document.getElementById("<%=DCountry.ClientID%>").value = "";
                        document.getElementById("<%=DPostalcode.ClientID%>").value = "";
                    }
                });

            });
        });
        //jQuery(document).ready(function () {
        //    $("#Gridview1").tablesorter({ debug: false, widgets: ['zebra'], sortList: [[0, 0]] });
        //});
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
                    <h1>Vital Statistics (Deaths)</h1>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="#">Main Menu</a></li>
                        <li class="breadcrumb-item active">Deaths</li>
                    </ol>
                </div>
            </div>
        </div>
        <!-- /.container-fluid -->
    </section>
    <div class="row">
        <div class="col-md-12">
            <div class="form-group row float-right" style="margin-right: 35px">
                <div class="form-group">
                    <asp:LinkButton ID="EditBtn" runat="server" CssClass="btn btn-info" Visible="false" OnClick="EditBtn_Click">
                            <i class="fa fa-edit"></i>&nbsp;Edit</asp:LinkButton>
                    <asp:LinkButton ID="CancelBtn" runat="server" CssClass="btn btn-danger" Visible="false" OnClick="CancelBtn_Click">
                            <i class="fa fa-times"></i>&nbsp;Cancel</asp:LinkButton>
                    <asp:LinkButton ID="AddDoc" runat="server" CssClass="btn btn-info" OnClick="AddDoc_Click">
                            <i class="fa fa-plus"></i>&nbsp;Add A Doctor</asp:LinkButton>

                    <asp:LinkButton ID="AddFun" runat="server" CssClass="btn btn-info" OnClick="AddFun_Click">
                            <i class="fa fa-plus"></i>&nbsp;Add A Funeral Home</asp:LinkButton>
                </div>
            </div>
        </div>
    </div>
    <!-- Main content -->
    <section class="content">

        <asp:ScriptManager ID="ScriptManager2" runat="server"></asp:ScriptManager>
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
                                            aria-selected="false" data-toggle="pill">Death Inquiry</a>
                                    </li>
                                </ul>
                            </div>
                            <!-- /.card-header -->
                            <asp:Label ID="lblMsg" runat="server" EnableViewState="False" ForeColor="Red"></asp:Label>

                            <div class="card-body">
                                <div class="tab-content">
                                    <div id="tab1" class="tab-pane fade show active" role="tabpanel">
                                        <div style="border: thin; border-color: black; color: #005595; font-family: Arial; font-size: 16px;">
                                            <div class="form-group row">
                                                <div class="col-md-6">
                                                    <asp:Label ID="Label1" runat="server" Text="Registration No.:"></asp:Label>
                                                    <div class="input-group">
                                                        <asp:TextBox ID="RegYear" class="form-control" runat="server" ReadOnly="true"></asp:TextBox>
                                                        <asp:TextBox ID="RegType" class="form-control" runat="server" MaxLength="1"></asp:TextBox>
                                                        <asp:TextBox ID="RegNo" class="form-control" runat="server" placeholder="0" MaxLength="18" onkeypress="javascript:return isNumber(event)"></asp:TextBox>

                                                    </div>
                                                </div>
                                                <div class="col-md-2">
                                                    <div class="form-group">
                                                        <asp:Label ID="Label2" runat="server" Text="Billable:"></asp:Label>
                                                        &nbsp;
                                                        <asp:DropDownList ID="Billable" runat="server" class="form-control select2">

                                                            <asp:ListItem Text="Yes" Value="Y"></asp:ListItem>
                                                            <asp:ListItem Text="No" Value="N"></asp:ListItem>
                                                        </asp:DropDownList>
                                                    </div>
                                                </div>
                                                <div class="col-md-4">
                                                    <div class="form-group">
                                                        <asp:Label ID="Label3" runat="server" Text="Reg Date:"></asp:Label>
                                                        <div class='form-group'>
                                                            <asp:TextBox ID="regdate" class="form-control" ClientIDMode="Static" ReadOnly="true" runat="server" placeholder="MM/DD/YYY">
                                             
                                                            </asp:TextBox>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="card card-info">
                                                <div class="card-header">
                                                    <h3 class="card-title">Deceased Information</h3>
                                                    <%--<asp:Label ID="Label4" runat="server" Text="Deceased Information" ForeColor="Black"></asp:Label>--%>
                                                </div>
                                                <div class="card-body">
                                                    <div class="content">
                                                        <div class="form-group row">
                                                            <div class="col-md-4">
                                                                <div class="form-group">
                                                                    <asp:Label ID="Label5" runat="server" Text="First Name:"></asp:Label>
                                                                    <asp:TextBox ID="Fname" runat="server" class="form-control"
                                                                        placeholder="First Name" MaxLength="24"></asp:TextBox>


                                                                </div>
                                                            </div>
                                                            <div class="col-md-4">
                                                                <div class="form-group">
                                                                    <asp:Label ID="Label6" runat="server" Text="Middle Name:"></asp:Label>
                                                                    <asp:TextBox ID="Mname" runat="server" class="form-control"
                                                                        placeholder="Middle Name" MaxLength="20"></asp:TextBox>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-4">
                                                                <div class="form-group">
                                                                    <asp:Label ID="Label7" runat="server" Text="Last Name:"></asp:Label>
                                                                    <asp:TextBox ID="Lname" runat="server" class="form-control" placeholder="Last Name" MaxLength="30"></asp:TextBox>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="form-group row">
                                                            <div class="col-md-4">
                                                                <div class="form-group">
                                                                    <asp:Label ID="Label8" runat="server" Text="Sex"></asp:Label>
                                                                    &nbsp;
                                                                    <asp:DropDownList ID="sex" runat="server" class="form-control">
                                                                        <asp:ListItem runat="server" Value="M">Male</asp:ListItem>
                                                                        <asp:ListItem runat="server" Valu="F">Female</asp:ListItem>
                                                                    </asp:DropDownList>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-4">
                                                                <div class="form-group">
                                                                    <asp:Label ID="Label9" runat="server" Text="Date of Death:"></asp:Label>
                                                                    <div class="input-group">
                                                                        <asp:TextBox ID="DDeath" class="form-control" ClientIDMode="Static" runat="server" placeholder="MM/DD/YYY"></asp:TextBox>

                                                                        <div class="input-group-prepend">
                                                                            <span class="input-group-text"><i class="fa fa-calendar"></i></span>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-4">
                                                                <div class="form-group">
                                                                    <asp:Label ID="Label10" runat="server" Text="Municipality:"></asp:Label>
                                                                    <asp:TextBox ID="Municipality" class="form-control" runat="server" MaxLength="25"></asp:TextBox>

                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="form-group row">
                                                            <div class="col-md-4">
                                                                <div class="form-group">
                                                                    <asp:Label ID="Label11" runat="server" Text="Place of Death:"></asp:Label>
                                                                    <asp:TextBox ID="PlaceDeath" class="form-control" runat="server" MaxLength="50"></asp:TextBox>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <br />
                                            <div class="card card-info">
                                                <div class="card-header">
                                                    <h3 class="card-title">Address of Place of Death</h3>
                                                    <%--<asp:Label ID="Label13" runat="server" Text="Address of Place of Death" ForeColor="Black"></asp:Label>--%>
                                                </div>
                                                <div class="card-body">
                                                    <div class="content">
                                                        <div class="form-group row">
                                                            <div class="col-md-2">
                                                                <div class="form-group">
                                                                    <asp:Label ID="Label68" runat="server" Text="House No.:"></asp:Label>
                                                                    <asp:TextBox ID="HouseNo" class="form-control" MaxLength="7" runat="server" placeholder="House Number"></asp:TextBox>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-8">
                                                                <div class="form-group">
                                                                    <asp:Label ID="Label14" runat="server" Text="Street:"></asp:Label>
                                                                    <asp:TextBox ID="Street" class="form-control" runat="server" MaxLength="35"></asp:TextBox>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-2">
                                                                <div class="form-group">
                                                                    <asp:Label ID="Label15" runat="server" Text="Form 17 Req?:"></asp:Label>
                                                                    <%--<asp:TextBox ID="Form17" class="form-control" runat="server"></asp:TextBox>--%>
                                                                                            &nbsp;
                                                                    <asp:DropDownList ID="printed" runat="server" class="form-control" AutoPostBack="true">
                                                                        <asp:ListItem Text="No" Value="N"></asp:ListItem>
                                                                        <asp:ListItem Text="Yes" Value="Y"></asp:ListItem>
                                                                    </asp:DropDownList>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="form-group row">
                                                            <div class="col-md-4">
                                                                <div class="form-group">
                                                                    <asp:Label ID="Label16" runat="server" Text="Unit/Apt:"></asp:Label>
                                                                    <asp:TextBox ID="Unit" class="form-control" runat="server" MaxLength="6"></asp:TextBox>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-4">
                                                                <div class="form-group">
                                                                    <asp:Label ID="Label17" runat="server" Text="City:"></asp:Label>
                                                                    <asp:TextBox ID="City" class="form-control" runat="server" MaxLength="25"></asp:TextBox>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-4">
                                                                <div class="form-group">
                                                                    <asp:Label ID="Label18" runat="server" Text="Province:"></asp:Label>
                                                                    <asp:TextBox ID="Province" class="form-control" runat="server" MaxLength="20"></asp:TextBox>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="form-group row">
                                                            <div class="col-md-4">
                                                                <div class="form-group">
                                                                    <asp:Label ID="Label19" runat="server" Text="Country:"></asp:Label>
                                                                    <asp:TextBox ID="Country" class="form-control" runat="server" MaxLength="15"></asp:TextBox>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-4">
                                                                <div class="form-group">
                                                                    <asp:Label ID="Label20" runat="server" Text="Postal Code:"></asp:Label>
                                                                    <asp:TextBox ID="Postalcode" class="form-control" runat="server" MaxLength="7"></asp:TextBox>
                                                                </div>
                                                            </div>
                                                        </div>


                                                        <div class="form-group row">
                                                            <div class="col-md-12">
                                                                <div class="form-group">
                                                                    <asp:Label ID="Label21" runat="server" Text="Funeral Home Code:"></asp:Label>
                                                                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                                                        <ContentTemplate>
                                                                            <!-- all other content goes here -->
                                                                            <asp:HiddenField runat="server" ID="FuneralCode" />
                                                                            <asp:TextBox ID="SearcFuneralHome" runat="server" class="form-control" Width="20%"
                                                                                AutoPostBack="true" OnTextChanged="SearchEvent" OnPreRender="SearchEvent" />
                                                                            <asp:Panel runat="server" ID="FuneralDropDown"
                                                                                Style="max-height: 150px; max-width: 45%; overflow: scroll; display: none; visibility: hidden;">
                                                                                <!-- GridView  goes here -->
                                                                                <asp:GridView ID="FuneralGridView" runat="server" Font-Size="Small"
                                                                                    AutoGenerateColumns="false" OnRowDataBound="FuneralGridView_RowDataBound"
                                                                                    OnSelectedIndexChanged="FuneralGridView_SelectedIndexChanged" AutoGenerateSelectButton="True">
                                                                                    <Columns>
                                                                                        <asp:BoundField DataField="F_Reg_Customer_Cnt" />
                                                                                        <asp:TemplateField>
                                                                                            <ItemTemplate>
                                                                                                <asp:Label ID="L1" runat="server" Text='<%# Eval("F_Reg_Short_Name") %>' />
                                                                                            </ItemTemplate>
                                                                                        </asp:TemplateField>
                                                                                        <asp:TemplateField>
                                                                                            <ItemTemplate>
                                                                                                <asp:Label ID="L2" runat="server" Text='<%# Eval("F_Reg_Funeral_Home")%>' />
                                                                                            </ItemTemplate>
                                                                                        </asp:TemplateField>
                                                                                        <asp:TemplateField>
                                                                                            <ItemTemplate>
                                                                                                <asp:Label ID="L3" runat="server" Text='<%# Eval("F_Reg_House_No") + " "+ Eval("F_Reg_St_Name") %>' />
                                                                                            </ItemTemplate>
                                                                                        </asp:TemplateField>
                                                                                        <asp:TemplateField>
                                                                                            <ItemTemplate>
                                                                                                <asp:HiddenField runat="server" ID="Funit" Value='<%# Eval("F_Reg_Unit") %>' />
                                                                                                <asp:Label ID="L4" runat="server" Text='<%# Eval("F_Reg_Unit") %>' />
                                                                                            </ItemTemplate>
                                                                                        </asp:TemplateField>
                                                                                        <asp:TemplateField>
                                                                                            <ItemTemplate>
                                                                                                <asp:Label ID="L5" runat="server" Text='<%# Eval("F_Reg_City")  + ", "+ Eval("F_Reg_Prov")+ " "+ Eval("F_Reg_PC") %>' />
                                                                                            </ItemTemplate>
                                                                                        </asp:TemplateField>
                                                                                    </Columns>
                                                                                    <HeaderStyle BackColor="Blue" ForeColor="White" />
                                                                                    <RowStyle ForeColor="#603813" BackColor="#F7F6F3" />
                                                                                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                                                                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                                                                    <HeaderStyle BackColor="#A86E07" Font-Bold="True" ForeColor="White" HorizontalAlign="Left" />
                                                                                    <EditRowStyle BackColor="#999999" />
                                                                                    <AlternatingRowStyle BackColor="White" />

                                                                                </asp:GridView>
                                                                            </asp:Panel>
                                                                            <ajaxToolkit:DropDownExtender ID="DropDownExtender1" runat="server"
                                                                                DropDownControlID="FuneralDropDown"
                                                                                TargetControlID="SearcFuneralHome" />
                                                                            <br />
                                                                            <div class="form-group row">
                                                                                <div class="col-md-4">
                                                                                    <div class="form-group">
                                                                                        <asp:TextBox ID="F_Name" runat="server" class="form-control"></asp:TextBox>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="col-md-2">
                                                                                    <div class="form-group">
                                                                                        <asp:TextBox ID="F_Street" runat="server" class="form-control"></asp:TextBox>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="col-md-2">
                                                                                    <div class="form-group">
                                                                                        <asp:TextBox ID="F_Unit" runat="server" class="form-control"></asp:TextBox>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="col-md-4">
                                                                                    <div class="form-group">
                                                                                        <asp:TextBox ID="F_CityProv" runat="server" class="form-control"></asp:TextBox>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </ContentTemplate>

                                                                    </asp:UpdatePanel>

                                                                </div>
                                                            </div>

                                                        </div>
                                                        <div class="form-group row">
                                                            <div class="col-md-12">
                                                                <div class="form-group">
                                                                    <asp:Label ID="Label22" runat="server" Text="Doctor:"></asp:Label>
                                                                    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                                                        <ContentTemplate>
                                                                            <!-- all other content goes here -->
                                                                            <asp:HiddenField runat="server" ID="DoctorCode" />
                                                                            <asp:TextBox ID="SearchDoctor" runat="server" class="form-control" Width="20%"
                                                                                AutoPostBack="true" OnTextChanged="SearchDoctor_PreRender" OnPreRender="SearchDoctor_PreRender" />
                                                                            <asp:Panel runat="server" ID="DoctorDropdown"
                                                                                Style="max-height: 150px; max-width: 40%; overflow: scroll; display: none; visibility: hidden;">
                                                                                <!-- GridView  goes here -->
                                                                                <asp:GridView ID="DoctorGrid" runat="server" Font-Size="Small" AutoGenerateSelectButton="True" AutoGenerateColumns="false"
                                                                                    OnRowDataBound="SearchDoctorGrid_RowDataBound" OnSelectedIndexChanged="SearchDoctorGrid_SelectedIndexChanged">

                                                                                    <Columns>
                                                                                        <asp:BoundField DataField="D_Reg_DR_No" />
                                                                                        <asp:TemplateField>
                                                                                            <ItemTemplate>
                                                                                                <asp:Label ID="L6" runat="server" Text='<%# Eval("D_Short_Name") %>' />
                                                                                            </ItemTemplate>
                                                                                        </asp:TemplateField>
                                                                                        <asp:TemplateField >
                                                                                            <ItemTemplate>
                                                                                                <asp:Label ID="L7" runat="server" Text='<%# Eval("D_Reg_Last_Name") + ", "+ Eval("D_Reg_First_Name") %>' />
                                                                                            </ItemTemplate>
                                                                                        </asp:TemplateField>
                                                                                        <asp:TemplateField >
                                                                                            <ItemTemplate>
                                                                                                <asp:Label ID="L8" runat="server" Text='<%# Eval("D_Reg_House_No") + " "+ Eval("D_Reg_St_Name") %>' />
                                                                                            </ItemTemplate>
                                                                                        </asp:TemplateField>
                                                                                        <asp:TemplateField >
                                                                                            <ItemTemplate>
                                                                                                <asp:Label ID="L9" runat="server" Text='<%# Eval("D_Reg_Unit") %>' />
                                                                                            </ItemTemplate>
                                                                                        </asp:TemplateField>
                                                                                        <asp:TemplateField >
                                                                                            <ItemTemplate>
                                                                                                <asp:Label ID="L10" runat="server" Text='<%# Eval("D_Reg_City")  + ", "+ Eval("D_Reg_Prov")+ " "+ Eval("D_Reg_PC") %>' />
                                                                                            </ItemTemplate>
                                                                                        </asp:TemplateField>
                                                                                    </Columns>
                                                                                    <HeaderStyle BackColor="Blue" ForeColor="White" />
                                                                                    <RowStyle ForeColor="#603813" BackColor="#F7F6F3" />
                                                                                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                                                                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                                                                    <HeaderStyle BackColor="#A86E07" Font-Bold="True" ForeColor="White" HorizontalAlign="Left" />
                                                                                    <EditRowStyle BackColor="#999999" />
                                                                                    <AlternatingRowStyle BackColor="White" />

                                                                                </asp:GridView>
                                                                            </asp:Panel>
                                                                            <ajaxToolkit:DropDownExtender ID="DropDownExtender2" runat="server"
                                                                                DropDownControlID="DoctorDropdown"
                                                                                TargetControlID="SearchDoctor" />
                                                                            <br />
                                                                            <div class="form-group row">
                                                                                <div class="col-md-4">
                                                                                    <div class="form-group">
                                                                                        <asp:TextBox ID="D_Name" runat="server" class="form-control"></asp:TextBox>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="col-md-2">
                                                                                    <div class="form-group">
                                                                                        <asp:TextBox ID="D_Street" runat="server" class="form-control"></asp:TextBox>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="col-md-2">
                                                                                    <div class="form-group">
                                                                                        <asp:TextBox ID="D_Unit" runat="server" class="form-control"></asp:TextBox>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="col-md-4">
                                                                                    <div class="form-group">
                                                                                        <asp:TextBox ID="D_CityProv" runat="server" class="form-control"></asp:TextBox>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </ContentTemplate>

                                                                    </asp:UpdatePanel>
                                                                </div>
                                                            </div>

                                                        </div>

                                                    </div>
                                                </div>
                                            </div>
                                            <br />
                                            <div class="card card-info">
                                                <div class="card-header">
                                                    <h3 class="card-title">Address of Place of Death</h3>
                                                </div>
                                                <div class="card-body">
                                                    <div class="content">
                                                        <div class="form-group row">
                                                            <div class="col-md-4">
                                                                <div class="form-group">
                                                                    <asp:CheckBox ID="Same" runat="server" class="icheck-primary d-inline" Text="Address Same" />
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="form-group row">
                                                            <div class="col-md-2">
                                                                <div class="form-group">
                                                                    <asp:Label ID="Label43" runat="server" Text="House No.:"></asp:Label>
                                                                    <asp:TextBox ID="DHouseNo" class="form-control" runat="server" MaxLength="7" placeholder="House Number"></asp:TextBox>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <div class="form-group">
                                                                    <asp:Label ID="Label69" runat="server" Text="Street:"></asp:Label>
                                                                    <asp:TextBox ID="DStreet" class="form-control" runat="server" MaxLength="35"></asp:TextBox>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-4">
                                                                <div class="form-group">
                                                                    <asp:Label ID="Label71" runat="server" Text="Unit/Apt:"></asp:Label>
                                                                    <asp:TextBox ID="DUnit" class="form-control" runat="server" MaxLength="6"></asp:TextBox>
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <div class="form-group row">
                                                            <div class="col-md-4">
                                                                <div class="form-group">
                                                                    <asp:Label ID="Label72" runat="server" Text="City:"></asp:Label>
                                                                    <asp:TextBox ID="DCity" class="form-control" runat="server" MaxLength="25"></asp:TextBox>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-4">
                                                                <div class="form-group">
                                                                    <asp:Label ID="Label73" runat="server" Text="Province:"></asp:Label>
                                                                    <asp:TextBox ID="DProvince" class="form-control" runat="server" MaxLength="20"></asp:TextBox>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="form-group row">
                                                            <div class="col-md-4">
                                                                <div class="form-group">
                                                                    <asp:Label ID="Label74" runat="server" Text="Country:"></asp:Label>
                                                                    <asp:TextBox ID="DCountry" class="form-control" runat="server" MaxLength="15"></asp:TextBox>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-4">
                                                                <div class="form-group">
                                                                    <asp:Label ID="Label75" runat="server" Text="Postal Code:"></asp:Label>
                                                                    <asp:TextBox ID="DPostalcode" class="form-control" runat="server" MaxLength="7"></asp:TextBox>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="tab-pane fade" id="tab2" role="tabpanel">
                                        <div class="row" style="margin-bottom: 25px;">
                                            <div class="col-md-12">
                                                <div style="width: 100%; border: thin; border-color: black; color: #005595; font-family: Arial; font-size: 16px;">
                                                    <div class="form-group row">
                                                        <div class="col-md-12">
                                                            <div class="input-group">
                                                                <asp:TextBox ID="SearchDeath" class="form-control" runat="server" placeholder="Search here....."></asp:TextBox>

                                                                <div class="input-group-append">

                                                                    <asp:Button ID="Search_Death" runat="server" Text="Search" Class="btn btn-primary" BackColor="Gray"
                                                                        BorderColor="Gray" OnClick="Search_Death_Click" />
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
                                                                                BorderColor="LightGray" AutoGenerateColumns="false" AllowPaging="True" PageSize="5" AllowSorting="true"
                                                                                OnPageIndexChanging="GridView1_PageIndexChanging" CellPadding="3" CellSpacing="2" Width="100%" OnRowCommand="GridView1_RowCommand"
                                                                                DataSourceID="SearcDeaths" CssClass="table table-condensed table-hover" Style="font-size: 12pt; font-family: arial; overflow: scroll">
                                                                                <Columns>
                                                                                    <asp:BoundField DataField="D_Reg_No" HeaderText="ID" />
                                                                                    <asp:BoundField DataField="D_Reg_Year" HeaderText="Year" />
                                                                                    <asp:BoundField DataField="D_Reg_type" HeaderText="Type" />
                                                                                    <asp:TemplateField HeaderText=" First Name">
                                                                                        <ItemTemplate>
                                                                                            <asp:Label ID="D_Reg_First_Name" runat="server" Text='<%# Eval("D_Reg_First_Name") %>'></asp:Label>
                                                                                        </ItemTemplate>
                                                                                    </asp:TemplateField>
                                                                                    <asp:TemplateField HeaderText="Last Name">
                                                                                        <ItemTemplate>
                                                                                            <asp:Label ID="D_Reg_Last_Name" runat="server" Text='<%# Eval("D_Reg_Last_Name") %>'></asp:Label>
                                                                                        </ItemTemplate>
                                                                                    </asp:TemplateField>
                                                                                    <asp:TemplateField HeaderText="Reg Date">
                                                                                        <ItemTemplate>
                                                                                            <asp:Label ID="D_Reg_Date" runat="server" Text='<%# Eval("D_Reg_Date") %>'></asp:Label>
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
                                                                </div>
                                                                <asp:SqlDataSource ID="SearcDeaths"
                                                                    SelectCommand="SearchDeath" SelectCommandType="StoredProcedure"
                                                                    ConnectionString="<%$ ConnectionStrings:Vitals%>"
                                                                    runat="server">
                                                                    <SelectParameters>
                                                                        <asp:ControlParameter ControlID="SearchDeath" Name="Searchstr" PropertyName="Text" Type="String"
                                                                            ConvertEmptyStringToNull="true" />
                                                                    </SelectParameters>
                                                                </asp:SqlDataSource>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="form-group row">
                                                        <div class="col-md-12">
                                                            <div class="form-group">
                                                                <div id="Section2" style="display: none" runat="server">
                                                                    <div class="row">
                                                                        <div class="col-md-12">
                                                                            <asp:Label ID="Label44" runat="server" EnableViewState="False" ForeColor="Red"></asp:Label><br />

                                                                            <div class="form-group row">
                                                                                <div class="col-12 col-sm-6">
                                                                                    <asp:Label ID="Label45" runat="server" Text="Registration No.:"></asp:Label>
                                                                                    <div class="input-group">
                                                                                        <asp:TextBox ID="H_RegYear" class="form-control" runat="server" ReadOnly="true"></asp:TextBox>
                                                                                        <asp:TextBox ID="H_RegType" class="form-control" runat="server" MaxLength="1"></asp:TextBox>
                                                                                        <asp:TextBox ID="H_RegNo" class="form-control" runat="server" placeholder="0" onkeypress="javascript:return isNumber(event)" MaxLength="18"></asp:TextBox>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="col-12 col-sm-2">
                                                                                    <div class="form-group">
                                                                                        <asp:Label ID="Label46" runat="server" Text="Billable:"></asp:Label>
                                                                                        &nbsp;
                                                                                        <asp:DropDownList ID="H_Billable" runat="server" class="form-control select2" AutoPostBack="true">

                                                                                            <asp:ListItem Text="Yes" Value="Y"></asp:ListItem>
                                                                                            <asp:ListItem Text="No" Value="N"></asp:ListItem>
                                                                                        </asp:DropDownList>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="col-12 col-sm-4">
                                                                                    <div class="form-group">
                                                                                        <asp:Label ID="Label47" runat="server" Text="Reg Date:"></asp:Label>
                                                                                        <div class='form-group'>
                                                                                            <asp:TextBox ID="H_RegDate" class="form-control" ClientIDMode="Static" ReadOnly="true" runat="server"
                                                                                                placeholder="MM/DD/YYY">
                                             
                                                                                            </asp:TextBox>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="card card-info">
                                                                                <div class="card-header">
                                                                                    <h3 class="card-title">Deceased Information</h3>
                                                                                </div>
                                                                                <div class="card-body">
                                                                                    <div class="content">
                                                                                        <div class="form-group row">
                                                                                            <div class="col-md-4">
                                                                                                <div class="form-group">
                                                                                                    <asp:Label ID="Label49" runat="server" Text="First Name:"></asp:Label>
                                                                                                    <asp:TextBox ID="H_Fname" runat="server" class="form-control" placeholder="First Name" MaxLength="24"></asp:TextBox>
                                                                                                </div>
                                                                                            </div>
                                                                                            <div class="col-md-4">
                                                                                                <div class="form-group">
                                                                                                    <asp:Label ID="Label50" runat="server" Text="Middle Name:"></asp:Label>
                                                                                                    <asp:TextBox ID="H_Mname" runat="server" class="form-control" placeholder="Middle Name" MaxLength="30"></asp:TextBox>
                                                                                                </div>
                                                                                            </div>
                                                                                            <div class="col-md-4">
                                                                                                <div class="form-group">
                                                                                                    <asp:Label ID="Label51" runat="server" Text="Last Name:"></asp:Label>
                                                                                                    <asp:TextBox ID="H_Lname" runat="server" class="form-control" placeholder="Last Name" MaxLength="20"></asp:TextBox>
                                                                                                </div>
                                                                                            </div>
                                                                                        </div>
                                                                                        <div class="form-group row">
                                                                                            <div class="col-md-4">
                                                                                                <div class="form-group">
                                                                                                    <asp:Label ID="Label52" runat="server" Text="Sex"></asp:Label>
                                                                                                    &nbsp;
                                                                                                    <asp:DropDownList ID="H_RegSex" runat="server" class="form-control" AutoPostBack="true">
                                                                                                        <asp:ListItem runat="server" Value="M">Male</asp:ListItem>
                                                                                                        <asp:ListItem runat="server" Valu="F">Female</asp:ListItem>
                                                                                                    </asp:DropDownList>
                                                                                                </div>
                                                                                            </div>
                                                                                            <div class="col-md-4">
                                                                                                <div class="form-group">
                                                                                                    <asp:Label ID="Label53" runat="server" Text="Date of Death:"></asp:Label>
                                                                                                    <div class="input-group">
                                                                                                        <asp:TextBox ID="H_DDeath" class="form-control" ClientIDMode="Static" runat="server"
                                                                                                            placeholder="MM/DD/YYY"></asp:TextBox>

                                                                                                        <div class="input-group-prepend">
                                                                                                            <span class="input-group-text"><i class="fa fa-calendar"></i></span>
                                                                                                        </div>
                                                                                                    </div>
                                                                                                </div>
                                                                                            </div>
                                                                                            <div class="col-md-4">
                                                                                                <div class="form-group">
                                                                                                    <asp:Label ID="Label54" runat="server" Text="Municipality:"></asp:Label>
                                                                                                    <asp:TextBox ID="H_Municipality" class="form-control" runat="server" MaxLength="25"></asp:TextBox>
                                                                                                </div>
                                                                                            </div>
                                                                                        </div>
                                                                                        <div class="form-group row">
                                                                                            <div class="col-md-8">
                                                                                                <div class="form-group">
                                                                                                    <asp:Label ID="Label55" runat="server" Text="Place of Death:"></asp:Label>
                                                                                                    <asp:TextBox ID="H_PlaceDeath" class="form-control" runat="server" MaxLength="50"></asp:TextBox>
                                                                                                </div>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <br />
                                                                            <div class="card card-info">
                                                                                <div class="card-header">
                                                                                    <h3 class="card-title">Address of Place of Death</h3>
                                                                                </div>
                                                                                <div class="card-body">
                                                                                    <div class="content">
                                                                                        <div class="form-group row">
                                                                                            <div class="col-md-2">
                                                                                                <div class="form-group">
                                                                                                    <asp:Label ID="Label58" runat="server" Text="House No.:"></asp:Label>
                                                                                                    <asp:TextBox ID="H_HouseNo" class="form-control" runat="server" MaxLength="7" placeholder="House Number"></asp:TextBox>
                                                                                                </div>
                                                                                            </div>
                                                                                            <div class="col-md-8">
                                                                                                <div class="form-group">
                                                                                                    <asp:Label ID="Label59" runat="server" Text="Street:"></asp:Label>
                                                                                                    <asp:TextBox ID="H_Street" class="form-control" runat="server" MaxLength="35"></asp:TextBox>
                                                                                                </div>
                                                                                            </div>
                                                                                            <div class="col-md-2">
                                                                                                <div class="form-group">
                                                                                                    <asp:Label ID="Label60" runat="server" Text="Form 17 Req?:"></asp:Label>
                                                                                                    &nbsp;
                                                                                                        <asp:DropDownList ID="H_Printed" runat="server" class="form-control" AutoPostBack="true">
                                                                                                            <asp:ListItem Text="No" Value="N"></asp:ListItem>
                                                                                                            <asp:ListItem Text="Yes" Value="Y"></asp:ListItem>
                                                                                                        </asp:DropDownList>
                                                                                                </div>
                                                                                            </div>
                                                                                        </div>
                                                                                        <div class="form-group row">
                                                                                            <div class="col-md-4">
                                                                                                <div class="form-group">
                                                                                                    <asp:Label ID="Label61" runat="server" Text="Unit/Apt:"></asp:Label>
                                                                                                    <asp:TextBox ID="H_Unit" class="form-control" runat="server" MaxLength="6"></asp:TextBox>
                                                                                                </div>
                                                                                            </div>
                                                                                            <div class="col-md-4">
                                                                                                <div class="form-group">
                                                                                                    <asp:Label ID="Label62" runat="server" Text="City:"></asp:Label>
                                                                                                    <asp:TextBox ID="H_City" class="form-control" runat="server" MaxLength="25"></asp:TextBox>
                                                                                                </div>
                                                                                            </div>
                                                                                            <div class="col-md-4">
                                                                                                <div class="form-group">
                                                                                                    <asp:Label ID="Label63" runat="server" Text="Province:"></asp:Label>
                                                                                                    <asp:TextBox ID="H_Province" class="form-control" runat="server" MaxLength="20"></asp:TextBox>
                                                                                                </div>
                                                                                            </div>
                                                                                        </div>
                                                                                        <div class="form-group row">
                                                                                            <div class="col-md-4">
                                                                                                <div class="form-group">
                                                                                                    <asp:Label ID="Label64" runat="server" Text="Country:"></asp:Label>
                                                                                                    <asp:TextBox ID="H_Country" class="form-control" runat="server" MaxLength="15"></asp:TextBox>
                                                                                                </div>
                                                                                            </div>
                                                                                            <div class="col-md-4">
                                                                                                <div class="form-group">
                                                                                                    <asp:Label ID="Label65" runat="server" Text="Postal Code:"></asp:Label>
                                                                                                    <asp:TextBox ID="H_PostalCode" class="form-control" runat="server" MaxLength="7"></asp:TextBox>
                                                                                                </div>
                                                                                            </div>
                                                                                        </div>

                                                                                        <div class="form-group row">
                                                                                            <div class="col-md-12">
                                                                                                <div class="form-group">
                                                                                                    <asp:Label ID="H_FunCode" runat="server" Text="Funeral Home Code:"></asp:Label>
                                                                                                    <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                                                                                                        <ContentTemplate>
                                                                                                            <!-- all other content goes here -->
                                                                                                            <asp:HiddenField runat="server" ID="H_FuneralCode" />
                                                                                                            <asp:TextBox ID="H_SearchFuneral" runat="server" class="form-control" Width="20%"
                                                                                                                AutoPostBack="true" OnTextChanged="H_SearchFuneral_TextChanged" OnPreRender="H_SearchFuneral_TextChanged" />
                                                                                                            <asp:Panel runat="server" ID="H_FuneralDropDown"
                                                                                                                Style="max-height: 150px; max-width: 45%; overflow: scroll; display: none; visibility: hidden;">
                                                                                                                <!-- GridView  goes here -->

                                                                                                                <asp:GridView ID="H_FuneralGrid" runat="server" Font-Size="Small" AutoGenerateSelectButton="True"
                                                                                                                    AutoGenerateColumns="false" OnRowDataBound="H_FuneralGrid_RowDataBound" OnSelectedIndexChanged="H_FuneralGrid_SelectedIndexChanged">

                                                                                                                    <Columns>
                                                                                                                        <asp:BoundField DataField="F_Reg_Customer_Cnt" />
                                                                                                                        <asp:TemplateField>
                                                                                                                            <ItemTemplate>
                                                                                                                                <asp:Label ID="L11" runat="server" Text='<%# Eval("F_Reg_Short_Name") %>' />
                                                                                                                            </ItemTemplate>
                                                                                                                        </asp:TemplateField>
                                                                                                                        <asp:TemplateField>
                                                                                                                            <ItemTemplate>
                                                                                                                                <asp:Label ID="L12" runat="server" Text='<%# Eval("F_Reg_Funeral_Home")%>' />
                                                                                                                            </ItemTemplate>
                                                                                                                        </asp:TemplateField>
                                                                                                                        <asp:TemplateField>
                                                                                                                            <ItemTemplate>
                                                                                                                                <asp:Label ID="L13" runat="server" Text='<%# Eval("F_Reg_House_No") + " "+ Eval("F_Reg_St_Name") %>' />
                                                                                                                            </ItemTemplate>
                                                                                                                        </asp:TemplateField>

                                                                                                                        <asp:TemplateField>
                                                                                                                            <ItemTemplate>
                                                                                                                                <asp:Label ID="L14" runat="server" Text='<%# Eval("F_Reg_Unit") %>' />
                                                                                                                            </ItemTemplate>
                                                                                                                        </asp:TemplateField>
                                                                                                                        <asp:TemplateField>
                                                                                                                            <ItemTemplate>
                                                                                                                                <asp:Label ID="L15" runat="server" Text='<%# Eval("F_Reg_City")  + ", "+ Eval("F_Reg_Prov")+ " "+ Eval("F_Reg_PC") %>' />
                                                                                                                            </ItemTemplate>
                                                                                                                        </asp:TemplateField>
                                                                                                                    </Columns>
                                                                                                                    <HeaderStyle BackColor="Blue" ForeColor="White" />
                                                                                                                    <RowStyle ForeColor="#603813" BackColor="#F7F6F3" />
                                                                                                                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                                                                                                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                                                                                                    <HeaderStyle BackColor="#A86E07" Font-Bold="True" ForeColor="White" HorizontalAlign="Left" />
                                                                                                                    <EditRowStyle BackColor="#999999" />
                                                                                                                    <AlternatingRowStyle BackColor="White" />

                                                                                                                </asp:GridView>
                                                                                                            </asp:Panel>
                                                                                                            <ajaxToolkit:DropDownExtender ID="DropDownExtender3" runat="server"
                                                                                                                DropDownControlID="H_FuneralDropDown"
                                                                                                                TargetControlID="H_SearchFuneral" />
                                                                                                            <br />
                                                                                                            <div class="form-group row">
                                                                                                                <div class="col-md-4">
                                                                                                                    <div class="form-group">
                                                                                                                        <asp:TextBox ID="H_F_Name" runat="server" class="form-control"></asp:TextBox>
                                                                                                                    </div>
                                                                                                                </div>
                                                                                                                <div class="col-md-2">
                                                                                                                    <div class="form-group">
                                                                                                                        <asp:TextBox ID="H_F_Street" runat="server" class="form-control"></asp:TextBox>
                                                                                                                    </div>
                                                                                                                </div>
                                                                                                                <div class="col-md-2">
                                                                                                                    <div class="form-group">
                                                                                                                        <asp:TextBox ID="H_F_Unit" runat="server" class="form-control"></asp:TextBox>
                                                                                                                    </div>
                                                                                                                </div>
                                                                                                                <div class="col-md-4">
                                                                                                                    <div class="form-group">
                                                                                                                        <asp:TextBox ID="H_F_CityProv" runat="server" class="form-control"></asp:TextBox>
                                                                                                                    </div>
                                                                                                                </div>
                                                                                                            </div>
                                                                                                        </ContentTemplate>

                                                                                                    </asp:UpdatePanel>
                                                                                                </div>
                                                                                            </div>

                                                                                        </div>
                                                                                        <div class="form-group row">
                                                                                            <div class="col-md-12">
                                                                                                <div class="form-group">
                                                                                                    <asp:Label ID="H_DoctorCode" runat="server" Text="Doctor:"></asp:Label>
                                                                                                    <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                                                                                                        <ContentTemplate>
                                                                                                            <!-- all other content goes here -->
                                                                                                            <asp:HiddenField runat="server" ID="H_DR_Code" />
                                                                                                            <asp:TextBox ID="H_SearchDoctor" runat="server" class="form-control" Width="20%"
                                                                                                                AutoPostBack="true" OnTextChanged="SearchDoctor_PreRender" OnPreRender="SearchDoctor_PreRender" />
                                                                                                            <asp:Panel runat="server" ID="H_DoctorDropdown"
                                                                                                                Style="max-height: 150px; max-width: 40%; overflow: scroll; display: none; visibility: hidden;">
                                                                                                                <!-- GridView  goes here -->
                                                                                                                <asp:GridView ID="H_DoctorGrid" runat="server" Font-Size="Small" AutoGenerateSelectButton="True"
                                                                                                                    AutoGenerateColumns="false" OnRowDataBound="H_DoctorGrid_RowDataBound" OnSelectedIndexChanged="H_DoctorGrid_SelectedIndexChanged">

                                                                                                                    <Columns>
                                                                                                                        <asp:BoundField DataField="D_Reg_DR_No" />
                                                                                                                        <asp:TemplateField>
                                                                                                                            <ItemTemplate>
                                                                                                                                <asp:Label ID="L16" runat="server" Text='<%# Eval("D_Short_Name") %>' />
                                                                                                                            </ItemTemplate>
                                                                                                                        </asp:TemplateField>
                                                                                                                        <asp:TemplateField>
                                                                                                                            <ItemTemplate>
                                                                                                                                <asp:Label ID="L17" runat="server" Text='<%# Eval("D_Reg_Last_Name") + ", "+ Eval("D_Reg_First_Name") %>' />
                                                                                                                            </ItemTemplate>
                                                                                                                        </asp:TemplateField>
                                                                                                                        <asp:TemplateField>
                                                                                                                            <ItemTemplate>
                                                                                                                                <asp:Label ID="L18" runat="server" Text='<%# Eval("D_Reg_House_No") + " "+ Eval("D_Reg_St_Name") %>' />
                                                                                                                            </ItemTemplate>
                                                                                                                        </asp:TemplateField>

                                                                                                                        <asp:TemplateField>
                                                                                                                            <ItemTemplate>
                                                                                                                                <asp:Label ID="L19" runat="server" Text='<%# Eval("D_Reg_Unit") %>' />
                                                                                                                            </ItemTemplate>
                                                                                                                        </asp:TemplateField>
                                                                                                                        <asp:TemplateField>
                                                                                                                            <ItemTemplate>
                                                                                                                                <asp:Label ID="L20" runat="server" Text='<%# Eval("D_Reg_City")  + ", "+ Eval("D_Reg_Prov")+ " "+ Eval("D_Reg_PC") %>' />
                                                                                                                            </ItemTemplate>
                                                                                                                        </asp:TemplateField>
                                                                                                                    </Columns>
                                                                                                                    <HeaderStyle BackColor="Blue" ForeColor="White" />
                                                                                                                    <RowStyle ForeColor="#603813" BackColor="#F7F6F3" />
                                                                                                                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                                                                                                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                                                                                                    <HeaderStyle BackColor="#A86E07" Font-Bold="True" ForeColor="White" HorizontalAlign="Left" />
                                                                                                                    <EditRowStyle BackColor="#999999" />
                                                                                                                    <AlternatingRowStyle BackColor="White" />

                                                                                                                </asp:GridView>
                                                                                                            </asp:Panel>
                                                                                                            <ajaxToolkit:DropDownExtender ID="DropDownExtender4" runat="server"
                                                                                                                DropDownControlID="H_DoctorDropdown"
                                                                                                                TargetControlID="H_SearchDoctor" />
                                                                                                            <br />
                                                                                                            <div class="form-group row">
                                                                                                                <div class="col-md-4">
                                                                                                                    <div class="form-group">
                                                                                                                        <asp:TextBox ID="H_D_Name" runat="server" class="form-control"></asp:TextBox>
                                                                                                                    </div>
                                                                                                                </div>
                                                                                                                <div class="col-md-2">
                                                                                                                    <div class="form-group">
                                                                                                                        <asp:TextBox ID="H_D_Street" runat="server" class="form-control"></asp:TextBox>
                                                                                                                    </div>
                                                                                                                </div>
                                                                                                                <div class="col-md-2">
                                                                                                                    <div class="form-group">
                                                                                                                        <asp:TextBox ID="H_D_Unit" runat="server" class="form-control"></asp:TextBox>
                                                                                                                    </div>
                                                                                                                </div>
                                                                                                                <div class="col-md-4">
                                                                                                                    <div class="form-group">
                                                                                                                        <asp:TextBox ID="H_D_CityProv" runat="server" class="form-control"></asp:TextBox>
                                                                                                                    </div>
                                                                                                                </div>
                                                                                                            </div>
                                                                                                        </ContentTemplate>

                                                                                                    </asp:UpdatePanel>
                                                                                                </div>
                                                                                            </div>

                                                                                        </div>

                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <br />
                                                                            <div class="card card-info">
                                                                                <div class="card-header">
                                                                                    <h3 class="card-title">Address of Deceased</h3>
                                                                                </div>
                                                                                <div class="card-body">
                                                                                    <div class="content">
                                                                                        <div class="form-group row">
                                                                                            <div class="col-md-4">
                                                                                                <div class="form-group">
                                                                                                    <%--  <asp:RadioButton ID="RadioButton1" runat="server" Text="Address Same" ClientIDMode="Static" />--%>
                                                                                                    <asp:CheckBox ID="H_Same" runat="server" Text="Address Same" class="icheck-primary d-inline" />
                                                                                                </div>
                                                                                            </div>
                                                                                        </div>
                                                                                        <div class="form-group row">
                                                                                            <div class="col-md-2">
                                                                                                <div class="form-group">
                                                                                                    <asp:Label ID="Label78" runat="server" Text="House No.:"></asp:Label>
                                                                                                    <asp:TextBox ID="H_DHouseNo" class="form-control" runat="server" MaxLength="7" placeholder="House Number"></asp:TextBox>
                                                                                                </div>
                                                                                            </div>
                                                                                            <div class="col-md-6">
                                                                                                <div class="form-group">
                                                                                                    <asp:Label ID="Label79" runat="server" Text="Street:"></asp:Label>
                                                                                                    <asp:TextBox ID="H_DStreet" class="form-control" runat="server" MaxLength="35"></asp:TextBox>
                                                                                                </div>
                                                                                            </div>
                                                                                            <div class="col-md-4">
                                                                                                <div class="form-group">
                                                                                                    <asp:Label ID="Label80" runat="server" Text="Unit/Apt:"></asp:Label>
                                                                                                    <asp:TextBox ID="H_DUnit" class="form-control" runat="server" MaxLength="6"></asp:TextBox>
                                                                                                </div>
                                                                                            </div>
                                                                                        </div>

                                                                                        <div class="form-group row">
                                                                                            <div class="col-md-4">
                                                                                                <div class="form-group">
                                                                                                    <asp:Label ID="Label81" runat="server" Text="City:"></asp:Label>
                                                                                                    <asp:TextBox ID="H_DCity" class="form-control" runat="server" MaxLength="25"></asp:TextBox>
                                                                                                </div>
                                                                                            </div>
                                                                                            <div class="col-md-4">
                                                                                                <div class="form-group">
                                                                                                    <asp:Label ID="Label82" runat="server" Text="Province:"></asp:Label>
                                                                                                    <asp:TextBox ID="H_DProvince" class="form-control" runat="server" MaxLength="20"></asp:TextBox>
                                                                                                </div>
                                                                                            </div>
                                                                                        </div>
                                                                                        <div class="form-group row">
                                                                                            <div class="col-md-4">
                                                                                                <div class="form-group">
                                                                                                    <asp:Label ID="Label83" runat="server" Text="Country:"></asp:Label>
                                                                                                    <asp:TextBox ID="H_DCountry" class="form-control" runat="server" MaxLength="15"></asp:TextBox>
                                                                                                </div>
                                                                                            </div>
                                                                                            <div class="col-md-4">
                                                                                                <div class="form-group">
                                                                                                    <asp:Label ID="Label84" runat="server" Text="Postal Code:"></asp:Label>
                                                                                                    <asp:TextBox ID="H_DPostalCode" class="form-control" runat="server" MaxLength="7"></asp:TextBox>
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
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <asp:HiddenField ID="hfTab" runat="server" />
                                </div>
                                <div class="card-footer">
                                    <asp:LinkButton ID="SubmitBtn" runat="server" CssClass="btn btn-info"
                                        OnClick="SubmitBtn_Click">
                                            <i class="fa fa-save"></i>&nbsp;Save
                                    </asp:LinkButton>
                                </div>
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
        function Confirm() {
            var confirm_value = document.createElement("INPUT");
            confirm_value.type = "hidden";
            confirm_value.name = "confirm_value";
            if (confirm("Do you want to save data?")) {
                confirm_value.value = "Yes";
            } else {
                confirm_value.value = "No";
            }
            document.forms[0].appendChild(confirm_value);
        }

    </script>
</asp:Content>
