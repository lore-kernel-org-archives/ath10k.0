Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE975C74A4B
	for <ath10k@archiver.kernel.org>; Fri, 10 Mar 2023 07:57:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7eNF4hVmAGjMPgKiPFJUytU/35iu2EfWSMFJ67DK2q4=; b=voK/3+Bq1lcyWN
	/1nh0XwxHpvljv6OwqYvi6t+EyL0sCnc2/tjsMIeipKtxu5Djp1g5sk4mwXR+ZWLOcibJFMogAexG
	HraRtvf0YO/Onl7tp6RGwxT3CV88E4y+ViuIKf+O1BHECPiVwyoU0y+KkwBXLnacHxvVZQtxqIMrC
	6UQNZcbm6jU4El9aJzJ/0dmWXm/2RLFT80ENEQoLo7X01WMzJJrLwYLiVH/PjykDNWDlQJoCT4bVd
	HQmguUa6mrRgqVNRTzvzt2s/pCdJHx+nPVKf6dfid7TkV1BXnqIDqZlVLn/Rqg5AOqzwjPIqdM34s
	bV4vxFt2MlO13bvPRmgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paXcW-00DUai-7d; Fri, 10 Mar 2023 07:56:56 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paXcT-00DUZm-0E
	for ath10k@lists.infradead.org; Fri, 10 Mar 2023 07:56:54 +0000
Received: by mail-ed1-x529.google.com with SMTP id j11so17033394edq.4
        for <ath10k@lists.infradead.org>; Thu, 09 Mar 2023 23:56:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678435011;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Na4vhlLIT8h87R1c4saJtnoc0rpStTN6SAaJv5Ui0DU=;
        b=f/cdum7O6TN5gJ9ROGgx6QjE0oljMSgdfelOxJDv/A44aZ7Mm1unTj43LMrAl8qXD3
         sHI50PXnWoUWOCaGf+Lw7NcDVU4NiPijijYupEKrMb/i7yVzAFSIs2Sdxro3W9NWDoHv
         l0FZKC3iXGb6IU9h1xEP+L1xj0TStwEsdmZgH7BeJN1yxjzdFSB6oJFobXTUS45dVs0M
         ULQH07khMas1d0aBIt/OjZLOHVTDe9lhbsnUreYNdh+WszcP/mDLVMMeWmaL4KFGK0LG
         +5HnCCB4hC8JohJPmZdM8SSKIi+lKSrrSUXogyHzjsDGs1U97Mara0hXF/7LevUFdWY9
         OvCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678435011;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Na4vhlLIT8h87R1c4saJtnoc0rpStTN6SAaJv5Ui0DU=;
        b=e9GTGRPUYcDP9ALhhtnv2hrHDzSdenkYPH7oxZ6f4PiylUuQEcoTy4kfvjvPVKvblZ
         X8MVITZflMKT9hqkaXCkbZdSA3364/B04jtfmugv6XWX+GwxehCsSrwkeD4HTJvc2MzS
         PNiNFy3BVYVf79SLZRNrSqAie+GuHdPrDuEHKFYAPhO+l0bh8lyi+tNuV9i/kT76oKT3
         lYYgz+e+cTW3ZODakLaBZKCAujBwBLozQbP8Yzg0FPhvboy4D/Dn3w/H7kCkpGUhjCCh
         7lJuo4+cRPRCI7lWH+RKtvKxQMRp3WYW6tqAk884SMVT6+IlJGA1oDYuCUigXkvzxt+z
         XcMA==
X-Gm-Message-State: AO0yUKVA7eEhwU2sBBZYwOArzTmivHqhZL+VLvErDbnTeXyI+aJ32ueR
	KrkF318mc9O3UMES28ItqnoTCQ==
X-Google-Smtp-Source: AK7set83ouw7MBm0jqo5iH57IkMFwoOVUzIry7zQggJ4hxcJBeN03UC69xrHLWNGpiqGw+nvqtrohA==
X-Received: by 2002:a17:906:eecc:b0:90b:167e:3050 with SMTP id wu12-20020a170906eecc00b0090b167e3050mr30865633ejb.36.1678435011591;
        Thu, 09 Mar 2023 23:56:51 -0800 (PST)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ox11-20020a170907100b00b008cf6f8798e1sm641097ejb.54.2023.03.09.23.56.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Mar 2023 23:56:50 -0800 (PST)
Message-ID: <6108c68b-e38b-3060-f6fa-53be79a795d7@linaro.org>
Date: Fri, 10 Mar 2023 07:56:49 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v1 01/15] dt-bindings: add pwrseq device tree bindings
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Herring <robh@kernel.org>
Cc: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Ulf Hansson <ulf.hansson@linaro.org>, Marcel Holtmann <marcel@holtmann.org>,
 Johan Hedberg <johan.hedberg@gmail.com>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
 Kalle Valo <kvalo@codeaurora.org>, "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, Stanimir Varbanov <svarbanov@mm-sol.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 linux-mmc <linux-mmc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:BLUETOOTH DRIVERS" <linux-bluetooth@vger.kernel.org>,
 ath10k@lists.infradead.org, linux-wireless <linux-wireless@vger.kernel.org>,
 netdev <netdev@vger.kernel.org>, Abel Vesa <abel.vesa@linaro.org>
References: <20211006035407.1147909-1-dmitry.baryshkov@linaro.org>
 <20211006035407.1147909-2-dmitry.baryshkov@linaro.org>
 <YXf6TbV2IpPbB/0Y@robh.at.kernel.org>
 <37b26090-945f-1e17-f6ab-52552a4b6d89@linaro.org>
 <CAL_JsqLAnJqZ95_bf6_fFmPJFMjuy43UfP2UxzEmFMNnG_t-Ug@mail.gmail.com>
 <31792ef1-20b0-b801-23b7-29f303b91def@linaro.org>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <31792ef1-20b0-b801-23b7-29f303b91def@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230309_235653_079320_6B4D0AD4 
X-CRM114-Status: GOOD (  31.07  )
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



On 02/11/2021 15:26, Dmitry Baryshkov wrote:
> On 28/10/2021 00:53, Rob Herring wrote:
>> On Tue, Oct 26, 2021 at 9:42 AM Dmitry Baryshkov
>> <dmitry.baryshkov@linaro.org> wrote:
>>>
>>> On 26/10/2021 15:53, Rob Herring wrote:
>>>> On Wed, Oct 06, 2021 at 06:53:53AM +0300, Dmitry Baryshkov wrote:
>>>>> Add device tree bindings for the new power sequencer subsystem.
>>>>> Consumers would reference pwrseq nodes using "foo-pwrseq" properties.
>>>>> Providers would use '#pwrseq-cells' property to declare the amount of
>>>>> cells in the pwrseq specifier.
>>>>
>>>> Please use get_maintainers.pl.
>>>>
>>>> This is not a pattern I want to encourage, so NAK on a common binding.
>>>
>>>
>>> Could you please spend a few more words, describing what is not
>>> encouraged? The whole foo-subsys/#subsys-cells structure?
>>
>> No, that's generally how common provider/consumer style bindings work.
>>
>>> Or just specifying the common binding?
>>
>> If we could do it again, I would not have mmc pwrseq binding. The
>> properties belong in the device's node. So don't generalize the mmc
>> pwrseq binding.
>>
>> It's a kernel problem if the firmware says there's a device on a
>> 'discoverable' bus and the kernel can't discover it. I know you have
>> the added complication of a device with 2 interfaces, but please,
>> let's solve one problem at a time.

Just to keep this topic updated with some pointers [1] to changes done 
to solve same problem in USB Hub. These patches 
(drivers/usb/misc/onboard_usb_hub*) have been merged since last year July.

It looks like we can take some inspiration from this to address PCIE Bus 
issue aswell.

Thanks to Neil to point this.

[1] 
https://lore.kernel.org/lkml/20220630193530.2608178-1-mka@chromium.org/T/


--srini
> 
> The PCI bus handling is a separate topic for now (as you have seen from 
> the clearly WIP patches targeting just testing of qca6390's wifi part).
> 
> For me there are three parts of the device:
> - power regulator / device embedded power domain.
> - WiFi
> - Bluetooth
> 
> With the power regulator being a complex and a bit nasty beast. It has 
> several regulators beneath, which have to be powered up in a proper way.
> Next platforms might bring additional requirements common to both WiFi 
> and BT parts (like having additional clocks, etc). It is externally 
> controlled (after providing power to it you have to tell, which part of 
> the chip is required by pulling up the WiFi and/or BT enable GPIOs.
> 
> Having to duplicate this information in BT and WiFi cases results in 
> non-aligned bindings (with WiFi and BT parts using different set of 
> properties and different property names) and non-algined drivers (so the 
> result of the powerup would depend on the order of drivers probing).
> 
> So far I still suppose that having a single separate entity controlling 
> the powerup of such chips is the right thing to do.
> 
> I'd prefer to use the power-domain bindings (as the idea seems to be 
> aligned here), but as the power-domain is used for the in-chip power 
> domains, we had to invent the pwrseq name.
> 

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
