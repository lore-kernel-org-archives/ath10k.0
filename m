Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ob0-x231.google.com ([2607:f8b0:4003:c01::231])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WQxDa-0000Ik-1T
 for ath10k@lists.infradead.org; Fri, 21 Mar 2014 11:02:33 +0000
Received: by mail-ob0-f177.google.com with SMTP id wo20so2201283obc.8
 for <ath10k@lists.infradead.org>; Fri, 21 Mar 2014 04:02:06 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1395396014-24631-1-git-send-email-yeohchunyeow@gmail.com>
References: <1395396014-24631-1-git-send-email-yeohchunyeow@gmail.com>
Date: Fri, 21 Mar 2014 12:02:06 +0100
Message-ID: <CA+BoTQ=X=UxikrVrmr3hyQgjN2Tg5aeW5Ok7b+23n9X6bxRshA@mail.gmail.com>
Subject: Re: [PATCH] ath10k: add the Rx rate in FW stats
From: Michal Kazior <michal.kazior@tieto.com>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Chun-Yeow Yeoh <yeohchunyeow@gmail.com>
Cc: Kalle Valo <kvalo@qca.qualcomm.com>, linux-wireless <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On 21 March 2014 11:00, Chun-Yeow Yeoh <yeohchunyeow@gmail.com> wrote:
> FW stats does provide the Rx rate information. Add this.
> Tested with firmware 10.1.467.2-1.
>
> Further investigation on firmware 999.999.0.636 indicates
> that there is no Tx Rate and Rx Rate in the peer stats.

Incorrect.

999.999.0.636 does have Tx Rate. It doesn't have Rx Rate.

10.1.467.2-1 has both.


>
> Signed-off-by: Chun-Yeow Yeoh <yeohchunyeow@gmail.com>
> ---
>  drivers/net/wireless/ath/ath10k/core.h  |    1 +
>  drivers/net/wireless/ath/ath10k/debug.c |    5 +++++
>  drivers/net/wireless/ath/ath10k/wmi.h   |    1 +
>  3 files changed, 7 insertions(+)
>
> diff --git a/drivers/net/wireless/ath/ath10k/core.h b/drivers/net/wireles=
s/ath/ath10k/core.h
> index ad209a6..ca4cdab 100644
> --- a/drivers/net/wireless/ath/ath10k/core.h
> +++ b/drivers/net/wireless/ath/ath10k/core.h
> @@ -119,6 +119,7 @@ struct ath10k_peer_stat {
>         u8 peer_macaddr[ETH_ALEN];
>         u32 peer_rssi;
>         u32 peer_tx_rate;
> +       u32 peer_rx_rate;
>  };
>
>  struct ath10k_target_stats {
> diff --git a/drivers/net/wireless/ath/ath10k/debug.c b/drivers/net/wirele=
ss/ath/ath10k/debug.c
> index f95defa..4662cb7 100644
> --- a/drivers/net/wireless/ath/ath10k/debug.c
> +++ b/drivers/net/wireless/ath/ath10k/debug.c
> @@ -257,6 +257,8 @@ void ath10k_debug_read_target_stats(struct ath10k *ar,
>                         s->peer_rssi =3D __le32_to_cpu(peer_stats->peer_r=
ssi);
>                         s->peer_tx_rate =3D
>                                 __le32_to_cpu(peer_stats->peer_tx_rate);
> +                       s->peer_rx_rate =3D
> +                               __le32_to_cpu(peer_stats->peer_rx_rate);
>
>                         tmp +=3D sizeof(struct wmi_peer_stats);
>                 }
> @@ -425,6 +427,9 @@ static ssize_t ath10k_read_fw_stats(struct file *file=
, char __user *user_buf,
>                 len +=3D scnprintf(buf + len, buf_len - len, "%30s %u\n",
>                                  "Peer TX rate",
>                                  fw_stats->peer_stat[i].peer_tx_rate);
> +               len +=3D scnprintf(buf + len, buf_len - len, "%30s %u\n",
> +                                "Peer RX rate",
> +                                fw_stats->peer_stat[i].peer_rx_rate);
>                 len +=3D scnprintf(buf + len, buf_len - len, "\n");
>         }
>         spin_unlock_bh(&ar->data_lock);
> diff --git a/drivers/net/wireless/ath/ath10k/wmi.h b/drivers/net/wireless=
/ath/ath10k/wmi.h
> index 084bcc5..2b2f0b7 100644
> --- a/drivers/net/wireless/ath/ath10k/wmi.h
> +++ b/drivers/net/wireless/ath/ath10k/wmi.h
> @@ -2825,6 +2825,7 @@ struct wmi_peer_stats {
>         struct wmi_mac_addr peer_macaddr;
>         __le32 peer_rssi;
>         __le32 peer_tx_rate;
> +       __le32 peer_rx_rate;
>  } __packed;

Unfortunately this isn't as simple as it seems.

Stats are received via wmi_stats_event. This structure contains fields
describing number of pdev/vdev/beer/bcn stat entries. All entries
(structures) are appended in certain order after this header. This
means if you change length of structure type you skew the calculation
of all succeeding entries.

IOW this means this patch breaks peer stats for 999.999.0.636.

I'm quite positive wmi_pdev_stats is also broken. This implies vdev
stats and peer stats position calculation is skewed in the first place
and you get garbage.

The main problem here is there are subtle yet crazy binary
incompatibilities between these firmwares.

The best way would probably be to implement wmi as an abstraction
layer with completely different backends for different firmware
branches/revisions. Otherwise you sign up for some pain..


Micha=B3

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
