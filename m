Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2DE6C05027
	for <ath10k@archiver.kernel.org>; Sat, 18 Feb 2023 01:34:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bonqryXuAWTuWDNZqEnlF5pvw7kDnn4uWUe8RrfWMTo=; b=Kz2PwNlrOU8Hj0
	HkztN+ZochARLYH2qGdEL0GoVd/n3qvXDEtWsW0iUQwwzaB3vbakFCuG0aq1LmaB9E2YVty2m9mP/
	/mGCohfmPCvkE4BIScpGcSWF5rYQvf+gA83rCcPkGG2q7BY0VmKnRAU+yCmI/L5zu6v5BB88e86bA
	LLDuNl4fS2bwqjO30C6+Wy72dAmlufoqxulhOshOTEIMkuFOhbK0ZUU7PcLEoJbjoLaPR+MeHo24z
	po0u7u9Fn7d4B44a4uEXrknB3QqZdr/2m6Ch+2XB3hIRVuBHp77JhbmvMwnObMR/rT7OcKnOYeMGA
	JbvIbxra+VE0oZSOeGkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pTC6c-00G8lV-Bx; Sat, 18 Feb 2023 01:33:38 +0000
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pTC6X-00G8kk-72
	for ath10k@lists.infradead.org; Sat, 18 Feb 2023 01:33:37 +0000
Received: by mail-lj1-x229.google.com with SMTP id f3so2581404ljn.12
        for <ath10k@lists.infradead.org>; Fri, 17 Feb 2023 17:33:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IuVW2CZdmVPPL009AhM1dwVCROCD9NP4LtUFzTmDF/g=;
        b=OnX+xtZpI/R679FSSSy+jfjkNnJLsFd2irLrXV+dz5h5CZh8sXN13ObBbkcvVmMZcL
         Zrv5pGM6QnwyZknxyWBCctLYigb9OAjB/YJZgGIyJy9le3RxS9jzyoGaekK6hfeDKYkY
         mYw1tykwVvZBrP6hOgRyU3DhAg+oOW38JIAdmIRXpoGmcnkGw27jSHkEpnZvuKc5Ff0E
         X0bwK+ypLLySUqQbiJ77HkianPFK5gf51ccLdMoAdrJzMvD1yWJmmO2rLVPDlzrTselH
         /Tlz6JroqBqLtn6uUkziKkqPkpY6T5KbqdGrrFVvPgYqD2lGfvKzdAHX0Jkr/h2NmOgb
         CVzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IuVW2CZdmVPPL009AhM1dwVCROCD9NP4LtUFzTmDF/g=;
        b=uPIyCHjsZh/psUHkO2IyIBinWXfWeImK2AE3lOfES225C4hCBAI0o8+vImyL9q4TXs
         LQ0qeAM6sGKxwCLA15rWgRUUb6pKUUnOBB4401DxUqSKHEzGyqcWI0xUDoJ/mCaSDS8N
         gX0DngxWssxqX0c6WXb3VG5gsVYuP3xYpY5FOzBQV+LqVGiDVFGpBQS8t9YieTEKORw4
         D4VHQKmHX6NNTkGgFxnxqjf37YLKfqz0M0MqhIQWmvAq/Gv2vBL6uvOX5dBb6UEHP1R6
         GF1NHnSl/nYKHrrAcwdUv4FFp2WRCV1rDKUMqRogIri2YIhstMUShbZBAmKHiLS4JSQQ
         hPiA==
X-Gm-Message-State: AO0yUKXI8c9zhFD2KaAVxMA7ZFTI5fRGvKjHYAH1+891sKXPQZnp7qvj
	GMp7CJfPUKYkf97iiwZ5u6/+0ePZluGSPX8F
X-Google-Smtp-Source: AK7set96NnuGQ4KE6QC/nqape/t3SOt9k4jE5QewYTOQk8GjgY5ongK+MfbVDH3OLXmTq2an8p+kYA==
X-Received: by 2002:a2e:9097:0:b0:293:50e7:3d07 with SMTP id l23-20020a2e9097000000b0029350e73d07mr563220ljg.14.1676684010134;
        Fri, 17 Feb 2023 17:33:30 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id s3-20020a2e98c3000000b002934ea0def9sm736302ljj.140.2023.02.17.17.33.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Feb 2023 17:33:29 -0800 (PST)
Message-ID: <81448efc-5b77-5022-5b9f-3b5188509068@linaro.org>
Date: Sat, 18 Feb 2023 03:33:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: ath10k-firmware: WCN3990: Add board file for the Lenovo Yoga C630
 laptop
Content-Language: en-GB
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: ath10k@lists.infradead.org
Cc: "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>
References: <CAA8EJpqrHuTaN-bB6XoB7ZWNvfggNtMts3bBQwqMH8RpO1E3QQ@mail.gmail.com>
In-Reply-To: <CAA8EJpqrHuTaN-bB6XoB7ZWNvfggNtMts3bBQwqMH8RpO1E3QQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230217_173333_293417_CE34CC8F 
X-CRM114-Status: GOOD (  16.50  )
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

Hello Kalle,

On 07/10/2022 15:22, Dmitry Baryshkov wrote:
> We'd like to ask for inclusion of the board file for the Lenovo Yoga
> C630 laptop. It is
> a WfA laptop using the Snapdragon SDM850 SoC.

I noticed that you've updated the WCN3990's board-2.bin, but this file 
was not included. Are there any issues with the submission?

> Following the questions from the ath10k wiki page:
> 
> * description for what hardware this is
> - It is an SDM845-based platform (SDM850)
> - It uses wcn3990 chip as a WiFi and BT radio
> - For the reference: [    8.727834] ath10k_snoc 18800000.wifi: qmi
> chip_id 0x30214 chip_family 0x4001 board_id 0xff soc_id 0x40030001
> 
> * origin of the board file
>    - They come from the original Windows partition, thus being a part
> of Windows drivers.
> 
> * ids to be used with the board file
> bus=snoc,qmi-board-id=ff,qmi-chip-id=30214,variant=Lenovo_C630
> 
> Note, the device comes with the board_id not changed from 0xff.
> Following the example of Chromebook boards we are adding the
> calibration variant.
> 
> * md5sum of each new board file to add
> 
> $ md5sum *
> 6cd260ad261193fb8b3ddf5293d0103f
> bus=snoc,qmi-board-id=ff,qmi-chip-id=30214,variant=Lenovo_C630.bin
> 
> $ sha256sum *
> ff96e5295cc3e3fd86f04049058396cd69cd7f1bc44ef4784f13ffe48ef42a8d
> bus=snoc,qmi-board-id=ff,qmi-chip-id=30214,variant=Lenovo_C630.bin

-- 
With best wishes
Dmitry


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
