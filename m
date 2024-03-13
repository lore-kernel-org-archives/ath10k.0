Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFE4AC54791
	for <ath10k@archiver.kernel.org>; Wed, 13 Mar 2024 15:09:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9D/LGalROnb2T4y0ClS9IfcPBAxyS2/alzeYHC18DcE=; b=CgmHy4Mpm/U8mh0M5poM/slhSG
	PSazJkCajncLkBHsQdSVGUT7KIXOI5H59f5sg5VN8ZkOoKz+jFQxSnlGZnPVQ/SqVz9Jw4iCiim+E
	8WxEDUhm73X3DZdqPMnOZcRvSQgddy425OPqYM9c+htlZ1ZjF3bi6toqTei0+NfktAh0fWbnEpY8E
	5lSuuilLbHOzWWqlmTPaEnwtIMdXS5OnWO//aGJh3eTq44ZlFoKoh1+WrzYSCJ3SF1mgFxkPhDPa9
	gdA9lU3L1vbTq25lXKitzn3rifZ3QAoFw6IYZUQNRMIg1nc7MbDAdJZS8TsnRMtq/9fUiFMuYV48k
	LkaMS9rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkQEI-0000000AY7G-2qs4;
	Wed, 13 Mar 2024 15:09:18 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkQEE-0000000AY59-1QLd
	for ath10k@lists.infradead.org;
	Wed, 13 Mar 2024 15:09:16 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4132f37e170so17649555e9.2
        for <ath10k@lists.infradead.org>; Wed, 13 Mar 2024 08:09:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1710342549; x=1710947349; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9D/LGalROnb2T4y0ClS9IfcPBAxyS2/alzeYHC18DcE=;
        b=R1VxiSL/DbXHvA81NAQXTXGmrRTyS95iT74IBJKL3s/2AldTTM19tHZAT8RAi8I/Lp
         JKV1wK+4278XERmkDjy4mx6iysdUp5a8VvyPzBORQCsoLZhwEgdEBWte2xJqEnsitgXc
         kE28rFQZZSOClqNEbKtKZYCw8mn1yuNdFlkmmo0hVOYdPl6//xSuE4t5888I+nb27/sL
         OEDkpgehqXrBRZjjZQNbuubF3XT5ioL/Y+duhuJeghmIOvhmgpg6NX2vkzq5/1ibznBQ
         DDEQZpBUGSWFYd7Ohhj7uMfyvwMrVTNEEJoaGhCrOXoOu7xSKuddgDW+ielAO+kftzGo
         AmkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710342549; x=1710947349;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9D/LGalROnb2T4y0ClS9IfcPBAxyS2/alzeYHC18DcE=;
        b=wc458t41fP+amCFwDi8d3CKzpuPpH3TVzBcnEDXJgKtljr6mVoCzyhnw0tS47zYWaP
         YeqEJvj46IjhNS+QO5v9e7BFq2iFnGkqK4y8DFY0CaO5mPeIaB3gmHQkl4AECf/a13ZL
         vm+PI1W3IZ9hJRzZEoEGGOdQFNFSSm2CiUIaLw61ruLwRMKfdm8VxNc+XAbWXXzW/uir
         2GEfrLKc5oqTO1Xmd/HT37Gyy9ops02GvGMd2fssDckyl8Ba4yQGwlkJQ1mMi8SFQZge
         ArVL+uais/GPsISs6KqXeIc5ZrP4/9j32zjKqgDOkqZedlC5w4jo10lEIzl9SYMlrbXO
         WFjA==
X-Forwarded-Encrypted: i=1; AJvYcCVNJT0mG2nRdCWzh3iZDeVNELXS7BmOMdTvxOCjBonV5DYTZQQARjryHB2laWAquE0dOqe3D5qlZSDsPuNYZXSFu0r9pxz4Aba0dQ==
X-Gm-Message-State: AOJu0Ywg8i7F+l+5ooK6B584kLf6gCg8qLxBgobKT/A0WP22020WjUG+
	QVfxPN/wuSHb3CBD3m7X7ZqCUGf3KFJZIvTRGHOFF7Ris2/M+G076+EDe8Rhx2U=
X-Google-Smtp-Source: AGHT+IHmZE4vNY7w2lgfvohHeDqLj+O8i0RjAZ7/srEyzTeHaFJv1iyOnFN9q+La8CK3lM1ablESfg==
X-Received: by 2002:adf:f549:0:b0:33e:8aba:cd0a with SMTP id j9-20020adff549000000b0033e8abacd0amr1887494wrp.9.1710342549473;
        Wed, 13 Mar 2024 08:09:09 -0700 (PDT)
Received: from ?IPV6:2a02:8428:2a4:1a01:8547:dfbf:d48:2a1? ([2a02:8428:2a4:1a01:8547:dfbf:d48:2a1])
        by smtp.gmail.com with ESMTPSA id q27-20020a056000137b00b0033e72e104c5sm11827757wrz.34.2024.03.13.08.09.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Mar 2024 08:09:09 -0700 (PDT)
Message-ID: <fb0ffdd9-923a-4191-8304-583243ad528b@freebox.fr>
Date: Wed, 13 Mar 2024 16:09:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: net: wireless: ath10k: add
 qcom,no-msa-ready-indicator prop
To: Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <quic_jjohnson@quicinc.com>,
 ath10k <ath10k@lists.infradead.org>,
 wireless <linux-wireless@vger.kernel.org>, DT <devicetree@vger.kernel.org>,
 Pierre-Hugues Husson <phhusson@freebox.fr>,
 Jami Kettunen <jamipkettunen@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <14daa98e-7fd3-4ebb-87bb-5d2c1fba679f@freebox.fr>
 <b8de96c7-cbb6-4a09-a4d4-2c11b3ab3e01@freebox.fr> <871q8wk7o3.fsf@kernel.org>
 <3392f356-7b19-483d-b9f8-3bd84068fa52@freebox.fr> <87wmqoilzf.fsf@kernel.org>
 <c58e67e6-6a7f-4963-86b9-580165bf05ba@freebox.fr> <87cyse8j9m.fsf@kernel.org>
 <6d4b1381-c121-4cda-a8c9-9ccac56bd447@freebox.fr> <87plw87nsc.fsf@kernel.org>
 <0816f7bb-3c97-4b90-8e19-191552ea6e26@freebox.fr> <87h6hk7aee.fsf@kernel.org>
Content-Language: en-US
From: Marc Gonzalez <mgonzalez@freebox.fr>
In-Reply-To: <87h6hk7aee.fsf@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240313_080914_582318_BF960756 
X-CRM114-Status: GOOD (  10.18  )
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

[ Dropping the DT fellows ]

On 05/03/2024 20:20, Kalle Valo wrote:

> Marc Gonzalez wrote:
> 
>> I need to build a kernel + rootfs + FW to test the proposed solution,
>> then I can spin a formal submission.
> 
> Yeah, please do test this to make sure we are not missing anything :)

I used buildroot ( https://buildroot.org ) to generate a kernel + rootfs
for my board (a variation of qcom/msm8998-mtp.dts)

Not sure if I must use the vendor FW blobs? Or if I can use the blobs
from linux-firmware-20240115.tar.xz (as supported by BR2).


All I see from the ath10k driver (with debugging cranked to the max) is:

[    0.539801] ath10k_snoc 18800000.wifi: Adding to iommu group 0
[    0.541941] ath10k_snoc 18800000.wifi: snoc xo-cal-data return -22
[    0.543633] ath10k_snoc 18800000.wifi: supply vdd-3.3-ch1 not found, using dummy regulator
[    0.544002] ath10k_snoc 18800000.wifi: qmi msa.paddr: 0x0000000094400000 , msa.vaddr: 0x(____ptrval____)
[    0.544271] ath10k_snoc 18800000.wifi: snoc probe


# ip link
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
2: enp1s0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast qlen 1000
    link/ether 34:27:92:82:48:ec brd ff:ff:ff:ff:ff:ff

No wlan device at this point.

I got shell-shock from reading these setup steps:

https://wiki.postmarketos.org/wiki/Qualcomm_Snapdragon_835_(MSM8998)#WLAN
https://github.com/jhugo/linux/blob/5.5rc2_wifi/README


Jeffrey, Bjorn, Konrad,
Has someone written idiot-proof (such as myself) steps to enable
the ath10k core on a msm8998 board?

I'm still not quite sure where linux-firmware.git fits into all this.

Regards


