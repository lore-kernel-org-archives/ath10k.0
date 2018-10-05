Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from gateway36.websitewelcome.com ([192.185.199.121])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g8VaA-0001B4-TL
 for ath10k@lists.infradead.org; Fri, 05 Oct 2018 19:16:16 +0000
Received: from cm17.websitewelcome.com (cm17.websitewelcome.com [100.42.49.20])
 by gateway36.websitewelcome.com (Postfix) with ESMTP id 6DCC9400E2E8D
 for <ath10k@lists.infradead.org>; Fri,  5 Oct 2018 13:22:25 -0500 (CDT)
Subject: Re: [PATCH] ath10k: htt_rx: Fix signedness bug in
 ath10k_update_per_peer_tx_stats
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
References: <20181005184245.GA11700@embeddedor.com>
 <3a55bec6-d20d-f500-e741-b228a86b7117@candelatech.com>
 <dd75a8aa-b87c-e325-cc1d-a0efe3664a32@embeddedor.com>
Message-ID: <fcc51fdd-fc31-9d2c-2e68-4ceecbb86129@embeddedor.com>
Date: Fri, 5 Oct 2018 21:15:49 +0200
MIME-Version: 1.0
In-Reply-To: <dd75a8aa-b87c-e325-cc1d-a0efe3664a32@embeddedor.com>
Content-Language: en-GB
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Ben Greear <greearb@candelatech.com>, Kalle Valo <kvalo@codeaurora.org>, "David S. Miller" <davem@davemloft.net>
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org



On 10/5/18 9:14 PM, Gustavo A. R. Silva wrote:
> =

> =

> On 10/5/18 9:09 PM, Ben Greear wrote:
>> On 10/05/2018 11:42 AM, Gustavo A. R. Silva wrote:
>>> Currently, the error handling for the call to function
>>> ath10k_get_legacy_rate_idx() doesn't work because
>>> *rate_idx* is of type u8 (8 bits, unsigned), which
>>> makes it impossible for it to hold a value less
>>> than 0.
>>>
>>> Fix this by changing the type of variable *rate_idx*
>>> to s8 (8 bits, signed).
>>
>> There are more than 127 rates, are you sure this is doing
>> what you want?
>>
> =

> Based on the following function, rate_idx can only hold values from 0 to =
11
> =


... and of course -EINVAL too

> static inline int ath10k_get_legacy_rate_idx(struct ath10k *ar, u8 rate)
> {
>         static const u8 legacy_rates[] =3D {1, 2, 5, 11, 6, 9, 12,
>                                           18, 24, 36, 48, 54};
>         int i;
> =

>         for (i =3D 0; i < ARRAY_SIZE(legacy_rates); i++) {
>                 if (rate =3D=3D legacy_rates[i])
>                         return i;
>         }
> =

>         ath10k_warn(ar, "Invalid legacy rate %hhd peer stats", rate);
>         return -EINVAL;
> }
> =

> Thanks
> --
> Gustavo
> =

>> Thanks,
>> Ben
>>
>>>
>>> Addresses-Coverity-ID: 1473914 ("Unsigned compared against 0")
>>> Fixes: 0189dbd71cbd ("ath10k: get the legacy rate index to update the t=
xrate table")
>>> Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
>>> ---
>>> =A0drivers/net/wireless/ath/ath10k/htt_rx.c | 3 ++-
>>> =A01 file changed, 2 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/net/wireless/ath/ath10k/htt_rx.c b/drivers/net/wir=
eless/ath/ath10k/htt_rx.c
>>> index f240525..edd0e74 100644
>>> --- a/drivers/net/wireless/ath/ath10k/htt_rx.c
>>> +++ b/drivers/net/wireless/ath/ath10k/htt_rx.c
>>> @@ -2753,7 +2753,8 @@ ath10k_update_per_peer_tx_stats(struct ath10k *ar,
>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 struct ath10k_per_peer=
_tx_stats *peer_stats)
>>> =A0{
>>> =A0=A0=A0=A0 struct ath10k_sta *arsta =3D (struct ath10k_sta *)sta->drv=
_priv;
>>> -=A0=A0=A0 u8 rate =3D 0, rate_idx =3D 0, sgi;
>>> +=A0=A0=A0 u8 rate =3D 0, sgi;
>>> +=A0=A0=A0 s8 rate_idx =3D 0;
>>> =A0=A0=A0=A0 struct rate_info txrate;
>>>
>>> =A0=A0=A0=A0 lockdep_assert_held(&ar->data_lock);
>>>
>>
>>

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
