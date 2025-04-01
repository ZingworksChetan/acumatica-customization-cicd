<%@ Page Language="C#" MasterPageFile="~/MasterPages/FormDetail.master" AutoEventWireup="true" ValidateRequest="false" CodeFile="ES401000.aspx.cs"
    Inherits="Page_ES401000" Title="Untitled Page" %>

<%@ MasterType VirtualPath="~/MasterPages/FormDetail.master" %>

<asp:Content ID="cont1" ContentPlaceHolderID="phDS" runat="Server">
    <px:PXDataSource ID="ds" runat="server" Visible="True" Width="100%" PrimaryView="Envelopes" TypeName="AcumaticaESign.ESignDocumentSummaryEnq">
        <CallbackCommands>
            <px:PXDSCallbackCommand CommitChanges="True" DependOnGrid="grid" Name="delete" Visible="True" StateColumn="IsDeleteAvailable" />
            <px:PXDSCallbackCommand CommitChanges="True" DependOnGrid="grid" Name="viewHistory" Visible="False" />
            <px:PXDSCallbackCommand CommitChanges="True" DependOnGrid="grid" Name="viewFile" Visible="False" />
            <px:PXDSCallbackCommand CommitChanges="True" DependOnGrid="grid" Name="voidEnvelope" Visible="True" StateColumn="IsActionsAvailable" />
            <px:PXDSCallbackCommand CommitChanges="True" DependOnGrid="grid" Name="viewESign" Visible="True" />
            <px:PXDSCallbackCommand CommitChanges="True" DependOnGrid="grid" Name="remind" Visible="True" StateColumn="IsActionsAvailable" />
            <px:PXDSCallbackCommand CommitChanges="True" DependOnGrid="grid" Name="checkStatus" Visible="True" />
            <px:PXDSCallbackCommand CommitChanges="true" Name="sendVoidRequest" Visible="False" />
        </CallbackCommands>
    </px:PXDataSource>
</asp:Content>
<asp:Content ID="cont2" ContentPlaceHolderID="phF" runat="Server">
    <px:PXSmartPanel ID="pnlVoid" runat="server"
        Width="460px" Caption="Void Document" CaptionVisible="True"
        AutoCallBack-Target="formVoid"
        AutoCallBack-Command="Refresh" AutoCallBack-Behavior-CommitChanges="True" AutoCallBack-Behavior-PostData="Page"
        Key="VoidRequest" CreateOnDemand="True" TabIndex="300">
        <px:PXFormView ID="formVoid" runat="server" DataSourceID="ds" Width="200px"
            SkinID="Transparent" DataMember="VoidRequest">
            <Template>
                <px:PXLayoutRule runat="server" ControlSize="L" LabelsWidth="S" StartColumn="True" />
                <px:PXTextEdit ID="edtCheckOutComment" runat="server" Height="81px" DataField="VoidReason" TextMode="MultiLine" />
                <px:PXPanel ID="PXPanelVoid" runat="server" SkinID="Buttons">
                    <px:PXButton ID="PXSend" runat="server" CommandName="sendVoidRequest" CommandSourceID="ds" SyncVisible="False" DialogResult="OK" />
                    <px:PXButton ID="PXClose" runat="server" DialogResult="Cancel" Text="Close" />
                </px:PXPanel>
            </Template>
        </px:PXFormView>
    </px:PXSmartPanel>
    <px:PXFormView ID="form" runat="server" DataSourceID="ds" Style="z-index: 100"
        Width="100%" DataMember="Filter" Caption="Selection">
        <Template>
            <px:PXLayoutRule ID="PXLayoutRule1" runat="server" StartColumn="True" />
            <px:PXLayoutRule ID="PXLayoutRule2" runat="server" Merge="True" ControlSize="XM" />
            <px:PXSelector ID="edOwnerID" runat="server" DataField="OwnerID" AutoRefresh="True" CommitChanges="True" />
            <px:PXCheckBox ID="edMyOwner" runat="server" DataField="MyOwner" CommitChanges="True" />
        </Template>
    </px:PXFormView>
</asp:Content>
<asp:Content ID="cont3" ContentPlaceHolderID="phG" runat="Server">
    <px:PXGrid ID="grid" runat="server" DataSourceID="ds" Style="z-index: 100" SyncPosition="True"
        FilesIndicator="False" KeepPosition="True" AllowPaging="True" AdjustPageSize="Auto"
        Width="100%" SkinID="PrimaryInquire" TabIndex="1100" BlankFilterHeader="All">
        <ActionBar DefaultAction="viewESign" />
        <AutoSize Enabled="True" />
        <Levels>
            <px:PXGridLevel DataKeyNames="EnvelopeInfoID" DataMember="Envelopes">
                <RowTemplate>
                    <px:PXDropDown ID="edAcumaticaEnvelopeStatus" runat="server" DataField="AcumaticaEnvelopeStatus"/>
                    <px:PXDateTimeEdit ID="edActivityDate" runat="server" DataField="ActivityDate" DisplayFormat="g"/>
                    <px:PXTextEdit ID="edTheme" runat="server" DataField="Theme"/>
                    <px:PXDateTimeEdit ID="edExpirationDate" runat="server" DataField="ExpirationDate" DisplayFormat="g"/>
                    <px:PXDateTimeEdit ID="edCreatedDateTime" runat="server" DataField="CreatedDateTime" DisplayFormat="g"/>
                    <px:PXSelector ID="edUploadFileWithIDSelector__Name" runat="server" DataField="UploadFileWithIDSelector__Name"/>
                    <px:PXCheckBox ID="edIsInProgress" runat="server" DataField="IsActionsAvailable" Text="IsActionsAvailable"/>
                    <px:PXCheckBox ID="edIsDeleteAvailable" runat="server" DataField="IsDeleteAvailable" Text="IsDeleteAvailable"/>
                </RowTemplate>
                <Columns>
                    <px:PXGridColumn DataField="ESignAccount__ProviderTypeIcon" Width="40px" Type="Icon" TextAlign="Center" AllowShowHide="False"
                        AllowResize="False" SortField="ESignAccount__ProviderType" ForceExport="True"/>
                    <px:PXGridColumn DataField="UploadFileWithIDSelector__Name" LinkCommand="viewFile" Width="350px"/>
                    <px:PXGridColumn DataField="Theme" Width="200px"/>
                    <px:PXGridColumn DataField="AcumaticaEnvelopeStatus" LinkCommand="viewHistory" Width="150px"/>
                    <px:PXGridColumn DataField="ActivityDate" Width="150px" DisplayFormat="g"/>
                    <px:PXGridColumn DataField="ExpirationDate" DisplayFormat="g" Width="150px"/>
                    <px:PXGridColumn DataField="CreatedDateTime" Width="150px" DisplayFormat="g"/>
                    <px:PXGridColumn DataField="SiteMap__Title" Width="200px"/>
                    <px:PXGridColumn DataField="IsActionsAvailable" TextAlign="Center" Type="CheckBox" Width="0px"/>
                    <px:PXGridColumn DataField="IsDeleteAvailable" TextAlign="Center" Type="CheckBox" Width="0px"/>
                    <px:PXGridColumn DataField="ESignAccount__ProviderType" Width="150px"/>
                </Columns>
            </px:PXGridLevel>
        </Levels>
        <AutoSize Container="Window" Enabled="True" MinHeight="150" />
        <AutoCallBack>
            <Behavior CommitChanges="True" />
        </AutoCallBack>
    </px:PXGrid>
</asp:Content>
