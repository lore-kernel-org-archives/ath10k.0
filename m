Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bl1lj-00074g-PK
 for ath10k@lists.infradead.org; Fri, 16 Sep 2016 22:38:05 +0000
From: "Hsu, Ryan" <ryanhsu@qca.qualcomm.com>
Subject: Re: [PATCH 4/4] ath10k: fix spurious tx/rx during boot
Date: Fri, 16 Sep 2016 22:37:38 +0000
Message-ID: <57DC735D.8020307@qca.qualcomm.com>
References: <1468924452-23877-1-git-send-email-michal.kazior@tieto.com>
 <1468924452-23877-5-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1468924452-23877-5-git-send-email-michal.kazior@tieto.com>
Content-Language: en-US
Content-ID: <53C206137EC0014DB6A12B9F456162AE@qualcomm.com>
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
To: "michal.kazior@tieto.com" <michal.kazior@tieto.com>, "Valo, Kalle" <kvalo@qca.qualcomm.com>
Cc: "marek.puzyniak@tieto.com" <marek.puzyniak@tieto.com>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>



On 07/19/2016 03:34 AM, Michal Kazior wrote:
>   
> +static int ath10k_core_reset_rx_filter(struct ath10k *ar)
> +{
> +	int ret;
> +	int vdev_id;
> +	int vdev_type;
> +	int vdev_subtype;
> +	const u8 *vdev_addr;
> +
> +	vdev_id = 0;
> +	vdev_type = WMI_VDEV_TYPE_STA;
> +	vdev_subtype = ath10k_wmi_get_vdev_subtype(ar, WMI_VDEV_SUBTYPE_NONE);
> +	vdev_addr = ar->mac_addr;
> +
> +	ret = ath10k_wmi_vdev_create(ar, vdev_id, vdev_type, vdev_subtype,
> +				     vdev_addr);
> +	if (ret) {
> +		ath10k_err(ar, "failed to create dummy vdev: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = ath10k_wmi_vdev_delete(ar, vdev_id);
> +	if (ret) {
> +		ath10k_err(ar, "failed to delete dummy vdev: %d\n", ret);
> +		return ret;
> +	}
> +
> +	/* WMI and HTT may use separate HIF pipes and are not guaranteed to be
> +	 * serialized properly implicitly.
> +	 *
> +	 * Moreover (most) WMI commands have no explicit acknowledges. It is
> +	 * possible to infer it implicitly by poking firmware with echo
> +	 * command - getting a reply means all preceding comments have been
> +	 * (mostly) processed.
> +	 *
> +	 * In case of vdev create/delete this is sufficient.
> +	 *
> +	 * Without this it's possible to end up with a race when HTT Rx ring is
> +	 * started before vdev create/delete hack is complete allowing a short
> +	 * window of opportunity to receive (and Tx ACK) a bunch of frames.
> +	 */
> +	ret = ath10k_wmi_barrier(ar);
QCA6174 UTF firmware seems doesn't support the WMI_ECHO command.

[16460.274822] ath10k_pci 0000:04:00.0: wmi tlv echo value 0x0ba991e9
...
[16463.461970] ath10k_pci 0000:04:00.0: failed to ping firmware: -110
[16463.461975] ath10k_pci 0000:04:00.0: failed to reset rx filter: -110

Has anyone verified any AP solution to see if UTF mode is still working 
with after this patch?

Anyway, I would like to exclude the workaround from all solution's UTF mode.

Michal any concerns? (or maybe just for QCA61x4 if any...)

> +	if (ret) {
> +		ath10k_err(ar, "failed to ping firmware: %d\n", ret);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
>

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
