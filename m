Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C18E3C54798
	for <ath10k@archiver.kernel.org>; Tue,  5 Mar 2024 13:41:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mWMosuJd6KOK3Ke8ji6R8Nxsr6pMCIN4zMcfmAiXvcI=; b=ZMf1sZDuShsBDEXghcMZb3MzGZ
	UL62tf6zLfBc+YQ5/DCeDrsKtjpBHY1mrGf43BuLiyQbLNMIs8Q85mJJ2wkdz1DY30As2Oe6QU+Pl
	OwuKfwHQinWcIyc/Cn5vlN5AwaGHVUtFKERJNRNasdmFqVFU/DQdZgZkEhMKcc0h2cIz/KD2VrD0U
	1FurUksHyM7nVD2ai49dp+AOHPlkXg+IQgHqXFel39q6ebO6C2B9nRiFBvsrrfP0IOPYrhgU/iXi6
	y8/LOH0hS+GGJ4+s9Eq5vflrMBfxPYV6o21PpUSQuxH966ZuABSkK7/f9flx7ORqXc1nXkQ3Bcbq3
	SdLxw3cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhV2k-0000000DrE5-0hZ6;
	Tue, 05 Mar 2024 13:41:18 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhV2e-0000000DrAp-2aK1
	for ath10k@lists.infradead.org;
	Tue, 05 Mar 2024 13:41:16 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-563d32ee33aso6858651a12.2
        for <ath10k@lists.infradead.org>; Tue, 05 Mar 2024 05:41:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1709646070; x=1710250870; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mWMosuJd6KOK3Ke8ji6R8Nxsr6pMCIN4zMcfmAiXvcI=;
        b=MZWqpNBmIDMXO5rUhsFIqlmgnGRxMYqZe+v6+FhXGyCSrzuyCRqxtVowCM+N23cMO4
         ncUN6hy6A8PA93W0OqA3+9gSXokZgeRSrtJ/aIuywmHBCG/wwi6MQuDWlnIiDFWpmmD+
         YjDOFtD2IsvhtCMh/nQe6rPEkMvDPqSx5urkKBehv5ls+Qzs1406lzD82ZEIEHULFY1L
         gtX+Bgk6ufK+7y32hcvH3doOe9Qv3uA4VFhAEHd8GqtD0DhXWJToXg76krJganjT+yQk
         a2n8LQKD4rjxKK9ozrIGLDYTlqfkM2SBq2uiFXOJ8PgoTKdv+Q14IBg0q20oNhRKTAV4
         DlfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709646070; x=1710250870;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mWMosuJd6KOK3Ke8ji6R8Nxsr6pMCIN4zMcfmAiXvcI=;
        b=sRVqixjBpPaEkNZgXYH+ip0E3uHJc/k9EIK0UUhxQNHwCfTVPmxFn5/XdWhy/O34/z
         EL7+4nLLM76feVEPVQ4hBCYd8b9Uk7Tpzj13ZNMdmOy3+skSO+84CzaysXD8QaR5hDUk
         gyT+8s82Y9XLvwjFi2IvRQJkHgD6+YppS+FXdsNc1qjRM9TDcsPI6VHin6PrG/6C0/wH
         7SsEqTjx47lGV2USt6YBPZiZrjYEadx2X52wfFzI6ON5aCyarj5thxLH3vhQVmWkjeQW
         il6y/pwsPdGAKA8EGEPbWpnsM5hsVwkhdH8n9hoVgAE1e9yF32P4pjvzgCouT7Zxm1F3
         ix2w==
X-Forwarded-Encrypted: i=1; AJvYcCWclWFRpPnzb57DfA/wzBanBi2xQQDjljTFZnohMMhO3TDWb6drVMFDVoyMczj/BfH7fnz4Z5jcTFyiNrZd8jJIN4/x3MXuJqB8dw==
X-Gm-Message-State: AOJu0Yw9GPdNYk2ycv3Lww0syEBIDHDRy0WwEYZUAErZKfSoHPMzwyCP
	/fbvNoZjLV9ozdyvOHaO2xl5G7mPQewvRHMBJcY9mHH2yUl4hI6GkPrVamV85xc=
X-Google-Smtp-Source: AGHT+IHOy4H+KwN+3BZ2BxwwFf9wu6lXSZYWE8FaLOKY/ogkOvlTx3vkijOKPnd5EhunmsO46V6uLw==
X-Received: by 2002:a17:906:558:b0:a45:ae87:ec09 with SMTP id k24-20020a170906055800b00a45ae87ec09mr570427eja.60.1709646070166;
        Tue, 05 Mar 2024 05:41:10 -0800 (PST)
Received: from [192.168.108.81] (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id o7-20020a1709062e8700b00a4558314ea0sm2190947eji.15.2024.03.05.05.41.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Mar 2024 05:41:09 -0800 (PST)
Message-ID: <4df78b7e-92dc-45e4-9d5f-9ec8793c4fd3@freebox.fr>
Date: Tue, 5 Mar 2024 14:41:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: net: wireless: ath10k: add
 qcom,no-msa-ready-indicator prop
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>
Cc: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <quic_jjohnson@quicinc.com>,
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
 <68a49964-7c05-4575-a4f3-35848c08fefc@freebox.fr>
 <20240304-component-animator-e2ee0ab7574a@spud>
From: Marc Gonzalez <mgonzalez@freebox.fr>
In-Reply-To: <20240304-component-animator-e2ee0ab7574a@spud>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240305_054113_048518_5B5FD2AE 
X-CRM114-Status: GOOD (  24.76  )
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

On 04/03/2024 20:34, Conor Dooley wrote:

> On Mon, Mar 04, 2024 at 05:21:37PM +0100, Marc Gonzalez wrote:
>
>> On 29/02/2024 19:40, Conor Dooley wrote:
>>
>>> On Wed, Feb 28, 2024 at 06:37:08PM +0200, Kalle Valo wrote:
>>>
>>>> Marc Gonzalez wrote:
>>>>
>>>>> As mentioned in my other reply, there are several msm8998-based
>>>>> devices affected by this issue. Is it not appropriate to consider
>>>>> a kernel-based work-around?
>>>>
>>>> Sorry, not following you here. But I'll try to answer anyway:
>>>>
>>>> I have understood that Device Tree is supposed to describe hardware, not
>>>> software. This is why having this property in DT does not look right
>>>> place for this. For example, if the ath10k firmware is fixed then DT
>>>> would have to be changed even though nothing changed in hardware. But of
>>>> course DT maintainers have the final say.
>>>
>>> I dunno, if the firmware affects the functionality of the hardware in a
>>> way that cannot be detected from the operating system at runtime how
>>> else is it supposed to deal with that?
>>> The devicetree is supposed to describe hardware, yes, but at a certain
>>> point the line between firmware and hardware is invisible :)
>>> Not describing software is mostly about not using it to determine
>>> software policy in the operating system.
>>
>> Recording here what was discussed a few days ago on IRC:
>>
>> If all msm8998 boards are affected, then it /might/ make sense
>> to work around the issue for ALL msm8998 boards:
>>
>> diff --git a/drivers/net/wireless/ath/ath10k/qmi.c b/drivers/net/wireless/ath/ath10k/qmi.c
>> index 0776e79b25f3a..9da06da518fb6 100644
>> --- a/drivers/net/wireless/ath/ath10k/qmi.c
>> +++ b/drivers/net/wireless/ath/ath10k/qmi.c
>> @@ -1076,6 +1076,9 @@ int ath10k_qmi_init(struct ath10k *ar, u32 msa_size)
>>  	qmi->ar = ar;
>>  	ar_snoc->qmi = qmi;
>>  
>> +	if (of_device_is_compatible(of_root, "qcom,msm8998")
>> +		qmi->no_point_in_waiting_for_msa_ready_indicator = true;
>> +
>>  	if (of_property_read_bool(dev->of_node, "qcom,msa-fixed-perm"))
>>  		qmi->msa_fixed_perm = true;
>>  
>>
>> Thus, anyone porting an msm8998 board to mainline would automatically
>> get the work-around, without having to hunt down the feature bit,
>> and tweak the FW files.
> 
> How come the root node comes into this, don't you have a soc-specific
> compatible for the integration on this SoC?
> (I am assuming that this is not the SDIO variant, given then it'd not be
> fixed to this particular implementation)

I see only
"qcom,ipq4019-wifi"
"qcom,wcn3990-wifi"
"qcom,wcn6750-wifi"

arch/arm64/boot/dts/qcom/msm8998.dtsi uses "qcom,wcn3990-wifi"
(which is also used for 9 other SoCs).

IIUC, you're saying there probably should have been a generic
compatible AND a board-specific compatible, like for ufshc:

$ git grep qcom,ufshc arch/arm64/boot/dts/qcom
arch/arm64/boot/dts/qcom/msm8996.dtsi:                  compatible = "qcom,msm8996-ufshc", "qcom,ufshc",
arch/arm64/boot/dts/qcom/msm8998.dtsi:                  compatible = "qcom,msm8998-ufshc", "qcom,ufshc", "jedec,ufs-2.0";
arch/arm64/boot/dts/qcom/sa8775p.dtsi:                  compatible = "qcom,sa8775p-ufshc", "qcom,ufshc", "jedec,ufs-2.0";
arch/arm64/boot/dts/qcom/sc7280.dtsi:                   compatible = "qcom,sc7280-ufshc", "qcom,ufshc",
arch/arm64/boot/dts/qcom/sc8180x.dtsi:                  compatible = "qcom,sc8180x-ufshc", "qcom,ufshc",
arch/arm64/boot/dts/qcom/sc8280xp.dtsi:                 compatible = "qcom,sc8280xp-ufshc", "qcom,ufshc",
arch/arm64/boot/dts/qcom/sc8280xp.dtsi:                 compatible = "qcom,sc8280xp-ufshc", "qcom,ufshc",
arch/arm64/boot/dts/qcom/sdm845.dtsi:                   compatible = "qcom,sdm845-ufshc", "qcom,ufshc",
arch/arm64/boot/dts/qcom/sm6115.dtsi:                   compatible = "qcom,sm6115-ufshc", "qcom,ufshc", "jedec,ufs-2.0";
arch/arm64/boot/dts/qcom/sm6125.dtsi:                   compatible = "qcom,sm6125-ufshc", "qcom,ufshc", "jedec,ufs-2.0";
arch/arm64/boot/dts/qcom/sm6350.dtsi:                   compatible = "qcom,sm6350-ufshc", "qcom,ufshc",
arch/arm64/boot/dts/qcom/sm8150.dtsi:                   compatible = "qcom,sm8150-ufshc", "qcom,ufshc",
arch/arm64/boot/dts/qcom/sm8250.dtsi:                   compatible = "qcom,sm8250-ufshc", "qcom,ufshc",
arch/arm64/boot/dts/qcom/sm8350.dtsi:                   compatible = "qcom,sm8350-ufshc", "qcom,ufshc",
arch/arm64/boot/dts/qcom/sm8450.dtsi:                   compatible = "qcom,sm8450-ufshc", "qcom,ufshc",
arch/arm64/boot/dts/qcom/sm8550.dtsi:                   compatible = "qcom,sm8550-ufshc", "qcom,ufshc",
arch/arm64/boot/dts/qcom/sm8650.dtsi:                   compatible = "qcom,sm8650-ufshc", "qcom,ufshc", "jedec,ufs-2.0";


If all msm8998-based device trees had (for example)
a qcom,msm8998-wcn3990-wifi compatible, we could have
matched that to apply a quirk to all msm8998 boards.

Did I understand correctly?

(In the toy code I provided, I matched the of_root because
there is no SoC-specific compatible for the device itself.)

-- 
Regards



