<%@ Page Title="" Language="C#" MasterPageFile="~/Vitals.Master" AutoEventWireup="true" CodeBehind="Get_Doctor.aspx.cs" Inherits="Vitals.Get_Doctor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div align="center" style="width: 100%; height: 40%; padding: 15px 20px; padding-top: 15%;">
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
                               
                                <asp:GridView ID="GridView1" runat="server" BorderStyle="None" GridLines="Horizontal" BorderColor="LightGray"
                                    PageIndex="10" AllowPaging="true" AutoGenerateColumns="true" AllowCustomPaging="true" CellPadding="3" CellSpacing="2" Width="100%">
                                    <Columns>
                                        <%-- <asp:BoundField DataField="D_Reg_DR_No"
                                            HeaderText="Doctor No" ReadOnly="True"
                                            SortExpression="D_Reg_DR_No" />
                                        <asp:BoundField DataField="D_Short_Name"
                                            HeaderText="Doctor Short Name" InsertVisible="False"
                                            ReadOnly="True" SortExpression="D_Short_Name" />
                                        <asp:BoundField DataField="OrderQty"
                                            HeaderText="OrderQty" SortExpression="OrderQty" />
                                        <asp:BoundField DataField="ProductID"
                                            HeaderText="ProductID" SortExpression="ProductID" />
                                        <asp:BoundField DataField="UnitPrice"
                                            HeaderText="UnitPrice" SortExpression="UnitPrice" />
                                        <asp:BoundField DataField="ModifiedDate"
                                            HeaderText="ModifiedDate" SortExpression="ModifiedDate" />--%>
                                       
                                    <%-- <asp:CommandField ShowDeleteButton="True"
                                            ShowEditButton="True" />--%>
                                    <%-- <asp:TemplateField>
                                            <ItemTemplate>
                                                <asp:Button ID="Button1" runat="server" Text="Edit" />
                                            </ItemTemplate>
                                        </asp:TemplateField>--%>
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
</asp:Content>
