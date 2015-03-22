Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lb0-x236.google.com ([2a00:1450:4010:c04::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YZaeF-0004dp-7K
 for ath10k@lists.infradead.org; Sun, 22 Mar 2015 07:50:16 +0000
Received: by lbbug6 with SMTP id ug6so5554789lbb.3
 for <ath10k@lists.infradead.org>; Sun, 22 Mar 2015 00:49:51 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1426849379-7562-6-git-send-email-marek.puzyniak@tieto.com>
References: <1426849379-7562-1-git-send-email-marek.puzyniak@tieto.com>
 <1426849379-7562-6-git-send-email-marek.puzyniak@tieto.com>
From: Arik Nemtsov <arik@wizery.com>
Date: Sun, 22 Mar 2015 09:49:36 +0200
Message-ID: <CA+XVXfdsHo4cm580oqCwd9SZQGrdkPgw_b+ipUVCDhkDupL0tw@mail.gmail.com>
Subject: Re: [PATCH v4 5/6] ath10k: add wmi support for tdls
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
To: Marek Puzyniak <marek.puzyniak@tieto.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On Fri, Mar 20, 2015 at 1:02 PM, Marek Puzyniak
<marek.puzyniak@tieto.com> wrote:
> As a part of tdls implementation introduce
> tdls related wmi data structures, constant
> values and functions.
>
> Signed-off-by: Marek Puzyniak <marek.puzyniak@tieto.com>
> ---
>  drivers/net/wireless/ath/ath10k/wmi-ops.h |  42 ++++++++
>  drivers/net/wireless/ath/ath10k/wmi-tlv.c | 153 ++++++++++++++++++++++++++++++
>  drivers/net/wireless/ath/ath10k/wmi-tlv.h |  53 +++++++++++
>  drivers/net/wireless/ath/ath10k/wmi.h     |  37 ++++++++
>  4 files changed, 285 insertions(+)
[...]
> +
> +       cmd = (void *)tlv->value;
> +       cmd->vdev_id = __cpu_to_le32(vdev_id);
> +       cmd->state = __cpu_to_le32(state);
> +       cmd->notification_interval_ms = __cpu_to_le32(5000);
> +       cmd->tx_discovery_threshold = __cpu_to_le32(100);
> +       cmd->tx_teardown_threshold = __cpu_to_le32(5);
> +       cmd->rssi_teardown_threshold = __cpu_to_le32(-75);
> +       cmd->rssi_delta = __cpu_to_le32(-20);
> +       cmd->tdls_options = __cpu_to_le32(options);
> +       cmd->tdls_peer_traffic_ind_window = __cpu_to_le32(2);
> +       cmd->tdls_peer_traffic_response_timeout_ms = __cpu_to_le32(5000);
> +       cmd->tdls_puapsd_mask = __cpu_to_le32(0xf);
> +       cmd->tdls_puapsd_inactivity_time_ms = __cpu_to_le32(0);
> +       cmd->tdls_puapsd_rx_frame_threshold = __cpu_to_le32(10);

Do the above lines assume all TDLS peers support TDLS buffer-sta
(which is required for peer UAPSD)? Especially the value of
tdls_puapsd_mask.
I can assure you not all peers support this :) For instance iwlwifi
does not (for now).

But I might be misinterpreting this - perhaps there some other code in
the driver/FW that checks the peer's extended-capabilities IE for
buffer-sta support (bit 28)?
That would be the best option.

Arik

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
