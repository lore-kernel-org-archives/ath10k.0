Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f6wsV-0005Hs-LK
 for ath10k@lists.infradead.org; Fri, 13 Apr 2018 11:28:28 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH 2/2] ath10k: support MAC address randomization in scan
References: <1522379640-6442-1-git-send-email-cjhuang@codeaurora.org>
 <1522379640-6442-3-git-send-email-cjhuang@codeaurora.org>
 <20180412205954.GA34456@rodete-desktop-imager.corp.google.com>
 <e16557d0891352ae0b83902faee97023@codeaurora.org>
Date: Fri, 13 Apr 2018 14:28:12 +0300
In-Reply-To: <e16557d0891352ae0b83902faee97023@codeaurora.org>
 (cjhuang@codeaurora.org's message of "Fri, 13 Apr 2018 14:53:25
 +0800")
Message-ID: <877epbs5v7.fsf@kamboji.qca.qualcomm.com>
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
To: cjhuang@codeaurora.org
Cc: Brian Norris <briannorris@chromium.org>, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

cjhuang@codeaurora.org writes:

>>> +	if (test_bit(WMI_SERVICE_SPOOF_MAC_SUPPORT, ar->wmi.svc_map)) {
>>> +		ret = ath10k_wmi_scan_prob_req_oui(ar, ar->mac_addr);
>>> +		if (ret) {
>>> +			ath10k_err(ar, "failed to set prob req oui: %i\n", ret);
>>> +			goto err_dfs_detector_exit;
>>> +		}
>>> +
>>> +		ar->hw->wiphy->features |=
>>> +			NL80211_FEATURE_SCAN_RANDOM_MAC_ADDR;
>>
>> Do you support NL80211_FEATURE_SCHED_SCAN_RANDOM_MAC_ADDR too?
>
> I'll add this flag too.

Are you going to send v2 or what's the plan?

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
