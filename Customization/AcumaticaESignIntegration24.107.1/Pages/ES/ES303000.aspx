<%@ Page Language="C#" MasterPageFile="~/MasterPages/FormDetail.master" AutoEventWireup="true" ValidateRequest="false"
    CodeFile="ES303000.aspx.cs" Inherits="Page_ES303000" Title="ESign Envelope" %>

<%@ MasterType VirtualPath="~/MasterPages/FormDetail.master" %>

<asp:Content ID="cont1" ContentPlaceHolderID="phDS" runat="Server">
    <px:PXDataSource ID="ds" runat="server" Visible="True" TypeName="AcumaticaESign.ESignEnvelopeEnq" PrimaryView="Envelopes">
    </px:PXDataSource>
</asp:Content>
<asp:Content ID="cont2" ContentPlaceHolderID="phF" runat="Server">
    <px:PXFormView ID="form" runat="server" DataSourceID="ds" DataMember="Envelopes" Style="z-index: 100"
        Width="100%" TabIndex="900" NoteIndicator="False" FilesIndicator="False">
        <Template>
            <px:PXLayoutRule runat="server" StartRow="True" ControlSize="XM" />
            <px:PXDropDown ID="edLastStatus" runat="server" DataField="AcumaticaEnvelopeStatus" Enabled="False" />
        </Template>
    </px:PXFormView>
</asp:Content>
<asp:Content ID="cont3" ContentPlaceHolderID="phG" runat="Server">
    <px:PXGrid ID="grid" runat="server" DataSourceID="ds" Style="z-index: 100"
        Width="100%" Height="150px" SkinID="Details" TabIndex="3300" TemporaryFilterCaption="Filter Applied">
        <Levels>
            <px:PXGridLevel DataMember="Recipients">
                <RowTemplate>
                </RowTemplate>
                <Columns>
                    <px:PXGridColumn DataField="Email" Width="250px" />
                    <px:PXGridColumn DataField="Name" Width="150px" />
                    <px:PXGridColumn DataField="Status" Width="150px" />
                    <px:PXGridColumn DataField="DeliveredDateTime" Width="150px" DisplayFormat="g"/>
                    <px:PXGridColumn DataField="SignedDateTime" Width="150px" DisplayFormat="g"/>
                    <px:PXGridColumn DataField="IPAddress" Width="150px" />
                </Columns>
            </px:PXGridLevel>
        </Levels>
        <AutoSize Container="Window" Enabled="True" MinHeight="150" />
        <ActionBar>
            <Actions>
                <AddNew Enabled="False"></AddNew>
                <Delete Enabled="False"></Delete>
            </Actions>
        </ActionBar>
    </px:PXGrid>
</asp:Content>
