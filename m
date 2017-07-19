Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtprelay0164.hostedemail.com ([216.40.44.164]
 helo=smtprelay.hostedemail.com)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dXrof-0001xi-Ig
 for ath10k@lists.infradead.org; Wed, 19 Jul 2017 16:27:15 +0000
Message-ID: <1500481605.25934.40.camel@perches.com>
Subject: Re: [PATCH] ath10k_htt_rx_amsdu_allowed(): use ath10k_dbg()
From: Joe Perches <joe@perches.com>
Date: Wed, 19 Jul 2017 09:26:45 -0700
In-Reply-To: <288fce5b-d738-f0ac-2433-67e1b35a0664@gmail.com>
References: <288fce5b-d738-f0ac-2433-67e1b35a0664@gmail.com>
Mime-Version: 1.0
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
To: Gabriel C <nix.or.die@gmail.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, Kalle Valo <kvalo@qca.qualcomm.com>, Ryan Hsu <ryanhsu@qti.qualcomm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>

On Wed, 2017-07-19 at 17:37 +0200, Gabriel C wrote:
>          Each time we get disconencted from AP we get flooded with messages like:
> 
>          ...
>          ath10k_pci 0000:03:00.0: no channel configured; ignoring frame(s)!
>          <until ratelimit kicks in>
>          ath10k_warn: 155 callbacks suppressed

[]

> diff --git a/drivers/net/wireless/ath/ath10k/htt_rx.c b/drivers/net/wireless/ath/ath10k/htt_rx.c
[]
> @@ -1514,7 +1514,7 @@ static bool ath10k_htt_rx_amsdu_allowed(struct ath10k *ar,
>           */
> 
>          if (!rx_status->freq) {
> -               ath10k_warn(ar, "no channel configured; ignoring frame(s)!\n");
> +               ath10k_dbg(ar, ATH10K_DBG_HTT, "no channel configured; ignoring frame(s)!\n");
>                  return false;
>          }

Hi.  This doesn't apply because of tab to space conversions.

Please use git send-email to send your patch.

Maybe read Documentation/process/email-clients.rst

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
