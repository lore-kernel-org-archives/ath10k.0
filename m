Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-la0-x229.google.com ([2a00:1450:4010:c03::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZH9r9-0006qK-V2
 for ath10k@lists.infradead.org; Mon, 20 Jul 2015 12:07:43 +0000
Received: by lahh5 with SMTP id h5so95602733lah.2
 for <ath10k@lists.infradead.org>; Mon, 20 Jul 2015 05:07:14 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CA+BoTQnhxJCt1eiUrE68PNawf5FYh96oK1o=517_UY6cE1bOjw@mail.gmail.com>
References: <CAFBinCCxWeAwpAU2Qjh3RbLX3YGxDUiVoiaTk-WEhySj6OvxFw@mail.gmail.com>
 <CA+BoTQ=HrQjvSwy0R5YDkkPLcQOi2zwiMAL0OEL2YswAASWnZQ@mail.gmail.com>
 <CAFBinCCymvnL5sTDJJQ6vEZZfchPPG=PeyrXzzt7cPqLJuUBMQ@mail.gmail.com>
 <55A44244.9000109@dd-wrt.com>
 <CA+BoTQn5rERqGT-vUKGV=Bs-rMYzx2132+BDGLTmQpWK=DJW7g@mail.gmail.com>
 <55A4E1FC.9000005@dd-wrt.com>
 <CA+BoTQkOeLarxTcOR=aeFoixP-41Jri72gM5MRqUQdNhbQoXOg@mail.gmail.com>
 <CAFBinCBN53s=wHf6428iaqj9sorQCz7XbGiT+UrhWtiYvUGH7g@mail.gmail.com>
 <CA+BoTQnhxJCt1eiUrE68PNawf5FYh96oK1o=517_UY6cE1bOjw@mail.gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 20 Jul 2015 14:06:55 +0200
Message-ID: <CAFBinCDfZZdTBJL_WcmtTVMha94SAktOF9u2-jmUvW_eces9XA@mail.gmail.com>
Subject: Re: AP mode firmware crash on QCA9880-BR4A
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Michal Kazior <michal.kazior@tieto.com>
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, Sebastian Gottschall <s.gottschall@dd-wrt.com>

Hi Michal,

On Mon, Jul 20, 2015 at 1:41 PM, Michal Kazior <michal.kazior@tieto.com> wrote:
> Firmware file names aren't versions and don't use them as such. The
> naming serves only for backward compatibility between firmware and
> driver releases.
>
> Use firmware version strings, please. I.e. 10.1.467-xxx.
I totally forgot about that, sorry.
The one that is working is firmware-2.bin_10.1.467.bin

I also misread one of your last emails. You asked about version "10.2-00082":
This version crashes as well (same symptoms).

> Can you post contents of your
> /sys/kernel/debug/ieee80211/phy*/ath10k/wmi_services, please?
>
> (for both 10.1.467 and any of 10.2 that crashes)
You can find the output with 10.1.467.2-1 here and at the end of this email: [0]
And the output with 10.2.4.70-2 can be found here: [1]
T
> I'd recommend using traces[1] instead as they won't suffer from this
> problem. Kernel log buffer isn't big enough to debug everything with
> mere prints.
Okay, I will do this tonight. Do you want trace-logs of the crashing
firmware (I will simply use 10.2.4.70-2 from now on) or also the
output on the working (10.1.467.2-1) one?


Regards,
Martin


[0] https://paste.kde.org/pp7qowsge
[1] https://paste.kde.org/p14zlrxtf


wmi_services with firmware 10.1.467.2-1:
WMI_SERVICE_BEACON_OFFLOAD               -
WMI_SERVICE_SCAN_OFFLOAD                 enabled
WMI_SERVICE_ROAM_OFFLOAD                 enabled
WMI_SERVICE_BCN_MISS_OFFLOAD             enabled
WMI_SERVICE_STA_PWRSAVE                  enabled
WMI_SERVICE_STA_ADVANCED_PWRSAVE         enabled
WMI_SERVICE_AP_UAPSD                     enabled
WMI_SERVICE_AP_DFS                       -
WMI_SERVICE_11AC                         enabled
WMI_SERVICE_BLOCKACK                     enabled
WMI_SERVICE_PHYERR                       enabled
WMI_SERVICE_BCN_FILTER                   enabled
WMI_SERVICE_RTT                          enabled
WMI_SERVICE_RATECTRL                     -
WMI_SERVICE_WOW                          enabled
WMI_SERVICE_RATECTRL_CACHE               enabled
WMI_SERVICE_IRAM_TIDS                    enabled
WMI_SERVICE_ARPNS_OFFLOAD                -
WMI_SERVICE_NLO                          -
WMI_SERVICE_GTK_OFFLOAD                  -
WMI_SERVICE_SCAN_SCH                     -
WMI_SERVICE_CSA_OFFLOAD                  -
WMI_SERVICE_CHATTER                      -
WMI_SERVICE_COEX_FREQAVOID               -
WMI_SERVICE_PACKET_POWER_SAVE            -
WMI_SERVICE_FORCE_FW_HANG                -
WMI_SERVICE_GPIO                         -
WMI_SERVICE_STA_DTIM_PS_MODULATED_DTIM   -
WMI_SERVICE_STA_UAPSD_BASIC_AUTO_TRIG    -
WMI_SERVICE_STA_UAPSD_VAR_AUTO_TRIG      -
WMI_SERVICE_STA_KEEP_ALIVE               -
WMI_SERVICE_TX_ENCAP                     -
WMI_SERVICE_BURST                        -
WMI_SERVICE_SMART_ANTENNA_SW_SUPPORT     -
WMI_SERVICE_SMART_ANTENNA_HW_SUPPORT     -
WMI_SERVICE_ROAM_SCAN_OFFLOAD            -
WMI_SERVICE_AP_PS_DETECT_OUT_OF_SYNC     -
WMI_SERVICE_EARLY_RX                     -
WMI_SERVICE_STA_SMPS                     -
WMI_SERVICE_FWTEST                       -
WMI_SERVICE_STA_WMMAC                    -
WMI_SERVICE_TDLS                         -
WMI_SERVICE_MCC_BCN_INTERVAL_CHANGE      -
WMI_SERVICE_ADAPTIVE_OCS                 -
WMI_SERVICE_BA_SSN_SUPPORT               -
WMI_SERVICE_FILTER_IPSEC_NATKEEPALIVE    -
WMI_SERVICE_WLAN_HB                      -
WMI_SERVICE_LTE_ANT_SHARE_SUPPORT        -
WMI_SERVICE_BATCH_SCAN                   -
WMI_SERVICE_QPOWER                       -
WMI_SERVICE_PLMREQ                       -
WMI_SERVICE_THERMAL_MGMT                 -
WMI_SERVICE_RMC                          -
WMI_SERVICE_MHF_OFFLOAD                  -
WMI_SERVICE_COEX_SAR                     -
WMI_SERVICE_BCN_TXRATE_OVERRIDE          -
WMI_SERVICE_NAN                          -
WMI_SERVICE_L1SS_STAT                    -
WMI_SERVICE_ESTIMATE_LINKSPEED           -
WMI_SERVICE_OBSS_SCAN                    -
WMI_SERVICE_TDLS_OFFCHAN                 -
WMI_SERVICE_TDLS_UAPSD_BUFFER_STA        -
WMI_SERVICE_TDLS_UAPSD_SLEEP_STA         -
WMI_SERVICE_IBSS_PWRSAVE                 -
WMI_SERVICE_LPASS                        -
WMI_SERVICE_EXTSCAN                      -
WMI_SERVICE_D0WOW                        -
WMI_SERVICE_HSOFFLOAD                    -
WMI_SERVICE_ROAM_HO_OFFLOAD              -
WMI_SERVICE_RX_FULL_REORDER              -
WMI_SERVICE_DHCP_OFFLOAD                 -
WMI_SERVICE_STA_RX_IPA_OFFLOAD_SUPPORT   -
WMI_SERVICE_MDNS_OFFLOAD                 -
WMI_SERVICE_SAP_AUTH_OFFLOAD             -
WMI_SERVICE_ATF                          -
WMI_SERVICE_COEX_GPIO                    -


wmi_services with firmware 10.2.4.70-2:

WMI_SERVICE_BEACON_OFFLOAD               -
WMI_SERVICE_SCAN_OFFLOAD                 enabled
WMI_SERVICE_ROAM_OFFLOAD                 enabled
WMI_SERVICE_BCN_MISS_OFFLOAD             enabled
WMI_SERVICE_STA_PWRSAVE                  enabled
WMI_SERVICE_STA_ADVANCED_PWRSAVE         enabled
WMI_SERVICE_AP_UAPSD                     enabled
WMI_SERVICE_AP_DFS                       -
WMI_SERVICE_11AC                         enabled
WMI_SERVICE_BLOCKACK                     enabled
WMI_SERVICE_PHYERR                       enabled
WMI_SERVICE_BCN_FILTER                   -
WMI_SERVICE_RTT                          enabled
WMI_SERVICE_RATECTRL                     -
WMI_SERVICE_WOW                          -
WMI_SERVICE_RATECTRL_CACHE               enabled
WMI_SERVICE_IRAM_TIDS                    enabled
WMI_SERVICE_ARPNS_OFFLOAD                -
WMI_SERVICE_NLO                          -
WMI_SERVICE_GTK_OFFLOAD                  -
WMI_SERVICE_SCAN_SCH                     -
WMI_SERVICE_CSA_OFFLOAD                  -
WMI_SERVICE_CHATTER                      -
WMI_SERVICE_COEX_FREQAVOID               -
WMI_SERVICE_PACKET_POWER_SAVE            -
WMI_SERVICE_FORCE_FW_HANG                enabled
WMI_SERVICE_GPIO                         -
WMI_SERVICE_STA_DTIM_PS_MODULATED_DTIM   -
WMI_SERVICE_STA_UAPSD_BASIC_AUTO_TRIG    -
WMI_SERVICE_STA_UAPSD_VAR_AUTO_TRIG      -
WMI_SERVICE_STA_KEEP_ALIVE               -
WMI_SERVICE_TX_ENCAP                     -
WMI_SERVICE_BURST                        enabled
WMI_SERVICE_SMART_ANTENNA_SW_SUPPORT     enabled
WMI_SERVICE_SMART_ANTENNA_HW_SUPPORT     -
WMI_SERVICE_ROAM_SCAN_OFFLOAD            -
WMI_SERVICE_AP_PS_DETECT_OUT_OF_SYNC     -
WMI_SERVICE_EARLY_RX                     -
WMI_SERVICE_STA_SMPS                     -
WMI_SERVICE_FWTEST                       -
WMI_SERVICE_STA_WMMAC                    -
WMI_SERVICE_TDLS                         -
WMI_SERVICE_MCC_BCN_INTERVAL_CHANGE      -
WMI_SERVICE_ADAPTIVE_OCS                 -
WMI_SERVICE_BA_SSN_SUPPORT               -
WMI_SERVICE_FILTER_IPSEC_NATKEEPALIVE    -
WMI_SERVICE_WLAN_HB                      -
WMI_SERVICE_LTE_ANT_SHARE_SUPPORT        -
WMI_SERVICE_BATCH_SCAN                   -
WMI_SERVICE_QPOWER                       -
WMI_SERVICE_PLMREQ                       -
WMI_SERVICE_THERMAL_MGMT                 -
WMI_SERVICE_RMC                          -
WMI_SERVICE_MHF_OFFLOAD                  -
WMI_SERVICE_COEX_SAR                     -
WMI_SERVICE_BCN_TXRATE_OVERRIDE          -
WMI_SERVICE_NAN                          -
WMI_SERVICE_L1SS_STAT                    -
WMI_SERVICE_ESTIMATE_LINKSPEED           -
WMI_SERVICE_OBSS_SCAN                    -
WMI_SERVICE_TDLS_OFFCHAN                 -
WMI_SERVICE_TDLS_UAPSD_BUFFER_STA        -
WMI_SERVICE_TDLS_UAPSD_SLEEP_STA         -
WMI_SERVICE_IBSS_PWRSAVE                 -
WMI_SERVICE_LPASS                        -
WMI_SERVICE_EXTSCAN                      -
WMI_SERVICE_D0WOW                        -
WMI_SERVICE_HSOFFLOAD                    -
WMI_SERVICE_ROAM_HO_OFFLOAD              -
WMI_SERVICE_RX_FULL_REORDER              -
WMI_SERVICE_DHCP_OFFLOAD                 -
WMI_SERVICE_STA_RX_IPA_OFFLOAD_SUPPORT   -
WMI_SERVICE_MDNS_OFFLOAD                 -
WMI_SERVICE_SAP_AUTH_OFFLOAD             -
WMI_SERVICE_ATF                          enabled
WMI_SERVICE_COEX_GPIO                    -

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
