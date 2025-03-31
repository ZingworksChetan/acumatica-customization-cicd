<%@ Page Language="C#" MasterPageFile="~/MasterPages/TabView.master" AutoEventWireup="true" ValidateRequest="false" CodeFile="PS101000.aspx.cs" Inherits="Page_PS101000" Title="Untitled Page" %>
<%@ MasterType VirtualPath="~/MasterPages/TabView.master" %>

<asp:Content ID="cont1" ContentPlaceHolderID="phDS" Runat="Server">
	<px:PXDataSource ID="ds" runat="server" Visible="True" Width="100%"
        TypeName="PS.Objects.PS.PSPremiumBasic.PSSetupMaint"
        PrimaryView="pssetup"
        >
		<CallbackCommands>

		</CallbackCommands>
	</px:PXDataSource>
</asp:Content>
<asp:Content ID="cont2" ContentPlaceHolderID="phF" Runat="Server">
	<px:PXTab DataMember="pssetup" ID="tab" runat="server" DataSourceID="ds" Height="150px" Style="z-index: 100" Width="100%" AllowAutoHide="false">
		<Items>
			<px:PXTabItem Text="Settings">
			
				<Template>
					<px:PXLayoutRule runat="server" ID="CstPXLayoutRule1" StartRow="True" ></px:PXLayoutRule></Template></px:PXTabItem>
			<px:PXTabItem Text="Maintenance" >
				<Template>
					<px:PXFormView RenderStyle="Simple" DataMember="pssetup" runat="server" ID="snapshotForm_PBC" DataSourceID="ds" >
						<Template>
							<px:PXLayoutRule ControlSize="XS" runat="server" ID="NAWPXLayoutRulePBC14" StartRow="True" ></px:PXLayoutRule>
							<px:PXPanel DataMember="pssetup" Caption="Webhook" runat="server" ID="NAWPanelPBC40">
								<px:PXLayoutRule runat="server" ID="NAWLayoutRulePBC44" ControlSize="XL" LabelsWidth="SM" ></px:PXLayoutRule>
								<px:PXLayoutRule runat="server" ID="NAWPXLayoutRulePBC1" Merge="True" ></px:PXLayoutRule>
								<px:PXTextEdit runat="server" ID="NAWPXTextEditSecretKeyPBC4" DataField="SnapshotSecretKey" ></px:PXTextEdit>
								<px:PXButton runat="server" ID="NAWBtnGeneratePBC1" CommandSourceID="ds" CommandName = "GenerateSnapshotSecret" ></px:PXButton>
							</px:PXPanel>
							<px:PXPanel RenderStyle="RoundBorder" runat="server" ID="NAWPanelPBC33" Caption="Snapshot" DataMember="pssetup" >
								<px:PXLayoutRule LabelsWidth="SM" runat="server" ID="NAWPXLayoutRulePBC39" ControlSize="XL" ></px:PXLayoutRule>
								<px:PXTextEdit runat="server" ID="NAWPXTextEditPBC36" DataField="LiveInstanceURL" ></px:PXTextEdit>
								<px:PXTextEdit runat="server" ID="NAWPXTextEditPBC37" DataField="StagingInstanceURL" ></px:PXTextEdit>
								<px:PXTextEdit runat="server" ID="NAWPXTextEditPBC35" DataField="DevInstanceURL" ></px:PXTextEdit>
								<px:PXNumberEdit runat="server" ID="NAWPXNumberEditPBC38" DataField="GetSnapshotTimeOut" ></px:PXNumberEdit></px:PXPanel></Template></px:PXFormView></Template></px:PXTabItem></Items>
		<AutoSize Container="Window" Enabled="True" MinHeight="200" ></AutoSize>
	</px:PXTab></asp:Content>