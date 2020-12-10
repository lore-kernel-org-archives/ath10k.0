Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1knQS7-0000ez-7n
 for ath10k@lists.infradead.org; Thu, 10 Dec 2020 18:14:08 +0000
Received: by mail-ot1-x343.google.com with SMTP id x13so5762237oto.8
 for <ath10k@lists.infradead.org>; Thu, 10 Dec 2020 10:14:02 -0800 (PST)
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com.
 [209.85.167.174])
 by smtp.gmail.com with ESMTPSA id j2sm1230525otq.78.2020.12.10.10.13.58
 for <ath10k@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Dec 2020 10:13:58 -0800 (PST)
Received: by mail-oi1-f174.google.com with SMTP id d27so6753551oic.0
 for <ath10k@lists.infradead.org>; Thu, 10 Dec 2020 10:13:58 -0800 (PST)
MIME-Version: 1.0
References: <1607612975-5756-1-git-send-email-pillair@codeaurora.org>
In-Reply-To: <1607612975-5756-1-git-send-email-pillair@codeaurora.org>
From: Brian Norris <briannorris@chromium.org>
Date: Thu, 10 Dec 2020 10:13:46 -0800
Message-ID: <CA+ASDXN4uLsbo7uuO7WPaUBY+mqHQRfdMHJ4R9KBqqmiVQJUcA@mail.gmail.com>
Subject: Re: [PATCH] ath10k: Remove voltage regulator votes during wifi disable
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
To: Rakesh Pillai <pillair@codeaurora.org>
Cc: kuabhs@chromium.org, Youghandhar Chintala <youghand@codeaurora.org>, linux-wireless <linux-wireless@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>, ath10k <ath10k@lists.infradead.org>, Doug Anderson <dianders@chromium.org>

On Thu, Dec 10, 2020 at 7:09 AM Rakesh Pillai <pillair@codeaurora.org> wrote:
> --- a/drivers/net/wireless/ath/ath10k/snoc.c
> +++ b/drivers/net/wireless/ath/ath10k/snoc.c
> @@ -1045,14 +1085,18 @@ static int ath10k_snoc_hif_power_up(struct ath10k *ar,
>         ret = ath10k_snoc_init_pipes(ar);
>         if (ret) {
>                 ath10k_err(ar, "failed to initialize CE: %d\n", ret);
> -               goto err_wlan_enable;
> +               goto err_free_rri;
>         }
>
>         return 0;
>
> -err_wlan_enable:
> +err_free_rri:
> +       ath10k_ce_free_rri(ar);

This change in the error path seems to be an unrelated (but correct)
fix. It deserves its own patch, I think.

Brian

>         ath10k_snoc_wlan_disable(ar);
>
> +err_hw_power_off:
> +       ath10k_hw_power_off(ar);
> +
>         return ret;
>  }
>

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
