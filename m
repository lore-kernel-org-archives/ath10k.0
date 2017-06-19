Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dMykt-0005kZ-IZ
 for ath10k@lists.infradead.org; Mon, 19 Jun 2017 15:38:21 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [RFC v2 05/10] ath10k: htt: High latency TX support
Date: Mon, 19 Jun 2017 15:37:37 +0000
Message-ID: <87efugxa2o.fsf@kamboji.qca.qualcomm.com>
References: <1497279791-9598-1-git-send-email-erik.stromdahl@gmail.com>
 <1497279791-9598-6-git-send-email-erik.stromdahl@gmail.com>
 <f446d226-ca60-7dcb-f62d-00de6ead4cd4@bowerswilkins.com>
 <3b0e54b7-fa0f-3609-e793-f443e05d7595@gmail.com>
In-Reply-To: <3b0e54b7-fa0f-3609-e793-f443e05d7595@gmail.com> (Erik
 Stromdahl's message of "Sat, 17 Jun 2017 19:59:59 +0200")
Content-Language: en-US
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
To: Erik Stromdahl <erik.stromdahl@gmail.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, Peter Oh <peter.oh@bowerswilkins.com>

Erik Stromdahl <erik.stromdahl@gmail.com> writes:

> On 2017-06-13 19:38, Peter Oh wrote:
>> On 06/12/2017 08:03 AM, Erik Stromdahl wrote:
>>> Add HTT TX function for HL interfaces.
>>> Intended for SDIO and USB.
>>>
>>> Signed-off-by: Erik Stromdahl <erik.stromdahl@gmail.com>
>>> ---
>>>
>>> diff --git a/drivers/net/wireless/ath/ath10k/mac.c
>>> b/drivers/net/wireless/ath/ath10k/mac.c
>>> index 48418f9..c5fd803 100644
>>> --- a/drivers/net/wireless/ath/ath10k/mac.c
>>> +++ b/drivers/net/wireless/ath/ath10k/mac.c
>>> @@ -3572,7 +3572,10 @@ static int ath10k_mac_tx_submit(struct ath10k *ar,
>>>       switch (txpath) {
>>>       case ATH10K_MAC_TX_HTT:
>>> -        ret = ath10k_htt_tx(htt, txmode, skb);
>>> +        if (ar->is_high_latency)
>> Can we use function pointers at initial time to avoid condition check at hot path?
>> I'm afraid adding more lines on hot path.
>
> I haven't made any comparison of assembly code between if-paths or
> function pointers, but since most architectures have conditional
> instructions I don't think the penalty is that big (if there is any
> penalty at all). There are plenty of other condition checks in the RX
> path (mac80211 is full of them), so I don't really see this as an
> issue.

Unless we can measure it I wouldn't be that worried either. Without
numbers trying to optimise is hard to get right.

> That being said, any improvement is always welcome (even micro
> optimizations if they are beneficial). I will think about this and see
> if adding function pointers can be done in a nice way.

But are function pointers really that much faster? You have to do a
function call anyway. And maybe use of likely() would be better, we want
to optimise for the low latency case anyway, but I still doubt we could
even measure that.

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
