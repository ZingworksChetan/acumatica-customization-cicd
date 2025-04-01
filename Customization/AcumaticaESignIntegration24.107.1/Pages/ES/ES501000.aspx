<%@ Page Language="C#" MasterPageFile="~/MasterPages/ListView.master" AutoEventWireup="true" ValidateRequest="false" CodeFile="ES501000.aspx.cs"
    Inherits="Page_ES501000" Title="Untitled Page" %>

<%@ MasterType VirtualPath="~/MasterPages/ListView.master" %>

<asp:Content ID="cont1" ContentPlaceHolderID="phDS" runat="Server">
    <px:pxdatasource id="ds" runat="server" visible="True" width="100%" primaryview="Envelopes" typename="AcumaticaESign.ESignSyncProcess">
    </px:pxdatasource>
</asp:Content>
<asp:Content ID="cont3" ContentPlaceHolderID="phL" runat="Server">
    <px:pxgrid id="grid" runat="server" datasourceid="ds" style="z-index: 100" filesindicator="False" allowpaging="True" adjustpagesize="Auto"
        width="100%" height="250px" skinid="PrimaryInquire" tabindex="800" syncposition="True">
        <Levels>
            <px:PXGridLevel DataMember="Envelopes">
                <Columns>
                    <px:PXGridColumn DataField="ProviderTypeIcon" Width="40px" Type="Icon" TextAlign="Center" AllowShowHide="False"
                        AllowResize="False" SortField="ProviderType" ForceExport="True"/>
                    <px:PXGridColumn DataField="Selected" TextAlign="Center" Type="CheckBox" Width="50px" AllowCheckAll="True" CommitChanges="True" />
                    <px:PXGridColumn DataField="Theme" Width="200px" />
                    <px:PXGridColumn DataField="AcumaticaEnvelopeStatus" Width="200px" />
                    <px:PXGridColumn DataField="ActivityDate" Width="200px" DisplayFormat="g" />
                    <px:PXGridColumn DataField="ESignAccountID" CommitChanges="True" Width="200px" />
                    <px:PXGridColumn DataField="ProviderType" Width="150px" />
                </Columns>
            </px:PXGridLevel>
        </Levels>
        <AutoSize Container="Window" Enabled="True" MinHeight="150" />
    </px:pxgrid>
</asp:Content>
