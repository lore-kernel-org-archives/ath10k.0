Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from gateway20.websitewelcome.com ([192.185.63.14])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zqeel-00031a-JL
 for ath10k@lists.infradead.org; Mon, 26 Oct 2015 10:05:37 +0000
Received: from ham06.websitewelcome.com (unknown [108.179.254.230])
 by gateway20.websitewelcome.com (Postfix) with ESMTP id B1655A334F5F3
 for <ath10k@lists.infradead.org>; Mon, 26 Oct 2015 05:05:12 -0500 (CDT)
Received: from br538.hostgator.com.br (br538.hostgator.com.br
 [108.179.252.175])
 by ham06.websitewelcome.com (Postfix) with ESMTP id 06AD340004
 for <ath10k@lists.infradead.org>; Mon, 26 Oct 2015 05:05:12 -0500 (CDT)
Received: from [209.85.220.175] (port=36507 helo=mail-qk0-f175.google.com)
 by br538.hostgator.com.br with esmtpsa (TLSv1.2:AES128-GCM-SHA256:128)
 (Exim 4.85) (envelope-from <bino@bino.us>) id 1ZqeeN-0005to-SR
 for ath10k@lists.infradead.org; Mon, 26 Oct 2015 05:05:11 -0500
Received: by qkfq3 with SMTP id q3so10957364qkf.3
 for <ath10k@lists.infradead.org>; Mon, 26 Oct 2015 03:05:11 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1445851330-18736-1-git-send-email-manikanta.pubbisetty@gmail.com>
References: <1445851330-18736-1-git-send-email-manikanta.pubbisetty@gmail.com>
Date: Mon, 26 Oct 2015 08:05:11 -0200
Message-ID: <CAMu38xLre1jS7Vjsc3sL80oTkVhg5YQJV-U-CXeEQo8k2Zqp-A@mail.gmail.com>
Subject: Re: [PATCH] ath10k: update antenna configuration after setting in fw
From: Albino B Neto <bino@bino.us>
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
To: manikanta.pubbisetty@gmail.com
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

2015-10-26 7:22 GMT-02:00  <manikanta.pubbisetty@gmail.com>:
> Signed-off-by: Manikanta Pubbisetty <manikanta.pubbisetty@gmail.com>
> ---
>  drivers/net/wireless/ath/ath10k/mac.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
> index 484c1a1..8d0ce37 100644
> --- a/drivers/net/wireless/ath/ath10k/mac.c
> +++ b/drivers/net/wireless/ath/ath10k/mac.c
> @@ -3771,9 +3771,6 @@ static int __ath10k_set_antenna(struct ath10k *ar, u32 tx_ant, u32 rx_ant)
>         ath10k_check_chain_mask(ar, tx_ant, "tx");
>         ath10k_check_chain_mask(ar, rx_ant, "rx");
>
> -       ar->cfg_tx_chainmask = tx_ant;
> -       ar->cfg_rx_chainmask = rx_ant;
> -
>         if ((ar->state != ATH10K_STATE_ON) &&
>             (ar->state != ATH10K_STATE_RESTARTED))
>                 return 0;
> @@ -3794,6 +3791,9 @@ static int __ath10k_set_antenna(struct ath10k *ar, u32 tx_ant, u32 rx_ant)
>                 return ret;
>         }
>
> +       ar->cfg_tx_chainmask = tx_ant;
> +       ar->cfg_rx_chainmask = rx_ant;
> +
>         return 0;
>  }

Sorry, I see no change in the code. script checkpatch.pl ?

    Albino

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
