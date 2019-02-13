Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-eopbgr740049.outbound.protection.outlook.com
 ([40.107.74.49] helo=NAM01-BN3-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gtzoc-0003xi-IS
 for ath10k@lists.infradead.org; Wed, 13 Feb 2019 19:03:28 +0000
From: Sergey Matyukevich <sergey.matyukevich.os@quantenna.com>
Subject: Re: [PATCH 0/4] cfg80211/mac80211: Add support for TID specific
 configuration
Date: Wed, 13 Feb 2019 19:01:37 +0000
Message-ID: <20190213190135.lp3sg3u3b4mmve7l@bars>
References: <1540230918-27712-1-git-send-email-tamizhr@codeaurora.org>
In-Reply-To: <1540230918-27712-1-git-send-email-tamizhr@codeaurora.org>
Content-Language: en-US
Content-ID: <6F55AE922EAA0C4EBE12CA6A61A77011@namprd05.prod.outlook.com>
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
To: Tamizh chelvam <tamizhr@codeaurora.org>
Cc: "johannes@sipsolutions.net" <johannes@sipsolutions.net>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Hello Tamizh,

> Add infrastructure for per TID aggregation/retry count configurations
> such as retry count and AMPDU aggregation control(disable/enable).
> In some scenario reducing the number of retry count for a specific data
> traffic can reduce the latency by proceeding with the next packet
> instead of retrying the same packet more time. This will be useful
> where the next packet can resume the operation without an issue.
> Here added NL80211_CMD_SET_TID_CONFIG to support this operation by
> accepting retry count and AMPDU aggregation control.
> This command can accept STA mac addreess to make the configuration
> station specific rather than applying to all the connected stations
> to the netdev.
> 
> Tamizh chelvam (3):
>   nl80211: Add netlink attribute for AMPDU aggregation enable/disable
>   tid conf 3
>   ath10k: Add support to configure TID specific configuration
> 
> Vasanthakumar Thiagarajan (1):
>   New netlink command for TID specific configuration

Could you please share your further plans regarding this patch series ?
Do you plan to send next revision in the forseable future ?
Or have you decided to abandon this approach ?

Regards,
Sergey

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
