Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m43-7.mailgun.net ([69.72.43.7])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k1jpl-0002hP-Cl
 for ath10k@lists.infradead.org; Sat, 01 Aug 2020 05:13:26 +0000
From: "Rakesh Pillai" <pillair@codeaurora.org>
References: <1596220042-2778-1-git-send-email-pillair@codeaurora.org>
 <1596220042-2778-2-git-send-email-pillair@codeaurora.org>
 <bedc5fe0-1904-d045-4a84-0869ee1b0b2e@candelatech.com>
In-Reply-To: <bedc5fe0-1904-d045-4a84-0869ee1b0b2e@candelatech.com>
Subject: RE: [PATCH v2 1/3] ath10k: Add history for tracking certain events
Date: Sat, 1 Aug 2020 10:43:16 +0530
Message-ID: <000901d667c2$7a645380$6f2cfa80$@codeaurora.org>
MIME-Version: 1.0
Content-Language: en-us
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
To: 'Ben Greear' <greearb@candelatech.com>, ath10k@lists.infradead.org
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, kuba@kernel.org, davem@davemloft.net, kvalo@codeaurora.org



> -----Original Message-----
> From: Ben Greear <greearb@candelatech.com>
> Sent: Saturday, August 1, 2020 12:08 AM
> To: Rakesh Pillai <pillair@codeaurora.org>; ath10k@lists.infradead.org
> Cc: linux-wireless@vger.kernel.org; linux-kernel@vger.kernel.org;
> kvalo@codeaurora.org; davem@davemloft.net; kuba@kernel.org;
> netdev@vger.kernel.org
> Subject: Re: [PATCH v2 1/3] ath10k: Add history for tracking certain events
> 
> On 7/31/20 11:27 AM, Rakesh Pillai wrote:
> > Add history for tracking the below events
> > - register read
> > - register write
> > - IRQ trigger
> > - NAPI poll
> > - CE service
> > - WMI cmd
> > - WMI event
> > - WMI tx completion
> >
> > This will help in debugging any crash or any
> > improper behaviour.
> >
> > Tested-on: WCN3990 hw1.0 SNOC WLAN.HL.3.1-01040-QCAHLSWMTPLZ-1
> >
> > Signed-off-by: Rakesh Pillai <pillair@codeaurora.org>
> > ---
> >   drivers/net/wireless/ath/ath10k/ce.c      |   1 +
> >   drivers/net/wireless/ath/ath10k/core.h    |  74 +++++++++++++++++
> >   drivers/net/wireless/ath/ath10k/debug.c   | 133
> ++++++++++++++++++++++++++++++
> >   drivers/net/wireless/ath/ath10k/debug.h   |  74 +++++++++++++++++
> >   drivers/net/wireless/ath/ath10k/snoc.c    |  15 +++-
> >   drivers/net/wireless/ath/ath10k/wmi-tlv.c |   1 +
> >   drivers/net/wireless/ath/ath10k/wmi.c     |  10 +++
> >   7 files changed, 307 insertions(+), 1 deletion(-)
> >
> 
> > +void ath10k_record_wmi_event(struct ath10k *ar, enum
> ath10k_wmi_type type,
> > +			     u32 id, unsigned char *data)
> > +{
> > +	struct ath10k_wmi_event_entry *entry;
> > +	u32 idx;
> > +
> > +	if (type == ATH10K_WMI_EVENT) {
> > +		if (!ar->wmi_event_history.record)
> > +			return;
> 
> This check above is duplicated below, add it once at top of the method
> instead.

The same function is used to record WMI events and CMD, which are stored in different memory locations.
Hence the check  " if (type == ATH10K_WMI_EVENT) {" is necessary.


> 
> > +
> > +		spin_lock_bh(&ar->wmi_event_history.hist_lock);
> > +		idx = ath10k_core_get_next_idx(&ar-
> >reg_access_history.index,
> > +					       ar-
> >wmi_event_history.max_entries);
> > +		spin_unlock_bh(&ar->wmi_event_history.hist_lock);
> > +		entry = &ar->wmi_event_history.record[idx];
> > +	} else {
> > +		if (!ar->wmi_cmd_history.record)
> > +			return;
> > +
> > +		spin_lock_bh(&ar->wmi_cmd_history.hist_lock);
> > +		idx = ath10k_core_get_next_idx(&ar-
> >reg_access_history.index,
> > +					       ar-
> >wmi_cmd_history.max_entries);
> > +		spin_unlock_bh(&ar->wmi_cmd_history.hist_lock);
> > +		entry = &ar->wmi_cmd_history.record[idx];
> > +	}
> > +
> > +	entry->timestamp = ath10k_core_get_timestamp();
> > +	entry->cpu_id = smp_processor_id();
> > +	entry->type = type;
> > +	entry->id = id;
> > +	memcpy(&entry->data, data + 4, ATH10K_WMI_DATA_LEN);
> > +}
> > +EXPORT_SYMBOL(ath10k_record_wmi_event);
> 
> > @@ -1660,6 +1668,11 @@ static int ath10k_snoc_probe(struct
> platform_device *pdev)
> >   	ar->ce_priv = &ar_snoc->ce;
> >   	msa_size = drv_data->msa_size;
> >
> > +	ath10k_core_reg_access_history_init(ar,
> ATH10K_REG_ACCESS_HISTORY_MAX);
> > +	ath10k_core_wmi_event_history_init(ar,
> ATH10K_WMI_EVENT_HISTORY_MAX);
> > +	ath10k_core_wmi_cmd_history_init(ar,
> ATH10K_WMI_CMD_HISTORY_MAX);
> > +	ath10k_core_ce_event_history_init(ar,
> ATH10K_CE_EVENT_HISTORY_MAX);
> 
> Maybe only enable this once user turns it on?  It sucks up a bit of memory?


This memory will be allocated only if the history is enabled via module param, else the function just returns 0.


> 
> > +
> >   	ath10k_snoc_quirks_init(ar);
> >
> >   	ret = ath10k_snoc_resource_init(ar);
> > diff --git a/drivers/net/wireless/ath/ath10k/wmi-tlv.c
> b/drivers/net/wireless/ath/ath10k/wmi-tlv.c
> > index 932266d..9df5748 100644
> > --- a/drivers/net/wireless/ath/ath10k/wmi-tlv.c
> > +++ b/drivers/net/wireless/ath/ath10k/wmi-tlv.c
> > @@ -627,6 +627,7 @@ static void ath10k_wmi_tlv_op_rx(struct ath10k *ar,
> struct sk_buff *skb)
> >   	if (skb_pull(skb, sizeof(struct wmi_cmd_hdr)) == NULL)
> >   		goto out;
> >
> > +	ath10k_record_wmi_event(ar, ATH10K_WMI_EVENT, id, skb->data);
> >   	trace_ath10k_wmi_event(ar, id, skb->data, skb->len);
> >
> >   	consumed = ath10k_tm_event_wmi(ar, id, skb);
> > diff --git a/drivers/net/wireless/ath/ath10k/wmi.c
> b/drivers/net/wireless/ath/ath10k/wmi.c
> > index a81a1ab..8ebd05c 100644
> > --- a/drivers/net/wireless/ath/ath10k/wmi.c
> > +++ b/drivers/net/wireless/ath/ath10k/wmi.c
> > @@ -1802,6 +1802,15 @@ struct sk_buff *ath10k_wmi_alloc_skb(struct
> ath10k *ar, u32 len)
> >
> >   static void ath10k_wmi_htc_tx_complete(struct ath10k *ar, struct sk_buff
> *skb)
> >   {
> > +	struct wmi_cmd_hdr *cmd_hdr;
> > +	enum wmi_tlv_event_id id;
> > +
> > +	cmd_hdr = (struct wmi_cmd_hdr *)skb->data;
> > +	id = MS(__le32_to_cpu(cmd_hdr->cmd_id),
> WMI_CMD_HDR_CMD_ID);
> > +
> > +	ath10k_record_wmi_event(ar, ATH10K_WMI_TX_COMPL, id,
> > +				skb->data + sizeof(struct wmi_cmd_hdr));
> > +
> >   	dev_kfree_skb(skb);
> >   }
> 
> I think guard the above new code with if (unlikely(ar-
> >ce_event_history.record)) { ... }
> 
> All in all, I think I'd want to compile this out (while leaving other debug
> compiled
> in) since it seems this stuff would be rarely used and it adds method calls to
> hot
> paths.
> 
> That is a decision for Kalle though, so see what he says...


Sure let me add this check.


> 
> Thanks,
> Ben
> 
> 
> --
> Ben Greear <greearb@candelatech.com>
> Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
