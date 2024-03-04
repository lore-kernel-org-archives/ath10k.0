Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92D03C48BF6
	for <ath10k@archiver.kernel.org>; Mon,  4 Mar 2024 16:21:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2NauviWk607nxbEN2DlOAU5kjIWJKRTn3ayaQZc8Isw=; b=sXjcNPxJV5HYOL3rmzNgxK7qta
	HDHhz8egkeG9dhODRCQo9Mdh/A7Bv1fXz2Dv7V/ZjbymnAGml9QVvNWxarn1fy29sQVaE6z8xyCiX
	QU6wpSivEmoV4G/oEjyKcWHSwdgQoZ5lgDQSYE3QQ6jjCwrCY6LPjS2eGvLaVEUKfdB3ALSi+v/0r
	0LK/6ZXTC1UdLyeL2coHvvV2seBsIbjNXyFo6N2cLyhxwghVgwI1ogt9tA+xy6lHUxpn7QcpUZP1N
	L5Jq7E+B8bfoi/yAD+suXkd5uz56FEQNlepybnXoisVLqoqQQSiP5+gfpjiSkFJQjNatKJFf6bPiw
	d8JdyOOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhB4S-00000009oYN-0w84;
	Mon, 04 Mar 2024 16:21:44 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhB4P-00000009oXG-06NS
	for ath10k@lists.infradead.org;
	Mon, 04 Mar 2024 16:21:42 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-33e285a33bdso1370320f8f.2
        for <ath10k@lists.infradead.org>; Mon, 04 Mar 2024 08:21:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1709569299; x=1710174099; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2NauviWk607nxbEN2DlOAU5kjIWJKRTn3ayaQZc8Isw=;
        b=eDrpW+oHkbKG0quF1Rb313EX48urTqMJkniAgoTbSeBwPb5n71iT2aSu5UI4rPMDr+
         ILgDjVUf/JAMrlQrQLcYATpxcRugVCRB2PCs0dmM/PnvY+2VsjunI5K8MoP9U8N1a9Kg
         aBtGkzr/UxGihAX41lo6CH2XlXbsdTYfL+Ps6COCOtq1UqIVOU0/HyfRVgKyVpyPW39a
         1dwinCSM/LR10VH+37a0nPPKGixM3SdJhJ1kK9cPPRZWVom7Cbw3+dfSF7mC13SVK0YN
         B9A1oSVeRT5lkWy0VlaBO0jtu11L/qIouVb6ZC43qHc2d4JeOvti/dvY7I/5OisoABEk
         GZEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709569299; x=1710174099;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2NauviWk607nxbEN2DlOAU5kjIWJKRTn3ayaQZc8Isw=;
        b=dtYtwfw+NfwEHL2+WLj8CIh66F4XDAQBAttoX44D3h9AVmCmA/hVQQwejCRO+w+bzA
         K4fNDKze/kz0Kd6ZoDSp0kDz/1zVa4eDCGP5YNERZ/iW0YYvyDGbZYLPqZmWG5EvBTCR
         aJhfMAXGHdYwKqmn8UE6mucYsaGbfo+Ll6oZKkOC5lqr1yBh3XbInal63i6FWMoU7Pme
         gJ1Yp8qaVywI49N4DFLgFg+s6M63kTcH2bQtogBCNxJIUWc2g7W4tW/NmIKT+BryQc5f
         9ik6RhfCOz8ENGTQFQEE+fm6cByjcn9+qwIjP+296A+3IfWM56AxbkB4AfrEnGPU6/EE
         px5Q==
X-Forwarded-Encrypted: i=1; AJvYcCWcLzusOkthfrWTNJrIOKobc4AWgRINcXu433Hw0Iu7G/M79tBinxCMHiJDl7+IIn7rdo0/1nYedvKiT+kpki34KMUsUDp3+qZOeg==
X-Gm-Message-State: AOJu0YwM2xsrcIXmsSEMsqMgykZa3scP8DKGMc0bHXBkJZMXGgfY4rur
	Sb68CBGkIYkR6gR18+aRXpeY/8+u2zxrnSw9wrZE9eDZ3/ebTjKBeUiHWISY8s4=
X-Google-Smtp-Source: AGHT+IFeuAkLZo+7SpvCw19rJhG+qBzOg0lkgNPbLPmlzxdr5EnioyfQyd2ksDtt5/vGI8oC1ahhPQ==
X-Received: by 2002:a5d:42cb:0:b0:33d:d84f:1ef0 with SMTP id t11-20020a5d42cb000000b0033dd84f1ef0mr6098847wrr.12.1709569298835;
        Mon, 04 Mar 2024 08:21:38 -0800 (PST)
Received: from [192.168.108.81] (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id az23-20020adfe197000000b0033e4403c6a9sm1552302wrb.22.2024.03.04.08.21.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Mar 2024 08:21:38 -0800 (PST)
Message-ID: <68a49964-7c05-4575-a4f3-35848c08fefc@freebox.fr>
Date: Mon, 4 Mar 2024 17:21:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: net: wireless: ath10k: add
 qcom,no-msa-ready-indicator prop
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>, Kalle Valo <kvalo@kernel.org>
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>,
 ath10k <ath10k@lists.infradead.org>,
 wireless <linux-wireless@vger.kernel.org>, DT <devicetree@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Pierre-Hugues Husson <phhusson@freebox.fr>,
 Jami Kettunen <jamipkettunen@gmail.com>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <14daa98e-7fd3-4ebb-87bb-5d2c1fba679f@freebox.fr>
 <b8de96c7-cbb6-4a09-a4d4-2c11b3ab3e01@freebox.fr> <871q8wk7o3.fsf@kernel.org>
 <3392f356-7b19-483d-b9f8-3bd84068fa52@freebox.fr> <87wmqoilzf.fsf@kernel.org>
 <20240229-ageless-primal-7a0544420949@spud>
From: Marc Gonzalez <mgonzalez@freebox.fr>
In-Reply-To: <20240229-ageless-primal-7a0544420949@spud>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240304_082141_154446_3474C2C8 
X-CRM114-Status: GOOD (  21.18  )
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
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

On 29/02/2024 19:40, Conor Dooley wrote:

> On Wed, Feb 28, 2024 at 06:37:08PM +0200, Kalle Valo wrote:
>
>> Marc Gonzalez wrote:
>> 
>>> As mentioned in my other reply, there are several msm8998-based
>>> devices affected by this issue. Is it not appropriate to consider
>>> a kernel-based work-around?
>>
>> Sorry, not following you here. But I'll try to answer anyway:
>>
>> I have understood that Device Tree is supposed to describe hardware, not
>> software. This is why having this property in DT does not look right
>> place for this. For example, if the ath10k firmware is fixed then DT
>> would have to be changed even though nothing changed in hardware. But of
>> course DT maintainers have the final say.
> 
> I dunno, if the firmware affects the functionality of the hardware in a
> way that cannot be detected from the operating system at runtime how
> else is it supposed to deal with that?
> The devicetree is supposed to describe hardware, yes, but at a certain
> point the line between firmware and hardware is invisible :)
> Not describing software is mostly about not using it to determine
> software policy in the operating system.

Recording here what was discussed a few days ago on IRC:

If all msm8998 boards are affected, then it /might/ make sense
to work around the issue for ALL msm8998 boards:

diff --git a/drivers/net/wireless/ath/ath10k/qmi.c b/drivers/net/wireless/ath/ath10k/qmi.c
index 0776e79b25f3a..9da06da518fb6 100644
--- a/drivers/net/wireless/ath/ath10k/qmi.c
+++ b/drivers/net/wireless/ath/ath10k/qmi.c
@@ -1076,6 +1076,9 @@ int ath10k_qmi_init(struct ath10k *ar, u32 msa_size)
 	qmi->ar = ar;
 	ar_snoc->qmi = qmi;
 
+	if (of_device_is_compatible(of_root, "qcom,msm8998")
+		qmi->no_point_in_waiting_for_msa_ready_indicator = true;
+
 	if (of_property_read_bool(dev->of_node, "qcom,msa-fixed-perm"))
 		qmi->msa_fixed_perm = true;
 

Thus, anyone porting an msm8998 board to mainline would automatically
get the work-around, without having to hunt down the feature bit,
and tweak the FW files.


-- 
Regards


