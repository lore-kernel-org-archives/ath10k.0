Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-oa0-x22d.google.com ([2607:f8b0:4003:c02::22d])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WQtIt-0002Dj-9Y
 for ath10k@lists.infradead.org; Fri, 21 Mar 2014 06:51:43 +0000
Received: by mail-oa0-f45.google.com with SMTP id eb12so1777332oac.18
 for <ath10k@lists.infradead.org>; Thu, 20 Mar 2014 23:51:22 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1395380076-4306-1-git-send-email-yeohchunyeow@gmail.com>
References: <1395380076-4306-1-git-send-email-yeohchunyeow@gmail.com>
Date: Fri, 21 Mar 2014 07:51:22 +0100
Message-ID: <CA+BoTQmLfdkyN8yC8m-i_yXbhQ3UYVj1kPrdFmYSyLONCC=Kig@mail.gmail.com>
Subject: Re: [PATCH] ath10k: fix the peer mac address in getting stats
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

On 21 March 2014 06:34, Chun-Yeow Yeoh <yeohchunyeow@gmail.com> wrote:
> Using the macro to convert the MAC address from WMI word
> format to char array has lead to the wrong peer mac
> address printed out while retrieving the peer stats from
> FW. Fix this.
>
> Signed-off-by: Chun-Yeow Yeoh <yeohchunyeow@gmail.com>
> ---
>  drivers/net/wireless/ath/ath10k/debug.c |    4 ++--
>  drivers/net/wireless/ath/ath10k/wmi.h   |   10 ----------
>  2 files changed, 2 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/net/wireless/ath/ath10k/debug.c b/drivers/net/wirele=
ss/ath/ath10k/debug.c
> index 6debd28..f95defa 100644
> --- a/drivers/net/wireless/ath/ath10k/debug.c
> +++ b/drivers/net/wireless/ath/ath10k/debug.c
> @@ -252,8 +252,8 @@ void ath10k_debug_read_target_stats(struct ath10k *ar,
>                         peer_stats =3D (struct wmi_peer_stats *)tmp;
>                         s =3D &stats->peer_stat[i];
>
> -                       WMI_MAC_ADDR_TO_CHAR_ARRAY(&peer_stats->peer_maca=
ddr,
> -                                                  s->peer_macaddr);
> +                       memcpy(s->peer_macaddr, &peer_stats->peer_macaddr=
.addr,
> +                              ETH_ALEN);

I noticed checkpatch started suggesting to prefer ether_addr_copy()
over memcpy(). Not a big deal though.

Other than that the patch looks good.

Reviewed-By: Micha=B3 Kazior <michal.kazior@tieto.com>


Micha=B3

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
