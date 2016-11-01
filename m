Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by merlin.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c1dWg-0000IN-UU
 for ath10k@lists.infradead.org; Tue, 01 Nov 2016 18:11:11 +0000
Subject: Re: Question on 10.4 firmware and fetch-indication logic.
References: <9af68587-603e-2fa9-5ce9-1dc373238b71@candelatech.com>
 <CA+BoTQkxsrGsGTOzxrNvmTOrdOqL1STG4i1ke0Lei6gMP5VZwA@mail.gmail.com>
From: Ben Greear <greearb@candelatech.com>
Message-ID: <4ab2ca16-37ac-7cb2-fa2f-1c7e5eb7e3b8@candelatech.com>
Date: Tue, 1 Nov 2016 11:04:41 -0700
MIME-Version: 1.0
In-Reply-To: <CA+BoTQkxsrGsGTOzxrNvmTOrdOqL1STG4i1ke0Lei6gMP5VZwA@mail.gmail.com>
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
Cc: ath10k <ath10k@lists.infradead.org>

On 11/01/2016 10:56 AM, Michal Kazior wrote:
> On 1 November 2016 at 18:21, Ben Greear <greearb@candelatech.com> wrote:
>> I am testing on modified 4.7 kernel and modified firmware with QCA9984 NIC
>> and lots of virtual station vdevs.
>>
>> The issue I am looking at currently is that I am seeing floods of these
>> messages
>> in some cases:
>>
>> Nov 01 09:43:38 ath-9984 kernel: ath10k_pci 0000:05:00.0: fetch-ind: failed
>> to lookup txq for peer_id 56 tid 7
>> Nov 01 09:43:38 ath-9984 kernel: ath10k_pci 0000:05:00.0: fetch-ind: failed
>> to lookup txq for peer_id 56 tid 7
>> Nov 01 09:43:38 ath-9984 kernel: ath10k_pci 0000:05:00.0: fetch-ind: failed
>> to lookup txq for peer_id 56 tid 7
>> Nov 01 09:43:38 ath-9984 kernel: ath10k_pci 0000:05:00.0: fetch-ind: failed
>> to lookup txq for peer_id 56 tid 7
>>
>> From this code in htt_rx.c:
>>
>> static void ath10k_htt_rx_tx_fetch_ind(struct ath10k *ar, struct sk_buff
>> *skb)
>> ...
>>
>>                 /* It is okay to release the lock and use txq because RCU
>> read
>>                  * lock is held.
>>                  */
>>
>>                 if (unlikely(!txq)) {
>>                         if (net_ratelimit())
>>                                 ath10k_warn(ar, "fetch-ind: failed to lookup
>> txq for peer_id %hu tid %hhu\n",
>>                                             peer_id, tid);
>>                         continue;
>>                 }
>>
>>
>> I am getting these after the vdev in question (and its peers) have been
>> removed.  I guess these
>> must be stale buffers that are finally transmitted or cleaned up by the
>> firmware after
>> vdev has been deleted?
>>
>> I am curious if anyone else sees something similar, and if this is expected
>> behaviour.
>
> Hmm, WMI and HTT do use independent CE ring buffers but peer_ids are
> unmapped in response to HTT events so it should be properly serialized
> by firmware itself.
>
> Did you happen to not remove peers prior to deleting vdev? Perhaps
> that's the cause that triggers the !txq condition.
>
> Perhaps it would make sense to flush (i.e. put up a barrier) HTT rx
> after stopping vdev.

 From what I can tell, on peer removal, the firmware will flush the tids, and will
delay the low-level peer object deletion until tids are fully flushed.  Based on logging,
the peer deletion was not deferred in the case I looked at, and so at peer removal
time, there were no frames in the tid tx queue.

Firmware then deletes AST keys and such, and that logic generates peer removal messages
(one per AST key in my case, which may be a bug, but probably is harmless, and should not
cause this as far as I can tell).

Then, some time later, after I get peer removal events in the driver, I see
the fetch-ind warnings.

I see this very often, so it is not just a rare race.

I have also modified firmware fairly extensively to allow disabling the peer
caching, which is integrated into the tx scheduling and similar logic, and
could have made mistakes there.

I do not know the code well around the fetch-ind logic:  This is how the
firmware tells the driver that it has fully transmitted a frame and is reporting
tx status?  Can it be anything else?

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
