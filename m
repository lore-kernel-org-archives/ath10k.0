Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b1Emy-0002zY-Pd
 for ath10k@lists.infradead.org; Fri, 13 May 2016 15:14:05 +0000
From: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v3 RESEND 1/2] ath10k: Add support for
 ath10k_sta_statistics support
Date: Fri, 13 May 2016 15:13:36 +0000
Message-ID: <87ziru9ejj.fsf@kamboji.qca.qualcomm.com>
References: <1462204347-31012-1-git-send-email-mohammed@qca.qualcomm.com>
In-Reply-To: <1462204347-31012-1-git-send-email-mohammed@qca.qualcomm.com>
 (Mohammed Shafi Shajakhan's message of "Mon, 2 May 2016 21:22:27	+0530")
Content-Language: en-US
Content-ID: <11DDFC7EBABECA4DB806D965C6842368@qualcomm.com>
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

It's nicer to ping than resend a patch. This patchset has been in
"Awaiting Upstream" state while waiting for the dependencies trickle
down to ath-next.

> Dependencies:
>
> 1. cfg80211/nl80211: Add support for NL80211_STA_INFO_RX_DURATION (under review)

739960f128e5 cfg80211/nl80211: Add support for NL80211_STA_INFO_RX_DURATION

Currently in net-next, should come to ath-next soon.

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
