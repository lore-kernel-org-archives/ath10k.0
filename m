Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D55AFC433EF
	for <ath10k@archiver.kernel.org>; Tue, 14 Dec 2021 22:48:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WWcmvHloYC5w2l0c5RIBc8duB/+IELfAv1irZTdKZDk=; b=xEHvspEIgTvW99
	UljF/9QXnAOcOXbpGsvAlM8v2xIi9M/hUPFB034ftxGZs4wQlDsADxWHpKfrGti0KPDR9RIpDnBVA
	XBnC2QFHF60+bR8+pfsEC4XNE+djJZQ/OTQhR4d5uW7OviI70m5yGPv9zsqwtGZZ+FVPm+oiiIHii
	AJnTo2voyVhXJ861xdFi2UxcjnJllM4UsBtSLK/Kg3TQtl/3Au2fvEaaWzKlFeONGr2msp7DbiJRK
	weRPCgsFlq++L8ONb82d3LPKubzMzBAgFqDct9IsX8/IE5TuS2jQknoM5NoivHU9krKB/P/+tjpuk
	gmNkKqM2WHdMVE5DNrBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mxGax-00FzK7-Oi; Tue, 14 Dec 2021 22:48:27 +0000
Received: from mail-io1-xd2d.google.com ([2607:f8b0:4864:20::d2d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxGav-00FzJe-5R
 for ath10k@lists.infradead.org; Tue, 14 Dec 2021 22:48:26 +0000
Received: by mail-io1-xd2d.google.com with SMTP id z26so26905982iod.10
 for <ath10k@lists.infradead.org>; Tue, 14 Dec 2021 14:48:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MXv/DtzT+RrVII/ZrToN2ofTA5+xjSjZP2wWKJOuS5k=;
 b=m7u5do6kEqS/yNJotc7vURvyVHtIY4LPihgG2+Q6Ucu5lAjpSWyNKgjSKZMvQXo7eL
 ru1Iqg5bdj1O7/RsdWMyhPd1+1b4jZk7MggskgtLsEEmHf0sv2cfE/+08hjd97vqyHOs
 LHFMSZaDaxCFs1Vsb/P9GFPbTL11VxrVTJRqk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MXv/DtzT+RrVII/ZrToN2ofTA5+xjSjZP2wWKJOuS5k=;
 b=nHOxXm5nR/5rpIKoVn1ywot+BWOINRYjNwuWG+87v3VhJOtYkXT0cXNO5MK5utGQ4C
 d0IRljngeC+TaVy8BhW+GJzhrr4J/bzHYzGlVA7mUT+58a1u36Cc7KoTTby59iBFvU7q
 VyfvijZ5Jbwq5mOyvK6gC8FymIo/6FFkYMeLlRN1Q7k+iuHRVLJ3MZDImlRioa1WeTwz
 EcXpB/cN/ZIacJJ8bwZQSGXA8wwKmVcpmkDV/wf2zVT8CoIcLnKVI4Z/OM78RRzyLajA
 a8OL4illy0qH7yeej6kESCpURu0IbfqrwH+XwrXDDAE7D41wjODkY8NFNsCBnrtvZ+KO
 ZAOg==
X-Gm-Message-State: AOAM530+9ylTwoMZEtespfaK0HMFXV5ah5etmbRYqPWlN41J0eIYEC9j
 2nCDmnZczShi7+XzlEkgy1FUYZUzHZU4dobAxcOC8A==
X-Google-Smtp-Source: ABdhPJwhPBYy3YkhpWPba0anVBjfvoXbIbG2xjp4g5uA3wsijJAtQub1bOlhDmNO/tfHCSUs1QnrSOvce1nGtdLL3rM=
X-Received: by 2002:a05:6638:134d:: with SMTP id
 u13mr4477072jad.360.1639522104190; 
 Tue, 14 Dec 2021 14:48:24 -0800 (PST)
MIME-Version: 1.0
References: <20211214223901.1.I777939e0ef1e89872d4ab65340f3fd756615a047@changeid>
In-Reply-To: <20211214223901.1.I777939e0ef1e89872d4ab65340f3fd756615a047@changeid>
From: Abhishek Kumar <kuabhs@chromium.org>
Date: Tue, 14 Dec 2021 14:48:13 -0800
Message-ID: <CACTWRwtn+xwVfdFC_1ZAEGC41+gqjDNpTk46vctejnF74Pf+AQ@mail.gmail.com>
Subject: Re: [PATCH] ath10k: enable threaded napi on ath10k driver
To: kvalo@codeaurora.org, briannorris@chromium.org
Cc: linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org, 
 dianders@chromium.org, pillair@codeaurora.org, 
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 ath10k@lists.infradead.org, netdev@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211214_144825_244400_95AE446F 
X-CRM114-Status: GOOD (  17.18  )
X-BeenThere: ath10k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
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
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

Hi All,

This patch is to trigger a discussion on the best approach to enable
threaded NAPI on ath10k. Threaded NAPI feature was added in (net:
extract napi poll functionality to __napi_poll() commit
898f8015ffe74118e7b461827451f2cc6e51035b) and showed good results on
ath10k snoc based solution.

If we come to a consensus with this as the best approach to enable
threaded NAPI on ath10k, then we can moved ahead with the
implementation and enable across sdio and pci, or if there is any
objection then we can discuss it here.

Thanks
Abhishek

On Tue, Dec 14, 2021 at 2:41 PM Abhishek Kumar <kuabhs@chromium.org> wrote:
>
> NAPI poll can be done in threaded context along with soft irq
> context. Threaded context can be scheduled efficiently, thus
> creating less of bottleneck during Rx processing. This patch is
> to enable threaded NAPI on ath10k driver.
>
> Tested-on: WCN3990 hw1.0 SNOC WLAN.HL.3.2.2-00696-QCAHLSWMTPL-1
> Signed-off-by: Abhishek Kumar <kuabhs@chromium.org>
> ---
>
>  drivers/net/wireless/ath/ath10k/pci.c  | 1 +
>  drivers/net/wireless/ath/ath10k/sdio.c | 1 +
>  drivers/net/wireless/ath/ath10k/snoc.c | 2 +-
>  3 files changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
> index 4d4e2f91e15c..584307574d99 100644
> --- a/drivers/net/wireless/ath/ath10k/pci.c
> +++ b/drivers/net/wireless/ath/ath10k/pci.c
> @@ -1958,6 +1958,7 @@ static int ath10k_pci_hif_start(struct ath10k *ar)
>
>         ath10k_dbg(ar, ATH10K_DBG_BOOT, "boot hif start\n");
>
> +       dev_set_threaded(&ar->napi_dev, true);
>         ath10k_core_napi_enable(ar);
>
>         ath10k_pci_irq_enable(ar);
> diff --git a/drivers/net/wireless/ath/ath10k/sdio.c b/drivers/net/wireless/ath/ath10k/sdio.c
> index 63e1c2d783c5..52ef74d9811a 100644
> --- a/drivers/net/wireless/ath/ath10k/sdio.c
> +++ b/drivers/net/wireless/ath/ath10k/sdio.c
> @@ -1862,6 +1862,7 @@ static int ath10k_sdio_hif_start(struct ath10k *ar)
>         struct ath10k_sdio *ar_sdio = ath10k_sdio_priv(ar);
>         int ret;
>
> +       dev_set_threaded(&ar->napi_dev, true);
>         ath10k_core_napi_enable(ar);
>
>         /* Sleep 20 ms before HIF interrupts are disabled.
> diff --git a/drivers/net/wireless/ath/ath10k/snoc.c b/drivers/net/wireless/ath/ath10k/snoc.c
> index 9513ab696fff..e7d12dbb3fa5 100644
> --- a/drivers/net/wireless/ath/ath10k/snoc.c
> +++ b/drivers/net/wireless/ath/ath10k/snoc.c
> @@ -926,7 +926,7 @@ static int ath10k_snoc_hif_start(struct ath10k *ar)
>         struct ath10k_snoc *ar_snoc = ath10k_snoc_priv(ar);
>
>         bitmap_clear(ar_snoc->pending_ce_irqs, 0, CE_COUNT_MAX);
> -
> +       dev_set_threaded(&ar->napi_dev, true);
>         ath10k_core_napi_enable(ar);
>         ath10k_snoc_irq_enable(ar);
>         ath10k_snoc_rx_post(ar);
> --
> 2.34.1.173.g76aa8bc2d0-goog
>

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
