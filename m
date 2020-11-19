Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfq8R-0001Dc-La
 for ath10k@lists.infradead.org; Thu, 19 Nov 2020 20:02:28 +0000
Received: by mail-wm1-x342.google.com with SMTP id s13so7828333wmh.4
 for <ath10k@lists.infradead.org>; Thu, 19 Nov 2020 12:02:27 -0800 (PST)
MIME-Version: 1.0
References: <20201106100708.4609-1-cjhuang@codeaurora.org>
 <20201106100708.4609-4-cjhuang@codeaurora.org>
In-Reply-To: <20201106100708.4609-4-cjhuang@codeaurora.org>
From: Abhishek Kumar <kuabhs@chromium.org>
Date: Thu, 19 Nov 2020 12:02:16 -0800
Message-ID: <CACTWRwtRfgaHXYMAttNwptHxCA7k6r+G_sC0=oyHZxjYb-GeWA@mail.gmail.com>
Subject: Re: [PATCH 3/3] ath10k: allow dynamic SAR power limits via common API
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
To: Carl Huang <cjhuang@codeaurora.org>
Cc: Brian Norris <briannorris@chromium.org>, linux-wireless <linux-wireless@vger.kernel.org>, Douglas Anderson <dianders@chromium.org>, ath10k <ath10k@lists.infradead.org>, kuabhs@google.com

Hi,
This patch looks good to me, there is one small nit, If the maintainer
can take care of it then probably we don't need a new rev.

> @@ -329,6 +336,7 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
>                 .fw_diag_ce_download = true,
>                 .tx_stats_over_pktlog = false,
>                 .supports_peer_stats_info = true,
> +               .dynamic_sar_support = true,
>         },
Orthogonal to this patch, other people might probably differ, I guess
putting dynamic sar support as a firmware feature capability should be
more scalable and then we don't need a structure table for each
firmware. This might hold for other firmware features as well.

> +       ath10k_dbg(ar, ATH10K_DBG_MAC, "mac txpower 2g:%d 5g:%d\n",
> +                  tx_power_2g, tx_power_5g);
just a nit: space after colon. This might throw a warning in checkpatch.pl

-Abhishek

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
