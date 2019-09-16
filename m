Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1i9suu-0008IC-AM
 for ath10k@lists.infradead.org; Mon, 16 Sep 2019 15:27:53 +0000
Message-ID: <6684ceecde399edeb31c594f889a403440c78142.camel@sipsolutions.net>
Subject: Re: [PATCH 3/4] mac80211: fix low throughput in push pull mode
From: Johannes Berg <johannes@sipsolutions.net>
Date: Mon, 16 Sep 2019 17:27:37 +0200
In-Reply-To: <1568639388-27291-3-git-send-email-yiboz@codeaurora.org>
 (sfid-20190916_151039_049848_BE125514)
References: <1568639388-27291-1-git-send-email-yiboz@codeaurora.org>
 <1568639388-27291-3-git-send-email-yiboz@codeaurora.org>
 (sfid-20190916_151039_049848_BE125514)
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
To: Yibo Zhao <yiboz@codeaurora.org>, ath10k@lists.infradead.org
Cc: Toke =?ISO-8859-1?Q?H=F8iland-J=F8rgensen?= <toke@toke.dk>, linux-wireless@vger.kernel.org

Without really looking at the code - 

> If station is ineligible for transmission in ieee80211_txq_may_transmit(),
> no packet will be delivered to FW. During the tests in push-pull mode with
> many clients, after several seconds, not a single station is an eligible
> candidate for transmission since global time is smaller than all the
> station's virtual airtime. As a consequence, the Tx has been blocked and
> throughput is quite low.

You should rewrite this to be, erm, a bit more understandable in
mac80211 context. I assume you're speaking (mostly?) about ath10k, but I
have very little context there. "push pull mode"? "firmware"? These
things are not something mac80211 knows about.

> Co-developed-by: Yibo Zhao <yiboz@codeaurora.org>

That also seems wrong, should be Toke I guess, unless you intended for a
From: Toke to be present?

johannes



_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
