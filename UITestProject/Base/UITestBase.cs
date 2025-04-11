﻿using Core;
using Core.Config;
using Core.Login;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using System.Diagnostics;
using System.Reflection;

namespace UITestProject.Base
{
    [TestClass]
    public class UITestBase
    {
        [ClassInitialize(InheritanceBehavior.BeforeEachDerivedClass)]
        public static void Initialize(TestContext context)
        {
            // This configuration would usually be loaded from a XML file when calling Config.ReadConfig()
            // but we can actually set most of the properties directly.
            // NOTE: Should be loaded from configuration and not hardcoded!
            Config.BrowserBin = @"F:\TestSDK\Chrome\chrome.exe";
            Config.SITE_DST_URL = @"http://localhost/USSFence/";
            Config.SITE_DST_LOGIN = "admin";
            Config.SITE_DST_PASSWORD = "Zing@2025";

            // Config.SelectedBrowser cannot be changed since the property set is private
            // reflection will do the trick!
            typeof(Config).GetProperty("SelectedBrowser")?.SetValue(null, PX.QA.Tools.Browsers.Chrome);

            PxLogin.LoginToDestinationSite();
        }

        [ClassCleanup(InheritanceBehavior.BeforeEachDerivedClass)]
        public static void Cleanup()
        {
            // Internal method -- takes care of killing web driver
            // Support.KillProcessTree(Process.GetCurrentProcess().Id, null, null);
            MethodInfo? dynMethod = typeof(Support).GetMethod("KillProcessTree", BindingFlags.NonPublic | BindingFlags.Static);
            dynMethod?.Invoke(null, new object?[] { Process.GetCurrentProcess().Id, null, null });
        }
    }
}