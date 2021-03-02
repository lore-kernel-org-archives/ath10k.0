Return-Path: <SRS0=fsDJ=IA=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19E07C433DB
	for <ath10k@archiver.kernel.org>; Tue,  2 Mar 2021 01:52:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7A436601FF
	for <ath10k@archiver.kernel.org>; Tue,  2 Mar 2021 01:52:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7A436601FF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ZKTkutcmqMgWObT5kS4gTQJWdKMul83kuchy/fK5+1E=; b=GDSZDWCwh4COYwOgaoz4SwDOR
	JK/9LHsv+xs69GbraBrgid/1HIdEtd6GidsthCzqLVIHO50Y67vvk4ATErr6OGinFkzf2R6mstEKU
	3NUQ2BCx2P1oMEa+sbFgQuKUuTmbXU2705sS/JkINq+thhNbZFio6jFdt+u4ku0UqlpJyIhNRzOjF
	OfEkU1iUlDiURhrv5dY2IBlTTi6Iy5dMAGhTccbpUKExwEYScvV72jgAHy6j9f1DDqj1xq+j5I3b8
	bOBnU2yJRTLgKmMKuYi7zuW5PDmNCskNyMrEUdli1dKmjzTHXgpwADQtithgwMPY6uqKkb+wZnysD
	/lfQjK24Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lGuC3-0003pU-Kg; Tue, 02 Mar 2021 01:51:23 +0000
Received: from mail-io1-xd30.google.com ([2607:f8b0:4864:20::d30])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lGuC1-0003ou-6x
 for ath10k@lists.infradead.org; Tue, 02 Mar 2021 01:51:21 +0000
Received: by mail-io1-xd30.google.com with SMTP id g27so18682695iox.2
 for <ath10k@lists.infradead.org>; Mon, 01 Mar 2021 17:51:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ChiCCkiCsXQxiUixofhODiitqcy5zpCs8hKaFZVKRjI=;
 b=XH9FrLA/2st5+fTiC6HJTOSf1MwNIWxkjsihf73fTh7kndO6L7cbplAGk5wrk3f+Bd
 J65pMiwHsVzExSIZAIqmYrj64nyh2BDfz+hwVYfokEn0+0RtC0wVX3/5YWF1x9TlyfXi
 qHM1MDkz3jgzQTAo5gqt8jAd0mGP+w3XT4U14=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ChiCCkiCsXQxiUixofhODiitqcy5zpCs8hKaFZVKRjI=;
 b=mugNpzHnkfpeS/iwgHK40jMUsSQG5dcwWztyAWPcGwj09q7bIHgCclLtR3lDC73Aj0
 scskyaXGDgA9yAkkkln/Ti2JjlaYwZX7zSz13UDCElgxCMgQc7HdJw7QPAla+ykUjJgo
 kFRM8v0Dnkkb7qOMtDDi9Zj+2OJSRgsj44sxZoeHRW5ZZHMIsomqxBJGqDH0Kf5WJDRg
 yBRa5h/rYPdyCIu9RLWdxZ0twHcVXTjF9fG3+P0035zw8rbD8UPz4GlTtVE31FEBEgij
 2ECFmUK/6u4JBDKjg2YeiJyjqkqZ/oBo9bZzkng70VOdyTnYjaT7KhdqfhkEbyJIdacP
 v6AA==
X-Gm-Message-State: AOAM533n8JmJ6Gt51u623tBLbyoLhE1vuqiWJNLazcO608ZH4N1pzt47
 rWSZ+m/cDsbBKXNNRp508e0iRAbVxbyHdpUTbF4MoQ==
X-Google-Smtp-Source: ABdhPJz3J7j717c/uTMNBy/qHIbiLcuAWjx+u4Udcm5tqf42hVMrgjAO+VnjYWDCI+qnDYI83S2kk8HmE46Ww7MQ2FE=
X-Received: by 2002:a02:1704:: with SMTP id 4mr19127370jah.121.1614649877502; 
 Mon, 01 Mar 2021 17:51:17 -0800 (PST)
MIME-Version: 1.0
References: <20210223142908.23374-1-youghand@codeaurora.org>
In-Reply-To: <20210223142908.23374-1-youghand@codeaurora.org>
From: Abhishek Kumar <kuabhs@chromium.org>
Date: Mon, 1 Mar 2021 17:51:05 -0800
Message-ID: <CACTWRwti94_VXpFZZhZKJhhJ_YUb1mCWjR2AtD_Rqwe6-GOGHQ@mail.gmail.com>
Subject: Re: [PATCH v3] ath10k: skip the wait for completion to recovery in
 shutdown path
To: Youghandhar Chintala <youghand@codeaurora.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210301_205121_309528_AA1DF5D7 
X-CRM114-Status: GOOD (  21.51  )
X-BeenThere: ath10k@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Cc: netdev <netdev@vger.kernel.org>, Brian Norris <briannorris@chromium.org>,
 linux-wireless <linux-wireless@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, ath10k <ath10k@lists.infradead.org>,
 Douglas Anderson <dianders@chromium.org>,
 ath10k-review.external@qti.qualcomm.com, Jakub Kicinski <kuba@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Kalle Valo <kvalo@codeaurora.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

This patch seems to address the comments on v2. Overall this patch LGTM.

Reviewed-by: Abhishek Kumar <kuabhs@chromium.org>

On Tue, Feb 23, 2021 at 6:29 AM Youghandhar Chintala
<youghand@codeaurora.org> wrote:
>
> Currently in the shutdown callback we wait for recovery to complete
> before freeing up the resources. This results in additional two seconds
> delay during the shutdown and thereby increase the shutdown time.
>
> As an attempt to take less time during shutdown, remove the wait for
> recovery completion in the shutdown callback and added an API to freeing
> the reosurces in which they were common for shutdown and removing
> the module.
>
> Tested-on: WCN3990 hw1.0 SNOC WLAN.HL.3.1-01040-QCAHLSWMTPLZ-1
>
> Signed-off-by: Youghandhar Chintala <youghand@codeaurora.org>
> Change-Id: I65bc27b5adae1fedc7f7b367ef13aafbd01f8c0c
> ---
> Changes from v2:
> -Corrected commit text and added common API for freeing the
>  resources for shutdown and unloading the module
> ---
>  drivers/net/wireless/ath/ath10k/snoc.c | 29 ++++++++++++++++++--------
>  1 file changed, 20 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/net/wireless/ath/ath10k/snoc.c b/drivers/net/wireless/ath/ath10k/snoc.c
> index 84666f72bdfa..70b3f2bd1c81 100644
> --- a/drivers/net/wireless/ath/ath10k/snoc.c
> +++ b/drivers/net/wireless/ath/ath10k/snoc.c
> @@ -1781,17 +1781,11 @@ static int ath10k_snoc_probe(struct platform_device *pdev)
>         return ret;
>  }
>
> -static int ath10k_snoc_remove(struct platform_device *pdev)
> +static int ath10k_snoc_free_resources(struct ath10k *ar)
>  {
> -       struct ath10k *ar = platform_get_drvdata(pdev);
>         struct ath10k_snoc *ar_snoc = ath10k_snoc_priv(ar);
>
> -       ath10k_dbg(ar, ATH10K_DBG_SNOC, "snoc remove\n");
> -
> -       reinit_completion(&ar->driver_recovery);
> -
> -       if (test_bit(ATH10K_SNOC_FLAG_RECOVERY, &ar_snoc->flags))
> -               wait_for_completion_timeout(&ar->driver_recovery, 3 * HZ);
> +       ath10k_dbg(ar, ATH10K_DBG_SNOC, "snoc free resources\n");
>
>         set_bit(ATH10K_SNOC_FLAG_UNREGISTERING, &ar_snoc->flags);
>
> @@ -1805,12 +1799,29 @@ static int ath10k_snoc_remove(struct platform_device *pdev)
>         return 0;
>  }
>
> +static int ath10k_snoc_remove(struct platform_device *pdev)
> +{
> +       struct ath10k *ar = platform_get_drvdata(pdev);
> +       struct ath10k_snoc *ar_snoc = ath10k_snoc_priv(ar);
> +
> +       ath10k_dbg(ar, ATH10K_DBG_SNOC, "snoc remove\n");
> +
> +       reinit_completion(&ar->driver_recovery);
> +
> +       if (test_bit(ATH10K_SNOC_FLAG_RECOVERY, &ar_snoc->flags))
> +               wait_for_completion_timeout(&ar->driver_recovery, 3 * HZ);
> +
> +       ath10k_snoc_free_resources(ar);
> +
> +       return 0;
> +}
> +
>  static void ath10k_snoc_shutdown(struct platform_device *pdev)
>  {
>         struct ath10k *ar = platform_get_drvdata(pdev);
>
>         ath10k_dbg(ar, ATH10K_DBG_SNOC, "snoc shutdown\n");
> -       ath10k_snoc_remove(pdev);
> +       ath10k_snoc_free_resources(ar);
>  }
>
>  static struct platform_driver ath10k_snoc_driver = {
> --
> 2.29.0
>

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
