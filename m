Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XYq6T-00018o-DX
 for ath10k@lists.infradead.org; Tue, 30 Sep 2014 05:36:02 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: checkpatch: CHECK: No space is necessary after a cast
References: <874mvq1w9v.fsf@kamboji.qca.qualcomm.com>
 <1412013755.4302.45.camel@joe-AO725>
Date: Tue, 30 Sep 2014 08:35:32 +0300
In-Reply-To: <1412013755.4302.45.camel@joe-AO725> (Joe Perches's message of
 "Mon, 29 Sep 2014 11:02:35 -0700")
Message-ID: <87bnpxy8kb.fsf@kamboji.qca.qualcomm.com>
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
To: Joe Perches <joe@perches.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>, ath10k@lists.infradead.org, Dan Carpenter <error27@gmail.com>

Joe Perches <joe@perches.com> writes:

> On Mon, 2014-09-29 at 14:49 +0300, Kalle Valo wrote:
>> Hi Joe,
>> 
>> I have a problem with checkpatch. On ath10k we have this function:
>> 
>> static inline struct ath10k_skb_cb *ATH10K_SKB_CB(struct sk_buff *skb)
>> {
>> 	BUILD_BUG_ON(sizeof(struct ath10k_skb_cb) >
>> 		     IEEE80211_TX_INFO_DRIVER_DATA_SIZE);
>> 	return (struct ath10k_skb_cb *)&IEEE80211_SKB_CB(skb)->driver_data;
>> }
>> 
>> And the BUILD_BUG_ON triggers this warning:
>> 
>> drivers/net/wireless/ath/ath10k/core.h:85: CHECK: No space is necessary after a cast
>> 
>> Any advice how to handle that?
>
> It's a checkpatch false positive that could be fixed.
>
> It needs something like another test to look for
> sizeof(type) as not a cast and more arithmetic/comparison
> uses.
>
> Maybe you can test this?

It works, thank you!

Tested-by: Kalle Valo <kvalo@qca.qualcomm.com>

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
