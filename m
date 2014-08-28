Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XMukm-0004DH-5t
 for ath10k@lists.infradead.org; Thu, 28 Aug 2014 08:08:22 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: BUG when doing rmmod
References: <87ha0xuml6.fsf@kamboji.qca.qualcomm.com>
 <CA+BoTQmw7-FXUazyMUb_+jWr8Zsd-N_z6T_zm6Rnc6NkfpLLYw@mail.gmail.com>
Date: Thu, 28 Aug 2014 11:07:54 +0300
In-Reply-To: <CA+BoTQmw7-FXUazyMUb_+jWr8Zsd-N_z6T_zm6Rnc6NkfpLLYw@mail.gmail.com>
 (Michal Kazior's message of "Thu, 28 Aug 2014 09:38:56 +0200")
Message-ID: <874mwxujdx.fsf@kamboji.qca.qualcomm.com>
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
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Michal Kazior <michal.kazior@tieto.com> writes:

> On 28 August 2014 08:58, Kalle Valo <kvalo@qca.qualcomm.com> wrote:
>
>> [  123.552499] Call Trace:
>> [  123.554957]  [<fe576c1b>] ath10k_pci_tasklet+0x1b/0x60 [ath10k_pci]
>> [  123.557436]  [<c1053fbe>] tasklet_action+0x9e/0xb0
>> [  123.559874]  [<c10534f1>] __do_softirq+0xf1/0x3f0
>> [  123.562277]  [<c1053400>] ? ftrace_raw_event_irq_handler_entry+0xa0/0xa0
>> [  123.564720]  [<c1004999>] do_softirq_own_stack+0x29/0x40
>> [  123.567096]  <IRQ>
> [...]
>> [  123.643338]  [<fe5740b3>] ath10k_pci_release+0x33/0x40 [ath10k_pci]
>> [  123.645289]  [<fe575d4b>] ath10k_pci_remove+0x7b/0x90 [ath10k_pci]
>> [  123.647174]  [<c132f5b8>] pci_device_remove+0x28/0x50
>> [  123.649056]  [<c146cbee>] __device_release_driver+0x4e/0xb0
>
> I should've expected spurious interrupts in pci_remove().. Does the
> following fix the problem?
>
> diff --git a/drivers/net/wireless/ath/ath10k/pci.c
> b/drivers/net/wireless/ath/ath10k/pci.c
> index 144eb8a3..a03d885 100644
> --- a/drivers/net/wireless/ath/ath10k/pci.c
> +++ b/drivers/net/wireless/ath/ath10k/pci.c
> @@ -2598,6 +2598,7 @@ static void ath10k_pci_remove(struct pci_dev *pdev)
>
>         ath10k_core_unregister(ar);
>         ath10k_pci_free_irq(ar);
> +       ath10k_pci_kill_tasklet(ar);
>         ath10k_pci_deinit_irq(ar);
>         ath10k_pci_ce_deinit(ar);
>         ath10k_pci_free_ce(ar);

Yup, this seems to fix it. Earlier my script didn't survive even 30
seconds, not it has been running 10 minutes without problems. Can you
write a proper patch for this, please?

Was this a regression due to some recent patches? If yes, that would be
good to document as well. Helps with people who port our patches to
older kernels.

Actually I did see the BUG below in the logs. But I don't really have
time to debug that right now and I just assume it's not ath10k bug.
(Please correct me if I'm wrong.)

[ 3236.078802] BUG: MAX_STACK_TRACE_ENTRIES too low!
[ 3236.078891] turning off the locking correctness validator.
[ 3236.078942] Please attach the output of /proc/lock_stat to the bug report
[ 3236.078994] CPU: 1 PID: 14428 Comm: rmmod Not tainted 3.16.0-wl-ath+ #570
[ 3236.079068] Hardware name: Hewlett-Packard HP ProBook 6540b/1722, BIOS 68CDD Ver. F.04 01/27/2010
[ 3236.079119]  00000000 00000000 ed01dd8c c17fea78 c2150100 ed01dd98 c10a0b45 ef23b2b8
[ 3236.079700]  ed01ddcc c10a312e ed01ddb4 00927500 fc611da4 fc60bc60 03c0ca42 000002f8
[ 3236.080258]  ef23ad40 00000002 00000000 ef23b2b8 ef23b2b0 ed01de4c c10a3bef 008ef5a8
[ 3236.080810] Call Trace:
[ 3236.080896]  [<c17fea78>] dump_stack+0x48/0x60
[ 3236.081003]  [<c10a0b45>] save_trace+0x95/0xa0
[ 3236.081091]  [<c10a312e>] mark_lock+0x11e/0x640
[ 3236.081147]  [<c10a3bef>] __lock_acquire+0x59f/0x1b40
[ 3236.081205]  [<c1087b95>] ? local_clock+0x25/0x30
[ 3236.081262]  [<c18085d7>] ? _raw_spin_unlock_irqrestore+0x57/0x60
[ 3236.081315]  [<c10a57c9>] lock_acquire+0x79/0x1a0
[ 3236.081370]  [<c106a250>] ? queue_delayed_work_on+0x80/0x80
[ 3236.081495]  [<c1319a59>] ? __debug_object_init+0x89/0x330
[ 3236.081596]  [<c106a28d>] flush_work+0x3d/0x250
[ 3236.081701]  [<c106a250>] ? queue_delayed_work_on+0x80/0x80
[ 3236.081810]  [<c105b694>] ? timer_fixup_assert_init+0x64/0x70
[ 3236.081881]  [<c131a24b>] ? debug_object_assert_init+0xbb/0xe0
[ 3236.081937]  [<c106bc7d>] ? __cancel_work_timer+0x8d/0xf0
[ 3236.081992]  [<c10a6114>] ? trace_hardirqs_on_caller+0xf4/0x1c0
[ 3236.082046]  [<c106bc59>] __cancel_work_timer+0x69/0xf0
[ 3236.082101]  [<c106bcf2>] cancel_delayed_work_sync+0x12/0x20
[ 3236.082221]  [<fc5c12de>] regulatory_exit+0x1e/0xf0 [cfg80211]
[ 3236.082339]  [<fc60130e>] cfg80211_exit+0x26/0x40 [cfg80211]
[ 3236.082448]  [<c10d652c>] SyS_delete_module+0xfc/0x170
[ 3236.082557]  [<c116a8a6>] ? vm_munmap+0x46/0x60
[ 3236.082629]  [<c1808cc7>] ? sysenter_exit+0xf/0x16
[ 3236.082685]  [<c10a6114>] ? trace_hardirqs_on_caller+0xf4/0x1c0
[ 3236.082740]  [<c116a8a6>] ? vm_munmap+0x46/0x60
[ 3236.082795]  [<c1808c98>] sysenter_do_call+0x12/0x12

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
