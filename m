Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by merlin.infradead.org with esmtp (Exim 4.85 #2 (Red Hat Linux))
 id 1am5oI-0000Ym-Vn
 for ath10k@lists.infradead.org; Fri, 01 Apr 2016 20:36:51 +0000
Subject: Re: [PATCH 1/3] ath10k: Ensure txrx-compl-task is stopped when
 cleaning htt-tx.
References: <1459457986-29222-1-git-send-email-greearb@candelatech.com>
 <CA+BoTQnmMKoK9z2QnTgBeRkXR0GdR1WV0XpOzD7JZnJ6QbHQ1w@mail.gmail.com>
From: Ben Greear <greearb@candelatech.com>
Message-ID: <56FEDBB8.2080404@candelatech.com>
Date: Fri, 1 Apr 2016 13:36:08 -0700
MIME-Version: 1.0
In-Reply-To: <CA+BoTQnmMKoK9z2QnTgBeRkXR0GdR1WV0XpOzD7JZnJ6QbHQ1w@mail.gmail.com>
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
To: Michal Kazior <michal.kazior@tieto.com>
Cc: linux-wireless <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On 03/31/2016 11:12 PM, Michal Kazior wrote:
> On 31 March 2016 at 22:59,  <greearb@candelatech.com> wrote:
>> From: Ben Greear <greearb@candelatech.com>
>>
>> Otherwise, the txrx-compl-task may access some bad memory?
>>
>> Signed-off-by: Ben Greear <greearb@candelatech.com>
>> ---
>>   drivers/net/wireless/ath/ath10k/htt_tx.c | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/drivers/net/wireless/ath/ath10k/htt_tx.c b/drivers/net/wireless/ath/ath10k/htt_tx.c
>> index 07b960e..58e88d3 100644
>> --- a/drivers/net/wireless/ath/ath10k/htt_tx.c
>> +++ b/drivers/net/wireless/ath/ath10k/htt_tx.c
>> @@ -376,6 +376,8 @@ void ath10k_htt_tx_free(struct ath10k_htt *htt)
>>   {
>>          int size;
>>
>> +       tasklet_kill(&htt->txrx_compl_task);
>> +
>
> I think, instead, the ordering of ath10k_htt_tx_free() and
> ath10k_htt_rx_free() should be reversed. It's already in the "correct"
> order in ath10k_core_stop() on error path.

That seems a bit too subtle for my taste, but either way
is fine with me.  You want to cook up a patch?

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
