Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YgB5w-00052B-IX
 for ath10k@lists.infradead.org; Thu, 09 Apr 2015 11:58:05 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: fix insufficient tracing buffer size
References: <1427364202-25235-1-git-send-email-michal.kazior@tieto.com>
Date: Thu, 9 Apr 2015 14:57:35 +0300
In-Reply-To: <1427364202-25235-1-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Thu, 26 Mar 2015 10:03:22 +0000")
Message-ID: <878ue1fr9s.fsf@kamboji.qca.qualcomm.com>
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
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Michal Kazior <michal.kazior@tieto.com> writes:

> Some trace messages were truncated and a kernel
> splat could be seen in the log:
>
>   WARNING: CPU: 3 PID: 0 at /devel/src/linux/drivers/net/wireless/ath/ath10k/./trace.h:114 ftrace_raw_event_ath10k_log_dbg+0x20e/0x220 [ath10k_core]()
>   Modules linked in: ath10k_pci(O) ath10k_core(O) ath iwldvm iwlwifi [last unloaded: iwlwifi]
>   CPU: 3 PID: 0 Comm: swapper/3 Tainted: G        W  O    4.0.0-rc3-wl-ath+ #703
>   Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.7.5-20140531_083030-gandalf 04/01/2014
>    ffffffffa01d4cb0 ffff88001fd83998 ffffffff8191b86c ffffffff81e3b718
>    0000000000000000 ffff88001fd839d8 ffffffff8105573a ffff88001c0a5528
>    ffff88001bea9ae0 ffff88001c3dd940 00000000000d0018 ffff88001fd83a80
>   Call Trace:
>    <IRQ>  [<ffffffff8191b86c>] dump_stack+0x45/0x57
>    [<ffffffff8105573a>] warn_slowpath_common+0x8a/0xc0
>    [<ffffffff8105582a>] warn_slowpath_null+0x1a/0x20
>    [<ffffffffa01c61fe>] ftrace_raw_event_ath10k_log_dbg+0x20e/0x220 [ath10k_core]
>    [<ffffffffa01aaa6b>] ath10k_dbg+0xbb/0xd0 [ath10k_core]
>    [<ffffffff810eed89>] ? trace_clock_local+0x9/0x10
>    [<ffffffffa01bd069>] ath10k_wmi_event_service_ready+0x479/0x520 [ath10k_core]
>    [<ffffffff810fdf90>] ? trace_buffer_unlock_commit+0x50/0x60
>    [<ffffffffa01c2113>] ath10k_wmi_tlv_op_rx+0x6b3/0x8b0 [ath10k_core]
>
> This could be reproduced with:
>
>   trace-cmd record -e ath10k
>   ifconfig wlan0 down
>   ifconfig wlan0 up
>
> Fixes: 5c01aa3de918 ("ath10k: deduplicate wmi service ready logic")
> Fixes: ca996ec56608 ("ath10k: implement wmi-tlv backend")
> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>

Thanks, applied.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
