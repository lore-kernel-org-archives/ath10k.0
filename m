Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VZc9L-0004ww-4a
 for ath10k@lists.infradead.org; Fri, 25 Oct 2013 07:49:40 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k:  Fix un-initialized debug objects.
References: <1382639166-25698-1-git-send-email-greearb@candelatech.com>
Date: Fri, 25 Oct 2013 10:49:02 +0300
In-Reply-To: <1382639166-25698-1-git-send-email-greearb@candelatech.com>
 (greearb@candelatech.com's message of "Thu, 24 Oct 2013 11:26:06
 -0700")
Message-ID: <871u39iydt.fsf@kamboji.qca.qualcomm.com>
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
To: greearb@candelatech.com
Cc: ath10k@lists.infradead.org

greearb@candelatech.com writes:

> From: Ben Greear <greearb@candelatech.com>
>
> If the 'ar' registration fails early, the debug
> objects were not initialized, and trouble ensued when
> the object was later destroyed and the un-initialized
> objects were accessed.
>
> ath10k: Unable to wakeup target
> ath10k: Failed to reset target, target did not wake up: -110
> ath10k: early firmware event indicated
> ath10k: could not start pci hif (-110)
> ath10k: could not probe fw (-110)
> ath10k: could not register driver core (-110)
> ------------[ cut here ]------------
> WARNING: CPU: 0 PID: 11760 at /mnt/sda/home/greearb/git/ath/lib/debugobjects.c:260 debug_print_object+0x7c/)
> ODEBUG: assert_init not available (active state 0) object type: timer_list hint: stub_timer+0x0/0x17
> Modules linked in: ath10k_pci(+) ath10k_core ath5k ath9k ath9k_common ath9k_hw nfsv3 nfs_acl nfs fscache nf]
> CPU: 0 PID: 11760 Comm: modprobe Tainted: G        WC   3.12.0-rc5-wl+ #2
> Hardware name: To be filled by O.E.M. To be filled by O.E.M./HURONRIVER, BIOS 4.6.5 05/02/2012
>  0000000000000009 ffff88020b2db8d8 ffffffff8158a1af 0000000000000006
>  ffff88020b2db928 ffff88020b2db918 ffffffff8109f45e ffff88020b2db948
>  ffffffff812c3274 ffff88020b2db9d0 ffffffff81a41030 ffffffff81822095
> Call Trace:
>  [<ffffffff8158a1af>] dump_stack+0x55/0x86
>  [<ffffffff8109f45e>] warn_slowpath_common+0x77/0x91
>  [<ffffffff812c3274>] ? debug_print_object+0x7c/0x8d
>  [<ffffffff8109f50c>] warn_slowpath_fmt+0x41/0x43
>  [<ffffffff812c3274>] debug_print_object+0x7c/0x8d
>  [<ffffffff810a8324>] ? timer_debug_hint+0xa/0xa
>  [<ffffffff812c3a4c>] debug_object_assert_init+0x95/0xb1
>  [<ffffffff810a8fe2>] del_timer+0x1a/0x5f
>  [<ffffffff810eca6d>] ? trace_hardirqs_off_caller+0x37/0xa6
>  [<ffffffff810b48eb>] try_to_grab_pending+0x4c/0x141
>  [<ffffffff810b4b12>] __cancel_work_timer+0x22/0xbf
>  [<ffffffff810b4bbd>] cancel_delayed_work_sync+0xe/0x10
>  [<ffffffffa095823e>] ath10k_debug_destroy+0x10/0x12 [ath10k_core]
>  [<ffffffffa0958a25>] ath10k_core_destroy+0xf/0x33 [ath10k_core]
>  [<ffffffffa0975b4d>] ath10k_pci_probe+0x2ef/0x326 [ath10k_pci]
>  [<ffffffff812e2f6d>] local_pci_probe+0x39/0x61
>  [<ffffffff813a0723>] ? driver_probe_device+0x2f9/0x2f9
>  [<ffffffff812e3195>] pci_device_probe+0xba/0xe0
>  [<ffffffff813a054f>] driver_probe_device+0x125/0x2f9
>  [<ffffffff813a0723>] ? driver_probe_device+0x2f9/0x2f9
>  [<ffffffff813a0771>] __driver_attach+0x4e/0x6f
>  [<ffffffff8139e847>] bus_for_each_dev+0x5a/0x8c
>  [<ffffffff8139fee8>] driver_attach+0x19/0x1b
>  [<ffffffff8139fb1d>] bus_add_driver+0x113/0x263
>  [<ffffffff813a0d61>] driver_register+0x87/0xbe
>  [<ffffffff812e2605>] __pci_register_driver+0x5c/0x60
>  [<ffffffffa097c000>] ? 0xffffffffa097bfff
>  [<ffffffffa097c021>] ath10k_pci_init+0x21/0x3e [ath10k_pci]
>  [<ffffffff81128bce>] ? jump_label_lock+0x12/0x14
>  [<ffffffffa097c000>] ? 0xffffffffa097bfff
>  [<ffffffff810020d9>] do_one_initcall+0x9f/0x132
>  [<ffffffff81128bce>] ? jump_label_lock+0x12/0x14
>  [<ffffffff810be655>] ? __blocking_notifier_call_chain+0x4c/0x5a
>  [<ffffffff810f977d>] load_module+0x1beb/0x1efe
>  [<ffffffff810f68b9>] ? mod_kobject_put+0x78/0x78
>  [<ffffffff810f9b5c>] SyS_init_module+0xcc/0xdb
>  [<ffffffff815967fd>] system_call_fastpath+0x1a/0x1f
> ---[ end trace 67d86d1d06d553fa ]---
>
> Signed-off-by: Ben Greear <greearb@candelatech.com>
> ---
>  drivers/net/wireless/ath/ath10k/core.c  |  2 ++
>  drivers/net/wireless/ath/ath10k/debug.c | 13 ++++++++-----
>  drivers/net/wireless/ath/ath10k/debug.h |  6 ++++++
>  3 files changed, 16 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
> index 2a360ca..282c187 100644
> --- a/drivers/net/wireless/ath/ath10k/core.c
> +++ b/drivers/net/wireless/ath/ath10k/core.c
> @@ -728,6 +728,8 @@ struct ath10k *ath10k_core_create(void *hif_priv, struct device *dev,
>  
>  	INIT_WORK(&ar->restart_work, ath10k_core_restart);
>  
> +	ath10k_debug_init(ar);

For symmetry would it make more sense to move ath10k_debug_destroy() to
ath10k_core_unregister()? That way we could avoid adding a new function.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
