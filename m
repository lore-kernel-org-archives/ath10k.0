Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZqjUG-00054D-LS
 for ath10k@lists.infradead.org; Mon, 26 Oct 2015 15:15:05 +0000
Message-ID: <562E4363.3000408@candelatech.com>
Date: Mon, 26 Oct 2015 08:14:43 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: update antenna configuration after setting in fw
References: <1445851330-18736-1-git-send-email-manikanta.pubbisetty@gmail.com>
 <CAMu38xLre1jS7Vjsc3sL80oTkVhg5YQJV-U-CXeEQo8k2Zqp-A@mail.gmail.com>
 <562DFC61.7080108@gmail.com>
In-Reply-To: <562DFC61.7080108@gmail.com>
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
To: Manikanta <manikanta.pubbisetty@gmail.com>, Albino B Neto <bino@bino.us>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org



On 10/26/2015 03:11 AM, Manikanta wrote:
>
> On Monday 26 October 2015 03:35 PM, Albino B Neto wrote:
>> 2015-10-26 7:22 GMT-02:00  <manikanta.pubbisetty@gmail.com>:
>>> Signed-off-by: Manikanta Pubbisetty <manikanta.pubbisetty@gmail.com>
>>> ---
>>>   drivers/net/wireless/ath/ath10k/mac.c | 6 +++---
>>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
>>> index 484c1a1..8d0ce37 100644
>>> --- a/drivers/net/wireless/ath/ath10k/mac.c
>>> +++ b/drivers/net/wireless/ath/ath10k/mac.c
>>> @@ -3771,9 +3771,6 @@ static int __ath10k_set_antenna(struct ath10k *ar, u32 tx_ant, u32 rx_ant)
>>>          ath10k_check_chain_mask(ar, tx_ant, "tx");
>>>          ath10k_check_chain_mask(ar, rx_ant, "rx");
>>>
>>> -       ar->cfg_tx_chainmask = tx_ant;
>>> -       ar->cfg_rx_chainmask = rx_ant;
>>> -
>>>          if ((ar->state != ATH10K_STATE_ON) &&
>>>              (ar->state != ATH10K_STATE_RESTARTED))
>>>                  return 0;
>>> @@ -3794,6 +3791,9 @@ static int __ath10k_set_antenna(struct ath10k *ar, u32 tx_ant, u32 rx_ant)
>>>                  return ret;
>>>          }
>>>
>>> +       ar->cfg_tx_chainmask = tx_ant;
>>> +       ar->cfg_rx_chainmask = rx_ant;
>>> +
>>>          return 0;
>>>   }
>> Sorry, I see no change in the code. script checkpatch.pl ?
> I have moved these two lines of code from the start of the function to the end, in between there is code for setting the antenna config in firmware. You can find in commit log why I have moved the code down in the function.

I think you should leave it as it was.  That way, you can reliably set the mask
before the hardware is started, and as soon as it _is_ started, then the value is
flushed to the hardware as expected.

Thanks,
Ben


>
> -Manikanta
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-wireless" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
