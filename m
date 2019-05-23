Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lj1-x241.google.com ([2a00:1450:4864:20::241])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hTqnd-0006XK-67
 for ath10k@lists.infradead.org; Thu, 23 May 2019 16:42:38 +0000
Received: by mail-lj1-x241.google.com with SMTP id e13so6077942ljl.11
 for <ath10k@lists.infradead.org>; Thu, 23 May 2019 09:42:33 -0700 (PDT)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com.
 [209.85.208.174])
 by smtp.gmail.com with ESMTPSA id d68sm7928lfg.23.2019.05.23.09.42.30
 for <ath10k@lists.infradead.org>
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Thu, 23 May 2019 09:42:30 -0700 (PDT)
Received: by mail-lj1-f174.google.com with SMTP id e13so6077906ljl.11
 for <ath10k@lists.infradead.org>; Thu, 23 May 2019 09:42:30 -0700 (PDT)
MIME-Version: 1.0
References: <20190523071534.254611-1-tientzu@chromium.org>
In-Reply-To: <20190523071534.254611-1-tientzu@chromium.org>
From: Brian Norris <briannorris@chromium.org>
Date: Thu, 23 May 2019 09:42:18 -0700
Message-ID: <CA+ASDXMaKpMWnLnKxeft-8eKfpM6qGDsmEzvh290JCCjeRRtxQ@mail.gmail.com>
Subject: Re: [PATCH] ath10k: add missing error handling
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
To: Claire Chang <tientzu@chromium.org>
Cc: linux-wireless <linux-wireless@vger.kernel.org>, ath10k@lists.infradead.org, Kalle Valo <kvalo@codeaurora.org>, Wen Gong <wgong@codeaurora.org>

On Thu, May 23, 2019 at 12:15 AM Claire Chang <tientzu@chromium.org> wrote:
> --- a/drivers/net/wireless/ath/ath10k/sdio.c
> +++ b/drivers/net/wireless/ath/ath10k/sdio.c
> @@ -607,6 +607,10 @@ static int ath10k_sdio_mbox_rx_alloc(struct ath10k *ar,
>                                                     full_len,
>                                                     last_in_bundle,
>                                                     last_in_bundle);
> +               if (ret) {

IIUC, you have basically the same failure case a few lines up, where
ath10k_sdio_mbox_alloc_pkt_bundle() may fail. Do the same there?

This (including the error label to which it's jumping) looks fine to me though:

Reviewed-by: Brian Norris <briannorris@chromium.org>

> +                       ath10k_warn(ar, "alloc_rx_pkt error %d\n", ret);
> +                       goto err;
> +               }
>         }
>
>         ar_sdio->n_rx_pkts = i;

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
