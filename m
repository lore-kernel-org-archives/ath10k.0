Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Ve1dn-0005J9-1F
 for ath10k@lists.infradead.org; Wed, 06 Nov 2013 11:51:19 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: Fix crash due to tasklet race.
References: <1383082737-20728-1-git-send-email-greearb@candelatech.com>
 <CA+BoTQ=qUgR4TEcUMjV88RD+fFreCkkEtHfu5hB2_BguirfNHg@mail.gmail.com>
Date: Wed, 6 Nov 2013 13:50:51 +0200
In-Reply-To: <CA+BoTQ=qUgR4TEcUMjV88RD+fFreCkkEtHfu5hB2_BguirfNHg@mail.gmail.com>
 (Michal Kazior's message of "Wed, 30 Oct 2013 10:03:48 +0100")
Message-ID: <87r4atsq90.fsf@kamboji.qca.qualcomm.com>
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
To: Michal Kazior <michal.kazior@tieto.com>
Cc: Ben Greear <greearb@candelatech.com>, ath10k@lists.infradead.org

Michal Kazior <michal.kazior@tieto.com> writes:

> On 29 October 2013 22:38,  <greearb@candelatech.com> wrote:
>> From: Ben Greear <greearb@candelatech.com>
>>
>> The tasklet can run after the rings have been cleaned up,
>> so check for NULL before de-referencing the ring.
>>
>> Signed-off-by: Ben Greear <greearb@candelatech.com>
>> ---
>>  drivers/net/wireless/ath/ath10k/ce.c | 10 ++++++++--
>>  1 file changed, 8 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/net/wireless/ath/ath10k/ce.c b/drivers/net/wireless/ath/ath10k/ce.c
>> index d243f28..dfcfda9 100644
>> --- a/drivers/net/wireless/ath/ath10k/ce.c
>> +++ b/drivers/net/wireless/ath/ath10k/ce.c
>> @@ -547,12 +547,18 @@ static int ath10k_ce_completed_send_next_nolock(struct ath10k_ce_pipe *ce_state,
>>         struct ath10k_ce_ring *src_ring = ce_state->src_ring;
>>         u32 ctrl_addr = ce_state->ctrl_addr;
>>         struct ath10k *ar = ce_state->ar;
>> -       unsigned int nentries_mask = src_ring->nentries_mask;
>> -       unsigned int sw_index = src_ring->sw_index;
>> +       unsigned int nentries_mask;
>> +       unsigned int sw_index;
>>         struct ce_desc *sdesc, *sbase;
>>         unsigned int read_index;
>>         int ret;
>>
>> +       if (!src_ring)
>> +               return -EIO;
>
> I don't think this is a proper way to fix the problem. What should be
> done is initialization clean up and some reordering to prevent this
> from happening in the first place.

I agree with Michal, but as we don't have any better fix for this issue
I'm inclined to take the patch anyway. Maybe there just should be a
comment stating that it's an ugly workaround and a WARN_ON() to make
sure that we properly fix the interrupt initialisation.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
