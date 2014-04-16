Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.candelatech.com ([208.74.158.172] helo=ns3.lanforge.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WaTAR-00055S-28
 for ath10k@lists.infradead.org; Wed, 16 Apr 2014 16:58:35 +0000
Received: from [192.168.100.236] (firewall.candelatech.com [70.89.124.249])
 (authenticated bits=0)
 by ns3.lanforge.com (8.14.2/8.14.2) with ESMTP id s3GGwApK005296
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
 for <ath10k@lists.infradead.org>; Wed, 16 Apr 2014 09:58:11 -0700
Message-ID: <534EB69F.9040307@candelatech.com>
Date: Wed, 16 Apr 2014 09:58:07 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Locking the htt_tx_detach path?
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
To: ath10k <ath10k@lists.infradead.org>

I have a patch in my tree that attempts to reset firmware when
the firmware fails to return tx credits after too much time.

The trace below is a crash that happened when this logic
kicked in.  Could easily just be my bug, of course, but when
looking at the related code I, I am suspicious that we should
grab the tx-lock in the detach method and check
that we are stopped before trying to transmit?

Maybe like this un-tested patch?

diff --git a/drivers/net/wireless/ath/ath10k/htt_tx.c b/drivers/net/wireless/ath/ath10k/htt_tx.c
index 22a4542..ba733e2 100644
--- a/drivers/net/wireless/ath/ath10k/htt_tx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_tx.c
@@ -144,9 +144,14 @@ static void ath10k_htt_tx_cleanup_pending(struct ath10k_htt *htt)
 void ath10k_htt_tx_detach(struct ath10k_htt *htt)
 {
        ath10k_htt_tx_cleanup_pending(htt);
+
+       spin_lock_bh(&htt->tx_lock);
        kfree(htt->pending_tx);
        kfree(htt->used_msdu_ids);
        dma_pool_destroy(htt->tx_pool);
+       htt->tx_pool = NULL;
+       spin_unlock_bh(&htt->tx_lock);
+
        return;
 }

@@ -403,6 +408,13 @@ int ath10k_htt_tx(struct ath10k_htt *htt, struct sk_buff *msdu)
                goto err;

        spin_lock_bh(&htt->tx_lock);
+
+       /* Check if we are detached... */
+       if (! htt->tx_pool) {
+               spin_unlock_bh(&htt->tx_lock);
+               goto err_tx_dec;
+       }
+
        res = ath10k_htt_tx_alloc_msdu_id(htt);
        if (res < 0) {
                spin_unlock_bh(&htt->tx_lock);




The crash below appears to be because the htt->tx_pool is NULL
in this code from htt_tx.c: (ath10k_htt_tx)

	/* Since HTT 3.0 there is no separate mgmt tx command. However in case
	 * of mgmt tx using TX_FRM there is not tx fragment list. Instead of tx
	 * fragment list host driver specifies directly frame pointer. */
	use_frags = htt->target_version_major < 3 ||
		    !ieee80211_is_mgmt(hdr->frame_control);

	skb_cb->htt.txbuf = dma_pool_alloc(htt->tx_pool, GFP_ATOMIC,
					   &paddr);


ath10k: failed with wmi_cmd_timeout 2 times, attempting hardware reset.
wlan0: Failed to send nullfunc to AP 00:c3:09:bf:a9:bb after 1000ms, disconnecting
sta2: Failed to send nullfunc to AP 00:c3:09:bf:a9:bb after 1000ms, disconnecting
sta3: Failed to send nullfunc to AP 00:c3:09:bf:a9:bb after 1000ms, disconnecting
sta4: Failed to send nullfunc to AP 00:c3:09:bf:a9:bb after 1000ms, disconnecting
sta5: Failed to send nullfunc to AP 00:c3:09:bf:a9:bb after 1000ms, disconnecting
sta6: Failed to send nullfunc to AP 00:c3:09:bf:a9:bb after 1000ms, disconnecting
ath10k: failed with wmi_cmd_timeout 2 times, attempting hardware reset.
BUG: unable to handle kernel NULL pointer dereference at           (null)
IP: [<ffffffff8116a1e1>] dma_pool_alloc+0x1a5/0x1dd
PGD c7f4f067 PUD c785e067 PMD 0
Oops: 0000 [#1] PREEMPT SMP
Modules linked in: nf_nat_ipv4 nf_nat 8021q garp stp mrp llc fuse macvlan wanlink(O) pktgen ip6table_filter ip6_tables ebtable_nat ebtables f71882fg coretemp
hwmon iTCO_wdt iTCO_vendor_support intel_rapl x86_pkg_temp_thermal intel_powerclamp kvm_intel kvm snd_hda_codec_hdmi snd_hda_codec_realtek microcode
snd_hda_codec_generic joydev pcspkr serio_raw snd_hda_intel i2c_i801 lpc_ich snd_hda_codec ath10k_pci snd_hwdep ath10k_core ath snd_seq snd_seq_device mac80211
snd_pcm cfg80211 e1000e snd_timer snd ptp soundcore pps_core shpchp uinput ipv6 i915 i2c_algo_bit drm_kms_helper ata_generic pata_acpi drm i2c_core video [last
unloaded: iptable_nat]
CPU: 0 PID: 6019 Comm: dhclient Tainted: G        WC O 3.14.0+ #6
Hardware name: To be filled by O.E.M. To be filled by O.E.M./ChiefRiver, BIOS 4.6.5 03/19/2013
task: ffff8800cbd4b100 ti: ffff8800c6a92000 task.ti: ffff8800c6a92000
RIP: 0010:[<ffffffff8116a1e1>]  [<ffffffff8116a1e1>] dma_pool_alloc+0x1a5/0x1dd
RSP: 0018:ffff8800c6a93758  EFLAGS: 00010003
ath10k: core-restart, going to state RESTARTING from ON
ieee80211 wiphy0: Hardware restart was requested
ath10k: failed to start hw scan: -70
ath10k: failed to set wmm params: -70
ath10k: failed to set wmm params: -70
ath10k: failed to set wmm params: -70
ath10k: failed to set wmm params: -70
RAX: 0000000000000292 RBX: ffff8800c906a130 RCX: 0000000000000000
RDX: 0000000000000000 RSI: 0000000000000292 RDI: ffff8802095b0790
RBP: ffff8800c6a93798 R08: 0000000000000032 R09: ffff8800c6a93798
R10: 63390e21f004bba9 R11: bf09c30000000188 R12: ffff8802095b0780
R13: ffff8802095b0580 R14: ffff8802095b0790 R15: 0000000000000020
FS:  00007f296b976740(0000) GS:ffff88021f200000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000000000000000 CR3: 00000000cc883000 CR4: 00000000001407f0
Stack:
 0000000000000000 ffff8800c6a93860 0040ffffffffff10 ffff8800c906a130
 ffff8800c906a100 ffff8802146c6758 0000000000000000 ffff880215447098
 ffff8800c6a93898 ffffffffa03883be 0000000000000000 0000000200000000
Call Trace:
 [<ffffffffa03883be>] ath10k_htt_tx+0x102/0x3f3 [ath10k_core]
 [<ffffffff8100a877>] ? __switch_to+0x255/0x41c
 [<ffffffff810d0ee7>] ? finish_task_switch+0x4d/0xd9
 [<ffffffffa037f09f>] ath10k_tx_htt+0xa4/0xcc [ath10k_core]
 [<ffffffffa037f3bb>] ath10k_tx+0x2f4/0x303 [ath10k_core]
 [<ffffffffa0303412>] __ieee80211_tx+0x2d8/0x359 [mac80211]
 [<ffffffffa0300f60>] ? ieee80211_tx_prepare+0xe0/0x339 [mac80211]
 [<ffffffff810d6170>] ? update_entity_load_avg+0x1e3/0x27f
 [<ffffffffa0303545>] ieee80211_tx+0xb2/0xc5 [mac80211]
 [<ffffffffa03039e5>] ieee80211_xmit+0x137/0x143 [mac80211]
 [<ffffffff81506895>] ? __alloc_skb+0x8d/0x19c
 [<ffffffffa03045ec>] ieee80211_subif_start_xmit+0xb8a/0xbb2 [mac80211]
 [<ffffffff81512991>] ? dev_queue_xmit_nit+0x195/0x1a4
 [<ffffffff81512e16>] dev_hard_start_xmit+0x320/0x41e
 [<ffffffff8152b232>] sch_direct_xmit+0x70/0x14f
 [<ffffffff81513152>] __dev_queue_xmit+0x23e/0x472
 [<ffffffff815133af>] dev_queue_xmit+0xd/0xf
 [<ffffffff815aa46e>] packet_sendmsg+0xc05/0xc6f
 [<ffffffff814fc242>] ? __sock_sendmsg+0x59/0x64
 [<ffffffff814fc242>] __sock_sendmsg+0x59/0x64
 [<ffffffff814fc9bf>] sock_aio_write+0xa7/0xab
 [<ffffffff81185532>] do_sync_write+0x59/0x79
 [<ffffffff811858f6>] ? rw_verify_area+0xa8/0xcb
 [<ffffffff81186814>] vfs_write+0xc3/0x120
 [<ffffffff81186949>] SyS_write+0x54/0x81
 [<ffffffff815c52f9>] system_call_fastpath+0x16/0x1b
Code: 48 89 13 4c 89 63 08 49 89 1c 24 eb 0c 48 89 df e8 5f e9 00 00 31 d2 eb 38 41 8b 4d 24 49 8b 55 10 48 89 c6 41 ff 45 20 4c 89 f7 <8b> 14 0a 41 89 55 24 48
89 ca 49 03 4d 18 49 03 55 10 48 8b 5d
RIP  [<ffffffff8116a1e1>] dma_pool_alloc+0x1a5/0x1dd
 RSP <ffff8800c6a93758>
CR2: 0000000000000000
---[ end trace fdbfb3d787b878e5 ]---
Kernel panic - not syncing: Fatal exception in interrupt
Kernel Offset: 0x0 from 0xffffffff81000000 (relocation range: 0xffffffff80000000-0xffffffff9fffffff)
drm_kms_helper: panic occurred, switching back to text console
Rebooting in 10 seconds..


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
