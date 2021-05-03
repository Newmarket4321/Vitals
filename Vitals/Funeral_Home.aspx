<%@ Page Title="" Language="C#" MasterPageFile="~/Vitals.Master" AutoEventWireup="true" CodeBehind="Funeral_Home.aspx.cs" Inherits="Vitals.Funeral_Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
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
                if (selectedTab.val() == "tab2")
                {
                
                    document.getElementById("<%=SubmitBtn.ClientID%>").style.display = "none";
                }
                if (selectedTab.val() == "tab1")
                {
                  
                  document.getElementById("<%=EditBtn.ClientID%>").style.display = "none";
                    document.getElementById("<%=SubmitBtn.ClientID%>").style.display = "block";
                }
              //  alert(document.getElementById("<%=hfTab.ClientID%>").val);
            });

        }
       
        function currentclick() {
            window.location.href="Funeral_Home.aspx";
        }
   //     function Databound() {     
   //      $.ajax({
   //      type: "POST",
   //      url: 'Doctors.aspx/databound',
   //      data: "",
   //      contentType: "application/json; charset=utf-8",
   //      dataType: "json",
   //          success: function (msg) {
   //              alert("success");
   //      },
   //          error: function (e) {
   //              alert("Something Wrong.");
   //      }
   //  });
   //}
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



        body {
            width: 100%;
            margin: 5px;
        }

        .table-condensed tr th {
            border: 0px solid #6e7bd9;
            color: black;
            background-color: white;
            font-family: Arial sans-serif-bold;
            font-size: 12pt;
        }

        .table-condensed, .table-condensed tr td {
            border: 0px solid #000;
            vertical-align:middle;
        }

        tr:nth-child(even) {
            background: #f8f7ff
        }

        tr:nth-child(odd) {
            background: #fff;
        }
    </style>
    <div class="container">
        <div class="row" style="padding-top: 10%;">
            <div class="col-md-6">
                <div class="form-group row float-left" style="margin-left: 35px;">
                    <div class="form-group">
                        <asp:LinkButton ID="Backbtn" runat="server" CssClass="btn btn-small btn-primary" Style="background-color: gray; border-color: gray;"
                            Visible="false" OnClick="Backbtn_Click">
                            <i class="fa fa-arrow-left"></i>&nbsp;Back</asp:LinkButton>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="form-group row float-right" style="margin-right: 35px;">
                    <div class="form-group">
                        <asp:LinkButton ID="EditBtn" runat="server" CssClass="btn btn-small btn-primary" Visible="false" OnClick="EditBtn_Click">
                            <i class="fa fa-edit"></i>&nbsp;Edit</asp:LinkButton>
                        <asp:LinkButton ID="CancelBtn" runat="server" CssClass="btn btn-small btn-primary" Visible="false" OnClick="CancelBtn_Click">
                            <i class="fa fa-remove"></i>&nbsp;Cancel</asp:LinkButton>
                    </div>
                </div>
            </div>
        </div>
        <div id="dvTab" style="border-style: groove;">
            <ul class="nav nav-tabs" role="tablist" style="margin-bottom: -15px; margin-left: 20px; border-bottom: 0;">
                <!-- add data-toggle attribute to the anchors -->
                <li class="nav-item" onClick="currentclick();">
                    <a data-toggle="tab" aria-controls="tab1" class="nav-link active" href="#tab1">Current</a>
                </li>
                <li class="nav-item" >
                    <a data-toggle="tab" aria-controls="tab2" class="nav-link " href="#tab2" >History</a>
                </li>
            </ul>
            <div class="tab-content">
                <div id="tab1" class="tab-pane active" role="tabpanel">
                    <div class="row" style="margin-bottom: 20px;">
                        <div class="col-md-12">
                            <div align="center" style="width: 100%; height: 40%; padding: 15px 20px;">
                                <div class="form-head form-group" style="background-color: #777; color: white; padding: 10px; width: 100%; border: none; text-align: center; outline: none; font-size: 15px;">
                                    <h3>Funeral Home</h3>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <%--<div style="margin-top: -20px; width: 100%; border: thin; border-color: black; padding: 15px 20px; color: #005595; font-family: Arial; font-size: 16px;">--%>
                            <asp:Label ID="lblMsg" runat="server" EnableViewState="False" ForeColor="Red"></asp:Label>
                            <div class="col-md-12">
                                <div id="Section1">
                                    <asp:Label ID="Label1" runat="server" EnableViewState="False" ForeColor="Red"></asp:Label>
                                    <div style="margin-top: -20px; width: 100%; border: thin; border-color: black; padding: 15px 20px; color: #005595; font-family: Arial; font-size: 16px;">

                                        <div class="form-group row">
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <asp:Label ID="Label10" runat="server" Text="Counter:"></asp:Label>
                                                    <asp:TextBox ID="C_Counter" class="form-control" runat="server" placeholder="Counter"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <asp:Label ID="Label11" runat="server" Text="Short Name:"></asp:Label>
                                                    <asp:TextBox ID="C_Shortname" class="form-control" runat="server" placeholder="Short Name"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <asp:Label ID="Label12" runat="server" Text="A/R Acct No."></asp:Label>
                                                    <asp:TextBox ID="C_Acctno" class="form-control" runat="server" placeholder="A/R Acct No"></asp:TextBox>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <asp:Label ID="Label13" runat="server" Text="Funeral Home:"></asp:Label>
                                                    <asp:TextBox ID="C_FuneralHome" class="form-control" runat="server" placeholder="Funeral Home"></asp:TextBox>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-group row">
                                            <div class="col-md-3">
                                                <div class="form-group">
                                                    <asp:Label ID="Label14" runat="server" Text="House No:"></asp:Label>
                                                    <asp:TextBox ID="C_House_No" class="form-control" runat="server" placeholder="House No"></asp:TextBox>
                                                </div>
                                            </div>
                                          <%--  <div class="col-md-3">
                                                <div class="form-group">
                                                    <asp:Label ID="Label15" runat="server" Text="House Qual No:"></asp:Label>
                                                    <asp:TextBox ID="" class="form-control" runat="server" placeholder="House Qual No"></asp:TextBox>
                                                </div>
                                            </div>--%>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <asp:Label ID="Label19" runat="server" Text="Street Address:"></asp:Label>
                                                    <asp:TextBox ID="C_StrAdd" class="form-control" runat="server" placeholder="Street Address"></asp:TextBox>
                                                </div>
                                            </div>

                                        </div>
                                        <div class="form-group row">
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <asp:Label ID="Label20" runat="server" Text="Unit No.:"></asp:Label>
                                                    <asp:TextBox ID="C_Unitnum" class="form-control" runat="server" placeholder="Unit No."></asp:TextBox>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <asp:Label ID="Label21" runat="server" Text="City:"></asp:Label>
                                                    <asp:TextBox ID="C_City" class="form-control" runat="server" placeholder="City"> </asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <asp:Label ID="Label22" runat="server" Text="Province:"></asp:Label>
                                                    <asp:TextBox ID="C_Province" class="form-control" runat="server" placeholder="Province"></asp:TextBox>
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
                                                    <asp:Label ID="Label23" runat="server" Text="Postal Code:"></asp:Label>
                                                    <asp:TextBox ID="C_PostalCode" class="form-control" runat="server" placeholder="Postal Code"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <asp:Label ID="Label24" runat="server" Text="Country:"></asp:Label>
                                                    <asp:TextBox ID="C_Country" class="form-control" runat="server" placeholder="Country"></asp:TextBox>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </div>
                            <%--</div>--%>
                        </div>
                    </div>
                </div>
                <div id="tab2" class="tab-pane" role="tabpanel">
                    <div class="row" style="margin-bottom: 25px;">
                        <div class="col-md-12">
                            <div align="center" style="width: 100%; height: 40%; padding: 15px 20px;">
                                <div class="form-head form-group" style="background-color: #777; color: white; padding: 10px; width: 100%; border: none; text-align: center; outline: none; font-size: 15px;">
                                    <h3>Funeral Home</h3>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div style="margin-top: -20px; width: 100%; border: thin; border-color: black; padding: 15px 20px; color: #005595; font-family: Arial; font-size: 16px;">
                                <%-- <asp:GridView ID="GridView1" runat="server"></asp:GridView>--%>
                                <div class="form-group row">
                                    <div class="col-md-12">
                                        <div class="input-group">
                                            <asp:TextBox ID="SearcFuneralHome" class="form-control" runat="server" placeholder="Search here....."></asp:TextBox>
                                            
                                            <div class="input-group-prepend">

                                                <asp:Button ID="SearchFuneral" runat="server" Text="Search" Class="btn btn-primary" BackColor="Gray"
                                                    BorderColor="Gray" OnClick="SearchFuneral_Click" />
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
                                                    DataSourceID="SearcFuneral" CssClass="table table-condensed table-hover" Style="font-size: 12pt; font-family: arial;">
                                                    <Columns>
                                                        <asp:BoundField DataField="F_Reg_Customer_Cnt" HeaderText="ID" />
                                                        <asp:TemplateField HeaderText="Short Name">
                                                            <ItemTemplate>
                                                                <asp:Label ID="F_Reg_Short_Name" runat="server" Text='<%# Eval("F_Reg_Short_Name") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Funeral Home">
                                                            <ItemTemplate>
                                                                <asp:Label ID="F_Reg_Funeral_Home" runat="server" Text='<%# Eval("F_Reg_Funeral_Home") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>

                                                        <asp:ButtonField ButtonType="Button" Text="ViewDetails" CommandName="ViewDetails" ControlStyle-CssClass="btn btn-primary"
                                                            ControlStyle-BackColor="#507CD1" ControlStyle-ForeColor="White" ControlStyle-Font-Size="15px"  />
                                                        <asp:ButtonField ButtonType="Button" Text="Edit" CommandName="Edit" ControlStyle-CssClass="btn btn-primary"
                                                            ControlStyle-BackColor="#005595" ControlStyle-ForeColor="White" ControlStyle-Font-Size="15px" />

                                                        <%--<asp:ButtonField ButtonType="Button" Text="Delete" CommandName="Delete"
                                                        ControlStyle-BackColor="#005595" ControlStyle-ForeColor="White" ControlStyle-Font-Size="15px" />--%>
                                                    </Columns>

                                                </asp:GridView>

                                            </div>
                                            <asp:SqlDataSource ID="SearcFuneral"
                                                SelectCommand="SearcFuneralHome" SelectCommandType="StoredProcedure"
                                                ConnectionString="<%$ ConnectionStrings:Vitals%>"
                                                runat="server">
                                                <SelectParameters>
                                                    <asp:ControlParameter ControlID="SearcFuneralHome" Name="Searchstr" PropertyName="Text" Type="String"
                                                        ConvertEmptyStringToNull="true" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>

                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group row">
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <div id="Section2" style="display: none" runat="server">
                                            <div style="margin-top: -20px; width: 100%; border: thin; border-color: black; padding: 15px 20px; color: #005595; font-family: Arial; font-size: 16px;">

                                                <div class="form-group row">
                                                    <div class="col-md-4">
                                                        <div class="form-group">
                                                            <asp:Label ID="cnt" runat="server" Text="Counter:"></asp:Label>
                                                            <asp:TextBox ID="Counter" class="form-control" runat="server" placeholder="Counter"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <asp:Label ID="Label2" runat="server" Text="Short Name:"></asp:Label>
                                                            <asp:TextBox ID="Shortname" class="form-control" runat="server" placeholder="Short Name"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <asp:Label ID="Label3" runat="server" Text="A/R Acct No."></asp:Label>
                                                            <asp:TextBox ID="Acctno" class="form-control" runat="server" placeholder="A/R Acct No"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <div class="col-md-12">
                                                        <div class="form-group">
                                                            <asp:Label ID="Label4" runat="server" Text="Funeral Home:"></asp:Label>
                                                            <asp:TextBox ID="FuneralHome" class="form-control" runat="server" placeholder="Funeral Home"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="form-group row">
                                                    <div class="col-md-3">
                                                        <div class="form-group">
                                                            <asp:Label ID="Label7" runat="server" Text="House No:"></asp:Label>
                                                            <asp:TextBox ID="House_No" class="form-control" runat="server" placeholder="House No"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                    <%--<div class="col-md-3">
                                                <div class="form-group">
                                                    <asp:Label ID="Label9" runat="server" Text="House Qual No:"></asp:Label>
                                                    <asp:TextBox ID="House_Qual_No" class="form-control" runat="server" placeholder="House Qual No"></asp:TextBox>
                                                </div>
                                            </div>--%>
                                                    <div class="col-md-9">
                                                        <div class="form-group">
                                                            <asp:Label ID="Label5" runat="server" Text="Street Address:"></asp:Label>
                                                            <asp:TextBox ID="StrAdd" class="form-control" runat="server" placeholder="Street Address"></asp:TextBox>
                                                        </div>
                                                    </div>

                                                </div>
                                                <div class="form-group row">
                                                    <div class="col-md-4">
                                                        <div class="form-group">
                                                            <asp:Label ID="Label6" runat="server" Text="Unit No.:"></asp:Label>
                                                            <asp:TextBox ID="Unitnum" class="form-control" runat="server" placeholder="Unit No."></asp:TextBox>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <asp:Label ID="Label17" runat="server" Text="City:"></asp:Label>
                                                            <asp:TextBox ID="City" class="form-control" runat="server" placeholder="City"> </asp:TextBox>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <asp:Label ID="Label18" runat="server" Text="Province:"></asp:Label>
                                                            <asp:TextBox ID="Province" class="form-control" runat="server" placeholder="Province"></asp:TextBox>
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
                                                            <asp:Label ID="Label16" runat="server" Text="Postal Code:"></asp:Label>
                                                            <asp:TextBox ID="PostalCode" class="form-control" runat="server" placeholder="Postal Code"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <asp:Label ID="Label8" runat="server" Text="Country:"></asp:Label>
                                                            <asp:TextBox ID="Country" class="form-control" runat="server" placeholder="Country"></asp:TextBox>
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
            <asp:LinkButton ID="SubmitBtn" runat="server" CssClass="btn btn-small btn-primary" OnClick="submit_Click">
                            <i class="fa fa-save"></i>&nbsp;Save</asp:LinkButton>
                </div>
            </div>
        </div>
        </div>
    </div>
    <script src="Content/bootstrap-notify-3.1.3/bootstrap-notify-3.1.3/dist/bootstrap-notify.min.js"></script>
    <script type="text/javascript">
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
