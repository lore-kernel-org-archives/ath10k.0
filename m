Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2C36ECAAD8
	for <ath10k@archiver.kernel.org>; Fri, 23 Sep 2022 14:39:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ICIwb+WXeAanOcyNWQqAuaf5sVk9PoNL0BPjTa2Hq2Q=; b=3x4zlDxEFVOKhj
	7H6TvjS4OAa9jsyrsM22qZUyeTP4+42gFTFv9eTpiCpTpO8ry46tcSyMzIauRHfh1ijlKAms366I9
	JgEpNngkLOX3d6Fkbpyno8SI1SJKyy6gkcfHYbkDIbbVDxOZB/TG8Q4GDm7S/Y+z0NRyB1T39bJO0
	YpygUm9ZAsQoecQK8El/jcWRHO9gZQtqY41AUXZP3BS9fiTukRq4OAiukD/KyM3w1dCoFkVeOZ0lh
	7AoA0C2IdW2tiUP2kKHDLoVjgXJOgBNpbVs5k22fndvVIQo9WXBCI8eOqhJ/HmtHYH0aH34cWa7zG
	g9sHKNeg4KbtQve5Xs7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1objpz-004f1h-Gc; Fri, 23 Sep 2022 14:39:31 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1objpv-004ezg-Lk
	for ath10k@lists.infradead.org; Fri, 23 Sep 2022 14:39:30 +0000
Received: by mail-ej1-x62b.google.com with SMTP id bj12so1064622ejb.13
        for <ath10k@lists.infradead.org>; Fri, 23 Sep 2022 07:39:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date;
        bh=S5eZN2svmhOfsW6VEcUb5Ry7O5bFBRCb5lC2tn/7Tfo=;
        b=gkzAlIt/hpKoRZEZLqhfZ8OysZ9L7bILUx3sexHwwb/6XDB+pCPacUz+MJjhWKhuR8
         03WIYD6q3het0x2eUZOaFt4+8DLRxhO61dji69+3Me4MLavSly0qeRo0vqetAht869ok
         ifG9Ps6irane6AxqQ0QfJg90uACXU5trZG5FNLfEzHAvnDR/7MbC/Fiy3LIbWwjANhiM
         E2UJl7+e5iXNxOJG9pVXNlrbpNeiZUe/b5JBc4Ah587wHR6LrqOEcMd85sSJX+AHXzVH
         ylFVisJVdx3w/VxoxI7/ouKWTh3F9lVB7kokwRSC1DxQ36BVKR9k3+145PxEiaip0TUB
         rnCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date;
        bh=S5eZN2svmhOfsW6VEcUb5Ry7O5bFBRCb5lC2tn/7Tfo=;
        b=3oszzgN8GOKFniyTDFQLq1fSyzrRZcW8QxtYfoD5mqEnvdFRl/zLjbPueHSJLWWpVb
         VE9Lo/2GxdGV2psgMKLY5OnZAimP4+MnVqapeLWY47FnqlAuoBHUK/C7qHlYREhARhuL
         t4E923weQ71KSaqRg5TY7aYPdZaUbSqW29Yu3b1EPOCYW9HdSnLNvdbsn80LsR6uMUNs
         eDO5DtLANYQmcmv+k2PhtvVDRD4WbIpo/7+oLRFoIr9Vl9N71fk6uUHFmfY5YvTP9MHF
         QP/6MNhGiSn3+GknEVDZhrp8eLfu4g7jz7fiI8UR0OvJCfgIjR2qYaLgZ/mGGFnxj/cY
         x04A==
X-Gm-Message-State: ACrzQf2OmavARBJ3+LApShsETXlX4VKkRwmanqXJkJrhbFlCy3NQ3mjN
	uDKPa60CHceUx15WPiS3cRbYsg==
X-Google-Smtp-Source: AMsMyM5/0fjixHZUeDGkqTbJZktQlwbIg9e75ri3yi5AJ6I4VwtQ3bwL9pzvfhAltPu40POCkTiVNg==
X-Received: by 2002:a17:906:8469:b0:781:fc76:fbd7 with SMTP id hx9-20020a170906846900b00781fc76fbd7mr7457238ejc.486.1663943960828;
        Fri, 23 Sep 2022 07:39:20 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id j2-20020a17090623e200b0078197a9421csm4117653ejg.85.2022.09.23.07.39.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Sep 2022 07:39:20 -0700 (PDT)
Mime-Version: 1.0
Date: Fri, 23 Sep 2022 16:39:18 +0200
Message-Id: <CN3UWLRBLVPF.VV4AX2X9TS34@otso>
Subject: Re: [PATCH v1 00/15] create power sequencing subsystem
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Dmitry Baryshkov" <dmitry.baryshkov@linaro.org>, "Andy Gross"
 <agross@kernel.org>, "Bjorn Andersson" <bjorn.andersson@linaro.org>, "Ulf
 Hansson" <ulf.hansson@linaro.org>, "Marcel Holtmann" <marcel@holtmann.org>,
 "Johan Hedberg" <johan.hedberg@gmail.com>, "Luiz Augusto von Dentz"
 <luiz.dentz@gmail.com>, "Kalle Valo" <kvalo@codeaurora.org>, "David S.
 Miller" <davem@davemloft.net>, "Jakub Kicinski" <kuba@kernel.org>,
 "Stanimir Varbanov" <svarbanov@mm-sol.com>
Cc: <linux-arm-msm@vger.kernel.org>, <linux-mmc@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-bluetooth@vger.kernel.org>,
 <ath10k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <netdev@vger.kernel.org>
X-Mailer: aerc 0.12.0
References: <20211006035407.1147909-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20211006035407.1147909-1-dmitry.baryshkov@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220923_073928_553827_D22BB728 
X-CRM114-Status: GOOD (  20.39  )
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

Hi Dmitry,

On Wed Oct 6, 2021 at 5:53 AM CEST, Dmitry Baryshkov wrote:
> This is a proposed power sequencer subsystem. This is a
> generification of the MMC pwrseq code. The subsystem tries to abstract
> the idea of complex power-up/power-down/reset of the devices.
>
> The primary set of devices that promted me to create this patchset is
> the Qualcomm BT+WiFi family of chips. They reside on serial+platform
> or serial + SDIO interfaces (older generations) or on serial+PCIe (newer
> generations).  They require a set of external voltage regulators to be
> powered on and (some of them) have separate WiFi and Bluetooth enable
> GPIOs.
>
> The major drawback for now is the lack of proper PCIe integration
> At this moment support for PCIe is hacked up to be able to test the
> PCIe part of qca6390. Proper PCIe support would require automatically
> powering up the devices before the scan basing on the proper device
> structure in the device tree. This two last patches are noted as WIP and
> are included into the patchset for the purpose of testing WiFi on newer
> chips (like qca6390/qca6391).

What's the status of this series? With this I have gotten Bluetooth to
somewhat work on sm7225-fairphone-fp4, which is using WCN3990/WCN3988.

Is there another solution with a different patch series that could make
it work also?

The latest I could find regarding some new Bluetooth thing is the
following email from June 2022, but nothing seems to have happened since
then.
https://lore.kernel.org/linux-arm-msm/SJ0PR02MB7135746D204F13550E9BAE77F8B29@SJ0PR02MB7135.namprd02.prod.outlook.com/

Regards
Luca

>
> Changes since RFC v2:
>  - Add documentation for the pwrseq code. Document data structures,
>    macros and exported functions.
>  - Export of_pwrseq_xlate_onecell()
>  - Add separate pwrseq_set_drvdata() function to follow the typical API
>    design
>  - Remove pwrseq_get_optional()/devm_pwrseq_get_optional()
>  - Moved code to handle old mmc-pwrseq binding to the MMC patch
>  - Split of_pwrseq_xlate_onecell() support to a separate patch
>
> Changes since RFC v1:
>  - Provider pwrseq fallback support
>  - Implement fallback support in pwrseq_qca.
>  - Mmove susclk handling to pwrseq_qca.
>  - Significantly simplify hci_qca.c changes, by dropping all legacy
>    code. Now hci_qca uses only pwrseq calls to power up/down bluetooth
>    parts of the chip.


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
