Return-Path: <SRS0=CwSx=HE=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88DDCC433E0
	for <ath10k@archiver.kernel.org>; Tue,  2 Feb 2021 11:12:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 295B964E06
	for <ath10k@archiver.kernel.org>; Tue,  2 Feb 2021 11:12:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 295B964E06
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=jfTzauVBUkIodH5uObaHKPql4i2sERsVc7CYJqcSmnU=; b=GO7Y10oFTRZE9iSli5R9QevTG
	Vnaceum4fYDOuufTMt9gwxfB/qyB0Qx6nGD/eyDCCBvm9KUzGbaUshdE9V3oK0AH5wS+3vQigP4HJ
	ZEoJNWvAFnkigLRNJu8VX0h9CjHuW3JWGou6PzFx43KZ6nzBQnueq8RHiDLjuAYpi+ioQBZOG4KLL
	BSyGA/Cjy2WMjbiBLjvuYXMeEN/+I5EQDoCwG+G8j6AabdRXVYWkM8HjBdu/+aUSft8ToNbFZ7Kv1
	sZWYUjbMYKPH21K1rct8PPqzMyE+/fyIWXMYzyUyNiNGZfCW3g7vs2Pm7pl1oz+ykmXaVyySqdw+P
	HVxvotIcw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l6tbF-0003FD-Fu; Tue, 02 Feb 2021 11:12:01 +0000
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l6tbC-0003EU-UN
 for ath10k@lists.infradead.org; Tue, 02 Feb 2021 11:12:00 +0000
Received: by mail-yb1-xb2b.google.com with SMTP id m76so13295461ybf.0
 for <ath10k@lists.infradead.org>; Tue, 02 Feb 2021 03:11:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=x/bHfvCMAqb1V7v7A4IFiandeTfZNu+bcanftQaRqOs=;
 b=C38eO2uux41TbI58aglk3idPPs7gQLHEvTYJmZb8yC4zQ/IwysV7nuPPPHd3anr7W5
 Okg1fS/8QhuDv2Z85twPmvBxyGaI3l7iJmOOtrAkxyswGEojsOFHtOgJ69dD9J1nbTSW
 N9FZtNLlVEYvsZAj8ECfLofgy/nUbaQdQ8owKp554KAysP9NV2Bc8wzEFrI/Ne3agsmz
 09t/mr5EAcSsAi5SFaUSSbOpCIls3rowEgQoah6ysP9RxBL0vFwAPiXDT2UwS0WsounG
 mMRRNpmAYaprRlnJ5Sgkyg4yOgL5rMJu8BHhHNGOkRAGW9YSG1/6fh2b5Ihdb2s+NsnB
 Ax3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=x/bHfvCMAqb1V7v7A4IFiandeTfZNu+bcanftQaRqOs=;
 b=l2zXx76+jC+eHze2wgztcAy7p+kWymPvGJNXpiWJYsVU2Xsd1R0ewGZVR6ubZ+N5RA
 0q8DmD7Nqwe4nzwq9Eqz+o3jS+KONwUm77VVEUir1sHqax53MRNCTX7fdjbAQkHNJnVp
 a8t4JMfowpDeWzNkrqtObaLDEWH0YOXxmMTp0b1RUsnHB5zoamxo/dIAC+d8T57VExsx
 JniobLp7JmAYiySPXu7/suwY9vWPupn0e8uQ8CBW/iTVmgF4/VGEvLgp56GxJxGE5DZF
 i7FuWW8M02T4869+2tj10TfFIL3NtSLAfUB087LAKZ6hdhhiiZNtiWDwibwHB5kGcj2s
 bbjg==
X-Gm-Message-State: AOAM533YQRDGdLHWnoMfnQAz3NIy9mXbMJhIAw/HBQkTLJwBkhdA+oys
 RABe7ilHMBuCAxl906q4IJYqRaJFOuyo8KK50te1tA==
X-Google-Smtp-Source: ABdhPJyUoRohpUuiZdZg6GMhYw0kD23x1MnP6h4YqY8QzzNrKMDZjxYkcKrbZvY8iZx3OoRsJW5EKu4EHY4mgHG524k=
X-Received: by 2002:a25:da41:: with SMTP id n62mr29665321ybf.155.1612264315156; 
 Tue, 02 Feb 2021 03:11:55 -0800 (PST)
MIME-Version: 1.0
References: <1601058581-19461-1-git-send-email-amit.pundir@linaro.org>
 <20200929190817.GA968845@bogus> <20201029134017.GA807@yoga>
 <CAMi1Hd20UpNhZm6z5t5Kcy8eTABiAj7X_Gm66QnJspZWSio0Ew@mail.gmail.com>
 <20201124175146.GG185852@builder.lan> <87sg8heeta.fsf@codeaurora.org>
In-Reply-To: <87sg8heeta.fsf@codeaurora.org>
From: Amit Pundir <amit.pundir@linaro.org>
Date: Tue, 2 Feb 2021 16:41:19 +0530
Message-ID: <CAMi1Hd2FN6QQzbKHooVyqQfH1NFTNLt4RwxyVXRf+5DwTc9ojg@mail.gmail.com>
Subject: Re: [PATCH] ath10k: Introduce a devicetree quirk to skip host cap QMI
 requests
To: Kalle Valo <kvalo@codeaurora.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210202_061159_100456_F18F0F3B 
X-CRM114-Status: UNSURE (   9.30  )
X-CRM114-Notice: Please train this message.
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
Cc: Rob Herring <robh@kernel.org>, dt <devicetree@vger.kernel.org>,
 netdev@vger.kernel.org, Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
 linux-wireless@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>,
 ath10k <ath10k@lists.infradead.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 John Stultz <john.stultz@linaro.org>, Jakub Kicinski <kuba@kernel.org>,
 Konrad Dybcio <konradybcio@gmail.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 David S Miller <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

Hi Kalle,

On Mon, 7 Dec 2020 at 22:25, Kalle Valo <kvalo@codeaurora.org> wrote:
>
> This is firmware version specific, right? There's also enum
> ath10k_fw_features which is embedded within firmware-N.bin, we could add
> a new flag there. But that means that a correct firmware-N.bin is needed
> for each firmware version, not sure if that would work out. Just
> throwing out ideas here.

Apologies for this late reply. I was out for a while.

If by that (the firmware version) you mean "QC_IMAGE_VERSION_STRING",
then that may be a bit tricky. Pocophone F1 use the same firmware
family version (WLAN.HL.2.0.XXX), used by Dragonboard 845c (which has
Wi-Fi working upstream).

Regards,
Amit Pundir

>
> --
> https://patchwork.kernel.org/project/linux-wireless/list/
>
> https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
