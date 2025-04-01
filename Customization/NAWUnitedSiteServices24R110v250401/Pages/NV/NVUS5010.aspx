<%@ Page Language="C#" MasterPageFile="~/MasterPages/FormDetail.master" AutoEventWireup="true" ValidateRequest="false" CodeFile="NVUS5010.aspx.cs" Inherits="Page_NVUS5010" Title="Untitled Page" %>
<%@ MasterType VirtualPath="~/MasterPages/FormDetail.master" %>

<asp:Content ID="cont1" ContentPlaceHolderID="phDS" runat="Server">
	<px:PXDataSource ID="ds" runat="server" Visible="True" Width="100%" PrimaryView="Filter" TypeName="NAWUnitedSiteServices.Prototype.Graph.NAWUSSExtensionContractProcessing" >
	</px:PXDataSource>
</asp:Content>
<asp:Content ID="form" ContentPlaceHolderID="phF" Runat="Server">
    <px:PXFormView ID="PXFormView1" runat="server" DataSourceID="ds" Style="z-index: 100" Width="100%" DataMember="Filter" 
        NoteIndicator="False" FilesIndicator="False"  TabIndex="100">
		<Template>
			<px:PXLayoutRule runat="server"  ControlSize="M" LabelsWidth="S" StartColumn="True"/>
			<px:PXDateTimeEdit ID="edOnRentDate" runat="server" DataField="OnRentDate" CommitChanges="true"></px:PXDateTimeEdit>
			<px:PXLayoutRule runat="server"  ControlSize="M" LabelsWidth="S" StartColumn="True"/>
			<px:PXSegmentMask ID="edBranchID" runat="server"  DataSourceID="ds" DataField="BranchID" CommitChanges="True" />
			<px:PXLayoutRule runat="server"  ControlSize="M" LabelsWidth="S" StartColumn="True"/>
			<px:PXSelector ID="edTerritoryCD" runat="server" DataSourceID="ds" DataField="TerritoryCD" CommitChanges="True"></px:PXSelector>
		</Template>
	</px:PXFormView>
</asp:Content>
<asp:Content ID="cont2" ContentPlaceHolderID="phG" runat="Server">
	<px:PXGrid ID="grid" runat="server" Height="400px" Width="100%" Style="z-index: 100" 
		AllowPaging="True" AllowSearch="True" AdjustPageSize="Auto" DataSourceID="ds" SkinID="PrimaryInquire" SyncPosition="true" TabIndex="100" 
        TemporaryFilterCaption="Filter Applied" FilesIndicator="False">
		<Levels>
			<px:PXGridLevel DataKeyNames="OrderType,OrderNbr" DataMember="Records">
			    <RowTemplate>
					<px:PXSelector Size="xxs" ID="edOrderType" runat="server" AllowNull="False" DataField="OrderType" Enabled="False" />
					<px:PXSelector ID="edOrderNbr" runat="server" DataField="OrderNbr" Enabled="False" AllowEdit="True" />
			    </RowTemplate>
                <Columns>
                    <px:PXGridColumn AllowCheckAll="true" DataField="Selected" TextAlign="Center" Type="CheckBox" Width="60px" />
                    <px:PXGridColumn DataField="UsrNAWBillingHold" TextAlign="Center" Type="CheckBox" Width="60px" />
					<px:PXGridColumn DataField="OrderType" />
					<px:PXGridColumn DataField="OrderNbr" />
					<px:PXGridColumn DataField="NVRTCycleRegister__CycleNbr" />
					<px:PXGridColumn DataField="CustomerID" />
					<px:PXGridColumn AllowUpdate="False" DataField="CustomerID_BAccountR_acctName" />
					<px:PXGridColumn DataField="UsrNVRTJobSiteNbr" />
					<px:PXGridColumn DataField="UsrNVCertifiedPayroll" TextAlign="Center" Type="CheckBox" Width="60px" />
					<px:PXGridColumn DataField="UsrNAWContractPeriod" />
					<px:PXGridColumn DataField="UsrNVInvoiceType" />
					<px:PXGridColumn DataField="NVRTJobSite__TerritoryCD" />
					<px:PXGridColumn DataField="NVRTCycleRegister__BranchID" />
					<px:PXGridColumn DataField="NVRTCycleRegister__NextBillDate" />
					<px:PXGridColumn DataField="NVRTCycleRegister__NextCycleStartDate" />
					<px:PXGridColumn DataField="NVRTCycleRegister__NextCycleEndDate" />
					<px:PXGridColumn DataField="UsrNAWSalesforceID" />
					<px:PXGridColumn DataField="OrderDesc" />
				</Columns>
			</px:PXGridLevel>
		</Levels>
		<AutoSize Container="Window" Enabled="True" MinHeight="200" />
	</px:PXGrid>
</asp:Content>
