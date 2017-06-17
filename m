Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lf0-x244.google.com ([2a00:1450:4010:c07::244])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dMI1I-0004g4-GL
 for ath10k@lists.infradead.org; Sat, 17 Jun 2017 18:00:26 +0000
Received: by mail-lf0-x244.google.com with SMTP id x81so6877402lfb.3
 for <ath10k@lists.infradead.org>; Sat, 17 Jun 2017 11:00:03 -0700 (PDT)
Subject: Re: [RFC v2 05/10] ath10k: htt: High latency TX support
References: <1497279791-9598-1-git-send-email-erik.stromdahl@gmail.com>
 <1497279791-9598-6-git-send-email-erik.stromdahl@gmail.com>
 <f446d226-ca60-7dcb-f62d-00de6ead4cd4@bowerswilkins.com>
From: Erik Stromdahl <erik.stromdahl@gmail.com>
Message-ID: <3b0e54b7-fa0f-3609-e793-f443e05d7595@gmail.com>
Date: Sat, 17 Jun 2017 19:59:59 +0200
MIME-Version: 1.0
In-Reply-To: <f446d226-ca60-7dcb-f62d-00de6ead4cd4@bowerswilkins.com>
Content-Language: en-US
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
To: Peter Oh <peter.oh@bowerswilkins.com>, kvalo@qca.qualcomm.com, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org



On 2017-06-13 19:38, Peter Oh wrote:
> On 06/12/2017 08:03 AM, Erik Stromdahl wrote:
>> Add HTT TX function for HL interfaces.
>> Intended for SDIO and USB.
>>
>> Signed-off-by: Erik Stromdahl <erik.stromdahl@gmail.com>
>> ---
>>
>> diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
>> index 48418f9..c5fd803 100644
>> --- a/drivers/net/wireless/ath/ath10k/mac.c
>> +++ b/drivers/net/wireless/ath/ath10k/mac.c
>> @@ -3572,7 +3572,10 @@ static int ath10k_mac_tx_submit(struct ath10k *ar,
>>       switch (txpath) {
>>       case ATH10K_MAC_TX_HTT:
>> -        ret = ath10k_htt_tx(htt, txmode, skb);
>> +        if (ar->is_high_latency)
> Can we use function pointers at initial time to avoid condition check at hot path?
> I'm afraid adding more lines on hot path.
I haven't made any comparison of assembly code between if-paths or function pointers,
but since most architectures have conditional instructions I don't think the
penalty is that big (if there is any penalty at all).
There are plenty of other condition checks in the RX path (mac80211 is full of them),
so I don't really see this as an issue.
That being said, any improvement is always welcome (even micro optimizations
if they are beneficial).
I will think about this and see if adding function pointers can be done in a nice way.

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
