Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ar2AB-0002Mp-0f
 for ath10k@lists.infradead.org; Fri, 15 Apr 2016 11:43:52 +0000
From: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v3 1/2] ath10k: Add support for ath10k_sta_statistics
 support
Date: Fri, 15 Apr 2016 11:43:22 +0000
Message-ID: <87r3e7qeqv.fsf@kamboji.qca.qualcomm.com>
References: <1459241642-3730-1-git-send-email-mohammed@qca.qualcomm.com>
In-Reply-To: <1459241642-3730-1-git-send-email-mohammed@qca.qualcomm.com>
 (Mohammed Shafi Shajakhan's message of "Tue, 29 Mar 2016 14:24:01	+0530")
Content-Language: en-US
Content-ID: <CE1191AB7B704F4F97AAFAC5E511B255@qualcomm.com>
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
To: "Shajakhan, Mohammed Shafi (Mohammed Shafi)" <mohammed@qti.qualcomm.com>
Cc: "mohammed@codeaurora.org" <mohammed@codeaurora.org>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com> writes:

> From: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>
>
> Enable support for 'drv_sta_statistics' callback.
> Export rx_duration support if available to cfg80211/nl80211
>
> This can also act as a placeholder for any new per STA stats support
>
> Signed-off-by: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>
> ---
> [v3] removed conditions for ath10k state checks based on Michal's suggestion
>
> Dependencies:
>
> 1. cfg80211/nl80211: Add support for NL80211_STA_INFO_RX_DURATION (under review)
> 2. iw: Add support for NL80211_STA_INFO_RX_DURATION netlink
>  attribute (under review)
> 3. ath10k: Enable debugfs provision to enable Peer Stats feature (merged in pending branch)

The dependency is in mac80211-next currently:

49da43f94f5e cfg80211/nl80211: Add support for NL80211_STA_INFO_RX_DURATION

(Sorry for the noise, I wish patchwork would have a feature to add
notes)

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
