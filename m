Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([2a01:4f8:191:72ef::2]
 helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eNlXT-0005B4-FM
 for ath10k@lists.infradead.org; Sat, 09 Dec 2017 20:16:01 +0000
Message-ID: <1512850533.26976.48.camel@sipsolutions.net>
Subject: Re: Wireless regressions in v4.15-rc1
From: Johannes Berg <johannes@sipsolutions.net>
Date: Sat, 09 Dec 2017 21:15:33 +0100
In-Reply-To: <87po7xwajg.fsf@kamboji.qca.qualcomm.com>
 (sfid-20171202_135939_841463_D1ADD367)
References: <87po7xwajg.fsf@kamboji.qca.qualcomm.com>
 (sfid-20171202_135939_841463_D1ADD367)
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
To: Kalle Valo <kvalo@codeaurora.org>, linux-wireless@vger.kernel.org, Thorsten Leemhuis <regressions@leemhuis.info>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org

On Sat, 2017-12-02 at 14:59 +0200, Kalle Valo wrote:
> 
> net: netlink: Update attr validation to require exact length for some types
> https://git.kernel.org/linus/28033ae4e0f5

This was reverted, more or less, to print only a warning:

https://git.kernel.org/pub/scm/linux/kernel/git/davem/net.git/commit/?id=6e237d099fac1f73a7b6d7287bb9191f29585a4e

> Jouni fixed this already in hostapd but we also need a fix for kernel so
> that old hostapd versions continue to work:
> 
> https://w1.fi/cgit/hostap/commit/?id=a2426829ce426de82d2fa47071ca41ea81c43307
> 
> Jouni also found a similar problem with mesh:
> 
> https://w1.fi/cgit/hostap/commit/?id=963d3149abfcbab5b83f9023bc50321f777360d1

See above for the kernel revert to let old hostapd versions continue to
work (properly only on little endian platforms) when they don't have
these fixes.

> And Johannes already submitted a revert related to wpa_supplicant:
> 
> [net] Revert "net: core: maybe return -EEXIST in __dev_alloc_name" diffmboxseries
> https://patchwork.ozlabs.org/patch/843863/

That was applied.

> And with ath10k I'm now seeing this:
> 
> [  133.175508] WARNING: CPU: 2 PID: 1743 at net/mac80211/agg-tx.c:315 ___ieee80211_stop_tx_ba_session+0x1ab/0x280 [mac80211]

Just sent a fix for this, kinda a merge/patch failure.

> johannes

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
