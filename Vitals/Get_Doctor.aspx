<%@ Page Title="" Language="C#" MasterPageFile="~/Vitals.Master" AutoEventWireup="true" CodeBehind="Get_Doctor.aspx.cs" Inherits="Vitals.Get_Doctor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        body {
            width: 100%;
            margin: 5px;
        }

        .table-condensed tr th {
            border: 0px solid #6e7bd9;
            color: white;
            background-color: #6e7bd9;
        }

        .table-condensed, .table-condensed tr td {
            border: 0px solid #000;
        }

        tr:nth-child(even) {
            background: #f8f7ff
        }

        tr:nth-child(odd) {
            background: #fff;
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

    <script type="text/javascript">
      <%-- $(document).ready(function () {

            var selectedTab = $("#<%=hfTab.ClientID%>");;
            var tabId = selectedTab.val() != "" ? selectedTab.val() : "tab1";
            $('#dvTab a[href="#' + tabId + '"]').tab('show');
            $("#dvTab a").click(function () {
                selectedTab.val($(this).attr("href").substring(1));
               
            });
        });--%>
        window.onload = function () {
            var selectedTab = $("#<%=hfTab.ClientID%>");
            var tabId = selectedTab.val() != "" ? selectedTab.val() : "tab1";
            $('#dvTab a[href="#' + tabId + '"]').tab('show');
            $("#dvTab a").click(function () {
                selectedTab.val($(this).attr("href").substring(1));
                alert("");
            });

        }
    </script>
    <div class="container">
        <div class="row" style="padding-top: 15%;">
            <div class="col-md-6">
                <div class="form-group row float-left" style="margin-left: 35px;">
                    <div class="form-group">
                        <asp:LinkButton ID="Backbtn" runat="server" CssClass="btn btn-small btn-primary" Style="background-color: gray; border-color: gray;"
                            Visible="false">
                            <i class="fa fa-arrow-left"></i>&nbsp;Back</asp:LinkButton>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="form-group row float-right" style="margin-right: 35px;">
                    <div class="form-group">
                        <asp:LinkButton ID="SubmitBtn" runat="server" CssClass="btn btn-small btn-primary">
                            <i class="fa fa-save"></i>&nbsp;Save</asp:LinkButton>
                        <asp:LinkButton ID="EditBtn" runat="server" CssClass="btn btn-small btn-primary" Visible="false">
                            <i class="fa fa-edit"></i>&nbsp;Edit</asp:LinkButton>
                        <asp:LinkButton ID="CancelBtn" runat="server" CssClass="btn btn-small btn-primary" Visible="false">
                            <i class="fa fa-remove"></i>&nbsp;Cancel</asp:LinkButton>
                    </div>
                </div>
            </div>
        </div>
        <div id="dvTab">
            <ul class="nav nav-tabs" role="tablist" style="margin-bottom: -15px; margin-left: 30px; border-bottom: 0;">
                <!-- add data-toggle attribute to the anchors -->
                <li class="nav-item">
                    <a data-toggle="tab" aria-controls="tab1" class="nav-link active" href="#tab1">Current</a>

                </li>
                <li class="nav-item">
                    <a data-toggle="tab" aria-controls="tab2" class="nav-link " href="#tab2">History</a>

                </li>
            </ul>
            <div class="tab-content">
                <div id="tab1" class="tab-pane active" role="tabpanel">
                    <div class="row" style="margin-bottom: 25px;">
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
                                            <asp:TextBox ID="TextBox1" class="form-control" runat="server" placeholder="Search here....."></asp:TextBox>
                                            <div class="input-group-prepend">
                                                <asp:Button ID="Button1" runat="server" Text="Search" Class="btn btn-primary" BackColor="Gray" BorderColor="Gray" />
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
                <div id="tab2" class="tab-pane" role="tabpanel">
                    <div class="row" style="margin-bottom: 25px;">
                        <div class="col-md-12">
                            <div align="center" style="width: 100%; height: 40%; padding: 15px 20px;">
                                <div class="form-head form-group" style="background-color: #777; color: white; padding: 10px; width: 100%; border: none; text-align: center; outline: none; font-size: 15px;">
                                    <h3>Doctors</h3>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div style="margin-top: -20px; width: 100%; border: thin; border-color: black; padding: 15px 20px; color: #005595; font-family: Arial; font-size: 16px;">
                                <%-- <asp:GridView ID="GridView1" runat="server"></asp:GridView>--%>
                                <div class="form-group row">
                                    <div class="col-md-12">
                                        <div class="input-group">
                                            <asp:TextBox ID="Searchtext" class="form-control" runat="server" placeholder="Search here....."></asp:TextBox>
                                            <div class="input-group-prepend">

                                                <asp:Button ID="Search" runat="server" Text="Search" Class="btn btn-primary" BackColor="Gray" BorderColor="Gray" OnClick="Search_Click" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <%--<asp:GridView runat="server" ID="datagrid1" UseAccessibleHeader="true" CssClass="table table-condensed table-hover" Width="50%" />--%>

                                            <asp:GridView ID="GridView1" runat="server" BorderStyle="None" GridLines="Horizontal" BorderColor="LightGray" AutoGenerateColumns="false"
                                                PageIndex="10" AllowPaging="True" AllowCustomPaging="True" CellPadding="3"
                                                CellSpacing="2" Width="100%" HeaderStyle-CssClass="bg-primary text-white" DataSourceID="SearchDoctor">
                                                <%--DataSourceID="SearchDoctor"--%>
                                                <Columns>
                                                    <asp:TemplateField HeaderText="Dr.Short Name">
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label4" runat="server" Text='<%# Eval("D_Short_Name") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Doctor Name">
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label4" runat="server" Text='<%# Eval("D_Reg_Last_Name") %>'></asp:Label>&nbsp;
                                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("D_Reg_First_Name") %>'></asp:Label>&nbsp;
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Street Address">
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label4" runat="server" Text='<%# Eval("D_Reg_St_Name") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                    <%--<asp:BoundField DataField="Dr.Short Name"
                                            HeaderText="Short Name" InsertVisible="False"
                                            ReadOnly="True" SortExpression="D_Short_Name" />
                                        <asp:BoundField DataField="D_Reg_Last_Name"
                                            HeaderText="Last Name" SortExpression="D_Reg_Last_Name" />
                                        <asp:BoundField DataField="Doctor Name"
                                            HeaderText="First Name" SortExpression="D_Reg_First_Name" />--%>

                                                    <asp:ButtonField ButtonType="Button" Text="ViewDetails" CommandName="ViewDetails"
                                                        ControlStyle-BackColor="#507CD1" ControlStyle-ForeColor="White" ControlStyle-Font-Size="15px" />
                                                    <asp:ButtonField ButtonType="Button" Text="Edit" CommandName="edit"
                                                        ControlStyle-BackColor="#005595" ControlStyle-ForeColor="White" ControlStyle-Font-Size="15px" />
                                                    <asp:ButtonField ButtonType="Button" Text="Delete" CommandName="Delete"
                                                        ControlStyle-BackColor="#005595" ControlStyle-ForeColor="White" ControlStyle-Font-Size="15px" />
                                                    <%--<asp:CommandField ShowDeleteButton="True"
                                            ShowEditButton="True" />--%>
                                                    <%--<asp:TemplateField>
                                            <ItemTemplate>
                                                <asp:Button ID="Button1" runat="server" Text="Edit" />
                                            </ItemTemplate>
                                        </asp:TemplateField>--%>
                                                </Columns>
                                                <HeaderStyle BackColor="LightCyan"
                                                    ForeColor="MediumBlue" />

                                                <FooterStyle BackColor="LightCyan"
                                                    ForeColor="MediumBlue" />
                                            </asp:GridView>
                                            <%--<asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="GetDoctors" TypeName="DoctorsBLL"></asp:ObjectDataSource>--%>
                                            <asp:SqlDataSource ID="SearchDoctor"
                                                SelectCommand="SearchDoctors" SelectCommandType="StoredProcedure"
                                                ConnectionString="<%$ ConnectionStrings:Vitals%>"
                                                runat="server">
                                                <SelectParameters>
                                                    <asp:ControlParameter ControlID="Searchtext" Name="Searchstr" PropertyName="Text" Type="String"
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
                <asp:HiddenField ID="hfTab" runat="server" />
            </div>
        </div>
    </div>
</asp:Content>
