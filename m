Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iFH9o-0008LN-4f
 for ath10k@lists.infradead.org; Tue, 01 Oct 2019 12:21:33 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH 6/6] ath10k: sdio: replace skb_trim with explicit set of
 skb->len
References: <20190409190851.4557-1-erik.stromdahl@gmail.com>
 <20190409190851.4557-7-erik.stromdahl@gmail.com>
 <87zhovcqhl.fsf@kamboji.qca.qualcomm.com>
 <deca77d1-f171-e0cd-b571-89c2f8bafc87@gmail.com>
Date: Tue, 01 Oct 2019 15:21:26 +0300
In-Reply-To: <deca77d1-f171-e0cd-b571-89c2f8bafc87@gmail.com> (Erik
 Stromdahl's message of "Mon, 15 Apr 2019 17:11:27 +0200")
Message-ID: <875zl864hl.fsf@kamboji.qca.qualcomm.com>
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
Cc: Johannes Berg <johannes@sipsolutions.net>, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

+ johannes

Erik Stromdahl <erik.stromdahl@gmail.com> writes:

> On 4/12/19 3:17 PM, Kalle Valo wrote:
>> Erik Stromdahl <erik.stromdahl@gmail.com> writes:
>>
>>> This patch fixes a bug with padding of the skb data buffer.
>>> Since skb_trim can only be used to reduce the skb len, it is useless when
>>> we pad (increase the length of) the skb. Instead we must set skb->len
>>> directly.
>>>
>>> Signed-off-by: Erik Stromdahl <erik.stromdahl@gmail.com>
>>> ---
>>>   drivers/net/wireless/ath/ath10k/sdio.c | 7 ++++++-
>>>   1 file changed, 6 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/net/wireless/ath/ath10k/sdio.c b/drivers/net/wireless/ath/ath10k/sdio.c
>>> index 3eb241cb8a25..989e3f563f3d 100644
>>> --- a/drivers/net/wireless/ath/ath10k/sdio.c
>>> +++ b/drivers/net/wireless/ath/ath10k/sdio.c
>>> @@ -1496,7 +1496,12 @@ static int ath10k_sdio_hif_tx_sg(struct ath10k *ar, u8 pipe_id,
>>>   		skb = items[i].transfer_context;
>>>   		padded_len = ath10k_sdio_calc_txrx_padded_len(ar_sdio,
>>>   							      skb->len);
>>> -		skb_trim(skb, padded_len);
>>> +		/* FIXME: unsure if just extending the skb len is the right
>>> +		 * thing to do since we might read outside the skb->data
>>> +		 * buffer. But we really don't want to realloc the skb just to
>>> +		 * pad the length.
>>> +		 */
>>> +		skb->len = padded_len;
>>
>> Good catch! But I don't think you can modify skb->len directly like
>> that. There is skb_pad() but that doesn't change skb->len, so that most
>> likely needs more changes. So maybe skb_put() is the safest here?
>>
> I have tried a few different solutions for this, but none seems to be
> bullet proof.
>
> skb_pad() raises a BUG() if there is not enough space in skb->data.
>
> The best candidate so far has been skb_put_padto(). It pads and reallocates
> the skb if needed.
>
> The problem is that it also cause a panic if there is more than one reference
> to the skb (skb_shared() returns true).
>
> Some of the management frames via nl80211 have a refcount of 2.
> In this case it is not possible to free and allocate the skb since there are
> other users/references.
>
> I think I will have to make some kind of solution where I copy the content of
> the skb to an internal buffer instead.

Sorry for the late reply, I see that you also tried a different (and
more complex) approach here:

https://patchwork.kernel.org/patch/10906011/

In my opinion the cleanest approach would be to add extra_tx_tailroom to
struct ieee80211_hw, similarly like we have extra_tx_headroom, and that
way ath10k could easily add the padding with skb_pad(). Or what do you
think?

Of course I don't know what Johannes thinks as it would need several
changes in mac80211, but at least struct net_device has needed_tailroom
as well. And I would imagine that there is some other hardware which
needs to do padding like this, or are ath10k SDIO devices really the
first mac80211 drivers needing tailroom?

-- 
https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
