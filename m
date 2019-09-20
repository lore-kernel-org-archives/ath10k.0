Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from alexa-out-tai-02.qualcomm.com ([103.229.16.227])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iBFLs-0004oP-TZ
 for ath10k@lists.infradead.org; Fri, 20 Sep 2019 09:37:22 +0000
Subject: RE: [PATCH v3] ath10k: support NET_DETECT WoWLAN feature
From: Wen Gong <wgong@qti.qualcomm.com>
Date: Fri, 20 Sep 2019 09:37:09 +0000
Message-ID: <29044fb6c3ba43af9a433aeb63f55e41@aptaiexm02f.ap.qualcomm.com>
References: <1534402113-14337-1-git-send-email-wgong@codeaurora.org>
 <20181114225910.GA220599@google.com>
 <CA+ASDXMh7vdfkA5jtJqWEU-g-4Ta5Xvy046zujyASZcESCGhAQ@mail.gmail.com>
 <87woe5aehr.fsf@kamboji.qca.qualcomm.com>
 <40854e84bd4b4a9699b60530b1c373ad@aptaiexm02f.ap.qualcomm.com>
 <87pnjvctjh.fsf@codeaurora.org>
In-Reply-To: <87pnjvctjh.fsf@codeaurora.org>
Content-Language: en-US
MIME-Version: 1.0
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
To: "kvalo@codeaurora.org" <kvalo@codeaurora.org>
Cc: Brian Norris <briannorris@chromium.org>, linux-wireless <linux-wireless@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, Wen Gong <wgong@codeaurora.org>

> -----Original Message-----
> From: Kalle Valo <kvalo@codeaurora.org>
> Sent: Friday, September 20, 2019 3:32 PM
> To: Wen Gong <wgong@qti.qualcomm.com>
> Cc: Brian Norris <briannorris@chromium.org>; linux-wireless <linux-
> wireless@vger.kernel.org>; Linux Kernel <linux-kernel@vger.kernel.org>;
> ath10k@lists.infradead.org; Wen Gong <wgong@codeaurora.org>
> Subject: [EXT] Re: [PATCH v3] ath10k: support NET_DETECT WoWLAN feature
> 
> >> Wen, can you enable NL80211_FEATURE_SCAN_RANDOM_MAC_ADDR?
> >> Does firmware
> >> support that?
> >
> > Yes, I test again, it is enabled
> NL80211_FEATURE_SCAN_RANDOM_MAC_ADDR now.
> 
> Sorry, I'm not quite understanding your reply.
> 
> But I mixed up the flags. I meant that can we enable
> NL80211_FEATURE_SCAN_RANDOM_MAC_ADDR in ath10k? Does the
> firmware
> releases which have WMI_SERVICE_NLO support
> NL80211_FEATURE_SCAN_RANDOM_MAC_ADDR as well?
Kalle,
I tested with this firmware: https://github.com/kvalo/ath10k-firmware/blob/master/QCA6174/hw3.0/sdio-4.4.1/firmware-sdio-6.bin_WLAN.RMH.4.4.1-00017-QCARMSWPZ-2

In ath10k_mac_register, it has flag WMI_SERVICE_SPOOF_MAC_SUPPORT enabled.
	if (test_bit(WMI_SERVICE_SPOOF_MAC_SUPPORT, ar->wmi.svc_map)) {
		ar->hw->wiphy->features |=
			NL80211_FEATURE_SCAN_RANDOM_MAC_ADDR;
	}

In ath10k_wow_init, it has flag ATH10K_FW_FEATURE_WOWLAN_SUPPORT, WMI_SERVICE_WOW, WMI_SERVICE_NLO enabled.
int ath10k_wow_init(struct ath10k *ar)
{
	if (!test_bit(ATH10K_FW_FEATURE_WOWLAN_SUPPORT,
		      ar->running_fw->fw_file.fw_features))
		return 0;

	if (WARN_ON(!test_bit(WMI_SERVICE_WOW, ar->wmi.svc_map)))
		return -EINVAL;

	if (test_bit(WMI_SERVICE_NLO, ar->wmi.svc_map)) {
		ar->wow.wowlan_support.flags |= WIPHY_WOWLAN_NET_DETECT;
		ar->wow.wowlan_support.max_nd_match_sets = WMI_PNO_MAX_SUPP_NETWORKS;
	}
}
> 
> --
> Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
