Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from [208.74.158.174] (helo=mail3.candelatech.com)
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hCPrs-0004mR-L7
 for ath10k@lists.infradead.org; Fri, 05 Apr 2019 14:30:58 +0000
Subject: Re: [PATCH] ath10k: Don't log a traceback on invalid event IDs.
References: <20190405100508.12679-1-pjones@redhat.com>
From: Ben Greear <greearb@candelatech.com>
Message-ID: <48c98ad9-665e-4665-a03c-242517a891ca@candelatech.com>
Date: Fri, 5 Apr 2019 07:30:54 -0700
MIME-Version: 1.0
In-Reply-To: <20190405100508.12679-1-pjones@redhat.com>
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
To: Peter Jones <pjones@redhat.com>, Kalle Valo <kvalo@codeaurora.org>
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, ath10k@lists.infradead.org, linux-kernel@vger.kernel.org



On 04/05/2019 03:05 AM, Peter Jones wrote:
> Very frequently upon resume from suspend, we see tracebacks like:
>
> ath10k_pci 0000:02:00.0: unsupported HTC service id: 1536
> ath10k_pci 0000:02:00.0: Unknown eventid: 118809
> WARNING: CPU: 1 PID: 23135 at drivers/net/wireless/ath/ath10k/mac.c:5650 ath10k_bss_info_changed+0xe8e/0xfd0 [ath10k_core]

 From what I can tell below, you did not actually remove the WARN_ON?

I think it is worth keeping a one-line logging message about these unknown events.
They can indicate firmware API mismatch.  They could be made to only print once
per boot if that helped.

And, if you are changing the logging messages, maybe put in extra info about what
code path it is taking, for instance:

+		ath10k_info(ar, ATH10K_DBG_WMI, "Unknown TLV op eventid: %d\n", id);

Thanks,
Ben

> Modules linked in: ...
> CPU: 1 PID: 23135 Comm: kworker/u16:54 Not tainted 4.20.15-200.fc29.x86_64 #1
> Hardware name: ...
> Workqueue: events_unbound async_run_entry_fn
> RIP: 0010:ath10k_bss_info_changed+0xe8e/0xfd0 [ath10k_core]
> Code: 89 c1 89 f2 4c 89 d7 48 c7 c6 60 7e ed c0 4c 89 4c 24 10 89 44 24 08 e8 e0 35 00 00 8b 44 24 08 4c 8b 4c 24 10 e9 22 f8 ff ff <0f> 0b e9 7a f4 ff ff 8b b3 70 01 00 00 89 f2 89 c1 48 c7 c6 20 7e
> RSP: 0018:ffffaba5456b7cc0 EFLAGS: 00010246
> RAX: 0000000000000000 RBX: ffff8d9b612a33a0 RCX: 0000000000000000
> RDX: 0000000000000001 RSI: 00000000fffffe01 RDI: ffffffffc0cca4ae
> RBP: 00000000020674ff R08: 0000000000200000 R09: 0000000000000000
> R10: ffff8d9a6d490700 R11: 0000000039a6c800 R12: ffff8d9b612a33a8
> R13: ffff8d9b4bd31580 R14: ffff8d9b4bd31580 R15: ffff8d9b612a3500
> FS:  0000000000000000(0000) GS:ffff8d9b66440000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 0000556cca653b66 CR3: 000000027920a001 CR4: 00000000003606e0
> Call Trace:
>  ? ath10k_conf_tx+0x7a/0x4b0 [ath10k_core]
>  ieee80211_bss_info_change_notify+0xab/0x1a0 [mac80211]
>  ieee80211_reconfig+0x66c/0x1300 [mac80211]
>  ? __switch_to_asm+0x34/0x70
>  ? __switch_to_asm+0x34/0x70
>  ? __switch_to_asm+0x40/0x70
>  wiphy_resume+0x7f/0x120 [cfg80211]
>  ? index_show+0x20/0x20 [cfg80211]
>  dpm_run_callback+0x59/0x150
>  device_resume+0xac/0x1f0
>  async_resume+0x19/0x30
>  async_run_entry_fn+0x39/0x160
>  process_one_work+0x1a1/0x3a0
>  worker_thread+0x30/0x380
>  ? process_one_work+0x3a0/0x3a0
>  kthread+0x112/0x130
>  ? kthread_create_on_node+0x60/0x60
>  ret_from_fork+0x35/0x40
> ---[ end trace 0afe382792dba858 ]---
>
> These errors are completely transient, and the card goes back to working
> perfectly fine afterwards.  I suspect the driver is just reading an
> uninitialized buffer as the card comes back up.
>
> In any case, there's no point in treating this as a major problem and
> logging a full register dump and a traceback; just logginng an INFO
> message saying that it happened is enough.  This patch does that.
>
> Signed-off-by: Peter Jones <pjones@redhat.com>
> ---
>  drivers/net/wireless/ath/ath10k/htc.c     | 4 ++--
>  drivers/net/wireless/ath/ath10k/sdio.c    | 2 +-
>  drivers/net/wireless/ath/ath10k/wmi-tlv.c | 2 +-
>  drivers/net/wireless/ath/ath10k/wmi.c     | 8 ++++----
>  4 files changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/net/wireless/ath/ath10k/htc.c b/drivers/net/wireless/ath/ath10k/htc.c
> index 805a7f8a04f..c244889b72e 100644
> --- a/drivers/net/wireless/ath/ath10k/htc.c
> +++ b/drivers/net/wireless/ath/ath10k/htc.c
> @@ -799,7 +799,7 @@ int ath10k_htc_connect_service(struct ath10k_htc *htc,
>  						&ep->ul_pipe_id,
>  						&ep->dl_pipe_id);
>  	if (status) {
> -		ath10k_warn(ar, "unsupported HTC service id: %d\n",
> +		ath10k_info(ar, "unsupported HTC service id: %d\n",
>  			    ep->service_id);
>  		return status;
>  	}
> @@ -877,7 +877,7 @@ static bool ath10k_htc_pktlog_svc_supported(struct ath10k *ar)
>  						&ul_pipe_id,
>  						&dl_pipe_id);
>  	if (status) {
> -		ath10k_warn(ar, "unsupported HTC service id: %d\n",
> +		ath10k_info(ar, "unsupported HTC service id: %d\n",
>  			    ATH10K_HTC_SVC_ID_HTT_LOG_MSG);
>
>  		return false;
> diff --git a/drivers/net/wireless/ath/ath10k/sdio.c b/drivers/net/wireless/ath/ath10k/sdio.c
> index fae56c67766..a265225216e 100644
> --- a/drivers/net/wireless/ath/ath10k/sdio.c
> +++ b/drivers/net/wireless/ath/ath10k/sdio.c
> @@ -1871,7 +1871,7 @@ static int ath10k_sdio_hif_map_service_to_pipe(struct ath10k *ar,
>  			   ar_sdio->mbox_addr[eid], ar_sdio->mbox_size[eid]);
>  		break;
>  	default:
> -		ath10k_warn(ar, "unsupported HTC service id: %d\n",
> +		ath10k_info(ar, "unsupported HTC service id: %d\n",
>  			    service_id);
>  		return -EINVAL;
>  	}
> diff --git a/drivers/net/wireless/ath/ath10k/wmi-tlv.c b/drivers/net/wireless/ath/ath10k/wmi-tlv.c
> index 582fb11f648..ca990c8d306 100644
> --- a/drivers/net/wireless/ath/ath10k/wmi-tlv.c
> +++ b/drivers/net/wireless/ath/ath10k/wmi-tlv.c
> @@ -614,7 +614,7 @@ static void ath10k_wmi_tlv_op_rx(struct ath10k *ar, struct sk_buff *skb)
>  		ath10k_wmi_event_mgmt_tx_bundle_compl(ar, skb);
>  		break;
>  	default:
> -		ath10k_dbg(ar, ATH10K_DBG_WMI, "Unknown eventid: %d\n", id);
> +		ath10k_info(ar, ATH10K_DBG_WMI, "Unknown eventid: %d\n", id);
>  		break;
>  	}
>
> diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless/ath/ath10k/wmi.c
> index 98a90e49d66..f4fa406d9fe 100644
> --- a/drivers/net/wireless/ath/ath10k/wmi.c
> +++ b/drivers/net/wireless/ath/ath10k/wmi.c
> @@ -5850,7 +5850,7 @@ static void ath10k_wmi_op_rx(struct ath10k *ar, struct sk_buff *skb)
>  		ath10k_wmi_event_service_available(ar, skb);
>  		break;
>  	default:
> -		ath10k_warn(ar, "Unknown eventid: %d\n", id);
> +		ath10k_info(ar, "Unknown eventid: %d\n", id);
>  		break;
>  	}
>
> @@ -5981,7 +5981,7 @@ static void ath10k_wmi_10_1_op_rx(struct ath10k *ar, struct sk_buff *skb)
>  		/* ignore utf events */
>  		break;
>  	default:
> -		ath10k_warn(ar, "Unknown eventid: %d\n", id);
> +		ath10k_info(ar, "Unknown eventid: %d\n", id);
>  		break;
>  	}
>
> @@ -6130,7 +6130,7 @@ static void ath10k_wmi_10_2_op_rx(struct ath10k *ar, struct sk_buff *skb)
>  		ath10k_wmi_event_peer_sta_ps_state_chg(ar, skb);
>  		break;
>  	default:
> -		ath10k_warn(ar, "Unknown eventid: %d\n", id);
> +		ath10k_info(ar, "Unknown eventid: %d\n", id);
>  		break;
>  	}
>
> @@ -6250,7 +6250,7 @@ static void ath10k_wmi_10_4_op_rx(struct ath10k *ar, struct sk_buff *skb)
>  		ath10k_wmi_event_peer_sta_ps_state_chg(ar, skb);
>  		break;
>  	default:
> -		ath10k_warn(ar, "Unknown eventid: %d\n", id);
> +		ath10k_info(ar, "Unknown eventid: %d\n", id);
>  		break;
>  	}
>
>

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
