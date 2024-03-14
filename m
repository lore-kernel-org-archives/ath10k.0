Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D43C7C54E67
	for <ath10k@archiver.kernel.org>; Thu, 14 Mar 2024 12:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gE5wEUzP7oRy3rpOImMIWYyKlvOqAt+4cy9tZHxAd+w=; b=RRJQIupqS4zZ2C1sMAKQTMluML
	jpke/PkjnkYFLwVjmlFZ44513ba7rcFoKs2Oo6eLppqWMOIj1COsXrkljyGbOi8SAZZy5UqrgZebB
	Mvrdxbk+Irmdm6pgcbAPp5E78W45+tYTJXBzi4+zsvTpeS/6bb/kwNbB8gO2Re0YDN1iXeO32TNNn
	YSvLznIeG+kBdwErfP288tVTVhyooG4Bcl1NfF7Cxm2onde63NMZGVABoziuLhElSjmMMRfwzC0b+
	WvrO9Mqg3kpLCsdQRR26zAfHRTF0/qM+FPrDypyxJKB7TMa0HDXzYAzMWYowMOhWKsozygYWOXM/C
	t6DVOz/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkkFW-0000000EGLv-2q4U;
	Thu, 14 Mar 2024 12:31:54 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkkFQ-0000000EGGx-1gJX
	for ath10k@lists.infradead.org;
	Thu, 14 Mar 2024 12:31:52 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-413fd732176so117405e9.0
        for <ath10k@lists.infradead.org>; Thu, 14 Mar 2024 05:31:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1710419506; x=1711024306; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gE5wEUzP7oRy3rpOImMIWYyKlvOqAt+4cy9tZHxAd+w=;
        b=BUJOjUMvUln2lSMaa4Y4N/yqDBMDMyj0o0tdnSNZAohetgY/Fd9w+rACZcyYsPGv2J
         POJ6QGsKjUtIhV3ebRR2jn04ml8BDsy60uWQWH0Uggq8Mm+kG+nHWjG27Ms2OktK9SOr
         FA6Ae8hhS1rDYnVXNe4R+RSHj6TMzK2yar/IiUBXoehliNWAm74En2gWaGZ94MFTcJYY
         tXP7qoGf4FnZrJKsiiJQrWW0KdC0J+uUE/TgjZ8tR6tV2hUxublJ07Aks+aixobQ581F
         8XhbEnSzSResz2iSHHcpzgLqARfbl1XouPYa1zPO+3aOXgil8592HJmDS15SaRj+lZvv
         0QhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710419506; x=1711024306;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gE5wEUzP7oRy3rpOImMIWYyKlvOqAt+4cy9tZHxAd+w=;
        b=nhB+FUJYG2oa9nFJK6co2UZIrTRFbL9Ehgj2D9x09JuX+HY2Mb2iA29e/8D0GoNjwl
         vUOvoVLxaWRytpJaJvkRzEJ5GQ5un62GEnxy6fN4LWVWjVcCoA+hSzNm9/BdCg16/nky
         UYn5esXLE/flh87Fu651WioQQvh8Xq0Lay7XI0YhKMAGMT2NDmV85kgCgYsvzf93yfBb
         NU4t8QCOeOnzqCev7hj2uNcU1nv3Va9ZtaKqJ8uRYI2xCoQ71mbfAwVWDqP+gyq1vVx0
         tsdwiNIwbDlx1PUxkBrs3UugtoqCgvlFuQtjrXCMsB2RkYJVQ1sdNmBy1jhuikl3OLws
         /bew==
X-Forwarded-Encrypted: i=1; AJvYcCVC6/zaW6d24R/+k+NufmoRD3G51VD4h11DAnrLuLbFm9zVvDHXghIUIidPJ9cgAo98I4zw1Q4pN3EFVu2up2iNyQtujeTnsWBCqQ==
X-Gm-Message-State: AOJu0YwNnE14JULKD2ivVyhZ+Qj8fJJ54sTJsxCrUet/U3dUj5B0Zeuj
	uMKhYO/ecCocRgIXVkvHEI7eycLwJ29gO1G8WfcwK2ZcHQRGPbsXfd9F76KYRu4=
X-Google-Smtp-Source: AGHT+IGz1iLcUF/1hNFI8SsZo3VRQ0H0FsSZ2Wlq2pNKXkkk0OSmNI0yqN9iyYu5/VCpoSTCzs4/zg==
X-Received: by 2002:a05:600c:3150:b0:413:f7c4:f4fc with SMTP id h16-20020a05600c315000b00413f7c4f4fcmr659441wmo.15.1710419506243;
        Thu, 14 Mar 2024 05:31:46 -0700 (PDT)
Received: from [192.168.108.81] (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id s9-20020a05600c45c900b00413e79344b7sm2352745wmo.19.2024.03.14.05.31.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Mar 2024 05:31:45 -0700 (PDT)
Message-ID: <d23b5fc5-9fc2-4841-8eb9-b22a28f05f69@freebox.fr>
Date: Thu, 14 Mar 2024 13:31:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: net: wireless: ath10k: add
 qcom,no-msa-ready-indicator prop
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Kalle Valo <kvalo@kernel.org>,
 Jeff Johnson <quic_jjohnson@quicinc.com>, ath10k
 <ath10k@lists.infradead.org>, wireless <linux-wireless@vger.kernel.org>,
 DT <devicetree@vger.kernel.org>, Pierre-Hugues Husson <phhusson@freebox.fr>,
 Jami Kettunen <jamipkettunen@gmail.com>
References: <14daa98e-7fd3-4ebb-87bb-5d2c1fba679f@freebox.fr>
 <b8de96c7-cbb6-4a09-a4d4-2c11b3ab3e01@freebox.fr> <871q8wk7o3.fsf@kernel.org>
 <3392f356-7b19-483d-b9f8-3bd84068fa52@freebox.fr> <87wmqoilzf.fsf@kernel.org>
 <c58e67e6-6a7f-4963-86b9-580165bf05ba@freebox.fr> <87cyse8j9m.fsf@kernel.org>
 <6d4b1381-c121-4cda-a8c9-9ccac56bd447@freebox.fr> <87plw87nsc.fsf@kernel.org>
 <0816f7bb-3c97-4b90-8e19-191552ea6e26@freebox.fr> <87h6hk7aee.fsf@kernel.org>
 <fb0ffdd9-923a-4191-8304-583243ad528b@freebox.fr>
 <CAA8EJppHa=qEkKbSVs9hMCBXfhiC9MyAQO+v+6TCWhg==4CpOQ@mail.gmail.com>
From: Marc Gonzalez <mgonzalez@freebox.fr>
In-Reply-To: <CAA8EJppHa=qEkKbSVs9hMCBXfhiC9MyAQO+v+6TCWhg==4CpOQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240314_053148_945763_BB4CDDAF 
X-CRM114-Status: GOOD (  20.18  )
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

On 13/03/2024 16:53, Dmitry Baryshkov wrote:

> On Wed, 13 Mar 2024 at 17:09, Marc Gonzalez wrote:
>
>> On 05/03/2024 20:20, Kalle Valo wrote:
>>
>>> Marc Gonzalez wrote:
>>>
>>>> I need to build a kernel + rootfs + FW to test the proposed solution,
>>>> then I can spin a formal submission.
>>>
>>> Yeah, please do test this to make sure we are not missing anything :)
>>
>> I used buildroot ( https://buildroot.org ) to generate a kernel + rootfs
>> for my board (a variation of qcom/msm8998-mtp.dts)
>>
>> Not sure if I must use the vendor FW blobs? Or if I can use the blobs
>> from linux-firmware-20240115.tar.xz (as supported by BR2).
>>
>>
>> All I see from the ath10k driver (with debugging cranked to the max) is:
>>
>> [    0.539801] ath10k_snoc 18800000.wifi: Adding to iommu group 0
>> [    0.541941] ath10k_snoc 18800000.wifi: snoc xo-cal-data return -22
>> [    0.543633] ath10k_snoc 18800000.wifi: supply vdd-3.3-ch1 not found, using dummy regulator
>> [    0.544002] ath10k_snoc 18800000.wifi: qmi msa.paddr: 0x0000000094400000 , msa.vaddr: 0x(____ptrval____)
>> [    0.544271] ath10k_snoc 18800000.wifi: snoc probe
>>
>>
>> # ip link
>> 1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue qlen 1000
>>     link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
>> 2: enp1s0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast qlen 1000
>>     link/ether 34:27:92:82:48:ec brd ff:ff:ff:ff:ff:ff
>>
>> No wlan device at this point.
> 
> Do you have pd-mapper, rmtfs and tqftpserv running? You also need to
> have wlanmdsp.mbn in the same directory as modem.mbn for your platform
> (see how this is handled for sdm845).
> If these points are implemented and you still don't have the wlan,
> please check for tqftpserv messages in syslog.

I first tried using buildroot, which doesn't package these tools AFAICT.
I have now generated a debian rootfs, which does package them.


>> I got shell-shock from reading these setup steps:
>>
>> https://wiki.postmarketos.org/wiki/Qualcomm_Snapdragon_835_(MSM8998)#WLAN
>> https://github.com/jhugo/linux/blob/5.5rc2_wifi/README
> 
> These readmes are mostly correct. You don't need qrtr now, it is
> provided by the kernel.  pd-mapper (protection-domain-mapper),
> tqftpserv and rmtfs usually can be installed from your distro.

Can you explain a little bit why all the steps are required
just to be able to talk to the ath10k IP block?

It's just an MMIO device, right?

		wifi: wifi@18800000 {
			compatible = "qcom,wcn3990-wifi";
			reg = <0x18800000 0x800000>;
			reg-names = "membase";

Is the IP block behind some kind of switch that must be programmed
by a remote processor on the SoC?

Regards



