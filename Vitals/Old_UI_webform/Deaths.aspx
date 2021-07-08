<%@ Page Title="" Language="C#" EnableEventValidation="false" MasterPageFile="~/Vitals.Master" AutoEventWireup="true" CodeBehind="Deaths.aspx.cs" Inherits="Vitals.Deaths" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
    <link href="Style/jquery-ui.css" rel="stylesheet" />
    <script src="Scripts/jquery-3.5.1.js"></script>
    <script src="Scripts/jquery-ui.js"></script>
    <script>
        window.onload = function () {
            var selectedTab = $("#<%=hfTab.ClientID%>");
            //  var str = window.location.href.slice(window.location.href.indexOf('?') + 1).split('&');


            var tabId = selectedTab.val() != "" ? selectedTab.val() : "tab1";
            $('#dvTab a[href="#' + tabId + '"]').tab('show');
            $("#dvTab a").click(function () {
                selectedTab.val($(this).attr("href").substring(1));
                // alert($(this).attr("href").substring(1));
                document.getElementById("<%=hfTab.ClientID%>").val = $(this).attr("href").substring(1);
                if (selectedTab.val() == "tab3") {
                    document.getElementById("<%=SubmitBtn.ClientID%>").style.display = "none";
                }
                if (selectedTab.val() == "tab1") {

                    document.getElementById("<%=EditBtn.ClientID%>").style.display = "none";
                    document.getElementById("<%=SubmitBtn.ClientID%>").style.display = "block";
                }
            });

        }
        function currentclick() {
            window.location.href = "Deaths.aspx";
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
                $("input#Same").click(function () {
                    alert($("#Street").html());
                    document.getElementById("<%=DHouseNo.ClientID%>").value = document.getElementById("<%=HouseNo.ClientID%>").value;
                    document.getElementById("<%=D_Street.ClientID%>").value = document.getElementById("<%=Street.ClientID%>").value;
                    document.getElementById("<%=D_Unit.ClientID%>").value = document.getElementById("<%=Unit.ClientID%>").value;
                    document.getElementById("<%=DCity.ClientID%>").value = document.getElementById("<%=City.ClientID%>").value;
                    document.getElementById("<%=DProvince.ClientID%>").value = document.getElementById("<%=Province.ClientID%>").value;
                    document.getElementById("<%=DCountry.ClientID%>").value = document.getElementById("<%=Country.ClientID%>").value;
                    document.getElementById("<%=DPostalcode.ClientID%>").value = document.getElementById("<%=Postalcode.ClientID%>").value;
                });

            });
            // Your code
        });

        $(document).ready(function () {
            $(function () {
                $("#<%=Fname.ClientID%>").change(function () {
                    alert("change");
                    // Your code for second text chnage 

                });
            });
        });
    </script>
    <style>
        .invisibleColumn {
            display: none;
            width: 0px;
        }

        body {
            font-family: Arial;
            font-size: 12px;
        }

        .tdonhover {
            background-color: #d9d9d9 !important;
        }

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
    <asp:ScriptManager ID="ScriptManager2" runat="server"></asp:ScriptManager>
    <div class="container">
        <div class="row" style="padding-top: 10%;">

            <div class="col-md-12">
                <div class="form-group row float-right" style="margin-right: 35px">
                    <div class="form-group">

                        <asp:LinkButton ID="EditBtn" runat="server" CssClass="btn btn-small btn-primary" Visible="false" OnClick="EditBtn_Click">
                            <i class="fa fa-edit"></i>&nbsp;Edit</asp:LinkButton>
                        <asp:LinkButton ID="CancelBtn" runat="server" CssClass="btn btn-small btn-primary" Visible="false" OnClick="CancelBtn_Click">
                            <i class="fa fa-remove"></i>&nbsp;Cancel</asp:LinkButton>
                        <asp:LinkButton ID="AddDoc" runat="server" CssClass="btn btn-small btn-primary" OnClick="AddDoc_Click">
                            <i class="fa fa-plus"></i>&nbsp;Add A Doctor</asp:LinkButton>

                        <asp:LinkButton ID="AddFun" runat="server" CssClass="btn btn-small btn-primary" OnClick="AddFun_Click">
                            <i class="fa fa-plus"></i>&nbsp;Add A Funeral Home</asp:LinkButton>
                    </div>
                </div>
            </div>
        </div>
        <div id="dvTab" style="border-style: groove;">
            <ul class="nav nav-tabs" role="tablist" style="margin-bottom: -15px; margin-left: 20px; border-bottom: 0;">
                <!-- add data-toggle attribute to the anchors -->
                <li class="nav-item" onclick="currentclick();"><a data-toggle="tab" aria-controls="tab1" class="nav-link active" href="#tab1">Current</a></li>
                <%-- <li class="nav-item"><a data-toggle="tab" aria-controls="tab2" class="nav-link " href="#tab2">Death Inquiry</a></li>--%>
                <li class="nav-item"><a data-toggle="tab" aria-controls="tab3" class="nav-link " href="#tab3">Death Inquiry</a></li>
            </ul>
            <div class="tab-content">
                <div id="tab1" class="tab-pane active" role="tabpanel">
                    <div class="row" style="margin-bottom: 20px;">
                        <div class="col-md-12">
                            <div align="center" style="width: 100%; height: 40%; padding: 15px 20px;">
                                <div class="form-head form-group" style="background-color: #777; color: white; padding: 10px; width: 100%; border: none; text-align: center; outline: none; font-size: 15px;">
                                    <h3>Vital Statistics (Deaths)</h3>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <asp:Label ID="lblMsg" runat="server" EnableViewState="False" ForeColor="Red"></asp:Label><br />
                            <div style="margin-top: -20px; width: 100%; height: 65%; border: thin; border-color: black;
                                                    padding: 15px 20px; color: #005595; font-family: Arial; font-size: 16px;">
                                <div class="form-group row">
                                    <div class="col-md-6">
                                        <asp:Label ID="Label1" runat="server" Text="Registration No.:"></asp:Label>
                                        <div class="input-group">
                                            <asp:TextBox ID="RegYear" class="form-control" runat="server" ReadOnly="true"></asp:TextBox>
                                            <asp:TextBox ID="RegType" class="form-control" runat="server"></asp:TextBox>
                                            <asp:TextBox ID="RegNo" class="form-control" runat="server" placeholder="0"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-md-2">
                                        <div class="form-group">
                                            <asp:Label ID="Label2" runat="server" Text="Billable:"></asp:Label>
                                            &nbsp;
                                <asp:DropDownList ID="Billable" runat="server" class="form-control">

                                    <asp:ListItem Text="Yes" Value="Yes"></asp:ListItem>
                                    <asp:ListItem Text="No" Value="No"></asp:ListItem>
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
                                            <asp:DropDownList ID="sex" runat="server" class="form-control">
                                                <asp:ListItem runat="server" Value="--Select--">--Select--</asp:ListItem>
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
                                        <%-- <div class="col-md-8">
                                            <div class="form-group">
                                                <asp:Label ID="Label12" runat="server" Text="Cause of Death(Optional):"></asp:Label>
                                                <asp:TextBox ID="CauseDeath1" class="form-control" runat="server"></asp:TextBox>
                                                <asp:TextBox ID="CauseDeath2" class="form-control" runat="server"></asp:TextBox>
                                            </div>
                                        </div>--%>
                                    </div>
                                </div>
                                <br />
                                <div class="header">
                                    <asp:Label ID="Label13" runat="server" Text="Address of Place of Death" ForeColor="Black"></asp:Label>
                                </div>
                                <div class="content">
                                    <div class="form-group row">
                                        <div class="col-md-2">
                                            <div class="form-group">
                                                <asp:Label ID="Label68" runat="server" Text="House No.:"></asp:Label>
                                                <asp:TextBox ID="HouseNo" class="form-control" MaxLength="35" runat="server" placeholder="House Number"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-md-8">
                                            <div class="form-group">
                                                <asp:Label ID="Label14" runat="server" Text="Street:"></asp:Label>
                                                <asp:TextBox ID="Street" class="form-control" runat="server"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-md-2">
                                            <div class="form-group">
                                                <asp:Label ID="Label15" runat="server" Text="Form 17 Req?:"></asp:Label>
                                                <%--<asp:TextBox ID="Form17" class="form-control" runat="server"></asp:TextBox>--%>
                                             &nbsp;
                                <asp:DropDownList ID="printed" runat="server" class="form-control" AutoPostBack="true">
                                    <asp:ListItem Text="No" Value="No"></asp:ListItem>
                                    <asp:ListItem Text="Yes" Value="Yes"></asp:ListItem>
                                </asp:DropDownList>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <asp:Label ID="Label16" runat="server" Text="Unit/Apt:"></asp:Label>
                                                <asp:TextBox ID="Unit" class="form-control" runat="server"></asp:TextBox>
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
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <asp:Label ID="Label21" runat="server" Text="Funeral Home Code:"></asp:Label>
                                                <%--<asp:DropDownList ID="FuneralCode" runat="server" class="form-control"></asp:DropDownList>--%>
                                                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                                    <ContentTemplate>
                                                        <!-- all other content goes here -->
                                                        <asp:HiddenField runat="server" ID="FuneralCode" />
                                                        <asp:TextBox ID="SearcFuneralHome" runat="server" class="form-control" Width="20%"
                                                            AutoPostBack="true" OnTextChanged="SearchEvent" OnPreRender="SearchEvent" />
                                                        <asp:Panel runat="server" ID="FuneralDropDown"
                                                            Style="max-height: 150px; max-width: 50%; overflow: scroll; display: none; visibility: hidden;">
                                                            <!-- GridView  goes here -->

                                                            <asp:GridView ID="FuneralGridView" runat="server" Font-Size="Small"
                                                                AutoGenerateColumns="false" OnRowDataBound="FuneralGridView_RowDataBound" 
                                                                OnSelectedIndexChanged="FuneralGridView_SelectedIndexChanged">

                                                                <Columns>
                                                                    <asp:BoundField DataField="F_Reg_Customer_Cnt"
                                                                        HeaderStyle-CssClass="invisibleColumn"
                                                                        ItemStyle-CssClass="invisibleColumn" />
                                                                    <asp:BoundField DataField="F_Reg_Short_Name"
                                                                        HeaderText="Short Name" HeaderStyle-CssClass="invisibleColumn"
                                                                        ItemStyle-CssClass="invisibleColumn" />
                                                                    <asp:BoundField DataField="F_Reg_Funeral_Home"
                                                                        HeaderText="Funeral Home" HeaderStyle-CssClass="invisibleColumn"
                                                                        ItemStyle-CssClass="invisibleColumn" />
                                                                    <asp:BoundField DataField="F_Reg_St_Name"
                                                                        HeaderText="Street Name" HeaderStyle-CssClass="invisibleColumn"
                                                                        ItemStyle-CssClass="invisibleColumn" />
                                                                    <asp:BoundField DataField="F_Reg_House_No"
                                                                        HeaderStyle-CssClass="invisibleColumn"
                                                                        ItemStyle-CssClass="invisibleColumn" />
                                                                    <asp:BoundField DataField="F_Reg_City"
                                                                        HeaderStyle-CssClass="invisibleColumn"
                                                                        ItemStyle-CssClass="invisibleColumn" />
                                                                    <asp:BoundField DataField="F_Reg_Prov"
                                                                        HeaderStyle-CssClass="invisibleColumn"
                                                                        ItemStyle-CssClass="invisibleColumn" />
                                                                    <asp:BoundField DataField="F_Reg_PC"
                                                                        HeaderStyle-CssClass="invisibleColumn"
                                                                        ItemStyle-CssClass="invisibleColumn" />
                                                                    <asp:BoundField DataField="F_Reg_Unit"
                                                                        HeaderStyle-CssClass="invisibleColumn"
                                                                        ItemStyle-CssClass="invisibleColumn" />
                                                                    <asp:TemplateField HeaderText="Short Name">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="Label76" runat="server" Text='<%# Eval("F_Reg_Short_Name") %>' />
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Funeral Home">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="Label76" runat="server" Text='<%# Eval("F_Reg_Funeral_Home")%>' />
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Street Name">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="Label76" runat="server" Text='<%# Eval("F_Reg_House_No") + " "+ Eval("F_Reg_St_Name") %>' />
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>

                                                                    <asp:TemplateField HeaderText="Unit" HeaderStyle-CssClass="invisibleColumn"
                                                                        ItemStyle-CssClass="invisibleColumn">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="Label76" runat="server" Text='<%# Eval("F_Reg_Unit") %>' />
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderStyle-CssClass="invisibleColumn"
                                                                        ItemStyle-CssClass="invisibleColumn">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="Label76" runat="server" Text='<%# Eval("F_Reg_City")  + ", "+ Eval("F_Reg_Prov")+ " "+ Eval("F_Reg_PC") %>' />
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
                                                        <asp:TextBox ID="F_Name" runat="server" Style="height: calc(1.5em + .75rem + 2px); padding: .375rem .75rem; font-size: 1rem; font-weight: 400; line-height: 1.5; color: #495057; background-color: #fff; background-clip: padding-box; border: 1px solid #ced4da; border-radius: .25rem; transition: border-color .15s ease-in-out,box-shadow .15s ease-in-out; width: 20%;"></asp:TextBox>
                                                        <asp:TextBox ID="F_Street" runat="server" Style="height: calc(1.5em + .75rem + 2px); padding: .375rem .75rem; font-size: 1rem; font-weight: 400; line-height: 1.5; color: #495057; background-color: #fff; background-clip: padding-box; border: 1px solid #ced4da; border-radius: .25rem; transition: border-color .15s ease-in-out,box-shadow .15s ease-in-out; width: 25%;"></asp:TextBox>
                                                        <asp:TextBox ID="F_Unit" runat="server" Style="height: calc(1.5em + .75rem + 2px); padding: .375rem .75rem; font-size: 1rem; font-weight: 400; line-height: 1.5; color: #495057; background-color: #fff; background-clip: padding-box; border: 1px solid #ced4da; border-radius: .25rem; transition: border-color .15s ease-in-out,box-shadow .15s ease-in-out; width: 15%;"></asp:TextBox>
                                                        <asp:TextBox ID="F_CityProv" runat="server" Style="height: calc(1.5em + .75rem + 2px); padding: .375rem .75rem; font-size: 1rem; font-weight: 400; line-height: 1.5; color: #495057; background-color: #fff; background-clip: padding-box; border: 1px solid #ced4da; border-radius: .25rem; transition: border-color .15s ease-in-out,box-shadow .15s ease-in-out; width: 30%;"></asp:TextBox>

                                                    </ContentTemplate>

                                                </asp:UpdatePanel>
                                            </div>
                                        </div>

                                    </div>
                                    <div class="form-group row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <asp:Label ID="Label22" runat="server" Text="Doctor:"></asp:Label>
                                                <%--<asp:DropDownList ID="Doctor" runat="server" class="form-control"></asp:DropDownList>--%>
                                                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                                    <ContentTemplate>
                                                        <!-- all other content goes here -->
                                                        <asp:HiddenField runat="server" ID="DoctorCode" />
                                                        <asp:TextBox ID="SearchDoctor" runat="server" class="form-control" Width="20%"
                                                            AutoPostBack="true" OnTextChanged="SearchDoctor_PreRender" OnPreRender="SearchDoctor_PreRender" />
                                                        <asp:Panel runat="server" ID="DoctorDropdown"
                                                            Style="max-height: 150px; max-width: 50%; overflow: scroll; display: none; visibility: hidden;">
                                                            <!-- GridView  goes here -->

                                                            <asp:GridView ID="DoctorGrid" runat="server" Font-Size="Small"
                                                                AutoGenerateColumns="false" OnRowDataBound="SearchDoctorGrid_RowDataBound" OnSelectedIndexChanged="SearchDoctorGrid_SelectedIndexChanged">

                                                                <Columns>
                                                                    <asp:BoundField DataField="D_Reg_DR_No"
                                                                        HeaderStyle-CssClass="invisibleColumn"
                                                                        ItemStyle-CssClass="invisibleColumn" />
                                                                    <asp:BoundField DataField="D_Short_Name"
                                                                        HeaderText="Short Name" HeaderStyle-CssClass="invisibleColumn"
                                                                        ItemStyle-CssClass="invisibleColumn" />
                                                                    <asp:BoundField DataField="D_Reg_Last_Name"
                                                                        HeaderText="Funeral Home" HeaderStyle-CssClass="invisibleColumn"
                                                                        ItemStyle-CssClass="invisibleColumn" />
                                                                    <asp:BoundField DataField="D_Reg_First_Name"
                                                                        HeaderText="Street Name" HeaderStyle-CssClass="invisibleColumn"
                                                                        ItemStyle-CssClass="invisibleColumn" />
                                                                    <asp:BoundField DataField="D_Reg_House_No"
                                                                        HeaderStyle-CssClass="invisibleColumn"
                                                                        ItemStyle-CssClass="invisibleColumn" />
                                                                    <asp:BoundField DataField="D_Reg_St_Name"
                                                                        HeaderStyle-CssClass="invisibleColumn"
                                                                        ItemStyle-CssClass="invisibleColumn" />
                                                                    <asp:BoundField DataField="D_Reg_City"
                                                                        HeaderStyle-CssClass="invisibleColumn"
                                                                        ItemStyle-CssClass="invisibleColumn" />
                                                                    <asp:BoundField DataField="D_Reg_Prov"
                                                                        HeaderStyle-CssClass="invisibleColumn"
                                                                        ItemStyle-CssClass="invisibleColumn" />
                                                                    <asp:BoundField DataField="D_Reg_PC"
                                                                        HeaderStyle-CssClass="invisibleColumn"
                                                                        ItemStyle-CssClass="invisibleColumn" />
                                                                    <asp:BoundField DataField="D_Reg_Unit"
                                                                        HeaderStyle-CssClass="invisibleColumn"
                                                                        ItemStyle-CssClass="invisibleColumn" />
                                                                    <asp:TemplateField HeaderText="Short Name">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="Label76" runat="server" Text='<%# Eval("D_Short_Name") %>' />
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Doctor Name">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="Label76" runat="server" Text='<%# Eval("D_Reg_Last_Name") + ", "+ Eval("D_Reg_First_Name") %>' />
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Street Name">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="Label76" runat="server" Text='<%# Eval("D_Reg_House_No") + " "+ Eval("D_Reg_St_Name") %>' />
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>

                                                                    <asp:TemplateField HeaderText="Unit" HeaderStyle-CssClass="invisibleColumn"
                                                                        ItemStyle-CssClass="invisibleColumn">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="Label76" runat="server" Text='<%# Eval("D_Reg_Unit") %>' />
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderStyle-CssClass="invisibleColumn"
                                                                        ItemStyle-CssClass="invisibleColumn">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="Label76" runat="server" Text='<%# Eval("D_Reg_City")  + ", "+ Eval("D_Reg_Prov")+ " "+ Eval("D_Reg_PC") %>' />
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
                                                        <asp:TextBox ID="D_Name" runat="server" Style="height: calc(1.5em + .75rem + 2px); padding: .375rem .75rem; font-size: 1rem; font-weight: 400; line-height: 1.5; color: #495057; background-color: #fff; background-clip: padding-box; border: 1px solid #ced4da; border-radius: .25rem; transition: border-color .15s ease-in-out,box-shadow .15s ease-in-out; width: 20%;"></asp:TextBox>
                                                        <asp:TextBox ID="D_Street" runat="server" Style="height: calc(1.5em + .75rem + 2px); padding: .375rem .75rem; font-size: 1rem; font-weight: 400; line-height: 1.5; color: #495057; background-color: #fff; background-clip: padding-box; border: 1px solid #ced4da; border-radius: .25rem; transition: border-color .15s ease-in-out,box-shadow .15s ease-in-out; width: 25%;"></asp:TextBox>
                                                        <asp:TextBox ID="D_Unit" runat="server" Style="height: calc(1.5em + .75rem + 2px); padding: .375rem .75rem; font-size: 1rem; font-weight: 400; line-height: 1.5; color: #495057; background-color: #fff; background-clip: padding-box; border: 1px solid #ced4da; border-radius: .25rem; transition: border-color .15s ease-in-out,box-shadow .15s ease-in-out; width: 15%;"></asp:TextBox>
                                                        <asp:TextBox ID="D_CityProv" runat="server" Style="height: calc(1.5em + .75rem + 2px); padding: .375rem .75rem; font-size: 1rem; font-weight: 400; line-height: 1.5; color: #495057; background-color: #fff; background-clip: padding-box; border: 1px solid #ced4da; border-radius: .25rem; transition: border-color .15s ease-in-out,box-shadow .15s ease-in-out; width: 30%;"></asp:TextBox>

                                                    </ContentTemplate>

                                                </asp:UpdatePanel>
                                            </div>
                                        </div>

                                    </div>

                                </div>
                                <br />
                                <div class="header">
                                    <asp:Label ID="Label67" runat="server" Text=" Address of Deceased" ForeColor="Black"></asp:Label>
                                </div>
                                <div class="content">
                                    <div class="form-group row">
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <asp:RadioButton ID="Same" runat="server" Text="Address Same" ClientIDMode="Static" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <div class="col-md-2">
                                            <div class="form-group">
                                                <asp:Label ID="Label43" runat="server" Text="House No.:"></asp:Label>
                                                <asp:TextBox ID="DHouseNo" class="form-control" MaxLength="35" runat="server" placeholder="House Number"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <asp:Label ID="Label69" runat="server" Text="Street:"></asp:Label>
                                                <asp:TextBox ID="DStreet" class="form-control" runat="server"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <asp:Label ID="Label71" runat="server" Text="Unit/Apt:"></asp:Label>
                                                <asp:TextBox ID="DUnit" class="form-control" runat="server"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="form-group row">
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <asp:Label ID="Label72" runat="server" Text="City:"></asp:Label>
                                                <asp:TextBox ID="DCity" class="form-control" runat="server"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <asp:Label ID="Label73" runat="server" Text="Province:"></asp:Label>
                                                <asp:TextBox ID="DProvince" class="form-control" runat="server"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <asp:Label ID="Label74" runat="server" Text="Country:"></asp:Label>
                                                <asp:TextBox ID="DCountry" class="form-control" runat="server"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <asp:Label ID="Label75" runat="server" Text="Postal Code:"></asp:Label>
                                                <asp:TextBox ID="DPostalcode" class="form-control" runat="server"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
                <%--  <div id="tab2" class="tab-pane" role="tabpanel">

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
                </div>--%>
                <div id="tab3" class="tab-pane" role="tabpanel">
                    <div class="row" style="margin-bottom: 25px;">
                        <div class="col-md-12">
                            <div align="center" style="width: 100%; height: 40%; padding: 15px 20px;">
                                <div class="form-head form-group" style="background-color: #777; color: white; padding: 10px; width: 100%; border: none; text-align: center; outline: none; font-size: 15px;">
                                    <h3>Death</h3>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div style="margin-top: -20px; width: 100%; border: thin; border-color: black; padding: 15px 20px; color: #005595; font-family: Arial; font-size: 16px;">
                                <div class="form-group row">
                                    <div class="col-md-12">
                                        <div class="input-group">
                                            <asp:TextBox ID="SearchDeath" class="form-control" runat="server" placeholder="Search here....."></asp:TextBox>

                                            <div class="input-group-prepend">

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
                                                <asp:GridView ID="GridView1" runat="server" BorderStyle="None" GridLines="Horizontal"
                                                    BorderColor="LightGray" AutoGenerateColumns="false"
                                                    PageIndex="5" AllowPaging="True" AllowCustomPaging="True" CellPadding="3"
                                                    CellSpacing="2" Width="100%" OnRowCommand="GridView1_RowCommand"
                                                    DataSourceID="SearcDeaths" CssClass="table table-condensed table-hover" Style="font-size: 12pt; font-family: arial;">
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
                                                        <asp:ButtonField ButtonType="Button" Text="ViewDetails" CommandName="ViewDetails" ControlStyle-CssClass="btn btn-primary"
                                                            ControlStyle-BackColor="#507CD1" ControlStyle-ForeColor="White" ControlStyle-Font-Size="15px" />
                                                        <asp:ButtonField ButtonType="Button" Text="Edit" CommandName="Edit" ControlStyle-CssClass="btn btn-primary"
                                                            ControlStyle-BackColor="#005595" ControlStyle-ForeColor="White" ControlStyle-Font-Size="15px" />

                                                        <%--<asp:ButtonField ButtonType="Button" Text="Delete" CommandName="Delete"
                                                        ControlStyle-BackColor="#005595" ControlStyle-ForeColor="White" ControlStyle-Font-Size="15px" />--%>
                                                    </Columns>

                                                </asp:GridView>

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
                                                <div class="row" style="margin-bottom: 20px;">

                                                    <div class="col-md-12">
                                                        <asp:Label ID="Label44" runat="server" EnableViewState="False" ForeColor="Red"></asp:Label><br />
                                                        <div style="margin-top: -20px; width: 100%; height: 65%; border: thin; border-color: black; padding: 15px 20px; color: #005595; font-family: Arial; font-size: 16px;">
                                                            <div class="form-group row">
                                                                <div class="col-md-6">
                                                                    <asp:Label ID="Label45" runat="server" Text="Registration No.:"></asp:Label>
                                                                    <div class="input-group">
                                                                        <asp:TextBox ID="H_RegYear" class="form-control" runat="server" ReadOnly="true"></asp:TextBox>
                                                                        <asp:TextBox ID="H_RegType" class="form-control" runat="server"></asp:TextBox>
                                                                        <asp:TextBox ID="H_RegNo" class="form-control" runat="server" placeholder="0"></asp:TextBox>
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-2">
                                                                    <div class="form-group">
                                                                        <asp:Label ID="Label46" runat="server" Text="Billable:"></asp:Label>
                                                                        &nbsp;
                                                                        <asp:DropDownList ID="H_Billable" runat="server" class="form-control" AutoPostBack="true">
                                                                            <asp:ListItem runat="server" Value="--Select--">--Select--</asp:ListItem>
                                                                            <asp:ListItem Text="Yes" Value="Yes"></asp:ListItem>
                                                                            <asp:ListItem Text="No" Value="No"></asp:ListItem>
                                                                        </asp:DropDownList>
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-4">
                                                                    <div class="form-group">
                                                                        <asp:Label ID="Label47" runat="server" Text="Reg Date:"></asp:Label>
                                                                        <div class='form-group'>
                                                                            <asp:TextBox ID="H_RegDate" class="form-control" ClientIDMode="Static" ReadOnly="true" runat="server" placeholder="MM/DD/YYY">
                                             
                                                                            </asp:TextBox>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="header">
                                                                <asp:Label ID="Label48" runat="server" Text="Deceased Information" ForeColor="Black"></asp:Label>
                                                            </div>
                                                            <div class="content">
                                                                <div class="form-group row">
                                                                    <div class="col-md-4">
                                                                        <div class="form-group">
                                                                            <asp:Label ID="Label49" runat="server" Text="Fisrt Name:"></asp:Label>
                                                                            <asp:TextBox ID="H_Fname" runat="server" class="form-control" placeholder="First Name"></asp:TextBox>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-md-4">
                                                                        <div class="form-group">
                                                                            <asp:Label ID="Label50" runat="server" Text="Middle Name:"></asp:Label>
                                                                            <asp:TextBox ID="H_Mname" runat="server" class="form-control" placeholder="Middle Name"></asp:TextBox>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-md-4">
                                                                        <div class="form-group">
                                                                            <asp:Label ID="Label51" runat="server" Text="Last Name:"></asp:Label>
                                                                            <asp:TextBox ID="H_Lname" runat="server" class="form-control" placeholder="Last Name"></asp:TextBox>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="form-group row">
                                                                    <div class="col-md-4">
                                                                        <div class="form-group">
                                                                            <asp:Label ID="Label52" runat="server" Text="Sex"></asp:Label>
                                                                            &nbsp;
                                                                            <asp:DropDownList ID="H_RegSex" runat="server" class="form-control" AutoPostBack="true">
                                                                                <asp:ListItem runat="server" Value="--Select--">--Select--</asp:ListItem>
                                                                                <asp:ListItem runat="server" Value="M">Male</asp:ListItem>
                                                                                <asp:ListItem runat="server" Valu="F">Female</asp:ListItem>
                                                                            </asp:DropDownList>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-md-4">
                                                                        <div class="form-group">
                                                                            <asp:Label ID="Label53" runat="server" Text="Date of Death:"></asp:Label>
                                                                            <div class="input-group">
                                                                                <asp:TextBox ID="H_DDeath" class="form-control" ClientIDMode="Static" runat="server" placeholder="MM/DD/YYY"></asp:TextBox>

                                                                                <div class="input-group-prepend">
                                                                                    <span class="input-group-text"><i class="fa fa-calendar"></i></span>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-md-4">
                                                                        <div class="form-group">
                                                                            <asp:Label ID="Label54" runat="server" Text="Municipality:"></asp:Label>
                                                                            <asp:TextBox ID="H_Municipality" class="form-control" runat="server"></asp:TextBox>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="form-group row">
                                                                    <div class="col-md-8">
                                                                        <div class="form-group">
                                                                            <asp:Label ID="Label55" runat="server" Text="Place of Death:"></asp:Label>
                                                                            <asp:TextBox ID="H_PlaceDeath" class="form-control" runat="server"></asp:TextBox>
                                                                        </div>
                                                                    </div>
                                                                    <%--<div class="col-md-8">
                                                                        <div class="form-group">
                                                                            <asp:Label ID="Label56" runat="server" Text="Cause of Death(Optional):"></asp:Label>
                                                                            <asp:TextBox ID="H_Cause1" class="form-control" runat="server"></asp:TextBox>
                                                                            <asp:TextBox ID="H_Cause2" class="form-control" runat="server"></asp:TextBox>
                                                                        </div>
                                                                    </div>--%>
                                                                </div>
                                                            </div>
                                                            <br />
                                                            <div class="header">
                                                                <asp:Label ID="Label57" runat="server" Text="Address of Place of Death" ForeColor="Black"></asp:Label>
                                                            </div>
                                                            <div class="content">
                                                                <div class="form-group row">
                                                                    <div class="col-md-2">
                                                                        <div class="form-group">
                                                                            <asp:Label ID="Label58" runat="server" Text="House No.:"></asp:Label>
                                                                            <asp:TextBox ID="H_HouseNo" class="form-control" MaxLength="35" runat="server" placeholder="House Number"></asp:TextBox>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-md-8">
                                                                        <div class="form-group">
                                                                            <asp:Label ID="Label59" runat="server" Text="Street:"></asp:Label>
                                                                            <asp:TextBox ID="H_Street" class="form-control" runat="server"></asp:TextBox>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-md-2">
                                                                        <div class="form-group">
                                                                            <asp:Label ID="Label60" runat="server" Text="Form 17 Req?:"></asp:Label>
                                                                            <%--<asp:TextBox ID="Form17" class="form-control" runat="server"></asp:TextBox>--%>
                                                                            &nbsp;
                                                                            <asp:DropDownList ID="H_Printed" runat="server" class="form-control" AutoPostBack="true">
                                                                                <asp:ListItem Text="No" Value="No"></asp:ListItem>
                                                                                <asp:ListItem Text="Yes" Value="Yes"></asp:ListItem>
                                                                            </asp:DropDownList>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="form-group row">
                                                                    <div class="col-md-4">
                                                                        <div class="form-group">
                                                                            <asp:Label ID="Label61" runat="server" Text="Unit/Apt:"></asp:Label>
                                                                            <asp:TextBox ID="H_Unit" class="form-control" runat="server"></asp:TextBox>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-md-4">
                                                                        <div class="form-group">
                                                                            <asp:Label ID="Label62" runat="server" Text="City:"></asp:Label>
                                                                            <asp:TextBox ID="H_City" class="form-control" runat="server"></asp:TextBox>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-md-4">
                                                                        <div class="form-group">
                                                                            <asp:Label ID="Label63" runat="server" Text="Province:"></asp:Label>
                                                                            <asp:TextBox ID="H_Province" class="form-control" runat="server"></asp:TextBox>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="form-group row">
                                                                    <div class="col-md-4">
                                                                        <div class="form-group">
                                                                            <asp:Label ID="Label64" runat="server" Text="Country:"></asp:Label>
                                                                            <asp:TextBox ID="H_Country" class="form-control" runat="server"></asp:TextBox>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-md-4">
                                                                        <div class="form-group">
                                                                            <asp:Label ID="Label65" runat="server" Text="Postal Code:"></asp:Label>
                                                                            <asp:TextBox ID="H_PostalCode" class="form-control" runat="server"></asp:TextBox>
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
                                                                                        Style="max-height: 150px; max-width: 50%; overflow: scroll; display: none; visibility: hidden;">
                                                                                        <!-- GridView  goes here -->

                                                                                        <asp:GridView ID="H_FuneralGrid" runat="server" Font-Size="Small"
                                                                                            AutoGenerateColumns="false" OnRowDataBound="H_FuneralGrid_RowDataBound" OnSelectedIndexChanged="H_FuneralGrid_SelectedIndexChanged">

                                                                                            <Columns>
                                                                                                <asp:BoundField DataField="F_Reg_Customer_Cnt"
                                                                                                    HeaderStyle-CssClass="invisibleColumn"
                                                                                                    ItemStyle-CssClass="invisibleColumn" />
                                                                                                <asp:BoundField DataField="F_Reg_Short_Name"
                                                                                                    HeaderText="Short Name" HeaderStyle-CssClass="invisibleColumn"
                                                                                                    ItemStyle-CssClass="invisibleColumn" />
                                                                                                <asp:BoundField DataField="F_Reg_Funeral_Home"
                                                                                                    HeaderText="Funeral Home" HeaderStyle-CssClass="invisibleColumn"
                                                                                                    ItemStyle-CssClass="invisibleColumn" />
                                                                                                <asp:BoundField DataField="F_Reg_St_Name"
                                                                                                    HeaderText="Street Name" HeaderStyle-CssClass="invisibleColumn"
                                                                                                    ItemStyle-CssClass="invisibleColumn" />
                                                                                                <asp:BoundField DataField="F_Reg_House_No"
                                                                                                    HeaderStyle-CssClass="invisibleColumn"
                                                                                                    ItemStyle-CssClass="invisibleColumn" />
                                                                                                <asp:BoundField DataField="F_Reg_City"
                                                                                                    HeaderStyle-CssClass="invisibleColumn"
                                                                                                    ItemStyle-CssClass="invisibleColumn" />
                                                                                                <asp:BoundField DataField="F_Reg_Prov"
                                                                                                    HeaderStyle-CssClass="invisibleColumn"
                                                                                                    ItemStyle-CssClass="invisibleColumn" />
                                                                                                <asp:BoundField DataField="F_Reg_PC"
                                                                                                    HeaderStyle-CssClass="invisibleColumn"
                                                                                                    ItemStyle-CssClass="invisibleColumn" />
                                                                                                <asp:BoundField DataField="F_Reg_Unit"
                                                                                                    HeaderStyle-CssClass="invisibleColumn"
                                                                                                    ItemStyle-CssClass="invisibleColumn" />
                                                                                                <asp:TemplateField HeaderText="Short Name">
                                                                                                    <ItemTemplate>
                                                                                                        <asp:Label ID="Label76" runat="server" Text='<%# Eval("F_Reg_Short_Name") %>' />
                                                                                                    </ItemTemplate>
                                                                                                </asp:TemplateField>
                                                                                                <asp:TemplateField HeaderText="Funeral Home">
                                                                                                    <ItemTemplate>
                                                                                                        <asp:Label ID="Label76" runat="server" Text='<%# Eval("F_Reg_Funeral_Home")%>' />
                                                                                                    </ItemTemplate>
                                                                                                </asp:TemplateField>
                                                                                                <asp:TemplateField HeaderText="Street Name">
                                                                                                    <ItemTemplate>
                                                                                                        <asp:Label ID="Label76" runat="server" Text='<%# Eval("F_Reg_House_No") + " "+ Eval("F_Reg_St_Name") %>' />
                                                                                                    </ItemTemplate>
                                                                                                </asp:TemplateField>

                                                                                                <asp:TemplateField HeaderText="Unit" HeaderStyle-CssClass="invisibleColumn"
                                                                                                    ItemStyle-CssClass="invisibleColumn">
                                                                                                    <ItemTemplate>
                                                                                                        <asp:Label ID="Label76" runat="server" Text='<%# Eval("F_Reg_Unit") %>' />
                                                                                                    </ItemTemplate>
                                                                                                </asp:TemplateField>
                                                                                                <asp:TemplateField HeaderStyle-CssClass="invisibleColumn"
                                                                                                    ItemStyle-CssClass="invisibleColumn">
                                                                                                    <ItemTemplate>
                                                                                                        <asp:Label ID="Label76" runat="server" Text='<%# Eval("F_Reg_City")  + ", "+ Eval("F_Reg_Prov")+ " "+ Eval("F_Reg_PC") %>' />
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
                                                                                    <asp:TextBox ID="H_F_Name" runat="server" Style="height: calc(1.5em + .75rem + 2px); padding: .375rem .75rem; font-size: 1rem; font-weight: 400; line-height: 1.5; color: #495057; background-color: #fff; background-clip: padding-box; border: 1px solid #ced4da; border-radius: .25rem; transition: border-color .15s ease-in-out,box-shadow .15s ease-in-out; width: 20%;"></asp:TextBox>
                                                                                    <asp:TextBox ID="H_F_Street" runat="server" Style="height: calc(1.5em + .75rem + 2px); padding: .375rem .75rem; font-size: 1rem; font-weight: 400; line-height: 1.5; color: #495057; background-color: #fff; background-clip: padding-box; border: 1px solid #ced4da; border-radius: .25rem; transition: border-color .15s ease-in-out,box-shadow .15s ease-in-out; width: 25%;"></asp:TextBox>
                                                                                    <asp:TextBox ID="H_F_Unit" runat="server" Style="height: calc(1.5em + .75rem + 2px); padding: .375rem .75rem; font-size: 1rem; font-weight: 400; line-height: 1.5; color: #495057; background-color: #fff; background-clip: padding-box; border: 1px solid #ced4da; border-radius: .25rem; transition: border-color .15s ease-in-out,box-shadow .15s ease-in-out; width: 15%;"></asp:TextBox>
                                                                                    <asp:TextBox ID="H_F_CityProv" runat="server" Style="height: calc(1.5em + .75rem + 2px); padding: .375rem .75rem; font-size: 1rem; font-weight: 400; line-height: 1.5; color: #495057; background-color: #fff; background-clip: padding-box; border: 1px solid #ced4da; border-radius: .25rem; transition: border-color .15s ease-in-out,box-shadow .15s ease-in-out; width: 30%;"></asp:TextBox>

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
                                                                                        Style="max-height: 150px; max-width: 50%; overflow: scroll; display: none; visibility: hidden;">
                                                                                        <!-- GridView  goes here -->

                                                                                        <asp:GridView ID="H_DoctorGrid" runat="server" Font-Size="Small"
                                                                                            AutoGenerateColumns="false" OnRowDataBound="H_DoctorGrid_RowDataBound" OnSelectedIndexChanged="H_DoctorGrid_SelectedIndexChanged">

                                                                                            <Columns>
                                                                                                <asp:BoundField DataField="D_Reg_DR_No"
                                                                                                    HeaderStyle-CssClass="invisibleColumn"
                                                                                                    ItemStyle-CssClass="invisibleColumn" />
                                                                                                <asp:BoundField DataField="D_Short_Name"
                                                                                                    HeaderText="Short Name" HeaderStyle-CssClass="invisibleColumn"
                                                                                                    ItemStyle-CssClass="invisibleColumn" />
                                                                                                <asp:BoundField DataField="D_Reg_Last_Name"
                                                                                                    HeaderText="Funeral Home" HeaderStyle-CssClass="invisibleColumn"
                                                                                                    ItemStyle-CssClass="invisibleColumn" />
                                                                                                <asp:BoundField DataField="D_Reg_First_Name"
                                                                                                    HeaderText="Street Name" HeaderStyle-CssClass="invisibleColumn"
                                                                                                    ItemStyle-CssClass="invisibleColumn" />
                                                                                                <asp:BoundField DataField="D_Reg_House_No"
                                                                                                    HeaderStyle-CssClass="invisibleColumn"
                                                                                                    ItemStyle-CssClass="invisibleColumn" />
                                                                                                <asp:BoundField DataField="D_Reg_St_Name"
                                                                                                    HeaderStyle-CssClass="invisibleColumn"
                                                                                                    ItemStyle-CssClass="invisibleColumn" />
                                                                                                <asp:BoundField DataField="D_Reg_City"
                                                                                                    HeaderStyle-CssClass="invisibleColumn"
                                                                                                    ItemStyle-CssClass="invisibleColumn" />
                                                                                                <asp:BoundField DataField="D_Reg_Prov"
                                                                                                    HeaderStyle-CssClass="invisibleColumn"
                                                                                                    ItemStyle-CssClass="invisibleColumn" />
                                                                                                <asp:BoundField DataField="D_Reg_PC"
                                                                                                    HeaderStyle-CssClass="invisibleColumn"
                                                                                                    ItemStyle-CssClass="invisibleColumn" />
                                                                                                <asp:BoundField DataField="D_Reg_Unit"
                                                                                                    HeaderStyle-CssClass="invisibleColumn"
                                                                                                    ItemStyle-CssClass="invisibleColumn" />
                                                                                                <asp:TemplateField HeaderText="Short Name">
                                                                                                    <ItemTemplate>
                                                                                                        <asp:Label ID="Label76" runat="server" Text='<%# Eval("D_Short_Name") %>' />
                                                                                                    </ItemTemplate>
                                                                                                </asp:TemplateField>
                                                                                                <asp:TemplateField HeaderText="Doctor Name">
                                                                                                    <ItemTemplate>
                                                                                                        <asp:Label ID="Label76" runat="server" Text='<%# Eval("D_Reg_Last_Name") + ", "+ Eval("D_Reg_First_Name") %>' />
                                                                                                    </ItemTemplate>
                                                                                                </asp:TemplateField>
                                                                                                <asp:TemplateField HeaderText="Street Name">
                                                                                                    <ItemTemplate>
                                                                                                        <asp:Label ID="Label76" runat="server" Text='<%# Eval("D_Reg_House_No") + " "+ Eval("D_Reg_St_Name") %>' />
                                                                                                    </ItemTemplate>
                                                                                                </asp:TemplateField>

                                                                                                <asp:TemplateField HeaderText="Unit" HeaderStyle-CssClass="invisibleColumn"
                                                                                                    ItemStyle-CssClass="invisibleColumn">
                                                                                                    <ItemTemplate>
                                                                                                        <asp:Label ID="Label76" runat="server" Text='<%# Eval("D_Reg_Unit") %>' />
                                                                                                    </ItemTemplate>
                                                                                                </asp:TemplateField>
                                                                                                <asp:TemplateField HeaderStyle-CssClass="invisibleColumn"
                                                                                                    ItemStyle-CssClass="invisibleColumn">
                                                                                                    <ItemTemplate>
                                                                                                        <asp:Label ID="Label76" runat="server" Text='<%# Eval("D_Reg_City")  + ", "+ Eval("D_Reg_Prov")+ " "+ Eval("D_Reg_PC") %>' />
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
                                                                                    <asp:TextBox ID="H_D_Name" runat="server" Style="height: calc(1.5em + .75rem + 2px); padding: .375rem .75rem; font-size: 1rem; font-weight: 400; line-height: 1.5; color: #495057; background-color: #fff; background-clip: padding-box; border: 1px solid #ced4da; border-radius: .25rem; transition: border-color .15s ease-in-out,box-shadow .15s ease-in-out; width: 20%;"></asp:TextBox>
                                                                                    <asp:TextBox ID="H_D_Street" runat="server" Style="height: calc(1.5em + .75rem + 2px); padding: .375rem .75rem; font-size: 1rem; font-weight: 400; line-height: 1.5; color: #495057; background-color: #fff; background-clip: padding-box; border: 1px solid #ced4da; border-radius: .25rem; transition: border-color .15s ease-in-out,box-shadow .15s ease-in-out; width: 25%;"></asp:TextBox>
                                                                                    <asp:TextBox ID="H_D_Unit" runat="server" Style="height: calc(1.5em + .75rem + 2px); padding: .375rem .75rem; font-size: 1rem; font-weight: 400; line-height: 1.5; color: #495057; background-color: #fff; background-clip: padding-box; border: 1px solid #ced4da; border-radius: .25rem; transition: border-color .15s ease-in-out,box-shadow .15s ease-in-out; width: 15%;"></asp:TextBox>
                                                                                    <asp:TextBox ID="H_D_CityProv" runat="server" Style="height: calc(1.5em + .75rem + 2px); padding: .375rem .75rem; font-size: 1rem; font-weight: 400; line-height: 1.5; color: #495057; background-color: #fff; background-clip: padding-box; border: 1px solid #ced4da; border-radius: .25rem; transition: border-color .15s ease-in-out,box-shadow .15s ease-in-out; width: 30%;"></asp:TextBox>

                                                                                </ContentTemplate>

                                                                            </asp:UpdatePanel>
                                                                        </div>
                                                                    </div>

                                                                </div>

                                                            </div>
                                                            <br />
                                                            <div class="header">
                                                                <asp:Label ID="Label77" runat="server" Text=" Address of Deceased" ForeColor="Black"></asp:Label>
                                                            </div>
                                                            <div class="content">
                                                                <div class="form-group row">
                                                                    <div class="col-md-4">
                                                                        <div class="form-group">
                                                                            <asp:RadioButton ID="RadioButton1" runat="server" Text="Address Same" ClientIDMode="Static" />
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="form-group row">
                                                                    <div class="col-md-2">
                                                                        <div class="form-group">
                                                                            <asp:Label ID="Label78" runat="server" Text="House No.:"></asp:Label>
                                                                            <asp:TextBox ID="H_DHouseNo" class="form-control" MaxLength="35" runat="server" placeholder="House Number"></asp:TextBox>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-md-6">
                                                                        <div class="form-group">
                                                                            <asp:Label ID="Label79" runat="server" Text="Street:"></asp:Label>
                                                                            <asp:TextBox ID="H_DStreet" class="form-control" runat="server"></asp:TextBox>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-md-4">
                                                                        <div class="form-group">
                                                                            <asp:Label ID="Label80" runat="server" Text="Unit/Apt:"></asp:Label>
                                                                            <asp:TextBox ID="H_DUnit" class="form-control" runat="server"></asp:TextBox>
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                                <div class="form-group row">
                                                                    <div class="col-md-4">
                                                                        <div class="form-group">
                                                                            <asp:Label ID="Label81" runat="server" Text="City:"></asp:Label>
                                                                            <asp:TextBox ID="H_DCity" class="form-control" runat="server"></asp:TextBox>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-md-4">
                                                                        <div class="form-group">
                                                                            <asp:Label ID="Label82" runat="server" Text="Province:"></asp:Label>
                                                                            <asp:TextBox ID="H_DProvince" class="form-control" runat="server"></asp:TextBox>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="form-group row">
                                                                    <div class="col-md-4">
                                                                        <div class="form-group">
                                                                            <asp:Label ID="Label83" runat="server" Text="Country:"></asp:Label>
                                                                            <asp:TextBox ID="H_DCountry" class="form-control" runat="server"></asp:TextBox>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-md-4">
                                                                        <div class="form-group">
                                                                            <asp:Label ID="Label84" runat="server" Text="Postal Code:"></asp:Label>
                                                                            <asp:TextBox ID="H_DPostalCode" class="form-control" runat="server"></asp:TextBox>
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
            <div class="row" style="padding-top: 15px;">
                <div class="col-md-12">
                    <div class="form-group" align="center">

                        <asp:LinkButton ID="SubmitBtn" runat="server" CssClass="btn btn-small btn-primary " OnClick="SubmitBtn_Click">
                            <i class="fa fa-save"></i>&nbsp;Save</asp:LinkButton>
                    </div>
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

        //function notbillble() {
        //    // alert("yes");
        //    document.getElementById("Billable").checked = false;
        //    $("#Billable").prop("checked,false");
        //}
        //function billble() {
        //    //alert("yes");
        //}
        function showMyDialog(msg, alertype) {
            // alert(alertype);
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
