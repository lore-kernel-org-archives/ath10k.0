Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jyEMN-0002fY-KB
 for ath10k@lists.infradead.org; Wed, 22 Jul 2020 13:00:36 +0000
Subject: Re: [RFC 2/7] ath10k: Add support to process rx packet in thread
References: <1595351666-28193-1-git-send-email-pillair@codeaurora.org>
 <1595351666-28193-3-git-send-email-pillair@codeaurora.org>
 <13573549c277b34d4c87c471ff1a7060@codeaurora.org>
 <d79ae05e-e75a-de2f-f2e3-bc73637e1501@nbd.name>
 <04d7301d5ad7555a0377c7df530ad8522fc00f77.camel@sipsolutions.net>
From: Felix Fietkau <nbd@nbd.name>
Message-ID: <1f2726ff-8ba9-5278-0ec6-b80be475ea98@nbd.name>
Date: Wed, 22 Jul 2020 15:00:30 +0200
MIME-Version: 1.0
In-Reply-To: <04d7301d5ad7555a0377c7df530ad8522fc00f77.camel@sipsolutions.net>
Content-Language: en-US
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
To: Johannes Berg <johannes@sipsolutions.net>, Rajkumar Manoharan <rmanohar@codeaurora.org>, Rakesh Pillai <pillair@codeaurora.org>
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, dianders@chromium.org, evgreen@chromium.org, kuba@kernel.org, davem@davemloft.net, kvalo@codeaurora.org

On 2020-07-22 14:55, Johannes Berg wrote:
> On Wed, 2020-07-22 at 14:27 +0200, Felix Fietkau wrote:
> 
>> I'm considering testing a different approach (with mt76 initially):
>> - Add a mac80211 rx function that puts processed skbs into a list
>> instead of handing them to the network stack directly.
> 
> Would this be *after* all the mac80211 processing, i.e. in place of the
> rx-up-to-stack?
Yes, it would run all the rx handlers normally and then put the
resulting skbs into a list instead of calling netif_receive_skb or
napi_gro_frags.

- Felix

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
