Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.candelatech.com ([208.74.158.172] helo=ns3.lanforge.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UzpE5-0003b9-6Q
 for ath10k@lists.infradead.org; Thu, 18 Jul 2013 14:30:37 +0000
Message-ID: <51E7FBF7.2070102@candelatech.com>
Date: Thu, 18 Jul 2013 07:30:15 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: 3.11.0-rc1: Crash on rmmod of ath10k_pci
References: <51E6FECE.40401@candelatech.com>
 <CA+BoTQ=xdE47uRB7-aBoXfczNss6uW_CDOC9aFmYq+Er+PPbpQ@mail.gmail.com>
In-Reply-To: <CA+BoTQ=xdE47uRB7-aBoXfczNss6uW_CDOC9aFmYq+Er+PPbpQ@mail.gmail.com>
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
Cc: ath10k@lists.infradead.org

On 07/17/2013 10:25 PM, Michal Kazior wrote:
> Hi Ben,
>
>
> On 17 July 2013 22:30, Ben Greear <greearb@candelatech.com> wrote:
>> So, started testing on a v2 ath10k board today.  wlanX showed up
>> once I updated to 3.11.0-rc1 (didn't work on a 3.10 -wl kernel I
>> had laying around).
>>
>> rmmod of ath10k_pci blows up pretty spectacularly however...
>>
>> I'll go looking for a different tree to test upon...
>>
>> [root@LEC2270-1 ~]# BUG: unable to handle kernel NULL pointer dereference at
>> 0000000000000010
>> IP: [<ffffffffa054c6bd>] ath10k_ce_per_engine_service+0x2c/0x17a
>> [ath10k_pci]
>> PGD 1f12d9067 PUD 1f1299067 PMD 0
>> Oops: 0000 [#1] PREEMPT SMP
>> Modules linked in: nf_nat_ipv4 nf_nat 8021q garp stp mrp llc fuse macvlan
>> wanlink(O) pktgen lockd sunrpc f71882fg coretemp hwmon snd_hda_codec_hdmi
>> snd_hda_codec_rea]
>> CPU: 1 PID: 5085 Comm: rmmod Tainted: G         C O 3.11.0-rc1+ #2
>> Hardware name: To be filled by O.E.M. To be filled by O.E.M./HURONRIVER,
>> BIOS 4.6.5 05/02/2012
>> task: ffff8801ecb7ae80 ti: ffff8801e8934000 task.ti: ffff8801e8934000
>> RIP: 0010:[<ffffffffa054c6bd>]  [<ffffffffa054c6bd>]
>> ath10k_ce_per_engine_service+0x2c/0x17a [ath10k_pci]
>> RSP: 0018:ffff88021fa83e78  EFLAGS: 00010286
>> RAX: ffff88021598c000 RBX: 0000000000000000 RCX: ffff88021fa83ec8
>> RDX: ffff88021598c0f8 RSI: 0000000000000000 RDI: ffff88020d015f20
>> RBP: ffff88021fa83ed8 R08: ffff88021fa83f88 R09: ffff88021fa8e640
>> R10: ffff88021fa930a0 R11: ffff88021fa83ee8 R12: ffff88020d015f20
>> R13: ffff88021598c450 R14: 0000000000000009 R15: 0000000000000030
>> FS:  00007f3fe79f6740(0000) GS:ffff88021fa80000(0000) knlGS:0000000000000000
>> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>> CR2: 0000000000000010 CR3: 00000001f1223000 CR4: 00000000000407e0
>> Stack:
>>   ffff88021fa83e88 ffffffff81579152 ffff88021fa83f08 ffffffff810ab7be
>>   ffffffff810305d4 ffff88021fa8db40 ffff88021fa83ed8 ffff88021598c168
>>   ffff88021598c100 0000000000000101 0000000000000009 0000000000000030
>> Call Trace:
>>   <IRQ>
>>   [<ffffffff81579152>] ? _raw_spin_unlock_irq+0x26/0x31
>>   [<ffffffff810ab7be>] ? run_timer_softirq+0x1dd/0x1ec
>>   [<ffffffff810305d4>] ? lapic_next_deadline+0x2f/0x36
>>   [<ffffffffa05496bb>] ath10k_pci_ce_tasklet+0x15/0x17 [ath10k_pci]
>>   [<ffffffff810a5872>] tasklet_action+0x78/0xc6
>>   [<ffffffff810a606c>] __do_softirq+0xc4/0x19d
>>   [<ffffffff810a61cd>] irq_exit+0x46/0xa3
>>   [<ffffffff810317de>] smp_apic_timer_interrupt+0x2a/0x37
>>   [<ffffffff8157eddd>] apic_timer_interrupt+0x6d/0x80
>>   <EOI>
>>   [<ffffffff81579104>] ? _raw_spin_unlock_irqrestore+0xf/0x37
>>   [<ffffffff81108871>] __free_irq+0x116/0x1a4
>>   [<ffffffff81108971>] free_irq+0x72/0x8b
>>   [<ffffffffa0549479>] ath10k_pci_stop_intr+0x35/0x5c [ath10k_pci]
>>   [<ffffffffa0549504>] ath10k_pci_remove+0x64/0xad [ath10k_pci]
>>   [<ffffffff812d42c8>] pci_device_remove+0x3a/0x91
>>   [<ffffffff8139227f>] __device_release_driver+0x84/0xda
>>   [<ffffffff8139235f>] driver_detach+0x8a/0xb0
>>   [<ffffffff81391356>] bus_remove_driver+0xb4/0xd7
>>   [<ffffffff81392dda>] driver_unregister+0x67/0x6f
>>   [<ffffffff812d444b>] pci_unregister_driver+0x20/0x85
>>   [<ffffffffa054d238>] ath10k_pci_exit+0x10/0x12 [ath10k_pci]
>>   [<ffffffff810ed068>] SyS_delete_module+0x1f7/0x25b
>>   [<ffffffff8100b6a2>] ? do_notify_resume+0x58/0x69
>>   [<ffffffff8157e1e9>] system_call_fastpath+0x16/0x1b
>> Code: 89 f6 48 89 e5 41 57 41 56 41 55 41 54 49 89 fc 53 48 83 ec 38 4c 8b
>> af 90 01 00 00 49 8b 9c f5 58 04 00 00 49 81 c5 50 04 00 00 <44> 8b 73 10 e8
>> c3 fc ff ff 4
>> RIP  [<ffffffffa054c6bd>] ath10k_ce_per_engine_service+0x2c/0x17a
>> [ath10k_pci]
>>   RSP <ffff88021fa83e78>
>> CR2: 0000000000000010
>> ---[ end trace ca9bd6378a42a1a7 ]---
>
> You seem to have been lucky to trigger a race. CE is teared down
> before we really stop interrupts and there's very small chance for an
> interrupt to come in. This is strange, since CE interrupts are
> disabled and only firmware (i.e. crash) interrupt may come in. I've
> never seen firmware crash during module unloading. I have a patch for
> this but it's based upon my recovery patchset and it's not trivial to
> rebase the fix.

I plan to do further testing on the 'ath' repository, so hopefully
no need for porting patches around.  If/when that is stable, can see
about testing mainline.

Thanks,
Ben


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
