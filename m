Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YF3We-00073M-I5
 for ath10k@lists.infradead.org; Sat, 24 Jan 2015 16:25:33 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 2/2] ath10k: fix beacon deadlock
References: <1421412811-6387-1-git-send-email-michal.kazior@tieto.com>
 <1421412811-6387-2-git-send-email-michal.kazior@tieto.com>
Date: Sat, 24 Jan 2015 18:24:56 +0200
In-Reply-To: <1421412811-6387-2-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Fri, 16 Jan 2015 13:53:31 +0100")
Message-ID: <87y4osgn8n.fsf@kamboji.qca.qualcomm.com>
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

> This should fix a very rare occurrence of the following deadlock:
>
>   [<ffffffffa018265e>] ath10k_wmi_tx_beacons_nowait+0x1e/0x50 [ath10k_core]
>   [<ffffffffa01829b6>] ath10k_wmi_op_ep_tx_credits+0x16/0x40 [ath10k_core]
>   [<ffffffffa017d685>] ath10k_htc_send+0x285/0x3d0 [ath10k_core]
>   [<ffffffffa0184b81>] ath10k_wmi_cmd_send_nowait+0x81/0x110 [ath10k_core]
>   [<ffffffffa0184c61>] ath10k_wmi_tx_beacon_nowait.part.33+0x51/0x90 [ath10k_core]
>   [<ffffffffa0184cd0>] ath10k_wmi_tx_beacons_iter+0x30/0x40 [ath10k_core]
>   [<ffffffff81882246>] __iterate_active_interfaces+0xa6/0x100
>   [<ffffffffa0184ca0>] ? ath10k_wmi_tx_beacon_nowait.part.33+0x90/0x90 [ath10k_core]
>   [<ffffffff818822ae>] ieee80211_iterate_active_interfaces_atomic+0xe/0x10
>   [<ffffffffa0182676>] ath10k_wmi_tx_beacons_nowait+0x36/0x50 [ath10k_core]
>   [<ffffffffa01829b6>] ath10k_wmi_op_ep_tx_credits+0x16/0x40 [ath10k_core]
>   [<ffffffffa017d140>] ath10k_htc_rx+0x280/0x410 [ath10k_core]
>   [<ffffffffa01bcbf0>] ? ath10k_ce_completed_recv_next+0x60/0x80 [ath10k_pci]
>   [<ffffffffa01bc6ab>] ath10k_pci_ce_recv_data+0x11b/0x1d0 [ath10k_pci]
>   [<ffffffffa01bcf44>] ath10k_ce_per_engine_service+0x64/0xc0 [ath10k_pci]
>   [<ffffffffa01bcfc2>] ath10k_ce_per_engine_service_any+0x22/0x50 [ath10k_pci]
>   [<ffffffffa01bc4d0>] ath10k_pci_tasklet+0x30/0x90 [ath10k_pci]
>   [<ffffffff81055a55>] tasklet_action+0xc5/0x100
>
> To prevent this make sure to release ar->data_lock
> while calling to ath10k_wmi_beacon_send_ref_nowait().
>
> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>

This introduces a new warning from kbuild:

tree:   git://github.com/kvalo/ath ath-next-test
head:   59030a70b61c41268383d1406bb49fc559e0da4e
commit: 60845cf1bc104bbec7509eb4b6c9f09a1559bfdc [104/113] ath10k: fix beacon deadlock

New smatch warnings:
drivers/net/wireless/ath/ath10k/wmi.c:969 ath10k_wmi_tx_beacon_nowait() warn: variable dereferenced before check 'bcn' (see line 967)

Old smatch warnings:
drivers/net/wireless/ath/ath10k/wmi.c:3982 ath10k_wmi_start_scan_verify() warn: this array is probably non-NULL. 'arg->ie'
drivers/net/wireless/ath/ath10k/wmi.c:3984 ath10k_wmi_start_scan_verify() warn: this array is probably non-NULL. 'arg->channels'
drivers/net/wireless/ath/ath10k/wmi.c:3986 ath10k_wmi_start_scan_verify() warn: this array is probably non-NULL. 'arg->ssids'
drivers/net/wireless/ath/ath10k/wmi.c:3988 ath10k_wmi_start_scan_verify() warn: this array is probably non-NULL. 'arg->bssids'

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
