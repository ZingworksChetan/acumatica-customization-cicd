<%@ Page Language="C#" MasterPageFile="~/MasterPages/FormView.master" AutoEventWireup="true" ValidateRequest="false" CodeFile="NW100000.aspx.cs" Inherits="Page_NW100000" Title="Untitled Page" %>
<%@ MasterType VirtualPath="~/MasterPages/FormView.master" %>

<asp:Content ID="cont1" ContentPlaceHolderID="phDS" Runat="Server">
	<px:PXDataSource ID="ds" runat="server" Visible="True" Width="100%"
        TypeName="PS.Objects.PS.PSPremiumBasic.Graph.NAWFeaturesMaint"
        PrimaryView="Features"
        >
		<CallbackCommands>

		</CallbackCommands>
	</px:PXDataSource>
</asp:Content>
<asp:Content ID="cont2" ContentPlaceHolderID="phF" Runat="Server">
	<px:PXFormView RenderStyle="Normal" SkinID="" ID="form" runat="server" DataSourceID="ds" Style="z-index: 100" 
		Width="100%" DataMember="Features" 
		EmailingGraph="" Caption="General Settings" TemplateContainer="" TabIndex="500">
        <Activity Width="" Height=""></Activity>
		<Template>
		    <px:PXLayoutRule GroupCaption=" " runat="server" StartRow="True" StartColumn="True" StartGroup="True" ControlSize="L" LabelsWidth="xxs"></px:PXLayoutRule>            		    
		</Template>
	    <AutoSize Container="Window" Enabled="true"></AutoSize>
	</px:PXFormView>
</asp:Content>