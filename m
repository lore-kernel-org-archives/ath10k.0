Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hQT3L-0006Ke-8R
 for ath10k@lists.infradead.org; Tue, 14 May 2019 08:44:52 +0000
Message-ID: <be1934dad73b1cc654615c1c895a79a8b35ea456.camel@sipsolutions.net>
Subject: Re: [PATCH] mac80211: remove warning message
From: Johannes Berg <johannes@sipsolutions.net>
Date: Tue, 14 May 2019 10:44:45 +0200
In-Reply-To: <1557471662-1355-1-git-send-email-yiboz@codeaurora.org>
 (sfid-20190510_090204_942831_B8A9C5A2)
References: <1557471662-1355-1-git-send-email-yiboz@codeaurora.org>
 (sfid-20190510_090204_942831_B8A9C5A2)
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
To: Yibo Zhao <yiboz@codeaurora.org>, linux-wireless@vger.kernel.org
Cc: Zhi Chen <zhichen@codeaurora.org>, ath10k@lists.infradead.org

On Fri, 2019-05-10 at 15:01 +0800, Yibo Zhao wrote:
> In multiple SSID cases, it takes time to prepare every AP interface
> to be ready in initializing phase. If a sta already knows everything it
> needs to join one of the APs and sends authentication to the AP which
> is not fully prepared at this point of time, AP's channel context
> could be NULL. As a result, warning message occurs.

Please share the dump, I don't think this should be happening. I think
this warning did what it was supposed to, uncover a bug; rather than
remove the warning we should fix the bug.

> Even worse, if the AP is under attack via tools such as MDK3 and massive
> authentication requests are received in a very short time, console will
> be hung due to kernel warning messages.

I don't buy this, it's just a WARN_ON_ONCE().

> If this case can be hit during normal functionality, there should be no
> WARN_ON(). Those should be reserved to cases that are not supposed to be
> hit at all or some other more specific cases like indicating obsolete
> interface.

I agree, but right now I'm inclined to think it's a bug elsewhere rather
than normal operation.

johannes


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
