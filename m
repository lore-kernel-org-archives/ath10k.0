Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kkBRT-0006L2-AG
 for ath10k@lists.infradead.org; Tue, 01 Dec 2020 19:36:04 +0000
Received: by mail-ot1-x344.google.com with SMTP id z23so2794816oti.13
 for <ath10k@lists.infradead.org>; Tue, 01 Dec 2020 11:36:01 -0800 (PST)
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com.
 [209.85.161.54])
 by smtp.gmail.com with ESMTPSA id t4sm161150oou.34.2020.12.01.11.35.57
 for <ath10k@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Dec 2020 11:35:57 -0800 (PST)
Received: by mail-oo1-f54.google.com with SMTP id f8so691447oou.0
 for <ath10k@lists.infradead.org>; Tue, 01 Dec 2020 11:35:57 -0800 (PST)
MIME-Version: 1.0
References: <20201126171553.2097-1-youghand@codeaurora.org>
In-Reply-To: <20201126171553.2097-1-youghand@codeaurora.org>
From: Brian Norris <briannorris@chromium.org>
Date: Tue, 1 Dec 2020 11:35:44 -0800
Message-ID: <CA+ASDXOvnfETrKs2ZbayZsRkUEpUbaeMGRkZNRCXa=M28HHE-w@mail.gmail.com>
Subject: Re: [PATCH v2] ath10k: skip the wait for completion to recovery in
 shutdown path
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
To: Youghandhar Chintala <youghand@codeaurora.org>
Cc: kuabhs@chromium.org, linux-wireless <linux-wireless@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>, ath10k <ath10k@lists.infradead.org>, Doug Anderson <dianders@chromium.org>, Rakesh Pillai <pillair@codeaurora.org>

On Thu, Nov 26, 2020 at 9:16 AM Youghandhar Chintala
<youghand@codeaurora.org> wrote:
> --- a/drivers/net/wireless/ath/ath10k/snoc.c
> +++ b/drivers/net/wireless/ath/ath10k/snoc.c
> @@ -1790,9 +1790,6 @@ static int ath10k_snoc_remove(struct platform_device *pdev)
>
>         reinit_completion(&ar->driver_recovery);
>
> -       if (test_bit(ATH10K_SNOC_FLAG_RECOVERY, &ar_snoc->flags))
> -               wait_for_completion_timeout(&ar->driver_recovery, 3 * HZ);

Hmm, this is the only instance of waiting for this completion, which
means that after this patch, 'ar->driver_recovery' is doing exactly
nothing. Should you instead just remove it completely?

Also, if your patch is correct, it seems like the completion was never
needed in the first place. You should probably address such a claim in
the commit message; is there truly no need to wait here? Or was there
some purpose here, but that purpose was accomplished some other way?
Or was there a purpose, and that purpose was misguided? It feels to me
like it is indeed correct to remove this (shutdown should be performed
promptly; we don't need to delay it just to try to "finish
recovering"), but it's your job to convince the reader.

Brian

> -
>         set_bit(ATH10K_SNOC_FLAG_UNREGISTERING, &ar_snoc->flags);
>
>         ath10k_core_unregister(ar);

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
