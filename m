Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZAFA5-0005tC-Dr
 for ath10k@lists.infradead.org; Wed, 01 Jul 2015 10:22:37 +0000
Message-ID: <5593BF46.8010108@qti.qualcomm.com>
Date: Wed, 1 Jul 2015 15:51:58 +0530
From: rmani <rmani@qti.qualcomm.com>
MIME-Version: 1.0
Subject: Re: [PATCH v2 1/8] ath10k: enhance swba event handler to adapt
 different size tim bitmap
References: <1434984747-24294-1-git-send-email-rmani@qti.qualcomm.com>
 <1434984747-24294-2-git-send-email-rmani@qti.qualcomm.com>
 <87h9poxjvs.fsf@kamboji.qca.qualcomm.com>
In-Reply-To: <87h9poxjvs.fsf@kamboji.qca.qualcomm.com>
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
To: Kalle Valo <kvalo@qca.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

On 07/01/2015 03:46 PM, Kalle Valo wrote:
> Raja Mani <rmani@qti.qualcomm.com> writes:
>
>> Due to 512 client support in 10.4 firmware, size of tim ie is going
>> to be slightly higher than non 10.4 firmware. So, size of tim_bitmap
>> what is carried in swba event from 10.4 firmware is bit higher.
>>
>> The only bottle neck to reuse existing swba handler
>> ath10k_wmi_event_host_swba() for 10.4 is that code designed to deal
>> with fixed size tim bitmap(ie, tim_info[].tim_bitmap in wmi_swba_ev_arg).
>> This patch removes such size limitation and makes it more suitable
>> to handle swba event which has different size tim bitmap.
>>
>> All existing swba event parsing functions are changed to adapt this
>> change. Actual support to handle 10.4 swba event is added in next patch.
>> Only preparation is made in this patch.
>>
>> Signed-off-by: Raja Mani <rmani@qti.qualcomm.com>
>
[..]
>> -		BUILD_BUG_ON(sizeof(arvif->u.ap.tim_bitmap) !=
>> -			     sizeof(tim_info->tim_bitmap));
>> +		WARN_ON(sizeof(arvif->u.ap.tim_bitmap) < tim_len);
>
> I'm worried that this WARN_ON() spams too much so I changed it to:
>
> --- a/drivers/net/wireless/ath/ath10k/wmi.c
> +++ b/drivers/net/wireless/ath/ath10k/wmi.c
> @@ -2893,7 +2893,7 @@ static void ath10k_wmi_update_tim(struct ath10k *ar,
>          if (__le32_to_cpu(tim_info->tim_changed)) {
>                  int i;
>
> -               WARN_ON(sizeof(arvif->u.ap.tim_bitmap) < tim_len);
> +               WARN_ON_ONCE(sizeof(arvif->u.ap.tim_bitmap) < tim_len);
>
>                  for (i = 0; i < tim_len; i++) {
>                          t = tim_info->tim_bitmap[i / 4];
>
>

The change looks good to me.

--
Raja



_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
