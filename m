Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AC89C54798
	for <ath10k@archiver.kernel.org>; Tue,  5 Mar 2024 17:32:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RHGCjxaUPDbJWBPK3hLyM4vR5pB66bSx5oKjgwP2aPM=; b=yJBnrtNbRX4hxRHtGaFWFGmebk
	Y8HGJXfVhrA4halewWHAspr5U0fnirtEr2pznFwBl1Nwr2XpI/jRi+N5v2DzyMjBly7Iiuf42sdY0
	74d6VHr1waUtGg/KyAIej2JWjsV8m438sLqT5Be5wHDSBz06JNk/YuVYOpkxmEYVNqklrlJGSLw0K
	vz0gWG+pZdwnZDpKvy2NP7khncGBDgQf0HKomFQJcad4sShtaWWUrC8/Xs2drYj9RgSqHqVnWk27t
	WDEfv8UuebENe5z7NTywRGQi14magxbujZqbG0VXkjU3f2GwuJT2yfJpK9tNs0eCpVJSbKxxycpdo
	1gUZqbuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhYeT-0000000EhQ8-1eO6;
	Tue, 05 Mar 2024 17:32:29 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhYeP-0000000EhOs-0cFs
	for ath10k@lists.infradead.org;
	Tue, 05 Mar 2024 17:32:28 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-412e8c63f23so13178805e9.0
        for <ath10k@lists.infradead.org>; Tue, 05 Mar 2024 09:32:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1709659942; x=1710264742; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RHGCjxaUPDbJWBPK3hLyM4vR5pB66bSx5oKjgwP2aPM=;
        b=cWc78hJndsm8Ul+/Xx+Y4mhKTCM9Vw5bCHlh9VcTgTwageNRTrd2dQr2x4FArs981C
         d3xQ1rEJ0JTOrRngCZyqxpPoRGwrqObAmKDJsGKsZmbtXJv58NW3FGTePZar46+3aMu0
         X16DojPQ5Mp1nOC6wRmv+9ofQfSuWk0wXcpaZCOZmJsUDPQ88Ql8t85kFVOar0Ff3ItD
         8PQH+mV1sRSmSshHNC1KO82MuOQTh81iWXDNlx85O35KWiHtddDU+z50AycL0xLtdXD0
         19jv5cmIVowEIGZY6HMZgvNa78fwPzM1RhqFc2khWlENTEx7TjCvJG/bxApxif1veeVV
         VCbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709659942; x=1710264742;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RHGCjxaUPDbJWBPK3hLyM4vR5pB66bSx5oKjgwP2aPM=;
        b=uBBWwzIXl6qUkDPVwl2puHDT9pvYE6lckzrohxhd1MkKB/5n4Cmho50ETNnUBihno8
         BmBV+Yk+OvEqYLJbja9qrLnziZBnrx+toQr54feX66ULeuO50At4cdaKVCUqpeDmzQEb
         S06bulrtq6lQwS0E8y1Oug/IQkrhIAnkjd1Tbuj3/rzhdYjSatuPM9MeYX0dva69lVnE
         TYsuCcR626shdqVdDnR9g1am+H624GRyANT1wgK+u20AECqFcpa7LmYiBjnAyZY+dPdf
         fF545zWjjOTqz9P3BhS8w4RmkTOU7YCIdZaF44h4JYBTND+td3jOVVN+RGL3Un9GXJOB
         eWKQ==
X-Forwarded-Encrypted: i=1; AJvYcCVMeAMu30RJBDIJaY+mbdNS5+1JmuiufJFnNhPFucaBllGULzoNgatbah5TiczRgDvek5HCl57u73b1+ajriTeMaC9kI4x95D5EHg==
X-Gm-Message-State: AOJu0YwBQud3wnPe43ivOfNhkfjju68WVNvELTchzbLfzqteTbOWDnF4
	0Lm/KxTf129vsKnBErUwAEZAS1yt7ps62vOD4DryH8gsBBgtlZeS9sB2WQye23k=
X-Google-Smtp-Source: AGHT+IFUWWu6brcU5Z3h34Cf83caanSuxe11qXyds41BJD+kSKbWTuLmI4UzT/Lk46RQ0AtgdDlaRw==
X-Received: by 2002:a5d:4f07:0:b0:33e:11c3:7ebf with SMTP id c7-20020a5d4f07000000b0033e11c37ebfmr9315331wru.62.1709659941681;
        Tue, 05 Mar 2024 09:32:21 -0800 (PST)
Received: from [192.168.108.81] (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id q16-20020a5d6590000000b0033d56aa4f45sm15484527wru.112.2024.03.05.09.32.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Mar 2024 09:32:21 -0800 (PST)
Message-ID: <0816f7bb-3c97-4b90-8e19-191552ea6e26@freebox.fr>
Date: Tue, 5 Mar 2024 18:32:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: net: wireless: ath10k: add
 qcom,no-msa-ready-indicator prop
Content-Language: en-US
To: Kalle Valo <kvalo@kernel.org>
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
 <c58e67e6-6a7f-4963-86b9-580165bf05ba@freebox.fr> <87cyse8j9m.fsf@kernel.org>
 <6d4b1381-c121-4cda-a8c9-9ccac56bd447@freebox.fr> <87plw87nsc.fsf@kernel.org>
From: Marc Gonzalez <mgonzalez@freebox.fr>
In-Reply-To: <87plw87nsc.fsf@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240305_093225_583694_08282893 
X-CRM114-Status: GOOD (  11.56  )
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

On 05/03/2024 15:31, Kalle Valo wrote:

> Thanks, this is exactly what I'm proposing.

With your suggestions, the patch becomes much simpler:

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index 0032f8aa892ff..18d0abcf6f693 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -769,6 +769,7 @@ static const char *const ath10k_core_fw_feature_str[] = {
 	[ATH10K_FW_FEATURE_SINGLE_CHAN_INFO_PER_CHANNEL] = "single-chan-info-per-channel",
 	[ATH10K_FW_FEATURE_PEER_FIXED_RATE] = "peer-fixed-rate",
 	[ATH10K_FW_FEATURE_IRAM_RECOVERY] = "iram-recovery",
+	[ATH10K_FW_FEATURE_NO_MSA_READY] = "no-msa-ready",
 };
 
 static unsigned int ath10k_core_get_fw_feature_str(char *buf,
diff --git a/drivers/net/wireless/ath/ath10k/core.h b/drivers/net/wireless/ath/ath10k/core.h
index c110d15528bd0..1ac8ea02cc088 100644
--- a/drivers/net/wireless/ath/ath10k/core.h
+++ b/drivers/net/wireless/ath/ath10k/core.h
@@ -835,6 +835,9 @@ enum ath10k_fw_features {
 	/* Firmware support IRAM recovery */
 	ATH10K_FW_FEATURE_IRAM_RECOVERY = 22,
 
+	/* Firmware does not send MSA_READY indicator */
+	ATH10K_FW_FEATURE_NO_MSA_READY = 23,
+
 	/* keep last */
 	ATH10K_FW_FEATURE_COUNT,
 };
diff --git a/drivers/net/wireless/ath/ath10k/qmi.c b/drivers/net/wireless/ath/ath10k/qmi.c
index 38e939f572a9e..7e408fd63cdb8 100644
--- a/drivers/net/wireless/ath/ath10k/qmi.c
+++ b/drivers/net/wireless/ath/ath10k/qmi.c
@@ -1040,6 +1040,8 @@ static void ath10k_qmi_driver_event_work(struct work_struct *work)
 		switch (event->type) {
 		case ATH10K_QMI_EVENT_SERVER_ARRIVE:
 			ath10k_qmi_event_server_arrive(qmi);
+			if (test_bit(ATH10K_FW_FEATURE_NO_MSA_READY, ar->running_fw->fw_file.fw_features))
+				ath10k_qmi_event_msa_ready(qmi);
 			break;
 		case ATH10K_QMI_EVENT_SERVER_EXIT:
 			ath10k_qmi_event_server_exit(qmi);



I need to build a kernel + rootfs + FW to test the proposed solution,
then I can spin a formal submission.

(I didn't understand why this patch requires Dmitry's series?)

Do I need to submit a symmetric patch to linux-firmware to define bit 23?
And also a patch to add the bit to some firmwares? (All msm8998 FWs?)

Regards


