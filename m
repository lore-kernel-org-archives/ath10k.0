Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XBs1L-0004wi-OK
 for ath10k@lists.infradead.org; Mon, 28 Jul 2014 20:59:48 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: add support for 10.2 firmware
References: <1406287937-26507-1-git-send-email-michal.kazior@tieto.com>
Date: Mon, 28 Jul 2014 23:59:15 +0300
In-Reply-To: <1406287937-26507-1-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Fri, 25 Jul 2014 13:32:17 +0200")
Message-ID: <87oaw9jj30.fsf@kamboji.qca.qualcomm.com>
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

> The 10.2 firmware is a successor of 10.1 firmware
> (formerly identified as 10.x). Both share a lot
> but have some slight ABI differences that need to
> be taken care of.
>
> The 10.2 firmware introduces some new features but
> those can be added in subsequent patches. This
> patch makes ath10k boot and work with 10.2 with
> comparable functionality to 10.1.
>
> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>

Thanks, applied with minor changes:

> +static void ath10k_wmi_10_2_process_rx(struct ath10k *ar, struct sk_buff *skb)
> +{
> +	struct wmi_cmd_hdr *cmd_hdr;
> +	enum wmi_10_2_event_id id;
> +
> +	cmd_hdr = (struct wmi_cmd_hdr *)skb->data;
> +	id = MS(__le32_to_cpu(cmd_hdr->cmd_id), WMI_CMD_HDR_CMD_ID);
> +
> +	if (skb_pull(skb, sizeof(struct wmi_cmd_hdr)) == NULL)
> +		return;
> +
> +	trace_ath10k_wmi_event(id, skb->data, skb->len);
> +
> +	switch (id) {
> +
> +
> +	case WMI_10_2_MGMT_RX_EVENTID:

checkpatch warned about extra newlines here.

> +static void
> +ath10k_wmi_peer_assoc_fill_main_636(struct ath10k *ar, void *buf,
> +				    const struct wmi_peer_assoc_complete_arg *arg)
> +{

And this was too long. I "fixed" it by s/main_636/main/. I think the 636
part was a bit redundant anyway.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
