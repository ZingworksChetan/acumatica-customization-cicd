<%@ Page Language="C#" MasterPageFile="~/MasterPages/FormTab.master" AutoEventWireup="true"
    ValidateRequest="false" CodeFile="ES301000.aspx.cs" Inherits="Page_ES301000" Title="Untitled Page" %>

<%@ MasterType VirtualPath="~/MasterPages/FormTab.master" %>

<asp:Content ID="cont1" ContentPlaceHolderID="phDS" runat="Server">
    <script type="text/javascript">
        function reloadScreen() {
            var ds = __px_cm(window).findDataSource();
            if (ds) {
                ds.executeCallback(ds.cancelCommandName);
            }
        }
        $(function () {
            $(document)
                .ready(function () {
                    var chat = $.connection.refreshHub;
                    chat.client.refreshPage = function () {
                        reloadScreen();
                    }
                    $.connection.hub.start()
                        .done(function () {
                            window.console.log("refreshHub connection started");
                        });
                });
        });
    </script>
    <px:pxdatasource id="ds" runat="server" visible="True" typename="AcumaticaESign.ESignAccountEntry"
        primaryview="Accounts" suspendunloading="False">
        <CallbackCommands>
            <px:PXDSCallbackCommand CommitChanges="True" Name="Connect" />
            <px:PXDSCallbackCommand CommitChanges="True" Name="Disconnect" />
        </CallbackCommands>
    </px:pxdatasource>
</asp:Content>
<asp:Content ID="cont2" ContentPlaceHolderID="phF" runat="Server">
    <px:pxformview id="form" runat="server" datasourceid="ds" style="z-index: 100" width="100%" datamember="Accounts"
        tabindex="1400" allowcollapse="False" markrequired="Dynamic">
        <Template>
            <px:PXLayoutRule runat="server" StartRow="True" ControlSize="M" LabelsWidth="SM" StartColumn="True" />
            <px:PXSelector ID="edAccountCD" runat="server" DataField="AccountCD" AutoGenerateColumns="True">
              <GridProperties>
                <Columns>
                  <px:PXGridColumn DataField="ProviderTypeIcon" Type="Icon" TextAlign="Center" 
                      SortField="ProviderType" Width="40px" AllowResize="False" AllowShowHide="False" AutoGenerateOption="Add" ForceExport="True" />
                </Columns>
              </GridProperties>
            </px:PXSelector>
            <px:PXCheckBox ID="chkIsActive" runat="server" DataField="IsActive" CommitChanges="True" />
            <px:PXDropDown ID="edProviderType" runat="server" DataField="ProviderType" CommitChanges="True" />
            <px:PXDropDown ID="edStatus" runat="server" DataField="Status" Enabled="False" />
            <px:PXDropDown ID="edType" runat="server" DataField="Type" CommitChanges="True" />
            <px:PXSelector ID="edDefaultUserID" runat="server" DataField="OwnerID" CommitChanges="True"/>
            <px:PXLayoutRule runat="server" ControlSize="XM" LabelsWidth="S" StartColumn="True" GroupCaption="ESIGN ACCOUNT INFO" />
            <px:PXTextEdit ID="edApiUrl" runat="server" DataField="ApiUrl" />
            <px:PXTextEdit ID="edClientID" runat="server" AlreadyLocalized="False" DataField="ClientID" />
            <px:PXTextEdit ID="edClientSecret" runat="server" AlreadyLocalized="False" DataField="ClientSecret" />
            <px:PXCheckBox ID="edIsTestApi" runat="server" DataField="IsTestApi" Text="Test" CommitChanges="True"/>
            <px:PXTextEdit ID="edEmail" runat="server" DataField="Email" />
            <px:PXTextEdit ID="edPassword" runat="server" DataField="Password" TextMode="Password" />
        </Template>
    </px:pxformview>
</asp:Content>
<asp:Content ID="cont3" ContentPlaceHolderID="phG" runat="Server">
    <px:pxtab id="tab" runat="server" width="100%" height="150px" datasourceid="ds" datamember="SelectedAccount">
        <Items>
            <px:PXTabItem Text="Notification Details">
                <Template>
                    <px:PXFormView ID="PXFormView1" runat="server" DataMember="SelectedAccount" DataSourceID="ds" TabIndex="7500" SkinID="Transparent">
                        <Template>
                            <px:PXLayoutRule runat="server" StartColumn="True" LabelsWidth="XM" GroupCaption="Reminders" StartGroup="True" />
                            <px:PXCheckBox runat="server" Text="Send reminders" DataField="SendReminders" ID="edSendReminders" CommitChanges="True" />
                            <px:PXNumberEdit runat="server" ID="edFirstReminderDay" DataField="FirstReminderDay" />
                            <px:PXNumberEdit runat="server" ID="edReminderFrequency" DataField="ReminderFrequency" />
                            <px:PXDropDown ID="edReminderType" runat="server" DataField="ReminderType"/>
                            <px:PXLayoutRule runat="server" StartGroup="True" GroupCaption="Expiration" StartColumn="True" LabelsWidth="XM" />
                            <px:PXNumberEdit runat="server" ID="edExpiredDays" DataField="ExpiredDays" />
                            <px:PXNumberEdit runat="server" ID="edWarnDays" DataField="WarnDays" />
                        </Template>
                    </px:PXFormView>
                </Template>
            </px:PXTabItem>
            <px:PXTabItem RepaintOnDemand="False" Text="Users">
                <Template>
                    <px:PXGrid ID="PXGrid1" runat="server" DataSourceID="ds" SkinID="DetailsInTab" TemporaryFilterCaption="Filter Applied" Width="100%">
                        <Levels>
                            <px:PXGridLevel DataMember="Users" DataKeyNames="AccountID,OwnerID">
                                <RowTemplate>
                                    <px:PXSelector ID="edOwnerID" runat="server" DataField="OwnerID" CommitChanges="True">
                                    </px:PXSelector>
                                    <px:PXTextEdit ID="edOwnerID_EPEmployee_acctName" runat="server" DataField="OwnerID_EPEmployee_acctName" DefaultLocale="">
                                    </px:PXTextEdit>
                                </RowTemplate>
                                <Columns>
                                    <px:PXGridColumn DataField="OwnerID" Width="120px" CommitChanges="True">
                                    </px:PXGridColumn>
                                    <px:PXGridColumn DataField="OwnerID_EPEmployee_acctName" Width="200px">
                                    </px:PXGridColumn>
                                </Columns>
                            </px:PXGridLevel>
                        </Levels>
                        <AutoSize Enabled="True" />
                    </px:PXGrid>
                </Template>
            </px:PXTabItem>
        </Items>
        <AutoSize Container="Window" Enabled="True" MinHeight="150" />
    </px:pxtab>
</asp:Content>
