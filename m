Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iNa8X-00056p-2s
 for ath10k@lists.infradead.org; Thu, 24 Oct 2019 10:14:34 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH v6 2/3] ath10k: change max RX bundle size from 8 to 32 for
 sdio
References: <1569402639-31720-1-git-send-email-wgong@codeaurora.org>
 <1569402639-31720-3-git-send-email-wgong@codeaurora.org>
 <87r232sdeh.fsf@kamboji.qca.qualcomm.com>
 <c2227ffd5901b03a2874fddb98298e0d@codeaurora.org>
Date: Thu, 24 Oct 2019 13:14:27 +0300
In-Reply-To: <c2227ffd5901b03a2874fddb98298e0d@codeaurora.org> (Wen Gong's
 message of "Thu, 24 Oct 2019 17:40:25 +0800")
Message-ID: <87d0emsb5o.fsf@kamboji.qca.qualcomm.com>
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
To: Wen Gong <wgong@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Wen Gong <wgong@codeaurora.org> writes:

> On 2019-10-24 17:25, Kalle Valo wrote:
>> Wen Gong <wgong@codeaurora.org> writes:
>>
>>> The max bundle size support by firmware is 32, change it from 8 to 32
>>> will help performance. This results in significant performance
>>> improvement on RX path.
>>>
>>> Tested with QCA6174 SDIO with firmware
>>> WLAN.RMH.4.4.1-00017-QCARMSWPZ-1
>>>
>>> Signed-off-by: Wen Gong <wgong@codeaurora.org>
>>> ---
>>>  drivers/net/wireless/ath/ath10k/htc.h  | 12 +++++++++---
>>>  drivers/net/wireless/ath/ath10k/sdio.c |  4 ++--
>>>  drivers/net/wireless/ath/ath10k/sdio.h |  4 ++--
>>>  3 files changed, 13 insertions(+), 7 deletions(-)
>>>
>>> diff --git a/drivers/net/wireless/ath/ath10k/htc.h
>>> b/drivers/net/wireless/ath/ath10k/htc.h
>>> index f55d3ca..7055156 100644
>>> --- a/drivers/net/wireless/ath/ath10k/htc.h
>>> +++ b/drivers/net/wireless/ath/ath10k/htc.h
>>> @@ -39,7 +39,7 @@
>>>   * 4-byte aligned.
>>>   */
>>>
>>> -#define HTC_HOST_MAX_MSG_PER_RX_BUNDLE        8
>>> +#define HTC_HOST_MAX_MSG_PER_RX_BUNDLE        32
>>
>> So how do I know that this change doesn't break any other hardware? I
>> did a quick review and I think it's safe, but the commit log mentions
>> nothing about this.
>
> the real max rx bundle is decided in ath10k_htc_wait_target.
> it is the min value of HTC_HOST_MAX_MSG_PER_RX_BUNDLE and the value
> reported from firmware.
> htc->max_msgs_per_htc_bundle =
> 			min_t(u8, msg->ready_ext.max_msgs_per_htc_bundle,
> 			      HTC_HOST_MAX_MSG_PER_RX_BUNDLE);

And we assume that no other firmware than QCA6174 SDIO uses value bigger
than 8? Because if there is a such firmware using, for example, value 9
this might cause a regression.

Anyway, I added this comment to the commit log:

  The real max rx bundle is decided in ath10k_htc_wait_target(), it is
  the min value of HTC_HOST_MAX_MSG_PER_RX_BUNDLE and the value reported
  from firmware. So this change shouldn't cause any regressions with
  other hardware supported by ath10k.

-- 
https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
