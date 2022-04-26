Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BF75C433EF
	for <ath10k@archiver.kernel.org>; Tue, 26 Apr 2022 22:34:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZuDDzvyhHdmMYPRSjiRmw5CGQNmt6uHEMT8KSbxm5RA=; b=IpApQ6k0UMQ0h9
	htt9JmaQurwufyN5heY5yPa2fzyg2v9PEuaAbZOeMPuFccjt01UUYFpGkXf6dPGUBWPW/FTsu3l54
	u1KV3qULtP7fkVAMRYh4L4veHtvOokhUpEYzr6oTBmLV6Ut7wOt0muuyjtUHe9ChPDBOQmtWs70tC
	N+ZnMfj6rveZWDXBISpKb8X0mQ1xHkj9u5u12vgfeauWLyIMK87h8HpjUs/sN14664EFccebw5uSh
	pSUBe8VwJh1teAzzTlx18V7E7v272Ne9+12SqvAnARJRaUFvhnUFeAaUjKnoszoSwS05NrQye3xOb
	7fD9TlR2M1HUMWOIYLHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njTlE-00GTAs-0j; Tue, 26 Apr 2022 22:34:20 +0000
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njTlB-00GTAV-D5
 for ath10k@lists.infradead.org; Tue, 26 Apr 2022 22:34:18 +0000
Received: by mail-ot1-x329.google.com with SMTP id
 r14-20020a9d750e000000b00605446d683eso14051326otk.10
 for <ath10k@lists.infradead.org>; Tue, 26 Apr 2022 15:34:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QOVruyTRY05/IB4dGodf9j5s8WkZhLYEMF1zPjhJnqU=;
 b=FJgqu7tUhGTf4pp2slwvkEMS7a5eJjGcvKCLSIztNY+14AkXepqJ0SqpdNBcZky/WX
 Fb90MZZxHTxzXlynFw3KyoxfOqTufkEYeGoGRNzqOyKWVxYAUerSB1pA3QZMrJsotXdQ
 YjIu5S4xHw9lauMzCV2DA+LrVZzjomjl/ywhc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QOVruyTRY05/IB4dGodf9j5s8WkZhLYEMF1zPjhJnqU=;
 b=M/Ktx10oUQVH+2oFdrNR8V67NyMw1ES+/WLR4AXAOG2+K2bSMLwyaNpZ144OhHxhp2
 51W7tOKIptBSJ4opa4FWNTdAVzKjSb6eDcG/ScgzedOB5kYrS033XAMSYvzNQrmeH6SH
 RdTo0BXaBxAruMT4XBOaEcdC+IebNbXHp4ODsXRtx1zLUnd43xlpEWAYPYely8Kg+cSm
 PR7fViOissS5bHhPEqxp1I0fT4nef7EmM+XQNq0T350KfIArARbKT0XZ1VU1TKz9f4K/
 pfmUtwpWBe+83odKxQEr75eZ1JyY8jWIq3a/tpPQMBft2cpAGNmpsIuBtqaHgf2wjF7C
 2BUw==
X-Gm-Message-State: AOAM5339lQBSiSsw5C3Skm6JrgKkrVHZsAMoSJj+yO/AdGyXaEFkFDOi
 pxGi5HLLqaGKWccD8/6NRSJDES/dG/4x/g==
X-Google-Smtp-Source: ABdhPJwrB1223amVYQH8wZ8qqUFSCx7jaqAuZHoMGNVgzgV4l5jXt/u5XFlXG1g9ujAcr5J9q0TCTg==
X-Received: by 2002:a9d:744c:0:b0:605:513d:2c66 with SMTP id
 p12-20020a9d744c000000b00605513d2c66mr9218037otk.154.1651012454904; 
 Tue, 26 Apr 2022 15:34:14 -0700 (PDT)
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com.
 [209.85.160.49]) by smtp.gmail.com with ESMTPSA id
 6-20020aca0706000000b002f9d20b3134sm5376643oih.7.2022.04.26.15.34.13
 for <ath10k@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Apr 2022 15:34:13 -0700 (PDT)
Received: by mail-oa1-f49.google.com with SMTP id
 586e51a60fabf-e5e433d66dso166853fac.5
 for <ath10k@lists.infradead.org>; Tue, 26 Apr 2022 15:34:13 -0700 (PDT)
X-Received: by 2002:a05:6870:4201:b0:e6:47c4:e104 with SMTP id
 u1-20020a056870420100b000e647c4e104mr14046899oac.257.1651012453086; Tue, 26
 Apr 2022 15:34:13 -0700 (PDT)
MIME-Version: 1.0
References: <20220426221859.v2.1.I650b809482e1af8d0156ed88b5dc2677a0711d46@changeid>
In-Reply-To: <20220426221859.v2.1.I650b809482e1af8d0156ed88b5dc2677a0711d46@changeid>
From: Brian Norris <briannorris@chromium.org>
Date: Tue, 26 Apr 2022 15:34:02 -0700
X-Gmail-Original-Message-ID: <CA+ASDXPNFwvYVBMHjbTNQ-uTnQrs5TvPAH2jXgPKuFLUw2GbZA@mail.gmail.com>
Message-ID: <CA+ASDXPNFwvYVBMHjbTNQ-uTnQrs5TvPAH2jXgPKuFLUw2GbZA@mail.gmail.com>
Subject: Re: [PATCH v2] ath10k: skip ath10k_halt during suspend for driver
 state RESTARTING
To: Abhishek Kumar <kuabhs@chromium.org>
Cc: kvalo@kernel.org, quic_wgong@quicinc.com, 
 Linux Kernel <linux-kernel@vger.kernel.org>, 
 linux-wireless <linux-wireless@vger.kernel.org>,
 ath10k <ath10k@lists.infradead.org>, 
 "<netdev@vger.kernel.org>" <netdev@vger.kernel.org>,
 "David S. Miller" <davem@davemloft.net>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220426_153417_501372_BE1A5326 
X-CRM114-Status: GOOD (  12.98  )
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

On Tue, Apr 26, 2022 at 3:20 PM Abhishek Kumar <kuabhs@chromium.org> wrote:
>
> Double free crash is observed when FW recovery(caused by wmi
> timeout/crash) is followed by immediate suspend event. The FW recovery
> is triggered by ath10k_core_restart() which calls driver clean up via
> ath10k_halt(). When the suspend event occurs between the FW recovery,
> the restart worker thread is put into frozen state until suspend completes.
> The suspend event triggers ath10k_stop() which again triggers ath10k_halt()
> The double invocation of ath10k_halt() causes ath10k_htt_rx_free() to be
> called twice(Note: ath10k_htt_rx_alloc was not called by restart worker
> thread because of its frozen state), causing the crash.
...
> Tested-on: QCA6174 hw3.2 PCI WLAN.RM.4.4.1-00288-QCARMSWPZ-1
> Co-developed-by: Wen Gong <quic_wgong@quicinc.com>
> Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
> Signed-off-by: Abhishek Kumar <kuabhs@chromium.org>
> ---
>
> Changes in v2:
> - Fixed typo, replaced ath11k by ath10k in the comments.
> - Adjusted the position of my S-O-B tag.
> - Added the Tested-on tag.

You could have retained my:

Reviewed-by: Brian Norris <briannorris@chromium.org>

but no worries; it's just a few characters ;)

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
