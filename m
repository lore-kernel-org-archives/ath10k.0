Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gL4xW-0006ob-Tl
 for ath10k@lists.infradead.org; Fri, 09 Nov 2018 11:28:20 +0000
Message-ID: <218bac09a559cd0d1c6cdc5d9c4dbd4b33ffca1c.camel@sipsolutions.net>
Subject: Re: [PATCH 0/6] wireless: Per-sta NoAck and offload support
From: Johannes Berg <johannes@sipsolutions.net>
Date: Fri, 09 Nov 2018 12:28:01 +0100
In-Reply-To: <1539715271-14325-1-git-send-email-tamizhr@codeaurora.org>
 (sfid-20181016_204254_690922_6A9D8E64)
References: <1539715271-14325-1-git-send-email-tamizhr@codeaurora.org>
 (sfid-20181016_204254_690922_6A9D8E64)
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
To: Tamizh chelvam <tamizhr@codeaurora.org>, ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org

Hi,

> Adds infrastructure for driver to offload NoAck functionality,
> driver like ath10k could make use of it. Also extends the
> current ndev wide NoAck policy to per-station, with sta level
> NoAck policy configuration userspace could selectively turn off/on
> Noack based on various connection parameters of the station.

So ... we have this, but we also have

[PATCH 0/4] cfg80211/mac80211: Add support for TID specific configuration

which you were involved in.

Unless you can cite a good reason not to, I think it would make sense to
combine the two and make "noack" just another attribute in the TID
configuration.

johannes


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
