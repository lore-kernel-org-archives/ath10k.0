Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail29.static.mailgun.info ([104.130.122.29])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jyUQa-0003sn-91
 for ath10k@lists.infradead.org; Thu, 23 Jul 2020 06:10:05 +0000
MIME-Version: 1.0
Date: Wed, 22 Jul 2020 23:09:49 -0700
From: Rajkumar Manoharan <rmanohar@codeaurora.org>
Subject: Re: [RFC 2/7] ath10k: Add support to process rx packet in thread
In-Reply-To: <1f2726ff-8ba9-5278-0ec6-b80be475ea98@nbd.name>
References: <1595351666-28193-1-git-send-email-pillair@codeaurora.org>
 <1595351666-28193-3-git-send-email-pillair@codeaurora.org>
 <13573549c277b34d4c87c471ff1a7060@codeaurora.org>
 <d79ae05e-e75a-de2f-f2e3-bc73637e1501@nbd.name>
 <04d7301d5ad7555a0377c7df530ad8522fc00f77.camel@sipsolutions.net>
 <1f2726ff-8ba9-5278-0ec6-b80be475ea98@nbd.name>
Message-ID: <cd705bfc39721d5738fe1ee3d806a131@codeaurora.org>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Felix Fietkau <nbd@nbd.name>
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, dianders@chromium.org, Rakesh Pillai <pillair@codeaurora.org>, evgreen@chromium.org, kuba@kernel.org, Johannes Berg <johannes@sipsolutions.net>, davem@davemloft.net, kvalo@codeaurora.org

On 2020-07-22 06:00, Felix Fietkau wrote:
> On 2020-07-22 14:55, Johannes Berg wrote:
>> On Wed, 2020-07-22 at 14:27 +0200, Felix Fietkau wrote:
>> 
>>> I'm considering testing a different approach (with mt76 initially):
>>> - Add a mac80211 rx function that puts processed skbs into a list
>>> instead of handing them to the network stack directly.
>> 
>> Would this be *after* all the mac80211 processing, i.e. in place of 
>> the
>> rx-up-to-stack?
> Yes, it would run all the rx handlers normally and then put the
> resulting skbs into a list instead of calling netif_receive_skb or
> napi_gro_frags.
> 
Felix,

This seems like split & batch processing. In past (ath9k), we observed 
some
behavioral differences between netif_rx and netif_receive_skb. The 
intermediate
queue in netif_rx changed not just performance but also time sensitive 
application
data. Agree that wireless stack processing might be heavier than 
ethernet packet
processing. If the hardware supports rx decap offload, NAPI processing 
shouldn't be
an issue. right?

-Rajkumar

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
