Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f7wW2-0008On-Rx
 for ath10k@lists.infradead.org; Mon, 16 Apr 2018 05:17:24 +0000
MIME-Version: 1.0
Date: Mon, 16 Apr 2018 13:17:12 +0800
From: cjhuang@codeaurora.org
Subject: Re: [PATCH 2/2] ath10k: support MAC address randomization in scan
In-Reply-To: <877epbs5v7.fsf@kamboji.qca.qualcomm.com>
References: <1522379640-6442-1-git-send-email-cjhuang@codeaurora.org>
 <1522379640-6442-3-git-send-email-cjhuang@codeaurora.org>
 <20180412205954.GA34456@rodete-desktop-imager.corp.google.com>
 <e16557d0891352ae0b83902faee97023@codeaurora.org>
 <877epbs5v7.fsf@kamboji.qca.qualcomm.com>
Message-ID: <539b85655d7f700bfcd28a6f698af943@codeaurora.org>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Kalle Valo <kvalo@codeaurora.org>
Cc: Brian Norris <briannorris@chromium.org>, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

On 2018-04-13 19:28, Kalle Valo wrote:
> cjhuang@codeaurora.org writes:
> 
>>>> +	if (test_bit(WMI_SERVICE_SPOOF_MAC_SUPPORT, ar->wmi.svc_map)) {
>>>> +		ret = ath10k_wmi_scan_prob_req_oui(ar, ar->mac_addr);
>>>> +		if (ret) {
>>>> +			ath10k_err(ar, "failed to set prob req oui: %i\n", ret);
>>>> +			goto err_dfs_detector_exit;
>>>> +		}
>>>> +
>>>> +		ar->hw->wiphy->features |=
>>>> +			NL80211_FEATURE_SCAN_RANDOM_MAC_ADDR;
>>> 
>>> Do you support NL80211_FEATURE_SCHED_SCAN_RANDOM_MAC_ADDR too?
>> 
>> I'll add this flag too.
> 
> Are you going to send v2 or what's the plan?

Yes I'll send V2.


Thanks,
Carl

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
