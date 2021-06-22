<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm2.aspx.cs" Inherits="Vitals.WebForm2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>


    <script type="text/javascript">
        $(document).ready(function () {
            var selectedTab = $("#<%=hfTab.ClientID%>");;
            var tabId = selectedTab.val() != "" ? selectedTab.val() : "tab1";
            $('#dvTab a[href="#' + tabId + '"]').tab('show');
            $("#dvTab a").click(function () {
                selectedTab.val($(this).attr("href").substring(1));
            });
        });
    </script>
</head>
<body>
    <form id="form1" runat="server" >
        <%--    <div>
              <!-- Panel starts -->
            <div class="panel panel-default" style="width: 400px; padding: 5px; margin: 5px">
                <div id="dvTab">
                    <!-- Navigation Tabs starts -->
                    <ul class="nav nav-tabs" role="tablist">
                        <li><a href="#tab1" aria-controls="tab1" role="tab" data-toggle="tab">Tab1
                        </a></li>
                        <li><a href="#tab2" aria-controls="tab2" role="tab" data-toggle="tab">Tab2</a></li>
                        <li><a href="#tab3" aria-controls="tab3" role="tab" data-toggle="tab">Tab3</a></li>
                    </ul>
                    <!-- Navigation Tabs ends -->
                    <!-- Tab Panes starts -->
                    <div class="tab-content" style="padding-top: 10px">
                        <div role="tabpanel" class="tab-pane active" id="tab1">
                            You are in Tab1
                        </div>
                        <div role="tabpanel" class="tab-pane" id="tab2">
                            You are in Tab2
                        </div>
                        <div role="tabpanel" class="tab-pane" id="tab3">
                            You are in Tab3
                        </div>
                    </div>
                    <!-- Tab Panes ends -->
                </div>
                <br />
                <asp:Button ID="btnSubmit" Text="Submit" runat="server" OnClick="btnSubmit_Click"  CssClass="btn btn-primary" />
                <asp:Button ID="btnSelectTab2" Text="Select Tab2" runat="server" OnClick="btnSelectTab2_Click" CssClass="btn btn-primary" />
                <asp:Button ID="btnSelectTab3" Text="Select Tab3" runat="server" OnClick="btnSelectTab3_Click" CssClass="btn btn-primary" />
                <asp:HiddenField ID="hfTab" runat="server" />
            </div>
            <!-- Panel ends -->
        </div>--%>
        <div class="container">
        <div class="row" style="padding-top: 15%;padding-left:50px;">
            <div class="panel panel-default" style="width: 800px; padding: 5px; margin: 5px;" >

                <div id="dvTab">
                    <ul class="nav nav-tabs" role="tablist" style="margin-bottom: -15px; margin-left: 30px; border-bottom: 0;">
                        <!-- add data-toggle attribute to the anchors -->
                        <li>
                            <a data-toggle="tab" aria-controls="tab1" href="#tab1">Current</a>

                        </li>
                        <li>
                            <a data-toggle="tab" aria-controls="tab2" href="#tab2">History</a>

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
        </div>
            </div>
    </form>

</body>
</html>
