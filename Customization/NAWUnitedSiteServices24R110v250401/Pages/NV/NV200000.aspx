<%@ Page Language="C#" MasterPageFile="~/MasterPages/ListView.master" AutoEventWireup="true" ValidateRequest="false" CodeFile="NV200000.aspx.cs" Inherits="Page_NV200000" Title="Untitled Page" %>
<%@ MasterType VirtualPath="~/MasterPages/ListView.master" %>

<asp:Content ID="cont1" ContentPlaceHolderID="phDS" runat="Server">
    <px:PXDataSource ID="ds" runat="server" Visible="True" Width="100%" PrimaryView="Records" TypeName="NV.UnitedSiteServices.NVInvoiceTypeMaint" >
	</px:PXDataSource>
</asp:Content>
<asp:Content ID="cont2" ContentPlaceHolderID="phL" runat="Server">
    <px:PXGrid ID="grid" runat="server" Height="400px" Width="100%" Style="z-index: 100"
		AllowPaging="True" AllowSearch="True" AdjustPageSize="Auto" DataSourceID="ds" SkinID="Primary" TabIndex="100" TemporaryFilterCaption="Filter Applied">
		<Levels>
			<px:PXGridLevel DataKeyNames="InvoiceTypeID" DataMember="Records">
			    <RowTemplate>
                </RowTemplate>
                <Columns>
                    <px:PXGridColumn DataField="InvoiceTypeID">
                    </px:PXGridColumn>
                    <px:PXGridColumn DataField="InvoiceTypeCD" Width="250px" CommitChanges="true">
                    </px:PXGridColumn>
                     <px:PXGridColumn DataField="Descr" Width="300px">
                    </px:PXGridColumn>
                    
                </Columns>
			</px:PXGridLevel>
		</Levels>
		<AutoSize Container="Window" Enabled="True" MinHeight="200" />
        <Mode InitNewRow="true" />
	</px:PXGrid>
</asp:Content>
