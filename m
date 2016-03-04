Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1abrnh-0003wg-Vj
 for ath10k@lists.infradead.org; Fri, 04 Mar 2016 15:37:58 +0000
From: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 10/13] ath10k: implement flushing of pending frames in txqs
Date: Fri, 4 Mar 2016 15:37:28 +0000
Message-ID: <87twkmw8y5.fsf@kamboji.qca.qualcomm.com>
References: <1453384006-31907-1-git-send-email-michal.kazior@tieto.com>
 <1453384006-31907-11-git-send-email-michal.kazior@tieto.com>
 <87h9gmy538.fsf@kamboji.qca.qualcomm.com>
 <CA+BoTQmgMBfz+Dkf-+0gDHvnhk5OA4_ZGZgwYDKXG5yP-xMRYw@mail.gmail.com>
In-Reply-To: <CA+BoTQmgMBfz+Dkf-+0gDHvnhk5OA4_ZGZgwYDKXG5yP-xMRYw@mail.gmail.com>	(Michal
 Kazior's message of "Fri, 4 Mar 2016 10:52:04 +0100")
Content-Language: en-US
Content-ID: <926EC7E91D09144DA08D350C977DEF36@qualcomm.com>
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
To: "michal.kazior@tieto.com" <michal.kazior@tieto.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Michal Kazior <michal.kazior@tieto.com> writes:

> On 4 March 2016 at 10:17, Valo, Kalle <kvalo@qca.qualcomm.com> wrote:
>> Michal Kazior <michal.kazior@tieto.com> writes:
>>
>>> Firmware supporting pull-push tx model may request
>>> a switch between modes. When switching from
>>> pull-push to push-only it will be necessary to
>>> flush all pending frames. The code will do that
>>> once other bits that actually trigger it are added.
>>>
>>> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
>>
>> This fails to apply:
>>
>> fatal: sha1 information is lacking or useless (drivers/net/wireless/ath/ath10k/htt_rx.c).
>> Repository lacks necessary blobs to fall back on 3-way merge.
>> Cannot fall back to three-way merge.
>> Patch failed at 0010 ath10k: implement flushing of pending frames in txqs
>>
>>> @@ -2370,6 +2371,8 @@ static void ath10k_htt_txrx_compl_task(unsigned long ptr)
>>>               dev_kfree_skb_any(skb);
>>>       }
>>>
>>> +     ath10k_mac_tx_push_pending(ar);
>>> +
>>>       spin_lock_bh(&htt->rx_ring.lock);
>>>       while ((skb = __skb_dequeue(&htt->rx_compl_q))) {
>>>               resp = (struct htt_resp *)skb->data;
>>
>> This hunk seems to be the problem. I could try to fix it myself but the
>> function has changed so I would prefer that you respin.
>
> This patch is in v1. It's base included some extra patches that
> weren't in ath.git at the time.
>
> The v2 patchset has this patch squashed into wake_tx_queue patch and
> the entire v2 patchset is based solely on ath.git without any extra
> patches in between. Did patchwork confuse these patchsets?

No, it was me who got confused :) I was accidentally applying v1 instead
of v2.

But v2 also has conflicts with ath-next. I need to first update my trees
to get latest cfg80211/mac80211 and then I'll try again.

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
