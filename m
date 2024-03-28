Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BF91CD11DD
	for <ath10k@archiver.kernel.org>; Thu, 28 Mar 2024 17:39:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hBEyfkaUFeTURJJG6e68DKf7jzMPW6cXTRuGJ56eTuE=; b=G5qgsNpF1B844lc8OyDRHcD2W9
	a1jnCZWJdoELvwhOfqVw1e68gpWpQyYRtUXR/NEhXLoAfsRIjtK4sfh1PZktvRzwgMM6Rs3HMLekF
	gIWL27S73GZJSryTw74HLXHaXOLeS5FT8aw96JeOfg5ZgHe784TMNXNwitSUUXz/XQSGFt8DbRg31
	7QECOLO5F6nfRq/6HH6fiMVbgbt4Pumx/tg+yRwWujWEFGtVhNNJh5uFM5CcavVSSLqNl7Cx1P+0A
	WjbGGypkRI2mUuqgF0RA+QP7P4iJ/Cj/Vmu6uUQUv5be99Jm/524XwVzdXMsWt/zu1GcS+4FnSHzE
	thCqT1Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rptj9-0000000F0IR-01tn;
	Thu, 28 Mar 2024 17:39:47 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rptj4-0000000F0FN-0yeA
	for ath10k@lists.infradead.org;
	Thu, 28 Mar 2024 17:39:44 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4148c6132b4so13653925e9.1
        for <ath10k@lists.infradead.org>; Thu, 28 Mar 2024 10:39:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1711647579; x=1712252379; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hBEyfkaUFeTURJJG6e68DKf7jzMPW6cXTRuGJ56eTuE=;
        b=uOTLhcooujpo9zASs0mw0A5Q3XYnbfduY0b/n2Nt+PlUGfpJVhvwiAl3duGdFjgj6w
         rP3Z2ya4xkJ1VSipcAlL0Agdl/Sp54pu5gW66wb2TIH6Yn1tI+Co32psbqM7q+MOoW3I
         GbSl588niSDh5WfQKMyzHLhbNH8057Hf3iW7yxxe+QE11iF2Rd/XCPIoRiehjnvzeUfq
         opkDsKReniXeKr4h+S8snizXkbFer82ZAGd3u159vbtBe8/cHECKrw56N/EsYZFtzTAB
         I8Bv03VZEvEY7/n67cHEkOg4N8Rq7NyRYILEtdZcgP5+5FVKTCVRwRsi3Pey+sXUN/fm
         Cm8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711647579; x=1712252379;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hBEyfkaUFeTURJJG6e68DKf7jzMPW6cXTRuGJ56eTuE=;
        b=JakoJKRBln4OZujP7hTqU5I3TNYWBzfFxFscZABtUaK9/aVjkUI254/zMgDRww6Bgx
         Wj1QZM9e3iplnldK4cxnVdXftTv5vfQyOQ7ypvHHE+yrC6/kF+IZEfxL5s/Hpw4cIxf5
         W9QJJ49mftxMfo12FFH40f9Y3uPgjcErDwtQVVPMLJHKbkyK6NGpW4mTdtP9qLlQB3JN
         hARibfSADmz1+ChtEc5h/btwnQzf9gxwhSgPBY3tdcUU5RV2EOOzoUHxUHwOI1YgWg5q
         lh604v+Pw9o8iIyZvm6Q/ZrHYfDk76+Bqj7b3IgewmUCfgPONbysKysqGO5VCkJ/FBSX
         rLVw==
X-Forwarded-Encrypted: i=1; AJvYcCUuhbS3pWFglLg+FLo0Ph5fPBbPymdfRXhFy3RifsFgskkDJztknxdYOePNjTeQE3qpa7EmyTjoU8txbc9ugb/MerI1DJc+xBFbEg==
X-Gm-Message-State: AOJu0YzPRby0WDGYDc3uo/sOt4Pv3xnzffpN7CBjePtIfrle1JkkS9wT
	MvKYsGBx1noGetKR4gQCBSrFYfmlkS8Gx/InZKSG4jAz5/jB9jatLFtf0ghy0Fs=
X-Google-Smtp-Source: AGHT+IH25UGpyUTZwfKMDNxOvtNvgGwcgB3GGZLR9PbX+P1XJKMoLJl5lW9dzk5XDs/O2Bg89Wim0A==
X-Received: by 2002:a05:600c:2285:b0:414:5e9d:ad31 with SMTP id 5-20020a05600c228500b004145e9dad31mr102964wmf.13.1711647579570;
        Thu, 28 Mar 2024 10:39:39 -0700 (PDT)
Received: from [192.168.108.81] (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id o10-20020a05600c510a00b004148a5e3188sm6066643wms.25.2024.03.28.10.39.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Mar 2024 10:39:39 -0700 (PDT)
Message-ID: <5cdad89c-282a-4df5-a286-b8404bc4dd81@freebox.fr>
Date: Thu, 28 Mar 2024 18:39:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 3/3] arm64: dts: qcom: msm8998: set
 qcom,no-msa-ready-indicator for wifi
Content-Language: en-US
From: Marc Gonzalez <mgonzalez@freebox.fr>
To: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <quic_jjohnson@quicinc.com>,
 ath10k <ath10k@lists.infradead.org>
Cc: wireless <linux-wireless@vger.kernel.org>, DT
 <devicetree@vger.kernel.org>, MSM <linux-arm-msm@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Pierre-Hugues Husson <phhusson@freebox.fr>, Arnaud Vrac <avrac@freebox.fr>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Jami Kettunen <jamipkettunen@gmail.com>,
 Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
References: <fd26ce4a-a9f3-4ada-8d46-ed36fb2456ca@freebox.fr>
In-Reply-To: <fd26ce4a-a9f3-4ada-8d46-ed36fb2456ca@freebox.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240328_103942_487518_84788A3A 
X-CRM114-Status: GOOD (  10.96  )
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

The ath10k driver waits for an "MSA_READY" indicator
to complete initialization. If the indicator is not
received, then the device remains unusable.

cf. ath10k_qmi_driver_event_work()

Several msm8998-based devices are affected by this issue.
Oddly, it seems safe to NOT wait for the indicator, and
proceed immediately when QMI_EVENT_SERVER_ARRIVE.

Jeff Johnson wrote:

  The feedback I received was "it might be ok to change all ath10k qmi
  to skip waiting for msa_ready", and it was pointed out that ath11k
  (and ath12k) do not wait for it.

  However with so many deployed devices, "might be ok" isn't a strong
  argument for changing the default behavior.

cf. also
https://wiki.postmarketos.org/wiki/Qualcomm_Snapdragon_835_(MSM8998)#WLAN

Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
---
 arch/arm64/boot/dts/qcom/msm8998.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
index 026b6b97785b5..681a80f4dc9db 100644
--- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
@@ -3185,6 +3185,7 @@ wifi: wifi@18800000 {
 			iommus = <&anoc2_smmu 0x1900>,
 				 <&anoc2_smmu 0x1901>;
 			qcom,snoc-host-cap-8bit-quirk;
+			qcom,no-msa-ready-indicator;
 		};
 	};
 };
-- 
2.34.1


