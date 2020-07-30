Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k17rS-0004uy-KN
 for ath10k@lists.infradead.org; Thu, 30 Jul 2020 12:40:52 +0000
Message-ID: <446c9e45b5e904fa747c3d727a2c39ee904789e0.camel@sipsolutions.net>
Subject: Re: [RFC 1/7] mac80211: Add check for napi handle before WARN_ON
From: Johannes Berg <johannes@sipsolutions.net>
Date: Thu, 30 Jul 2020 14:40:21 +0200
In-Reply-To: <000e01d66368$9a6ece70$cf4c6b50$@codeaurora.org>
References: <1595351666-28193-1-git-send-email-pillair@codeaurora.org>
 <1595351666-28193-2-git-send-email-pillair@codeaurora.org>
 <0dbdef912f9d61521011f638200fd451a3530568.camel@sipsolutions.net>
 <003201d6611e$c54a1c90$4fde55b0$@codeaurora.org>
 <ce380ea1fd1f5db40a92f67673f070a1f88eee50.camel@sipsolutions.net>
 <000e01d66368$9a6ece70$cf4c6b50$@codeaurora.org>
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
To: Rakesh Pillai <pillair@codeaurora.org>, ath10k@lists.infradead.org
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, evgreen@chromium.org, dianders@chromium.org, kuba@kernel.org, davem@davemloft.net, kvalo@codeaurora.org

On Sun, 2020-07-26 at 21:49 +0530, Rakesh Pillai wrote:

> We do have the usage of napi_gro_receive and netif_receive_skb in mac80211.
>                 /* deliver to local stack */
>                 if (rx->napi)
>                         napi_gro_receive(rx->napi, skb);
>                 else
>                         netif_receive_skb(skb);
> 
> 
> Also all the rx_handlers are called under the " rx->local->rx_path_lock" lock.
> Is the BH disable still required ?

I tend to think so, but you're welcome to show that it's not. The lock
serves a different purpose.

TBH, I don't have all of this in my head at all times either, so please
do your own work and analyse why it may or may not be necessary. But
without any such analysis I'm not going to take patches that change it.

johannes


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
