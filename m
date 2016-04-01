Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by merlin.infradead.org with esmtp (Exim 4.85 #2 (Red Hat Linux))
 id 1alzmq-0005uL-R9
 for ath10k@lists.infradead.org; Fri, 01 Apr 2016 14:10:57 +0000
Message-ID: <56FE7FEA.5090708@candelatech.com>
Date: Fri, 01 Apr 2016 07:04:26 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: [PATCH 3/3] ath10k: Add BUG_ON if we over-write peer-map pointer.
References: <1459457986-29222-1-git-send-email-greearb@candelatech.com>	<1459457986-29222-3-git-send-email-greearb@candelatech.com>
 <CA+BoTQkL5OM-QLVVe0RHEOoN-Vj4a0+U9EfaUf=2n+PO3mPDyQ@mail.gmail.com>
In-Reply-To: <CA+BoTQkL5OM-QLVVe0RHEOoN-Vj4a0+U9EfaUf=2n+PO3mPDyQ@mail.gmail.com>
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



On 03/31/2016 11:09 PM, Michal Kazior wrote:
> On 31 March 2016 at 22:59,  <greearb@candelatech.com> wrote:
>> From: Ben Greear <greearb@candelatech.com>
>>
>> Not sure this can happen, but seems like a reasonable sanity
>> check.
>>
>> Signed-off-by: Ben Greear <greearb@candelatech.com>
>> ---
>>   drivers/net/wireless/ath/ath10k/txrx.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/net/wireless/ath/ath10k/txrx.c b/drivers/net/wireless/ath/ath10k/txrx.c
>> index 94c27f6..172b1d6 100644
>> --- a/drivers/net/wireless/ath/ath10k/txrx.c
>> +++ b/drivers/net/wireless/ath/ath10k/txrx.c
>> @@ -309,6 +309,7 @@ void ath10k_peer_map_event(struct ath10k_htt *htt,
>>          ath10k_warn(ar, /*ATH10K_DBG_HTT,*/ "htt peer map vdev %d peer %pM id %d\n",
>>                     ev->vdev_id, ev->addr, ev->peer_id);
>>
>> +       BUG_ON(ar->peer_map[ev->peer_id] && (ar->peer_map[ev->peer_id] != peer));
>
> Does this really need to be a BUG_ON?

It means we have memory or logic corruption, or maybe we are out of sync with the
firmware, so I think it should be very visible, at least for a while.  I haven't
hit it, so not sure it can happen anyway....

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
