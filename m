Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1e20RA-0000rr-K6
 for ath10k@lists.infradead.org; Tue, 10 Oct 2017 19:43:34 +0000
Subject: Re: ath10k hang on rmmod after fw crash in 4.13.3+ hacks
References: <d18529ba-1d91-e9c6-4719-4586e6b5b287@candelatech.com>
From: Ben Greear <greearb@candelatech.com>
Message-ID: <8ee59286-42a6-7396-d420-185fefd72b57@candelatech.com>
Date: Tue, 10 Oct 2017 12:43:11 -0700
MIME-Version: 1.0
In-Reply-To: <d18529ba-1d91-e9c6-4719-4586e6b5b287@candelatech.com>
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
To: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, ath10k <ath10k@lists.infradead.org>

On 10/10/2017 12:07 PM, Ben Greear wrote:
> I loaded a crashing firmware (it crashes early since it ran OOM), and
> then tried to rmmod it.  rmmod hangs, with this stack:

Looks like this is a hang related to napi, and I had a patch from an
older kernel that is probably not needed anymore...maybe it causes the
issue.  I'll test with that removed...

Thanks,
Ben

>
> [root@ben-ota-2 ~]# cat /proc/32491/stack
> [<ffffffff8113c51d>] flush_work+0x1fd/0x2d0
> [<ffffffff8113f031>] __cancel_work_timer+0x111/0x190
> [<ffffffff8113f0bb>] cancel_work_sync+0xb/0x10
> [<ffffffffa0b0a054>] ath10k_core_unregister+0x14/0xa0 [ath10k_core]
> [<ffffffffa07c7dcd>] ath10k_pci_remove+0x2d/0x70 [ath10k_pci]
> [<ffffffff81528834>] pci_device_remove+0x34/0xb0
> [<ffffffff81656b18>] device_release_driver_internal+0x158/0x210
> [<ffffffff81656c1b>] driver_detach+0x3b/0x80
> [<ffffffff81655ad3>] bus_remove_driver+0x53/0xd0
> [<ffffffff81657737>] driver_unregister+0x27/0x40
> [<ffffffff81526ff4>] pci_unregister_driver+0x24/0x90
> [<ffffffffa07ca922>] ath10k_pci_exit+0x10/0x6ee [ath10k_pci]
> [<ffffffff811c64c1>] SyS_delete_module+0x1e1/0x2a0
> [<ffffffff81003d34>] do_syscall_64+0x64/0x140
> [<ffffffff819b77c9>] entry_SYSCALL64_slow_path+0x25/0x25
> [<ffffffffffffffff>] 0xffffffffffffffff
>


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
