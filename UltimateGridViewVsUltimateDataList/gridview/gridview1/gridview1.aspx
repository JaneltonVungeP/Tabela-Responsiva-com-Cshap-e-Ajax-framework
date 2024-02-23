<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="gridview1.aspx.cs" Inherits="UltimateGridViewVsUltimateDataList.gridview.gridview1.gridview1" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>GridView1</title>

    <%--sweet alert--%>

     <script src="../../Scripts/sweetalert.min.js"></script>
    <link href="../../Styles/sweetalert.css" rel="stylesheet" />
  <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
   


    <!-- Required meta tags -->
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous" />
    <link href="gridview1.css?version=0" rel="stylesheet" />


    <script src="https://kit.fontawesome.com/24e7002d97.js" crossorigin="anonymous"></script>
</head>
<body>
    <form id="form1" runat="server">
        <cc1:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></cc1:ToolkitScriptManager>
        <div class="text-center">

            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click" />
                </ContentTemplate>
            </asp:UpdatePanel>
            <br /> <br />
          <asp:Label ID="Label7" ForeColor="AntiqueWhite" CssClass=" table-responsive" runat="server" Text="Diario de um engenheiro Informatico" Font-Size="XX-Large"></asp:Label>
            <br /> <br />
            <asp:Panel ID="Panel1" HorizontalAlign="Center" runat="server">
                <asp:TextBox ID="TextBox9" Width="20%" Height="25px" Style="margin: 8px auto" BackColor="#151F28" ForeColor="AntiqueWhite" class="form-control table-responsive " runat="server" TextMode="Search" AutoPostBack="True" OnTextChanged="TextBox9_TextChanged"></asp:TextBox>
                <asp:GridView ID="GridView1" runat="server" CssClass="table gridview1 table-responsive" AutoGenerateColumns="False" ShowHeaderWhenEmpty="true" DataKeyNames="Id" Width="80%" ShowFooter="True" OnRowCommand="GridView1_RowCommand" OnRowEditing="GridView1_RowEditing" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowDeleting="GridView1_RowDeleting" OnRowUpdating="GridView1_RowUpdating">
                    <Columns>
                        <asp:TemplateField HeaderText="Index">
                            <EditItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Eval("id") %>'></asp:Label>
                            </EditItemTemplate>
                            <FooterTemplate>
                            </FooterTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("id") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Primeiro Nome">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" class="form-control All_textboxes" runat="server" Text='<%# Eval("firstname") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="TextBox5" runat="server" class="form-control textboxes" Text='<%# Eval("firstname") %>'></asp:TextBox>
                            </FooterTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%# Eval("firstname") %>'></asp:Label>
                            </ItemTemplate>
                            <FooterStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Ultimo Nome">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox2" class="form-control All_textboxes" runat="server" Text='<%# Eval("lastname") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="TextBox6" runat="server" class="form-control textboxes" Text='<%# Eval("lastname") %>'></asp:TextBox>
                            </FooterTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label4" runat="server" Text='<%# Eval("lastname") %>'></asp:Label>
                            </ItemTemplate>
                            <FooterStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Tel:telefone">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox3" class="form-control All_textboxes" runat="server" Text='<%# Eval("phonenumber") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="TextBox7" runat="server" class="form-control textboxes" Text='<%# Eval("phonenumber") %>'></asp:TextBox>
                            </FooterTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label5" runat="server" Text='<%# Eval("phonenumber") %>'></asp:Label>
                            </ItemTemplate>
                            <FooterStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Email">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox4" class="form-control All_textboxes" runat="server" Text='<%# Eval("email") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="TextBox8" runat="server" class="form-control textboxes" Text='<%# Eval("email") %>'></asp:TextBox>
                            </FooterTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label6" runat="server" Text='<%# Eval("email") %>'></asp:Label>
                            </ItemTemplate>
                            <FooterStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <EditItemTemplate>
                                <asp:LinkButton ID="LinkButton3" CommandName="Update" ToolTip="Actualizar" CssClass="btn btn-outline-success" runat="server"><i class="fa-solid fa-square-check"></i></asp:LinkButton>
                                <asp:LinkButton ID="LinkButton4" CommandName="Cancel" ToolTip="Cancelar" CssClass="btn btn-outline-secondary" runat="server"><i class="fa-solid fa-rectangle-xmark"></i></asp:LinkButton>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton1" CommandName="Edit" CssClass="btn btn-outline-warning" ToolTip="Editar" runat="server"><i class="fa-solid fa-pen-to-square"></i></asp:LinkButton>
                                <asp:LinkButton ID="LinkButton2" CommandName="Delete" CssClass="btn btn-outline-primary" ToolTip="Apagar" runat="server"><i class="fa-solid fa-trash-can"></i></asp:LinkButton>
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:LinkButton ID="LinkButton5" CommandName="Add" CssClass="btn btn-outline-info" ToolTip="Adicinar" runat="server"><i class="fa-solid fa-plus"></i></asp:LinkButton>
                            </FooterTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <HeaderStyle CssClass="gridview1_header" BorderStyle="Solid" />
                    <RowStyle CssClass="gridview1_row" />
                </asp:GridView>
                <br /> <br />
            </asp:Panel>
        </div>
    </form>
</body>
</html>
