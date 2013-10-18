Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VX3ZK-0001wT-M3
 for ath10k@lists.infradead.org; Fri, 18 Oct 2013 06:29:55 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: Fwd: ath10k related kernel crash in wireless-testing
 (3.12.0-rc3-wl+)
References: <52588F0C.3000009@candelatech.com>
 <525EB81E.5060305@candelatech.com>
 <87li1t5gmi.fsf@kamboji.qca.qualcomm.com>
 <87r4bk2spq.fsf@kamboji.qca.qualcomm.com>
 <CA+BoTQkbqvrcEQSkkHyYi0J1_Pa4yTC5Pk=CtKbd4_uOO3pBDg@mail.gmail.com>
Date: Fri, 18 Oct 2013 09:29:27 +0300
In-Reply-To: <CA+BoTQkbqvrcEQSkkHyYi0J1_Pa4yTC5Pk=CtKbd4_uOO3pBDg@mail.gmail.com>
 (Michal Kazior's message of "Thu, 17 Oct 2013 15:58:04 -0700")
Message-ID: <87txgfytvc.fsf@kamboji.qca.qualcomm.com>
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

> On 17 October 2013 01:43, Kalle Valo <kvalo@qca.qualcomm.com> wrote:
>> Kalle Valo <kvalo@qca.qualcomm.com> writes:
>>
>>> Ben Greear <greearb@candelatech.com> writes:
>>>
>>>> I sent this to the wrong list the first time.
>>>>
>>>> Do you know if this is already addressed?  If not, I'll see if I can
>>>> find a fix.
>>>
>>> [...]
>>>
>>>> ath10k: MSI-X interrupt handling (8 intrs)
>>>> ath10k: Unable to wakeup target
>>>> ath10k: target took longer 5000 us to wake up (awake count 1)
>>>> ath10k: Failed to get pcie state addr: -16
>>>> ath10k: early firmware event indicated
>>>> BUG: unable to handle kernel NULL pointer dereference at 0000000000000004
>>>> IP: [<ffffffffa06ae46c>] ath10k_ce_completed_send_next+0x47/0x122
>>>> [ath10k_pci]
>
> Hmm.. if BMI handlers are set then must've been CE is allocated
> earlier. I'm suspecting this is because ath10k_pci_ce_deinit() gets
> called on ath10k_pci_power_up() failpath before interrupts are
> disabled/hanlders unregistered.
>
> In that case the solution is to fix the failpath in
> ath10k_pci_power_up(). Disabling interrupts or moving
> ath10k_pci_ce_deinit() before the very return statement in
> ath10k_pci_hif_power_up()'s failpath should suffice. It should be safe
> to call ath10k_pci_ce_deinit() without calling to
> ath10k_pci_ce_init().

But doesn't that will still leave the race of having interrupts enabled
but tasklet handler not properly initialised? I think the right fix is
to first initialise everything and only then enable interrupts.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
