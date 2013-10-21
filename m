Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VYG2a-00042G-DR
 for ath10k@lists.infradead.org; Mon, 21 Oct 2013 14:01:05 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: Fwd: ath10k related kernel crash in wireless-testing
 (3.12.0-rc3-wl+)
References: <52588F0C.3000009@candelatech.com>
 <525EB81E.5060305@candelatech.com>
 <87li1t5gmi.fsf@kamboji.qca.qualcomm.com>
Date: Mon, 21 Oct 2013 17:00:32 +0300
In-Reply-To: <87li1t5gmi.fsf@kamboji.qca.qualcomm.com> (Kalle Valo's message
 of "Wed, 16 Oct 2013 19:23:49 +0300")
Message-ID: <87fvruu3jz.fsf@kamboji.qca.qualcomm.com>
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

I was able to reproduce your crash and it seems that my patch "ath10k:
add error handling to ath10k_pci_wait()" fixes the crash. But it's not
an ultimate solution, it's just bandaid for the issue:

[ 3200.447601] ath10k: MSI-X didn't succeed (1), trying MSI
[ 3200.447898] ath10k_pci 0000:02:00.0: irq 49 for MSI/MSI-X
[ 3200.449101] ath10k: MSI interrupt handling
[ 3201.620679] ath10k: Unable to wakeup target
[ 3201.620754] ath10k: Failed to reset target, target did not wake up: -110
[ 3201.621111] ath10k: early firmware event indicated
[ 3201.621624] ath10k: could not start pci hif (-110)
[ 3201.621691] ath10k: could not probe fw (-110)
[ 3201.621750] ath10k: could not register driver core (-110)

We are working on fixing the wakeup issue, doing just warm reset helps
but there are other problems with that. Need to investigate more.

And we need to fix the interrupt race properly at some point, I added a
todo entry for this:

http://wireless.kernel.org/en/users/Drivers/ath10k/todo

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
