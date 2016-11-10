Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by merlin.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c4eCJ-0000mY-7x
 for ath10k@lists.infradead.org; Thu, 10 Nov 2016 01:30:36 +0000
Received: from [192.168.100.149] (firewall.candelatech.com [50.251.239.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail2.candelatech.com (Postfix) with ESMTPSA id BF0E940A959
 for <ath10k@lists.infradead.org>; Wed,  9 Nov 2016 17:02:09 -0800 (PST)
Subject: Re: Kernel deadlock when ath10k firmware crashes in hacked 4.7+
 kernel.
References: <4850336f-f7ee-3d36-7e40-1dbe43d0da04@candelatech.com>
From: Ben Greear <greearb@candelatech.com>
Message-ID: <12bcb5a3-1eab-c5ff-e236-af6cee52cc2c@candelatech.com>
Date: Wed, 9 Nov 2016 17:02:09 -0800
MIME-Version: 1.0
In-Reply-To: <4850336f-f7ee-3d36-7e40-1dbe43d0da04@candelatech.com>
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
To: ath10k <ath10k@lists.infradead.org>

I should have looked a bit longer.  I was still running the patch
that acquired rcu-lock before the spinlock in the tx-push-pending.

I tried with that set to the normal way, and now it did not
hang.  I'll do some more testing in case I just got lucky.

Thanks,
Ben

On 11/09/2016 04:07 PM, Ben Greear wrote:
> I have been seeing this for a while, but finally took some time to get some
> debug info.  This is with modified 4.7 kernel and ath10k firmware for 9984 NIC.
> But, I suspect this could be a more general problem.
>
> An easy way I can reproduce this is to associate a station and then try
> to change its MTU to 2000.  Firmware crashes due to an assert that I have not
> debugged yet, but worse, the kernel hangs trying to cleanup.
>
> Some notes on the decode below:  I have a counter that makes sure the tx_push_pending
> bails out after 2000 loops, and I do not see that printout hit, so it does not appear
> to be looping forever in that method.  Maybe something is calling it in a tight loop
> though.
>
> Maybe we need to abort and clean up the push-pending logic somehow when firmware has crashed?
>
> Suggestions are welcome, and I can gather more debug and reproduce this easily.
>
>
> Type "apropos word" to search for commands related to "word"...
> Reading symbols from ./drivers/net/wireless/ath/ath10k/ath10k_core.ko...done.
> (gdb) l *(ath10k_mac_tx_push_pending+0x6c)
> 0xd4ec is in ath10k_mac_tx_push_pending (/home/greearb/git/linux-4.7.dev.y/drivers/net/wireless/ath/ath10k/mac.c:4344).
> 4339        int loop_max = 2000;
> 4340
> 4341        rcu_read_lock();
> 4342        spin_lock_bh(&ar->txqs_lock);
> 4343
> 4344        last = list_last_entry(&ar->txqs, struct ath10k_txq, list);
> 4345        while (!list_empty(&ar->txqs)) {
> 4346            artxq = list_first_entry(&ar->txqs, struct ath10k_txq, list);
> 4347            txq = container_of((void *)artxq, struct ieee80211_txq,
> 4348                       drv_priv);
> (gdb) l *(ath10k_sta_state+0x1be)
> 0x91ee is in ath10k_sta_state (/home/greearb/git/linux-4.7.dev.y/drivers/net/wireless/ath/ath10k/mac.c:4212).
> 4207        struct ath10k_skb_cb *cb;
> 4208        struct sk_buff *msdu;
> 4209        struct ieee80211_txq *txq_tmp;
> 4210        int msdu_id;
> 4211
> 4212        if (!txq)
> 4213            return;
> 4214
> 4215        spin_lock_bh(&ar->txqs_lock);
> 4216        if (!list_empty(&artxq->list))
> (gdb) l *(ath10k_htt_txrx_compl_task+0x54f)
> 0x1ff3f is in ath10k_htt_txrx_compl_task (/home/greearb/git/linux-4.7.dev.y/include/linux/compiler.h:222).
> 217    })
> 218
> 219    static __always_inline
> 220    void __read_once_size(const volatile void *p, void *res, int size)
> 221    {
> 222        __READ_ONCE_SIZE;
> 223    }
> 224
> 225    #ifdef CONFIG_KASAN
> 226    /*
> (gdb)
>
> ath10k_pci 0000:05:00.0: firmware crashed! (uuid adf694ed-1c76-4449-a1de-dd2a8ee596b1)
> ath10k_pci 0000:05:00.0: firmware register dump:
> ath10k_pci 0000:05:00.0: [00]: 0x0000000A 0x000015B3 0x0099773F 0x00975B31
> ath10k_pci 0000:05:00.0: [04]: 0x0099773F 0x00060130 0x00000000 0x00000000
> ath10k_pci 0000:05:00.0: [08]: 0x00446134 0x0045FA74 0x00446BBC 0x009CF074
> ath10k_pci 0000:05:00.0: [12]: 0x00000009 0xFFFFFFFF 0x00973ABC 0x00973AD2
> ath10k_pci 0000:05:00.0: [16]: 0x00973AB0 0x009B76E9 0x009606BB 0x00000000
> ath10k_pci 0000:05:00.0: [20]: 0x4099773F 0x004066AC 0x00000001 0x0047B7D0
> ath10k_pci 0000:05:00.0: [24]: 0x809977FA 0x0040670C 0x00418B10 0xC099773F
> ath10k_pci 0000:05:00.0: [28]: 0x80997818 0x0040672C 0x0045FA74 0x00446134
> ath10k_pci 0000:05:00.0: [32]: 0x8099CA3F 0x0040675C 0x0045FA74 0x00000002
> ath10k_pci 0000:05:00.0: [36]: 0x8098C1E8 0x0040677C 0x00000000 0x0045FA74
> ath10k_pci 0000:05:00.0: [40]: 0x809B052E 0x0040680C 0x004316B8 0x0043083C
> ath10k_pci 0000:05:00.0: [44]: 0x809B1E58 0x004068CC 0x00426E5C 0x0000014A
> ath10k_pci 0000:05:00.0: [48]: 0x809B1EB2 0x0040690C 0x0040697C 0x00975A00
> ath10k_pci 0000:05:00.0: [52]: 0x809AFA34 0x0040693C 0x00000001 0x0040697C
> ath10k_pci 0000:05:00.0: [56]: 0x809AF162 0x0040695C 0x0042298C 0x004229B0
> ath10k_pci 0000:05:00.0: ath10k_pci ATH10K_DBG_BUFFER:
> ath10k: [0000]: 00009C9C 14086402 71103332 AF21F004 00003B2C 0042D990 00000019 00009C9C
> ath10k: [0008]: 14085854 51100002 000F3F54 00000001 000000B3 004567DC 00009C9C 14085854
> ath10k: [0016]: 51100002 000F3F9C 00000001 000000B2 004567DC 00009C9D 10085852 00434198
> ath10k: [0024]: 004567DC 00000000 00000000 00009C9D 10085858 31100002 00434198 0000000A
> ath10k: [0032]: 00000000 00009C9D 17FC0001 0099773F 000015B3 000015B3 0040659C 91104569
> ath10k_pci 0000:05:00.0: ATH10K_END
> wlan0: Failed to send nullfunc to AP 04:f0:21:af:2c:3b after 1000ms, disconnecting
> NMI watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [kworker/u16:3:289]
> NMI watchdog: BUG: soft lockup - CPU#5 stuck for 22s! [swapper/5:0]
> NMI watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [kworker/u16:3:289]
> NMI watchdog: BUG: soft lockup - CPU#5 stuck for 22s! [swapper/5:0]
> INFO: rcu_preempt self-detected stall on CPU
>     1-...: (1 GPs behind) idle=af5/140000000000001/0 softirq=18130/18131 fqs=21662
>      (t=65000 jiffies g=8853 c=8852 q=1236)
> NMI watchdog: BUG: soft lockup - CPU#5 stuck for 22s! [swapper/5:0]
> NMI watchdog: BUG: soft lockup - CPU#1 stuck for 23s! [kworker/u16:3:289]
> BUG: spinlock lockup suspected on CPU#5, swapper/5/0
>  lock: 0xffff8800d4825b00, .magic: dead4ead, .owner: kworker/u16:3/289, .owner_cpu: 1
> NMI watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [kworker/u16:3:289]
> NMI watchdog: BUG: soft lockup - CPU#5 stuck for 22s! [swapper/5:0]
> NMI watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [kworker/u16:3:289]
> NMI watchdog: BUG: soft lockup - CPU#5 stuck for 22s! [swapper/5:0]
> NMI watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [kworker/u16:3:289]
> NMI watchdog: BUG: soft lockup - CPU#5 stuck for 22s! [swapper/5:0]
> NMI watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [kworker/u16:3:289]
> NMI watchdog: BUG: soft lockup - CPU#5 stuck for 23s! [swapper/5:0]
> NMI watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [kworker/u16:3:289]
> NMI watchdog: BUG: soft lockup - CPU#5 stuck for 23s! [swapper/5:0]
> INFO: rcu_preempt self-detected stall on CPU
>     1-...: (1 GPs behind) idle=af5/140000000000001/0 softirq=18130/18131 fqs=86644
>      (t=260003 jiffies g=8853 c=8852 q=4130)
> INFO: task kworker/2:0:24 blocked for more than 180 seconds.
>       Tainted: G        W  O L  4.7.10+ #10
> "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> INFO: task kworker/0:1:268 blocked for more than 180 seconds.
>       Tainted: G        W  O L  4.7.10+ #10
> "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> INFO: task kworker/u16:4:290 blocked for more than 180 seconds.
>       Tainted: G        W  O L  4.7.10+ #10
> "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> INFO: task kworker/0:2:489 blocked for more than 180 seconds.
>       Tainted: G        W  O L  4.7.10+ #10
> "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> INFO: task jbd2/dm-1-8:688 blocked for more than 180 seconds.
>       Tainted: G        W  O L  4.7.10+ #10
> "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> INFO: task systemd-journal:778 blocked for more than 180 seconds.
>       Tainted: G        W  O L  4.7.10+ #10
> "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> INFO: task jbd2/dm-2-8:938 blocked for more than 180 seconds.
>       Tainted: G        W  O L  4.7.10+ #10
> "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> INFO: task btserver:2155 blocked for more than 180 seconds.
>       Tainted: G        W  O L  4.7.10+ #10
> "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> INFO: task wpa_supplicant:3776 blocked for more than 180 seconds.
>       Tainted: G        W  O L  4.7.10+ #10
> "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> INFO: task kworker/0:3:6400 blocked for more than 180 seconds.
>       Tainted: G        W  O L  4.7.10+ #10
> "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> NMI watchdog: BUG: soft lockup - CPU#5 stuck for 23s! [swapper/5:0]
> NMI watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [kworker/u16:3:289]
> NMI watchdog: BUG: soft lockup - CPU#5 stuck for 23s! [swapper/5:0]
> NMI watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [kworker/u16:3:289]
> NMI watchdog: BUG: soft lockup - CPU#5 stuck for 23s! [swapper/5:0]
> NMI watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [kworker/u16:3:289]
> NMI watchdog: BUG: soft lockup - CPU#5 stuck for 22s! [swapper/5:0]
> NMI watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [kworker/u16:3:289]
> NMI watchdog: BUG: soft lockup - CPU#5 stuck for 22s! [swapper/5:0]
> NMI watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [kworker/u16:3:289]
> NMI watchdog: BUG: soft lockup - CPU#5 stuck for 22s! [swapper/5:0]
> NMI watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [kworker/u16:3:289]
> NMI watchdog: BUG: soft lockup - CPU#5 stuck for 22s! [swapper/5:0]
> INFO: rcu_preempt self-detected stall on CPU
>     1-...: (1 GPs behind) idle=af5/140000000000001/0 softirq=18130/18131 fqs=151625
>      (t=455006 jiffies g=8853 c=8852 q=6999)
> NMI watchdog: BUG: soft lockup - CPU#5 stuck for 22s! [swapper/5:0]
> INFO: rcu_sched detected stalls on CPUs/tasks:
>     1-...: (1 GPs behind) idle=af5/140000000000000/0 softirq=16702/18131 fqs=21660
>     5-...: (1 GPs behind) idle=9e9/1/0 softirq=13207/14592 fqs=21661
>     (detected by 3, t=65022 jiffies, g=502, c=501, q=4)
> NMI watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [kworker/u16:3:289]
> NMI watchdog: BUG: soft lockup - CPU#5 stuck for 22s! [swapper/5:0]
> NMI watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [kworker/u16:3:289]
> NMI watchdog: BUG: soft lockup - CPU#5 stuck for 22s! [swapper/5:0]
> NMI watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [kworker/u16:3:289]
> NMI watchdog: BUG: soft lockup - CPU#5 stuck for 22s! [swapper/5:0]
> NMI watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [kworker/u16:3:289]
> NMI watchdog: BUG: soft lockup - CPU#5 stuck for 23s! [swapper/5:0]
> NMI watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [kworker/u16:3:289]
> NMI watchdog: BUG: soft lockup - CPU#5 stuck for 23s! [swapper/5:0]
> NMI watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [kworker/u16:3:289]
> NMI watchdog: BUG: soft lockup - CPU#5 stuck for 23s! [swapper/5:0]
> NMI watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [kworker/u16:3:289]
> INFO: rcu_preempt self-detected stall on CPU
>     1-...: (1 GPs behind) idle=af5/140000000000001/0 softirq=18130/18131 fqs=216602
>      (t=650009 jiffies g=8853 c=8852 q=9761)
> NMI watchdog: BUG: soft lockup - CPU#5 stuck for 23s! [swapper/5:0]
> INFO: rcu_sched detected stalls on CPUs/tasks:
>     1-...: (1 GPs behind) idle=af5/140000000000000/0 softirq=16702/18131 fqs=86635
>     5-...: (1 GPs behind) idle=9e9/1/0 softirq=13207/14592 fqs=86636
>     (detected by 7, t=260027 jiffies, g=502, c=501, q=4)
> NMI watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [kworker/u16:3:289]
> NMI watchdog: BUG: soft lockup - CPU#5 stuck for 23s! [swapper/5:0]
> NMI watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [kworker/u16:3:289]
> NMI watchdog: BUG: soft lockup - CPU#5 stuck for 22s! [swapper/5:0]
> NMI watchdog: BUG: soft lockup - CPU#1 stuck for 23s! [kworker/u16:3:289]
> NMI watchdog: BUG: soft lockup - CPU#5 stuck for 22s! [swapper/5:0]
> NMI watchdog: BUG: soft lockup - CPU#1 stuck for 23s! [kworker/u16:3:289]
> NMI watchdog: BUG: soft lockup - CPU#5 stuck for 22s! [swapper/5:0]
> NMI watchdog: BUG: soft lockup - CPU#1 stuck for 23s! [kworker/u16:3:289]
> NMI watchdog: BUG: soft lockup - CPU#5 stuck for 22s! [swapper/5:0]
> NMI watchdog: BUG: soft lockup - CPU#1 stuck for 23s! [kworker/u16:3:289]
> sysrq: SysRq : Changing Loglevel
> sysrq: Loglevel set to 9
> sysrq: SysRq : Changing Loglevel
> sysrq: Loglevel set to 7
> NMI watchdog: BUG: soft lockup - CPU#5 stuck for 22s! [swapper/5:0]
> Modules linked in: nf_conntrack_netlink nf_conntrack nfnetlink nf_defrag_ipv4 8021q garp mrp stp llc bnep bluetooth fuse macvlan wanlink(O) pktgen
> rpcsec_gss_krb5 nfsv4 nfs fscache coretemp hwmon intel_rapl x86_pkg_temp_thermal intel_powerclamp iTCO_wdt iTCO_vendor_support kvm irqbypass joydev
> snd_hda_codec_hdmi snd_hda_codec_realtek snd_hda_codec_generic ath10k_pci ath10k_core ath mac80211 pcspkr snd_hda_intel snd_hda_codec cfg80211 snd_hda_core
> snd_hwdep snd_seq snd_seq_device snd_pcm snd_timer snd i2c_i801 soundcore lpc_ich shpchp tpm_tis tpm nfsd auth_rpcgss nfs_acl lockd grace sunrpc serio_raw i915
> i2c_algo_bit e1000e drm_kms_helper ptp pps_core drm i2c_core fjes video ipv6 [last unloaded: nf_conntrack]
> irq event stamp: 4565545
> hardirqs last  enabled at (4565544): [<ffffffff8190253c>] restore_regs_and_iret+0x0/0x1d
> hardirqs last disabled at (4565545): [<ffffffff819027b7>] apic_timer_interrupt+0x87/0xa0
> softirqs last  enabled at (4564446): [<ffffffff8111500c>] _local_bh_enable+0x1c/0x50
> softirqs last disabled at (4564447): [<ffffffff811166de>] irq_exit+0xae/0xb0
> CPU: 5 PID: 0 Comm: swapper/5 Tainted: G        W  O L  4.7.10+ #10
> Hardware name: To be filled by O.E.M. To be filled by O.E.M./ChiefRiver, BIOS 4.6.5 06/07/2013
> task: ffff880214912600 ti: ffff88021491c000 task.ti: ffff88021491c000
> RIP: 0010:[<ffffffff8116c746>]  [<ffffffff8116c746>] queued_spin_lock_slowpath+0x176/0x1a0
> RSP: 0018:ffff88021e343ce0  EFLAGS: 00000202
> RAX: 0000000000000101 RBX: ffff8800d4825b00 RCX: 0000000000000001
> RDX: 0000000000000101 RSI: 0000000000000001 RDI: ffff8800d4825b00
> RBP: ffff88021e343ce0 R08: 0000000000000101 R09: 00000000000000ff
> R10: 0000000000000000 R11: 0000000000000000 R12: 000000007d580340
> R13: 0000000000000001 R14: 000000007d580340 R15: 0000000000000000
> FS:  0000000000000000(0000) GS:ffff88021e340000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 00007f9325ee4a28 CR3: 0000000001e06000 CR4: 00000000001406e0
> Stack:
>  ffff88021e343d10 ffffffff8116de25 ffff8800d4825b00 ffff8800d4820a60
>  ffff8800d4825220 ffff8800d48243e0 ffff88021e343d30 ffffffff81901152
>  ffffffffa080b4bc ffff8800d48252f8 ffff88021e343d90 ffffffffa080b4bc
> Call Trace:
>  <IRQ>
>  [<ffffffff8116de25>] do_raw_spin_lock+0x145/0x150
>  [<ffffffff81901152>] _raw_spin_lock_bh+0x42/0x50
>  [<ffffffffa080b4bc>] ? ath10k_mac_tx_push_pending+0x6c/0x2d0 [ath10k_core]
>  [<ffffffffa080b4bc>] ath10k_mac_tx_push_pending+0x6c/0x2d0 [ath10k_core]
>  [<ffffffffa080b450>] ? ath10k_mac_tx_push_txq+0x190/0x190 [ath10k_core]
>  [<ffffffffa081df0f>] ath10k_htt_txrx_compl_task+0x54f/0x780 [ath10k_core]
>  [<ffffffff811872bd>] ? debug_lockdep_rcu_enabled+0x1d/0x20
>  [<ffffffffa087e5cd>] ? ath10k_ce_per_engine_service+0x7d/0xa0 [ath10k_pci]
>  [<ffffffff81168cb5>] ? trace_hardirqs_on_caller+0xa5/0x1b0
>  [<ffffffff8111530b>] ? __local_bh_enable_ip+0x6b/0xd0
>  [<ffffffff81901370>] ? _raw_spin_unlock_bh+0x30/0x40
>  [<ffffffffa087e666>] ? ath10k_ce_per_engine_service_any+0x76/0xa0 [ath10k_pci]
>  [<ffffffff8111571e>] tasklet_action+0x19e/0x210
>  [<ffffffff81116198>] __do_softirq+0x118/0x4c0
>  [<ffffffff811166de>] irq_exit+0xae/0xb0
>  [<ffffffff810359d5>] do_IRQ+0x65/0x110
>  [<ffffffff819024cc>] common_interrupt+0x8c/0x8c
>  <EOI>
>  [<ffffffff8176e0bb>] ? cpuidle_enter_state+0x12b/0x3b0
>  [<ffffffff8176e362>] cpuidle_enter+0x12/0x20
>  [<ffffffff8115ca25>] call_cpuidle+0x25/0x50
>  [<ffffffff8115ce40>] cpu_startup_entry+0x2f0/0x420
>  [<ffffffff810567b2>] start_secondary+0x152/0x170
> Code: 89 c2 89 d0 66 31 c0 41 39 c0 74 e6 4d 85 c9 c6 07 01 74 2b 41 c7 41 08 01 00 00 00 e9 51 ff ff ff 83 fa 01 75 07 e9 a6 fe ff ff <f3> 90 8b 07 84 c0 75 f8
> b8 01 00 00 00 66 89 07 5d c3 f3 90 4c
> NMI watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [kworker/u16:3:289]
> Modules linked in: nf_conntrack_netlink nf_conntrack nfnetlink nf_defrag_ipv4 8021q garp mrp stp llc bnep bluetooth fuse macvlan wanlink(O) pktgen
> rpcsec_gss_krb5 nfsv4 nfs fscache coretemp hwmon intel_rapl x86_pkg_temp_thermal intel_powerclamp iTCO_wdt iTCO_vendor_support kvm irqbypass joydev
> snd_hda_codec_hdmi snd_hda_codec_realtek snd_hda_codec_generic ath10k_pci ath10k_core ath mac80211 pcspkr snd_hda_intel snd_hda_codec cfg80211 snd_hda_core
> snd_hwdep snd_seq snd_seq_device snd_pcm snd_timer snd i2c_i801 soundcore lpc_ich shpchp tpm_tis tpm nfsd auth_rpcgss nfs_acl lockd grace sunrpc serio_raw i915
> i2c_algo_bit e1000e drm_kms_helper ptp pps_core drm i2c_core fjes video ipv6 [last unloaded: nf_conntrack]
> irq event stamp: 3155221
> hardirqs last  enabled at (3155220): [<ffffffff8190253c>] restore_regs_and_iret+0x0/0x1d
> hardirqs last disabled at (3155221): [<ffffffff819027b7>] apic_timer_interrupt+0x87/0xa0
> softirqs last  enabled at (1466546): [<ffffffffa08071ae>] ath10k_sta_state+0x1ae/0xbd0 [ath10k_core]
> softirqs last disabled at (1466548): [<ffffffffa07fef52>] ath10k_mac_txq_unref.part.56+0x22/0x110 [ath10k_core]
> CPU: 1 PID: 289 Comm: kworker/u16:3 Tainted: G        W  O L  4.7.10+ #10
> Hardware name: To be filled by O.E.M. To be filled by O.E.M./ChiefRiver, BIOS 4.6.5 06/07/2013
> Workqueue: phy0 ieee80211_iface_work [mac80211]
> task: ffff8802140dcc00 ti: ffff8800367d0000 task.ti: ffff8800367d0000
> RIP: 0010:[<ffffffffa07fef96>]  [<ffffffffa07fef96>] ath10k_mac_txq_unref.part.56+0x66/0x110 [ath10k_core]
> RSP: 0018:ffff8800367d3a28  EFLAGS: 00000202
> RAX: ffff8800d57a8078 RBX: ffff88021149a060 RCX: ffff8800d57a8078
> RDX: ffff8800d57a8078 RSI: ffff8800d4825b38 RDI: ffff8800d4825b00
> RBP: ffff8800367d3a48 R08: ffffffff8281b960 R09: ffffffff81c75e6b
> R10: 0000000000000001 R11: ffff8802140dd428 R12: ffff8800d48243e0
> R13: ffff8800d4825b00 R14: ffff88021149cb58 R15: ffff88021149cbd8
> FS:  0000000000000000(0000) GS:ffff88021e240000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 00007f72269c8000 CR3: 0000000001e06000 CR4: 00000000001406e0
> Stack:
>  0000000000000000 ffff88021149caf8 0000000000000000 ffff8800d48243e0
>  ffff8800367d3ad8 ffffffffa08071be 0000000000000076 0000000000000000
>  ffff8800367d3a88 0000000000000000 ffff8800d4825ac8 ffff8800d4820a60
> Call Trace:
>  [<ffffffffa08071be>] ath10k_sta_state+0x1be/0xbd0 [ath10k_core]
>  [<ffffffffa06e2f0e>] drv_sta_state+0xae/0xa10 [mac80211]
>  [<ffffffffa06ec3db>] __sta_info_destroy_part2+0x1cb/0x230 [mac80211]
>  [<ffffffffa06ec73b>] __sta_info_flush+0xfb/0x190 [mac80211]
>  [<ffffffffa0748af6>] ieee80211_set_disassoc+0xc6/0x430 [mac80211]
>  [<ffffffffa0748e93>] ieee80211_sta_connection_lost+0x33/0x70 [mac80211]
>  [<ffffffffa074d887>] ieee80211_sta_work+0x757/0x1b50 [mac80211]
>  [<ffffffff81168bdf>] ? mark_held_locks+0x6f/0xa0
>  [<ffffffff8190141e>] ? _raw_spin_unlock_irqrestore+0x4e/0x70
>  [<ffffffff81168dcd>] ? trace_hardirqs_on+0xd/0x10
>  [<ffffffffa0701503>] ieee80211_iface_work+0x373/0x410 [mac80211]
>  [<ffffffff8112dbd4>] ? process_one_work+0x164/0x750
>  [<ffffffff8112dc52>] process_one_work+0x1e2/0x750
>  [<ffffffff8112dbd4>] ? process_one_work+0x164/0x750
>  [<ffffffff8112e206>] worker_thread+0x46/0x4f0
>  [<ffffffff8112e1c0>] ? process_one_work+0x750/0x750
>  [<ffffffff811349c9>] kthread+0xf9/0x110
>  [<ffffffff81901d8f>] ret_from_fork+0x1f/0x40
>  [<ffffffff811348d0>] ? kthread_create_on_node+0x230/0x230
> Code: 48 89 0a 48 89 43 18 48 89 43 20 49 8b 84 24 58 17 00 00 49 8d b4 24 58 17 00 00 48 39 f0 48 8b 10 75 10 eb 4b 48 39 f2 48 8b 0a <48> 89 d0 74 40 48 89 ca
> 48 8d 48 e8 48 39 cb 75 e9 48 8b 38 48
> INFO: rcu_preempt self-detected stall on CPU
>     1-...: (1 GPs behind) idle=af5/140000000000001/0 softirq=18130/18131 fqs=281440
>      (t=845012 jiffies g=8853 c=8852 q=12262)
> Task dump for CPU 1:
> kworker/u16:3   R  running task        0   289      2 0x00000008
> Workqueue: phy0 ieee80211_iface_work [mac80211]
>  0000000000000002 ffff88021e243da8 ffffffff81143b9e ffffffff81143acc
>  0000000000000001 ffffffff81e59b80 ffff88021e243dc0 ffffffff81146ea2
>  ffffffff81e59b80 ffff88021e243df0 ffffffff81220616 ffff88021e258f00
> Call Trace:
>  <IRQ>  [<ffffffff81143b9e>] sched_show_task+0x12e/0x230
>  [<ffffffff81143acc>] ? sched_show_task+0x5c/0x230
>  [<ffffffff81146ea2>] dump_cpu_task+0x32/0x40
>  [<ffffffff81220616>] rcu_dump_cpu_stacks+0x71/0x92
>  [<ffffffff8118d65c>] rcu_check_callbacks+0xb1c/0xbe0
>  [<ffffffff811a4500>] ? tick_sched_do_timer+0x30/0x30
>  [<ffffffff811a4500>] ? tick_sched_do_timer+0x30/0x30
>  [<ffffffff81193124>] update_process_times+0x34/0x60
>  [<ffffffff811a3d30>] tick_sched_handle.isra.15+0x20/0x60
>  [<ffffffff811a4538>] tick_sched_timer+0x38/0x70
>  [<ffffffff81193b22>] __hrtimer_run_queues+0xe2/0x520
>  [<ffffffff811946e6>] hrtimer_interrupt+0xa6/0x1b0
>  [<ffffffff81057f63>] local_apic_timer_interrupt+0x33/0x50
>  [<ffffffff810588b8>] smp_apic_timer_interrupt+0x38/0x50
>  [<ffffffff819027bc>] apic_timer_interrupt+0x8c/0xa0
>  <EOI>  [<ffffffffa07fefa2>] ? ath10k_mac_txq_unref.part.56+0x72/0x110 [ath10k_core]
>  [<ffffffffa07fef52>] ? ath10k_mac_txq_unref.part.56+0x22/0x110 [ath10k_core]
>  [<ffffffffa08071be>] ath10k_sta_state+0x1be/0xbd0 [ath10k_core]
>  [<ffffffffa06e2f0e>] drv_sta_state+0xae/0xa10 [mac80211]
>  [<ffffffffa06ec3db>] __sta_info_destroy_part2+0x1cb/0x230 [mac80211]
>  [<ffffffffa06ec73b>] __sta_info_flush+0xfb/0x190 [mac80211]
>  [<ffffffffa0748af6>] ieee80211_set_disassoc+0xc6/0x430 [mac80211]
>  [<ffffffffa0748e93>] ieee80211_sta_connection_lost+0x33/0x70 [mac80211]
>  [<ffffffffa074d887>] ieee80211_sta_work+0x757/0x1b50 [mac80211]
>  [<ffffffff81168bdf>] ? mark_held_locks+0x6f/0xa0
>  [<ffffffff8190141e>] ? _raw_spin_unlock_irqrestore+0x4e/0x70
>  [<ffffffff81168dcd>] ? trace_hardirqs_on+0xd/0x10
>  [<ffffffffa0701503>] ieee80211_iface_work+0x373/0x410 [mac80211]
>  [<ffffffff8112dbd4>] ? process_one_work+0x164/0x750
>  [<ffffffff8112dc52>] process_one_work+0x1e2/0x750
>  [<ffffffff8112dbd4>] ? process_one_work+0x164/0x750
>  [<ffffffff8112e206>] worker_thread+0x46/0x4f0
>  [<ffffffff8112e1c0>] ? process_one_work+0x750/0x750
>  [<ffffffff811349c9>] kthread+0xf9/0x110
>  [<ffffffff81901d8f>] ret_from_fork+0x1f/0x40
>  [<ffffffff811348d0>] ? kthread_create_on_node+0x230/0x230
> NMI watchdog: BUG: soft lockup - CPU#5 stuck for 22s! [swapper/5:0]
> Modules linked in: nf_conntrack_netlink nf_conntrack nfnetlink nf_defrag_ipv4 8021q garp mrp stp llc bnep bluetooth fuse macvlan wanlink(O) pktgen
> rpcsec_gss_krb5 nfsv4 nfs fscache coretemp hwmon intel_rapl x86_pkg_temp_thermal intel_powerclamp iTCO_wdt iTCO_vendor_support kvm irqbypass joydev
> snd_hda_codec_hdmi snd_hda_codec_realtek snd_hda_codec_generic ath10k_pci ath10k_core ath mac80211 pcspkr snd_hda_intel snd_hda_codec cfg80211 snd_hda_core
> snd_hwdep snd_seq snd_seq_device snd_pcm snd_timer snd i2c_i801 soundcore lpc_ich shpchp tpm_tis tpm nfsd auth_rpcgss nfs_acl lockd grace sunrpc serio_raw i915
> i2c_algo_bit e1000e drm_kms_helper ptp pps_core drm i2c_core fjes video ipv6 [last unloaded: nf_conntrack]
> irq event stamp: 4565575
> hardirqs last  enabled at (4565574): [<ffffffff8190253c>] restore_regs_and_iret+0x0/0x1d
> hardirqs last disabled at (4565575): [<ffffffff819027b7>] apic_timer_interrupt+0x87/0xa0
> softirqs last  enabled at (4564446): [<ffffffff8111500c>] _local_bh_enable+0x1c/0x50
> softirqs last disabled at (4564447): [<ffffffff811166de>] irq_exit+0xae/0xb0
> CPU: 5 PID: 0 Comm: swapper/5 Tainted: G        W  O L  4.7.10+ #10
> Hardware name: To be filled by O.E.M. To be filled by O.E.M./ChiefRiver, BIOS 4.6.5 06/07/2013
> task: ffff880214912600 ti: ffff88021491c000 task.ti: ffff88021491c000
> RIP: 0010:[<ffffffff8116c74a>]  [<ffffffff8116c74a>] queued_spin_lock_slowpath+0x17a/0x1a0
> RSP: 0018:ffff88021e343ce0  EFLAGS: 00000202
> RAX: 0000000000000101 RBX: ffff8800d4825b00 RCX: 0000000000000001
> RDX: 0000000000000101 RSI: 0000000000000001 RDI: ffff8800d4825b00
> RBP: ffff88021e343ce0 R08: 0000000000000101 R09: 00000000000000ff
> R10: 0000000000000000 R11: 0000000000000000 R12: 000000007d580340
> R13: 0000000000000001 R14: 000000007d580340 R15: 0000000000000000
> FS:  0000000000000000(0000) GS:ffff88021e340000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 00007f9325ee4a28 CR3: 0000000001e06000 CR4: 00000000001406e0
> Stack:
>  ffff88021e343d10 ffffffff8116de25 ffff8800d4825b00 ffff8800d4820a60
>  ffff8800d4825220 ffff8800d48243e0 ffff88021e343d30 ffffffff81901152
>  ffffffffa080b4bc ffff8800d48252f8 ffff88021e343d90 ffffffffa080b4bc
> Call Trace:
>  <IRQ>
>  [<ffffffff8116de25>] do_raw_spin_lock+0x145/0x150
>  [<ffffffff81901152>] _raw_spin_lock_bh+0x42/0x50
>  [<ffffffffa080b4bc>] ? ath10k_mac_tx_push_pending+0x6c/0x2d0 [ath10k_core]
>  [<ffffffffa080b4bc>] ath10k_mac_tx_push_pending+0x6c/0x2d0 [ath10k_core]
>  [<ffffffffa080b450>] ? ath10k_mac_tx_push_txq+0x190/0x190 [ath10k_core]
>  [<ffffffffa081df0f>] ath10k_htt_txrx_compl_task+0x54f/0x780 [ath10k_core]
>  [<ffffffff811872bd>] ? debug_lockdep_rcu_enabled+0x1d/0x20
>  [<ffffffffa087e5cd>] ? ath10k_ce_per_engine_service+0x7d/0xa0 [ath10k_pci]
>  [<ffffffff81168cb5>] ? trace_hardirqs_on_caller+0xa5/0x1b0
>  [<ffffffff8111530b>] ? __local_bh_enable_ip+0x6b/0xd0
>  [<ffffffff81901370>] ? _raw_spin_unlock_bh+0x30/0x40
>  [<ffffffffa087e666>] ? ath10k_ce_per_engine_service_any+0x76/0xa0 [ath10k_pci]
>  [<ffffffff8111571e>] tasklet_action+0x19e/0x210
>  [<ffffffff81116198>] __do_softirq+0x118/0x4c0
>  [<ffffffff811166de>] irq_exit+0xae/0xb0
>  [<ffffffff810359d5>] do_IRQ+0x65/0x110
>  [<ffffffff819024cc>] common_interrupt+0x8c/0x8c
>  <EOI>
>  [<ffffffff8176e0bb>] ? cpuidle_enter_state+0x12b/0x3b0
>  [<ffffffff8176e362>] cpuidle_enter+0x12/0x20
>  [<ffffffff8115ca25>] call_cpuidle+0x25/0x50
>  [<ffffffff8115ce40>] cpu_startup_entry+0x2f0/0x420
>  [<ffffffff810567b2>] start_secondary+0x152/0x170
> Code: 66 31 c0 41 39 c0 74 e6 4d 85 c9 c6 07 01 74 2b 41 c7 41 08 01 00 00 00 e9 51 ff ff ff 83 fa 01 75 07 e9 a6 fe ff ff f3 90 8b 07 <84> c0 75 f8 b8 01 00 00
> 00 66 89 07 5d c3 f3 90 4c 8b 09 4d 85
> INFO: rcu_sched detected stalls on CPUs/tasks:
>     1-...: (1 GPs behind) idle=af5/140000000000000/0 softirq=16702/18131 fqs=151378
>     5-...: (1 GPs behind) idle=9e9/1/0 softirq=13207/14592 fqs=151379
>     (detected by 3, t=455032 jiffies, g=502, c=501, q=4)
> Task dump for CPU 1:
> kworker/u16:3   R  running task        0   289      2 0x00000008
> Workqueue: phy0 ieee80211_iface_work [mac80211]
>  0000000000000005 0000000000000003 ffff8802140dcc00 0000000000000002
>  ffff8802140dd428 ffff8800367d38f0 ffffffff81168bdf ffff8802140dcc00
>  ffffffff8190253c ffff8800d4825b00 ffff88021149cb58 ffff88021149cbd8
> Call Trace:
>  [<ffffffff81168bdf>] ? mark_held_locks+0x6f/0xa0
>  [<ffffffff8190253c>] ? retint_kernel+0x2d/0x2d
>  [<ffffffff81168cb5>] ? trace_hardirqs_on_caller+0xa5/0x1b0
>  [<ffffffff8100301a>] ? trace_hardirqs_on_thunk+0x1a/0x1c
>  [<ffffffff8190253c>] ? retint_kernel+0x2d/0x2d
>  [<ffffffffa07fef96>] ? ath10k_mac_txq_unref.part.56+0x66/0x110 [ath10k_core]
>  [<ffffffffa07fef52>] ? ath10k_mac_txq_unref.part.56+0x22/0x110 [ath10k_core]
>  [<ffffffffa08071be>] ? ath10k_sta_state+0x1be/0xbd0 [ath10k_core]
>  [<ffffffffa06e2f0e>] ? drv_sta_state+0xae/0xa10 [mac80211]
>  [<ffffffffa06ec3db>] ? __sta_info_destroy_part2+0x1cb/0x230 [mac80211]
>  [<ffffffffa06ec73b>] ? __sta_info_flush+0xfb/0x190 [mac80211]
>  [<ffffffffa0748af6>] ? ieee80211_set_disassoc+0xc6/0x430 [mac80211]
>  [<ffffffffa0748e93>] ? ieee80211_sta_connection_lost+0x33/0x70 [mac80211]
>  [<ffffffffa074d887>] ? ieee80211_sta_work+0x757/0x1b50 [mac80211]
>  [<ffffffff81168bdf>] ? mark_held_locks+0x6f/0xa0
>  [<ffffffff8190141e>] ? _raw_spin_unlock_irqrestore+0x4e/0x70
>  [<ffffffff81168dcd>] ? trace_hardirqs_on+0xd/0x10
>  [<ffffffffa0701503>] ? ieee80211_iface_work+0x373/0x410 [mac80211]
>  [<ffffffff8112dbd4>] ? process_one_work+0x164/0x750
>  [<ffffffff8112dc52>] ? process_one_work+0x1e2/0x750
>  [<ffffffff8112dbd4>] ? process_one_work+0x164/0x750
>  [<ffffffff8112e206>] ? worker_thread+0x46/0x4f0
>  [<ffffffff8112e1c0>] ? process_one_work+0x750/0x750
>  [<ffffffff811349c9>] ? kthread+0xf9/0x110
>  [<ffffffff81901d8f>] ? ret_from_fork+0x1f/0x40
>  [<ffffffff811348d0>] ? kthread_create_on_node+0x230/0x230
> Task dump for CPU 5:
> swapper/5       R  running task        0     0      1 0x00000008
>  ffffffff8176e0bb 0000000000000010 0000000000000206 ffff88021491fe90
>  0000000000000018 0000000000000000 000000167ff80a8f ffff880214920000
>  ffff88021e362600 ffffffff81ea67e0 ffff88021491c000 ffff88021491c000
> Call Trace:
>  [<ffffffff8176e0bb>] ? cpuidle_enter_state+0x12b/0x3b0
>  [<ffffffff8176e362>] ? cpuidle_enter+0x12/0x20
>  [<ffffffff8115ca25>] ? call_cpuidle+0x25/0x50
>  [<ffffffff8115ce40>] ? cpu_startup_entry+0x2f0/0x420
>  [<ffffffff810567b2>] ? start_secondary+0x152/0x170
> NMI watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [kworker/u16:3:289]
> Modules linked in: nf_conntrack_netlink nf_conntrack nfnetlink nf_defrag_ipv4 8021q garp mrp stp llc bnep bluetooth fuse macvlan wanlink(O) pktgen
> rpcsec_gss_krb5 nfsv4 nfs fscache coretemp hwmon intel_rapl x86_pkg_temp_thermal intel_powerclamp iTCO_wdt iTCO_vendor_support kvm irqbypass joydev
> snd_hda_codec_hdmi snd_hda_codec_realtek snd_hda_codec_generic ath10k_pci ath10k_core ath mac80211 pcspkr snd_hda_intel snd_hda_codec cfg80211 snd_hda_core
> snd_hwdep snd_seq snd_seq_device snd_pcm snd_timer snd i2c_i801 soundcore lpc_ich shpchp tpm_tis tpm nfsd auth_rpcgss nfs_acl lockd grace sunrpc serio_raw i915
> i2c_algo_bit e1000e drm_kms_helper ptp pps_core drm i2c_core fjes video ipv6 [last unloaded: nf_conntrack]
> irq event stamp: 3209865
> hardirqs last  enabled at (3209864): [<ffffffff8190253c>] restore_regs_and_iret+0x0/0x1d
> hardirqs last disabled at (3209865): [<ffffffff819027b7>] apic_timer_interrupt+0x87/0xa0
> softirqs last  enabled at (1466546): [<ffffffffa08071ae>] ath10k_sta_state+0x1ae/0xbd0 [ath10k_core]
> softirqs last disabled at (1466548): [<ffffffffa07fef52>] ath10k_mac_txq_unref.part.56+0x22/0x110 [ath10k_core]
> CPU: 1 PID: 289 Comm: kworker/u16:3 Tainted: G        W  O L  4.7.10+ #10
> Hardware name: To be filled by O.E.M. To be filled by O.E.M./ChiefRiver, BIOS 4.6.5 06/07/2013
> Workqueue: phy0 ieee80211_iface_work [mac80211]
> task: ffff8802140dcc00 ti: ffff8800367d0000 task.ti: ffff8800367d0000
> RIP: 0010:[<ffffffffa07fef96>]  [<ffffffffa07fef96>] ath10k_mac_txq_unref.part.56+0x66/0x110 [ath10k_core]
> RSP: 0018:ffff8800367d3a28  EFLAGS: 00000202
> RAX: ffff8800d57a8078 RBX: ffff88021149a060 RCX: ffff8800d57a8078
> RDX: ffff8800d57a8078 RSI: ffff8800d4825b38 RDI: ffff8800d4825b00
> RBP: ffff8800367d3a48 R08: ffffffff8281b960 R09: ffffffff81c75e6b
> R10: 0000000000000001 R11: ffff8802140dd428 R12: ffff8800d48243e0
> R13: ffff8800d4825b00 R14: ffff88021149cb58 R15: ffff88021149cbd8
> FS:  0000000000000000(0000) GS:ffff88021e240000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 00007f72269c8000 CR3: 0000000001e06000 CR4: 00000000001406e0
> Stack:
>  0000000000000000 ffff88021149caf8 0000000000000000 ffff8800d48243e0
>  ffff8800367d3ad8 ffffffffa08071be 0000000000000076 0000000000000000
>  ffff8800367d3a88 0000000000000000 ffff8800d4825ac8 ffff8800d4820a60
> Call Trace:
>  [<ffffffffa08071be>] ath10k_sta_state+0x1be/0xbd0 [ath10k_core]
>  [<ffffffffa06e2f0e>] drv_sta_state+0xae/0xa10 [mac80211]
>  [<ffffffffa06ec3db>] __sta_info_destroy_part2+0x1cb/0x230 [mac80211]
>  [<ffffffffa06ec73b>] __sta_info_flush+0xfb/0x190 [mac80211]
>  [<ffffffffa0748af6>] ieee80211_set_disassoc+0xc6/0x430 [mac80211]
>  [<ffffffffa0748e93>] ieee80211_sta_connection_lost+0x33/0x70 [mac80211]
>  [<ffffffffa074d887>] ieee80211_sta_work+0x757/0x1b50 [mac80211]
>  [<ffffffff81168bdf>] ? mark_held_locks+0x6f/0xa0
>  [<ffffffff8190141e>] ? _raw_spin_unlock_irqrestore+0x4e/0x70
>  [<ffffffff81168dcd>] ? trace_hardirqs_on+0xd/0x10
>  [<ffffffffa0701503>] ieee80211_iface_work+0x373/0x410 [mac80211]
>  [<ffffffff8112dbd4>] ? process_one_work+0x164/0x750
>  [<ffffffff8112dc52>] process_one_work+0x1e2/0x750
>  [<ffffffff8112dbd4>] ? process_one_work+0x164/0x750
>  [<ffffffff8112e206>] worker_thread+0x46/0x4f0
>  [<ffffffff8112e1c0>] ? process_one_work+0x750/0x750
>  [<ffffffff811349c9>] kthread+0xf9/0x110
>  [<ffffffff81901d8f>] ret_from_fork+0x1f/0x40
>  [<ffffffff811348d0>] ? kthread_create_on_node+0x230/0x230
> Code: 48 89 0a 48 89 43 18 48 89 43 20 49 8b 84 24 58 17 00 00 49 8d b4 24 58 17 00 00 48 39 f0 48 8b 10 75 10 eb 4b 48 39 f2 48 8b 0a <48> 89 d0 74 40 48 89 ca
> 48 8d 48 e8 48 39 cb 75 e9 48 8b 38 48
> sysrq: SysRq : Show Locks Held
>
> Showing all locks held in the system:
> 3 locks held by systemd/1:
>  #0:  (sb_writers#6){.+.+.+}, at: [<ffffffff812a46d2>] __sb_start_write+0xb2/0xf0
>  #1:  (&of->mutex){+.+.+.}, at: [<ffffffff8132e1ac>] kernfs_fop_write+0xfc/0x1b0
>  #2:  (cgroup_mutex){+.+.+.}, at: [<ffffffff811bc805>] cgroup_kn_lock_live+0x55/0x200
> 3 locks held by kworker/2:0/24:
>  #0:  ("events"){.+.+.+}, at: [<ffffffff8112dbd4>] process_one_work+0x164/0x750
>  #1:  (wireless_nlevent_work){+.+.+.}, at: [<ffffffff8112dbd4>] process_one_work+0x164/0x750
>  #2:  (rtnl_mutex){+.+.+.}, at: [<ffffffff81815b62>] rtnl_lock+0x12/0x20
> 3 locks held by kworker/0:1/268:
>  #0:  ("events"){.+.+.+}, at: [<ffffffff8112dbd4>] process_one_work+0x164/0x750
>  #1:  ((linkwatch_work).work){+.+.+.}, at: [<ffffffff8112dbd4>] process_one_work+0x164/0x750
>  #2:  (rtnl_mutex){+.+.+.}, at: [<ffffffff81815b62>] rtnl_lock+0x12/0x20
> 5 locks held by kworker/u16:4/290:
>  #0:  ("writeback"){++++..}, at: [<ffffffff8112dbd4>] process_one_work+0x164/0x750
>  #1:  ((&(&wb->dwork)->work)){+.+...}, at: [<ffffffff8112dbd4>] process_one_work+0x164/0x750
>  #2:  (&type->s_umount_key#33){++++..}, at: [<ffffffff812a4ec6>] trylock_super+0x16/0x50
>  #3:  (&sbi->s_journal_flag_rwsem){.+.+..}, at: [<ffffffff8134323c>] ext4_writepages+0x4c/0x1070
>  #4:  (jbd2_handle){+.+...}, at: [<ffffffff81392ba3>] start_this_handle+0x1a3/0x540
> 4 locks held by kworker/0:2/489:
>  #0:  ("events_freezable"){.+.+.+}, at: [<ffffffff8112dbd4>] process_one_work+0x164/0x750
>  #1:  ((&local->restart_work)){+.+.+.}, at: [<ffffffff8112dbd4>] process_one_work+0x164/0x750
>  #2:  (rtnl_mutex){+.+.+.}, at: [<ffffffff81815b62>] rtnl_lock+0x12/0x20
>  #3:  (&local->sta_mtx){+.+.+.}, at: [<ffffffffa072abd2>] ieee80211_reconfig+0xb42/0x2030 [mac80211]
> 5 locks held by systemd-journal/778:
>  #0:  (&mm->mmap_sem){++++++}, at: [<ffffffff8106c371>] __do_page_fault+0x161/0x510
>  #1:  (sb_pagefaults){.+.+..}, at: [<ffffffff812a46d2>] __sb_start_write+0xb2/0xf0
>  #2:  (&ei->i_mmap_sem){++++.+}, at: [<ffffffff81348480>] ext4_page_mkwrite+0x60/0x470
>  #3:  (jbd2_handle){+.+...}, at: [<ffffffff81392ba3>] start_this_handle+0x1a3/0x540
>  #4:  (&ei->i_data_sem){++++..}, at: [<ffffffff8133fc0b>] ext4_map_blocks+0x12b/0x5e0
> 2 locks held by agetty/1410:
>  #0:  (&tty->ldisc_sem){++++.+}, at: [<ffffffff81900f7d>] ldsem_down_read+0x2d/0x40
>  #1:  (&ldata->atomic_read_lock){+.+...}, at: [<ffffffff815808c9>] n_tty_read+0xa9/0x8c0
> 2 locks held by agetty/1414:
>  #0:  (&tty->ldisc_sem){++++.+}, at: [<ffffffff81900f7d>] ldsem_down_read+0x2d/0x40
>  #1:  (&ldata->atomic_read_lock){+.+...}, at: [<ffffffff815808c9>] n_tty_read+0xa9/0x8c0
> 2 locks held by bash/1757:
>  #0:  (&tty->ldisc_sem){++++.+}, at: [<ffffffff81900f7d>] ldsem_down_read+0x2d/0x40
>  #1:  (&ldata->atomic_read_lock){+.+...}, at: [<ffffffff815808c9>] n_tty_read+0xa9/0x8c0
> 4 locks held by btserver/2155:
>  #0:  (&f->f_pos_lock){+.+.+.}, at: [<ffffffff812c3a4e>] __fdget_pos+0x3e/0x50
>  #1:  (sb_writers#8){.+.+.+}, at: [<ffffffff812a46d2>] __sb_start_write+0xb2/0xf0
>  #2:  (&sb->s_type->i_mutex_key#11){+.+.+.}, at: [<ffffffff813387d3>] ext4_file_write_iter+0x43/0x380
>  #3:  (jbd2_handle){+.+...}, at: [<ffffffff81392ba3>] start_this_handle+0x1a3/0x540
> 3 locks held by wpa_supplicant/3776:
>  #0:  (cb_lock){++++++}, at: [<ffffffff8183fa04>] genl_rcv+0x14/0x40
>  #1:  (genl_mutex){+.+.+.}, at: [<ffffffff8183fe44>] genl_rcv_msg+0xa4/0xb0
>  #2:  (rtnl_mutex){+.+.+.}, at: [<ffffffff81815b62>] rtnl_lock+0x12/0x20
> 2 locks held by bash/5717:
>  #0:  (&tty->ldisc_sem){++++.+}, at: [<ffffffff81900f7d>] ldsem_down_read+0x2d/0x40
>  #1:  (&ldata->atomic_read_lock){+.+...}, at: [<ffffffff815808c9>] n_tty_read+0xa9/0x8c0
> 3 locks held by kworker/0:3/6400:
>  #0:  ("events_power_efficient"){.+.+.+}, at: [<ffffffff8112dbd4>] process_one_work+0x164/0x750
>  #1:  ((reg_check_chans).work){+.+...}, at: [<ffffffff8112dbd4>] process_one_work+0x164/0x750
>  #2:  (rtnl_mutex){+.+.+.}, at: [<ffffffff81815b62>] rtnl_lock+0x12/0x20
> 3 locks held by (journald)/6443:
>  #0:  (sb_writers#6){.+.+.+}, at: [<ffffffff812a46d2>] __sb_start_write+0xb2/0xf0
>  #1:  (&of->mutex){+.+.+.}, at: [<ffffffff8132e1ac>] kernfs_fop_write+0xfc/0x1b0
>  #2:  (cgroup_mutex){+.+.+.}, at: [<ffffffff811bc805>] cgroup_kn_lock_live+0x55/0x200
>
> =============================================
>
>


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
