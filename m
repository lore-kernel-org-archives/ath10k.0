Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gL5qR-00081M-Si
 for ath10k@lists.infradead.org; Fri, 09 Nov 2018 12:25:05 +0000
Message-ID: <dda0f03868f631ba9f76170e19dd28099a0e0add.camel@sipsolutions.net>
Subject: Re: [PATCH 1/4] New netlink command for TID specific configuration
From: Johannes Berg <johannes@sipsolutions.net>
Date: Fri, 09 Nov 2018 13:24:51 +0100
In-Reply-To: <20181109094017.j4vkhaprz4zmszch@bars>
References: <1540230918-27712-1-git-send-email-tamizhr@codeaurora.org>
 <1540230918-27712-2-git-send-email-tamizhr@codeaurora.org>
 <20181107140552.zfuusbapgqjumoln@bars>
 <0b75171a7777bd25e203240a3a119cb5@codeaurora.org>
 <20181109094017.j4vkhaprz4zmszch@bars>
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
To: Sergey Matyukevich <sergey.matyukevich.os@quantenna.com>, Tamizh chelvam <tamizhr@codeaurora.org>
Cc: Vasanthakumar Thiagarajan <vthiagar@codeaurora.org>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On Fri, 2018-11-09 at 09:40 +0000, Sergey Matyukevich wrote:
> 
> Ok. So if driver receives retry value (-1), it should reset to some
> default value known to driver or firmware. IMHO it worth making it
> more explicit: in its current form this convention will not be obvious
> for driver authors. Though I don't have a good idea how to do it.
> Maybe merge both aggregation and retry cfg80211 callbacks into one
> and use structure for params and bitmask for operations...

I think we want that anyway, I just suggested to also add the "noack" to
the same API, and indeed it's pointless to set retries and noack.

johannes


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
