Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VWjBE-00051Q-Vx
 for ath10k@lists.infradead.org; Thu, 17 Oct 2013 08:43:41 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: Fwd: ath10k related kernel crash in wireless-testing
 (3.12.0-rc3-wl+)
References: <52588F0C.3000009@candelatech.com>
 <525EB81E.5060305@candelatech.com>
 <87li1t5gmi.fsf@kamboji.qca.qualcomm.com>
Date: Thu, 17 Oct 2013 11:43:13 +0300
In-Reply-To: <87li1t5gmi.fsf@kamboji.qca.qualcomm.com> (Kalle Valo's message
 of "Wed, 16 Oct 2013 19:23:49 +0300")
Message-ID: <87r4bk2spq.fsf@kamboji.qca.qualcomm.com>
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
To: Ben Greear <greearb@candelatech.com>
Cc: ath10k@lists.infradead.org

Kalle Valo <kvalo@qca.qualcomm.com> writes:

> Ben Greear <greearb@candelatech.com> writes:
>
>> I sent this to the wrong list the first time.
>>
>> Do you know if this is already addressed?  If not, I'll see if I can
>> find a fix.
>
> [...]
>
>> ath10k: MSI-X interrupt handling (8 intrs)
>> ath10k: Unable to wakeup target
>> ath10k: target took longer 5000 us to wake up (awake count 1)
>> ath10k: Failed to get pcie state addr: -16
>> ath10k: early firmware event indicated
>> BUG: unable to handle kernel NULL pointer dereference at 0000000000000004
>> IP: [<ffffffffa06ae46c>] ath10k_ce_completed_send_next+0x47/0x122
>> [ath10k_pci]
>
> I think there are two bugs here:
>
> 1) Cold reset doesn't always work, Michal has a patch for that. That's
>    why the wakeup fails:
>
> http://lists.infradead.org/pipermail/ath10k/2013-October/000638.html
>
> 2) We enable interrupts too early and if wakeup fails and we get a
>    spurious interrupt ath10k crashes. We don't have a fix for this yet.

I tried to look how to enable interrupts only after everything is
properly initialised in ath10k, but didn't find any quick way to do
that. I guess one ugly way to workaround this race is to add a state
variable which is checked in the interrupt handler.

Does anyone else have any other ideas?

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
