<%@ Page Language="C#" MasterPageFile="~/MasterPages/FormView.master" AutoEventWireup="true" ValidateRequest="false" CodeFile="NW503520.aspx.cs" Inherits="Page_NW503520" Title="Untitled Page" %>
<%@ MasterType VirtualPath="~/MasterPages/FormView.master" %>

<asp:Content ID="cont1" ContentPlaceHolderID="phDS" Runat="Server">
	<px:PXDataSource ID="ds" runat="server" Visible="True" Width="100%"
        TypeName="PS.Objects.PS.PSPremiumBasic.Snapshot.Graph.NAWSynchronizeTenant"
        PrimaryView="Filter"
        >
		<CallbackCommands>

		</CallbackCommands>
	</px:PXDataSource>
</asp:Content>
<asp:Content ID="cont2" ContentPlaceHolderID="phF" Runat="Server">
	<px:PXFormView ID="form" runat="server" DataSourceID="ds" DataMember="Filter" Width="100%" AllowAutoHide="false">
		<Template>
			<px:PXLayoutRule ID="NAWPXLayoutRulePBC1" runat="server" StartRow="True"></px:PXLayoutRule>
			<px:PXDropDown runat="server" ID="NAWPXDropDownPBC2" DataField="SourceTenant" ></px:PXDropDown>
			<px:PXDropDown runat="server" ID="NAWPXDropDownPBC3" DataField="TargetTenant" ></px:PXDropDown>
			<px:PXDropDown runat="server" ID="NAWPXDropDownPBC4" DataField="ExportMode" ></px:PXDropDown>
			<px:PXCheckBox runat="server" ID="NAWPXCheckBoxPBC6" DataField="DontRestore" ></px:PXCheckBox>
			<px:PXCheckBox runat="server" ID="NAWPXCheckBoxPBC5" DataField="DeleteAfterRestore" ></px:PXCheckBox>
			<px:PXCheckBox runat="server" ID="NAWPXCheckBoxPBC7" DataField="KeepOriginalVisualAppearance" ></px:PXCheckBox></Template>
		<AutoSize Container="Window" Enabled="True" MinHeight="200" ></AutoSize>
	</px:PXFormView>
	<px:PXGrid Width="0" Height="0" runat="server" ID="NAWPXGridPBC8" SkinID="Inquire">
		<Levels>
			<px:PXGridLevel DataMember="ProcessingView">
				<Columns>
					<px:PXGridColumn DataField="Selected" Width="60" /></Columns></px:PXGridLevel></Levels></px:PXGrid></asp:Content>