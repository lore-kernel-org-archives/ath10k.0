Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by merlin.infradead.org with esmtp (Exim 4.85 #2 (Red Hat Linux))
 id 1alroY-0002rQ-5M
 for ath10k@lists.infradead.org; Fri, 01 Apr 2016 05:40:11 +0000
Message-ID: <56FE0834.4000109@candelatech.com>
Date: Thu, 31 Mar 2016 22:33:40 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: Deadlock on (faked) firmware crash, CUS239,
 modified 10.4.3 firmware.
References: <56F5F38A.2070602@candelatech.com>
 <CA+BoTQmwGONqJ0MgccrMzzx9UsGuRCZpdy1RSqdgkcNm_te0xQ@mail.gmail.com>
 <56FC52F5.7080407@candelatech.com>
 <CA+BoTQ=ZPA87-5iK7YtxQSAW-SeXaaBU1j+9gVMC-5c7cpTwrA@mail.gmail.com>
 <56FD77A1.2010807@candelatech.com>
 <CA+BoTQn9WOaCeTz22WS7FDe6ypu2Dxeu82zYKrQ+CyUxxqCa1Q@mail.gmail.com>
In-Reply-To: <CA+BoTQn9WOaCeTz22WS7FDe6ypu2Dxeu82zYKrQ+CyUxxqCa1Q@mail.gmail.com>
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



On 03/31/2016 10:26 PM, Michal Kazior wrote:
> On 31 March 2016 at 21:16, Ben Greear <greearb@candelatech.com> wrote:
> [...]
>> I tried adding check for FW crash yesterday, but that did not help.
>>
>> Today, I added a limit of 2000 loops.  I see that hit, and then kernel
>> crashes.  Maybe my patch is wrong.
>>
>> I've tried to apply (almost) every patch in linux.ath related to ath10k,
>> including a few from the mailing list that have not been applied yet.
>>
>> My push-pending method now looks like this:
>>
>> void ath10k_mac_tx_push_pending(struct ath10k *ar)
>> {
> [...]
>> }
>
> Looks sane.
>
>
>> The crash I get is this:
>>
>>
>> ath10k_pci 0000:05:00.0: firmware crashed! (uuid
>> 2a118708-977d-43d6-8d40-079ddec99eb3)
> [...]
>> BUG: unable to handle kernel paging request at 0000000000001000
>> IP: [<ffffffffa08e9810>] __skb_dequeue+0x2e/0x37 [mac80211]
>
> Hmm.. Do you have 2a58d42c1e01 ("mac80211: fix txq queue related
> crashes") applied?

Yes, though it is a different hash in my tree, probably merge issues.

See the patches I posted today to fix stale access to peer objects,
that seems to have fixed these problems for me, or at least made
it much harder to hit.

At quitting time, I was still seeing kasan errors in mac80211
stats logic, so there are more bugs waiting for tomorrow.

Thanks,
Ben


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
