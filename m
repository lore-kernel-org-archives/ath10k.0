Return-Path: <SRS0=TZpM=PV=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA24FC433EF
	for <ath10k@archiver.kernel.org>; Tue,  2 Nov 2021 14:05:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5EB0060296
	for <ath10k@archiver.kernel.org>; Tue,  2 Nov 2021 14:05:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5EB0060296
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RfXzlqgBAbthu989j5AUDgsqTFn/kK/60fTLeuQQi+Q=; b=Q5BW+dMBQQk58G
	Kbu8wNAOdgBY3s5CO9EdskA9FYhAkprBiYFIptMZrWi6+ChCdfQrNZoX3bpqPJ63eBGqNxZHTn1Uh
	KpHLx4l3OtmIaHAfAq9duc6T+qsi+jdRiYz+lNjxrgc+GhS83lkUtSIEf9HrEm0VE6ub+qra68zRG
	QrCVrBVmH5TfRNxabukIHagLoTbQu+v/D0j6BOVtXCdw4YUcx8Ey6NdgqYyrXV7MSRgxJHbqgQvlC
	kfPIr3Wg212WgFdUOpkT/Scf5uM8Nh9Oq5YbBBrQhHR5KKFOvAE2/kYBbpJAVN9Z/SBv2DCeRBxa4
	XyHM7R1AHXDXS15I5zsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mhuPy-001tlM-P1; Tue, 02 Nov 2021 14:05:38 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mhuPv-001tkN-Iy
 for ath10k@lists.infradead.org; Tue, 02 Nov 2021 14:05:37 +0000
Received: by mail-wm1-x332.google.com with SMTP id
 r9-20020a7bc089000000b00332f4abf43fso1666568wmh.0
 for <ath10k@lists.infradead.org>; Tue, 02 Nov 2021 07:05:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=+IYXwWS8RTx2nLZKN578GTrttVorrBmCdGgRqqEdI34=;
 b=aDm24t85uRClN+XO1YGgcwD+8BAIZ3ICQ1+kxTfb0AC9ny1rPjXf71kfbXm7rFkw6M
 mlrAqcVe7aGX96UQRA9prWqVGWvRj+ZlyMGHS3sUa7X7015IG1Ky5fTWFVeB4fT2G4sO
 7eWEBF8QngyWKZpJzx4IXMGUX5JYeVk11faNoo34GcgiI2cQZqpLHWNIuziPzaygVoVE
 n4HaIva8ek3caSnNkpkYw6UPm5yMoq4FbYj8qAAN3fR3yhEVAJrOBHan4jMO9qpYBAS9
 9aXwFslzFJ6JLtT2+BGIOxNFDuICkdlFLtjweURXASUHpyifZ1eK1FRRXq5N59mO1pk+
 2nTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=+IYXwWS8RTx2nLZKN578GTrttVorrBmCdGgRqqEdI34=;
 b=Z1PJrfzOUG+HE+ugzKQ6qjz7xVusE3YEXE1BnmuyUBk0tOQmba99Lg6kaBEzE0xisb
 78a73rscAIVv8cyI44WdcKTxZQmZ9u9pk+Gf7Fpu+pAtdkjxPkT0BrPGt3H3eBjXXPli
 cgNdA3s/zk07cMheyGvpuPe0sEvQ38yEsZBc5TcoAXu9JAol1t/gpduaWWYIwY4tB2T2
 q++Pgqecy34M0QtAW8i9306LdQi5McCoD73K697npISrC8tLJygTquBiKFal9j03XeC8
 BXn23hCKRmeOg26TArmEkYzk5TLgtogbAXjyBePAU90+scgdWQnNw9zjbSvoq9EsRDQG
 fWkg==
X-Gm-Message-State: AOAM530wmXuh5t1bCl/tZHKrJDK+TZKaHnBulTQNOpjhB5/nyLiNb18Z
 4fx86dDQCYuerGHjyZMEpQ2meA==
X-Google-Smtp-Source: ABdhPJzxg0SHqhkEzFQ1UmuimY5KEsGE4OUHBHVSwXpPdDc44Og9JozAJKDqnW7UGZNY5rLd2HpfGQ==
X-Received: by 2002:a1c:a904:: with SMTP id s4mr7080812wme.163.1635861933267; 
 Tue, 02 Nov 2021 07:05:33 -0700 (PDT)
Received: from [192.168.0.30]
 (cpc78119-cwma10-2-0-cust590.7-3.cable.virginm.net. [81.96.50.79])
 by smtp.gmail.com with ESMTPSA id z12sm12443417wrv.78.2021.11.02.07.05.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Nov 2021 07:05:32 -0700 (PDT)
Message-ID: <df3c0fd1-5ec1-5cf7-f94c-1b2db2882333@linaro.org>
Date: Tue, 2 Nov 2021 14:05:31 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v1 00/15] create power sequencing subsystem
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson
 <bjorn.andersson@linaro.org>, Ulf Hansson <ulf.hansson@linaro.org>,
 Marcel Holtmann <marcel@holtmann.org>,
 Johan Hedberg <johan.hedberg@gmail.com>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
 Kalle Valo <kvalo@codeaurora.org>, "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, Stanimir Varbanov <svarbanov@mm-sol.com>
Cc: linux-arm-msm@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
 ath10k@lists.infradead.org, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org
References: <2h9GS3myO9uyX8sDYwU_43cDbBCW_SE1h5qolKQLKT9ZVvz0-K6z6cix50eVsgMsYLtgTLsW37DxF0lf78vxCA==@protonmail.internalid>
 <20211006035407.1147909-1-dmitry.baryshkov@linaro.org>
From: Caleb Connolly <caleb.connolly@linaro.org>
In-Reply-To: <20211006035407.1147909-1-dmitry.baryshkov@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211102_070535_667235_57F9C6F2 
X-CRM114-Status: GOOD (  20.24  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

Hi Dmitry,

On 06/10/2021 04:53, Dmitry Baryshkov wrote:
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
> 
> Changes since RFC v2:
>   - Add documentation for the pwrseq code. Document data structures,
>     macros and exported functions.
>   - Export of_pwrseq_xlate_onecell()
>   - Add separate pwrseq_set_drvdata() function to follow the typical API
>     design
>   - Remove pwrseq_get_optional()/devm_pwrseq_get_optional()
>   - Moved code to handle old mmc-pwrseq binding to the MMC patch
>   - Split of_pwrseq_xlate_onecell() support to a separate patch
> 
> Changes since RFC v1:
>   - Provider pwrseq fallback support
>   - Implement fallback support in pwrseq_qca.
>   - Mmove susclk handling to pwrseq_qca.
>   - Significantly simplify hci_qca.c changes, by dropping all legacy
>     code. Now hci_qca uses only pwrseq calls to power up/down bluetooth
>     parts of the chip.
> 
> 
> 
Tested-by: Caleb Connolly <caleb.connolly@linaro.org>
[Tested on the OnePlus 6]

-- 
Kind Regards,
Caleb (they/them)

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
