Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ua0-x233.google.com ([2607:f8b0:400c:c08::233])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cfoxo-0005b9-K2
 for ath10k@lists.infradead.org; Mon, 20 Feb 2017 14:29:19 +0000
Received: by mail-ua0-x233.google.com with SMTP id 92so11383908uad.2
 for <ath10k@lists.infradead.org>; Mon, 20 Feb 2017 06:28:55 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1487599771734.76597@qti.qualcomm.com>
References: <CAMVG2sv5StH2+AWsfQU3TknGSgtoX6tXM6-_Cgwwo8BJz9Av+w@mail.gmail.com>
 <1487599771734.76597@qti.qualcomm.com>
From: Daniel J Blueman <daniel@quora.org>
Date: Mon, 20 Feb 2017 22:28:54 +0800
Message-ID: <CAMVG2svMzPZ7HjuuqQF_nasMHGz_7XH_DXfqMf5-sQMEtvSYcg@mail.gmail.com>
Subject: Re: [4.9.10] ath10k workqueue warnings
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
To: "Shajakhan, Mohammed Shafi (Mohammed Shafi)" <mohammed@qti.qualcomm.com>
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On 20 February 2017 at 22:09, Shajakhan, Mohammed Shafi (Mohammed
Shafi) <mohammed@qti.qualcomm.com> wrote:
> Hi Daniel,
>
> in-spite of the warning is the device working properly ?, for example are you able to scan
> Also did you observer a firmware crash ? Also i wonder have you disabled ath10k and observed
> these warnings in work_queue as 'ath10k_core_register_work' does not seems to map
> 'queue_delayed_work_on'

The interface was working fine.

We see an interrupt occurring ("IRQ->EOI") likely due to package
thermal excursion, and perhaps the true issue is that
intel_thermal_interrupt is adding work to the ath10k_wq workqueue.

I'll ask the right related folks.

Thanks!
  Daniel

> As far as the 4.9 fixes / changes
> https://git.kernel.org/cgit/linux/kernel/git/stable/linux-stable.git/log/drivers/net/wireless/ath/ath10k
>
> regards,
> shafi
> ________________________________________
> From: ath10k <ath10k-bounces@lists.infradead.org> on behalf of Daniel J Blueman <daniel@quora.org>
> Sent: 20 February 2017 18:56
> To: ath10k@lists.infradead.org
> Subject: [4.9.10] ath10k workqueue warnings
>
> Running 4.9 with some kernel debug options enabled [1], I see two
> workqueue warnings while ath10k work is being processed [3]. Full
> dmesg output is available [2].
>
> Let me know if getting any additional debug would help, or testing any changes.
>
> Thanks!
>   Dan
>
> [1] https://quora.org/config
> [2] https://quora.org/dmesg.txt
>
> -- [3]
>
> WARNING: CPU: 3 PID: 196 at kernel/workqueue.c:1509
> __queue_delayed_work+0x301/0x3c0
> CPU: 3 PID: 196 Comm: kworker/u8:3 Tainted: G   U     4.9.10-debug+ #3
> Hardware name: Dell Inc. XPS 13 9360/0T3FTF, BIOS 1.3.2 01/18/2017
> Workqueue: ath10k_wq ath10k_core_register_work [ath10k_core]
>  ffff880236187e88 ffffffffb74d83a1 0000000000000000 0000000000000000
>  ffff880236187ed0 ffffffffb6978b12 0000000000000082 00000000000005e5
>  0000000000000046 0000000000000003 ffff880235d4a1c8 ffff8802361a42a0
> Call Trace:
>  <IRQ>
>  [<ffffffffb74d83a1>] dump_stack+0x85/0xc4
>  [<ffffffffb6978b12>] __warn+0x172/0x1b0
>  [<ffffffffb6978d3d>] warn_slowpath_null+0x1d/0x20
>  [<ffffffffb69ca541>] __queue_delayed_work+0x301/0x3c0
>  [<ffffffffb69cc224>] queue_delayed_work_on+0x54/0xa0
>  [<ffffffffc181a19d>]
> pkg_temp_thermal_platform_thermal_notify+0x19d/0x24d
> [x86_pkg_temp_thermal]
>  [<ffffffffb6ca971c>] ? irq_work_run+0x2c/0x40
>  [<ffffffffb68dac37>] intel_thermal_interrupt+0x2f7/0x4b0
>  [<ffffffffb68daf11>] smp_thermal_interrupt+0x21/0x90
>  [<ffffffffb83d2eac>] thermal_interrupt+0x8c/0xa0
>  <EOI>
>  [<ffffffffb83d0483>] ? _raw_spin_unlock_irq+0x33/0x40
>  [<ffffffffb83d047c>] ? _raw_spin_unlock_irq+0x2c/0x40
>  [<ffffffffb83bffdc>] __schedule+0x111c/0x1b80
>  [<ffffffffb6a8a33e>] ? trace_hardirqs_on_caller+0x3fe/0x580
>  [<ffffffffc167789c>] ? ath10k_ce_completed_recv_next+0x5c/0x70 [ath10k_pci]
>  [<ffffffffb83c0ad4>] schedule+0x94/0x1b0
>  [<ffffffffc166fd1d>] ath10k_pci_hif_exchange_bmi_msg+0xabd/0x1490 [ath10k_pci]
>  [<ffffffffb6e45268>] ? kfree+0x258/0x2c0
>  [<ffffffffc166f260>] ? ath10k_pci_fw_crashed_dump+0x1d0/0x1d0 [ath10k_pci]
>  [<ffffffffc166f260>] ? ath10k_pci_fw_crashed_dump+0x1d0/0x1d0 [ath10k_pci]
>  [<ffffffffb797d3cd>] ? dev_printk_emit+0x9d/0xd0
>  [<ffffffffb797d330>] ? dev_vprintk_emit+0x600/0x600
>  [<ffffffffb797dc0c>] ? __dev_printk+0xdc/0x300
>  [<ffffffffc17b0345>] ath10k_bmi_lz_data+0x195/0x2c0 [ath10k_core]
>  [<ffffffffc17b01b0>] ? ath10k_bmi_execute+0x2a0/0x2a0 [ath10k_core]
>  [<ffffffffc17b0470>] ? ath10k_bmi_lz_data+0x2c0/0x2c0 [ath10k_core]
>  [<ffffffffc17b0736>] ath10k_bmi_fast_download+0x106/0x130 [ath10k_core]
>  [<ffffffffc17b0630>] ? ath10k_bmi_lz_stream_start+0x1c0/0x1c0 [ath10k_core]
>  [<ffffffffc1738080>] ? ath10k_read_wmi_services+0x200/0x200 [ath10k_core]
>  [<ffffffffc173ccdb>] ath10k_core_get_board_id_from_otp+0x10b/0x2e0
> [ath10k_core]
>  [<ffffffffc173cbd0>] ? ath10k_download_cal_file+0xc0/0xc0 [ath10k_core]
>  [<ffffffffc1673058>] ? ath10k_pci_hif_power_up+0x2b8/0x530 [ath10k_pci]
>  [<ffffffffc174259f>] ath10k_core_register_work+0x5cf/0x1960 [ath10k_core]
>  [<ffffffffb6a8f214>] ? lock_acquire+0x1b4/0x330
>  [<ffffffffc1741fd0>] ? ath10k_core_stop+0x160/0x160 [ath10k_core]
>  [<ffffffffb69ce832>] process_one_work+0x6a2/0x1b00
>  [<ffffffffb69ce798>] ? process_one_work+0x608/0x1b00
>  [<ffffffffb83d047c>] ? _raw_spin_unlock_irq+0x2c/0x40
>  [<ffffffffb69ce190>] ? pwq_dec_nr_in_flight+0x2b0/0x2b0
>  [<ffffffffb69cfd70>] worker_thread+0xe0/0x1460
>  [<ffffffffb83bf6bb>] ? __schedule+0x7fb/0x1b80
>  [<ffffffffb69cfc90>] ? process_one_work+0x1b00/0x1b00
>  [<ffffffffb69e3082>] kthread+0x222/0x2e0
>  [<ffffffffb69e2e60>] ? kthread_park+0x80/0x80
>  [<ffffffffb69e2e60>] ? kthread_park+0x80/0x80
>  [<ffffffffb69e2e60>] ? kthread_park+0x80/0x80
>  [<ffffffffb83d0eaa>] ret_from_fork+0x2a/0x40
>
> WARNING: CPU: 3 PID: 196 at kernel/workqueue.c:1511
> __queue_delayed_work+0x26f/0x3c0
> CPU: 3 PID: 196 Comm: kworker/u8:3 Tainted: G   U W    4.9.10-debug+ #3
> Hardware name: Dell Inc. XPS 13 9360/0T3FTF, BIOS 1.3.2 01/18/2017
> Workqueue: ath10k_wq ath10k_core_register_work [ath10k_core]
>  ffff880236187e88 ffffffffb74d83a1 0000000000000000 0000000000000000
>  ffff880236187ed0 ffffffffb6978b12 0000000000000082 00000000000005e7
>  ffff8802361a4268 0000000000000003 ffff880235d4a1c8 ffff8802361a42a0
> Call Trace:
>  <IRQ>
>  [<ffffffffb74d83a1>] dump_stack+0x85/0xc4
>  [<ffffffffb6978b12>] __warn+0x172/0x1b0
>  [<ffffffffb6978d3d>] warn_slowpath_null+0x1d/0x20
>  [<ffffffffb69ca4af>] __queue_delayed_work+0x26f/0x3c0
>  [<ffffffffb69cc224>] queue_delayed_work_on+0x54/0xa0
>  [<ffffffffc181a19d>]
> pkg_temp_thermal_platform_thermal_notify+0x19d/0x24d
> [x86_pkg_temp_thermal]
>  [<ffffffffb6ca971c>] ? irq_work_run+0x2c/0x40
>  [<ffffffffb68dac37>] intel_thermal_interrupt+0x2f7/0x4b0
>  [<ffffffffb68daf11>] smp_thermal_interrupt+0x21/0x90
>  [<ffffffffb83d2eac>] thermal_interrupt+0x8c/0xa0
>  <EOI>
>  [<ffffffffb83d0483>] ? _raw_spin_unlock_irq+0x33/0x40
>  [<ffffffffb83d047c>] ? _raw_spin_unlock_irq+0x2c/0x40
>  [<ffffffffb83bffdc>] __schedule+0x111c/0x1b80
>  [<ffffffffb6a8a33e>] ? trace_hardirqs_on_caller+0x3fe/0x580
>  [<ffffffffc167789c>] ? ath10k_ce_completed_recv_next+0x5c/0x70 [ath10k_pci]
>  [<ffffffffb83c0ad4>] schedule+0x94/0x1b0
>  [<ffffffffc166fd1d>] ath10k_pci_hif_exchange_bmi_msg+0xabd/0x1490 [ath10k_pci]
>  [<ffffffffb6e45268>] ? kfree+0x258/0x2c0
>  [<ffffffffc166f260>] ? ath10k_pci_fw_crashed_dump+0x1d0/0x1d0 [ath10k_pci]
>  [<ffffffffc166f260>] ? ath10k_pci_fw_crashed_dump+0x1d0/0x1d0 [ath10k_pci]
>  [<ffffffffb797d3cd>] ? dev_printk_emit+0x9d/0xd0
>  [<ffffffffb797d330>] ? dev_vprintk_emit+0x600/0x600
>  [<ffffffffb797dc0c>] ? __dev_printk+0xdc/0x300
>  [<ffffffffc17b0345>] ath10k_bmi_lz_data+0x195/0x2c0 [ath10k_core]
>  [<ffffffffc17b01b0>] ? ath10k_bmi_execute+0x2a0/0x2a0 [ath10k_core]
>  [<ffffffffc17b0470>] ? ath10k_bmi_lz_data+0x2c0/0x2c0 [ath10k_core]
>  [<ffffffffc17b0736>] ath10k_bmi_fast_download+0x106/0x130 [ath10k_core]
>  [<ffffffffc17b0630>] ? ath10k_bmi_lz_stream_start+0x1c0/0x1c0 [ath10k_core]
>  [<ffffffffc1738080>] ? ath10k_read_wmi_services+0x200/0x200 [ath10k_core]
>  [<ffffffffc173ccdb>] ath10k_core_get_board_id_from_otp+0x10b/0x2e0
> [ath10k_core]
>  [<ffffffffc173cbd0>] ? ath10k_download_cal_file+0xc0/0xc0 [ath10k_core]
>  [<ffffffffc1673058>] ? ath10k_pci_hif_power_up+0x2b8/0x530 [ath10k_pci]
>  [<ffffffffc174259f>] ath10k_core_register_work+0x5cf/0x1960 [ath10k_core]
>  [<ffffffffb6a8f214>] ? lock_acquire+0x1b4/0x330
>  [<ffffffffc1741fd0>] ? ath10k_core_stop+0x160/0x160 [ath10k_core]
>  [<ffffffffb69ce832>] process_one_work+0x6a2/0x1b00
>  [<ffffffffb69ce798>] ? process_one_work+0x608/0x1b00
>  [<ffffffffb83d047c>] ? _raw_spin_unlock_irq+0x2c/0x40
>  [<ffffffffb69ce190>] ? pwq_dec_nr_in_flight+0x2b0/0x2b0
>  [<ffffffffb69cfd70>] worker_thread+0xe0/0x1460
>  [<ffffffffb83bf6bb>] ? __schedule+0x7fb/0x1b80
>  [<ffffffffb69cfc90>] ? process_one_work+0x1b00/0x1b00
>  [<ffffffffb69e3082>] kthread+0x222/0x2e0
>  [<ffffffffb69e2e60>] ? kthread_park+0x80/0x80
>  [<ffffffffb69e2e60>] ? kthread_park+0x80/0x80
>  [<ffffffffb69e2e60>] ? kthread_park+0x80/0x80
>  [<ffffffffb83d0eaa>] ret_from_fork+0x2a/0x40
> --
> Daniel J Blueman
>
> _______________________________________________
> ath10k mailing list
> ath10k@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/ath10k



-- 
Daniel J Blueman

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
