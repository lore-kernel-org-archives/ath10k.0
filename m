Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from phoenix3.szarvasnet.hu ([87.101.127.16] helo=mail.szarvasnet.hu)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VFViq-00021W-NF
 for ath10k@lists.infradead.org; Fri, 30 Aug 2013 20:55:14 +0000
Message-ID: <522104B1.2070004@openwrt.org>
Date: Fri, 30 Aug 2013 22:46:41 +0200
From: Gabor Juhos <juhosg@openwrt.org>
MIME-Version: 1.0
Subject: Re: [PATCH 3/7] ath10k: remove void pointer from struct
 ath10k_pci_compl
References: <20130830122905.31164.50662.stgit@localhost6.localdomain6>
 <20130830123021.31164.8374.stgit@localhost6.localdomain6>
In-Reply-To: <20130830123021.31164.8374.stgit@localhost6.localdomain6>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Kalle Valo <kvalo@qca.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

2013.08.30. 14:30 keltez=E9ssel, Kalle Valo =EDrta:
> Void pointers are bad, mmkay.
> =

> No functional changes.
> =

> Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>
> ---
>  drivers/net/wireless/ath/ath10k/pci.c |   12 ++++++------
>  drivers/net/wireless/ath/ath10k/pci.h |    2 +-
>  2 files changed, 7 insertions(+), 7 deletions(-)
> =


<snip>

> @@ -1026,7 +1026,7 @@ static void ath10k_pci_process_ce(struct ath10k *ar)
>  				break;
>  			}
>  =

> -			skb =3D (struct sk_buff *)compl->transfer_context;
> +			skb =3D (struct sk_buff *)compl->skb;

The cast can be removed from here as well.

>  			nbytes =3D compl->nbytes;
>  =

>  			ath10k_dbg(ATH10K_DBG_PCI,
> diff --git a/drivers/net/wireless/ath/ath10k/pci.h b/drivers/net/wireless=
/ath/ath10k/pci.h
> index c65fe1b..2e1f422 100644
> --- a/drivers/net/wireless/ath/ath10k/pci.h
> +++ b/drivers/net/wireless/ath/ath10k/pci.h
> @@ -54,7 +54,7 @@ struct ath10k_pci_compl {
>  	enum ath10k_pci_compl_state state;
>  	struct ath10k_ce_pipe *ce_state;
>  	struct ath10k_pci_pipe *pipe_info;
> -	void *transfer_context;
> +	struct sk_buff *skb;
>  	unsigned int nbytes;
>  	unsigned int transfer_id;
>  	unsigned int flags;
> =

> =

> _______________________________________________
> ath10k mailing list
> ath10k@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/ath10k
> =



_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
