Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([5.9.151.49] helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1abVSl-0004g4-62
 for ath10k@lists.infradead.org; Thu, 03 Mar 2016 15:46:52 +0000
Message-ID: <1457019983.2044.29.camel@sipsolutions.net>
Subject: Re: [PATCH] cfg80211/nl80211: Add support for
 NL80211_STA_INFO_RX_DURATION
From: Johannes Berg <johannes@sipsolutions.net>
Date: Thu, 03 Mar 2016 16:46:23 +0100
In-Reply-To: <1456927710-32073-1-git-send-email-mohammed@qca.qualcomm.com>
References: <1456927710-32073-1-git-send-email-mohammed@qca.qualcomm.com>
Mime-Version: 1.0
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
To: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>, linux-wireless@vger.kernel.org
Cc: mohammed@codeaurora.org, kvalo@codeaurora.org, ath10k@lists.infradead.org

On Wed, 2016-03-02 at 19:38 +0530, Mohammed Shafi Shajakhan wrote:
> From: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>
> 
> Add support for new netlink attribute 'NL80211_STA_INFO_RX_DURATION'
> This flag will be set when drivers can fill rx_duration ( approximate
> total air time(usecs) for unicast data/management frames from the
> connected client) via 'drv_sta_statistics' callback

So, what's that useful for?

Are you really sure you mean "unicast"? What if the station is the AP?
Why wouldn't multicast frames it transmitted be accounted for?

> Also make sta_info flags 'filled' as 64 bit to accomodate for new

typo: accommodate

johannes

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
