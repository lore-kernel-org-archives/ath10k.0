Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33A7BC48BF6
	for <ath10k@archiver.kernel.org>; Mon,  4 Mar 2024 15:51:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IUb/5Oupvxe0SuRsceM3xY4GgJJePH6d2omdHhOHGS8=; b=4pvGrP6Ybvl/Cco/S6/ql7goOI
	8e8VUwNgihk6OpcTjOwOw69dnA3A1m81X1ssegc0UtEuPiGUBm2LIptyTajdnr/tvOn4BaZ1m9tRc
	+qRnBswcXqQ6sN7KS6DRRrTKVDZNALXn8/R1Ko4MibBg9KsjLKV6yvD+wg26EHQky1IWbkZEqczCs
	c662+qXsF+AmM5ON/wpzyV7fEeg0EnuJawRa45tgcuAQc+Q0rsivYRs+7ZibFg14SFQj57LCAqafL
	sfMPP7jUXw0WxH2uU9q5dgtVbCaLaqlpPd1IZ23g36odSkZRvksL403adqI8EGXESEA6tkAmfKaj+
	7tq3lK1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhAbR-00000009hZ6-1Lnr;
	Mon, 04 Mar 2024 15:51:45 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhAbN-00000009hYJ-1hNV
	for ath10k@lists.infradead.org;
	Mon, 04 Mar 2024 15:51:43 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-33d568fbf62so2426649f8f.3
        for <ath10k@lists.infradead.org>; Mon, 04 Mar 2024 07:51:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1709567498; x=1710172298; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IUb/5Oupvxe0SuRsceM3xY4GgJJePH6d2omdHhOHGS8=;
        b=1SPpt0iF4oI+NjaQZ9VqGNCRL95kKYoaxNdv/NJ4AAEmrxZpxel9QDPxqvwnFN7pw9
         +Xgn4aZMlHbXu2+nEEtNpKZ4FqOe1YHbl8HpHi4Is4EO545H9UQHB03QdLux49tujIvp
         YJLfANH9XNs51758SmDOXSZhwLZ/59IoNa8Nfz9NmU76XOOYowhXZ1WVXEg1gjzYsEJj
         3T3u181j67KAf/Ephogf/rV7Z6x6t5poILhShO8SGbTXlxt3GRCvxdz3JVxZmYg3iLWL
         6dZLvYeukkos8+8HP9wxvWpNwHlg7bkF0h08OAEB29Us4llOte/oyUHvBdbDg4EgNi32
         pGRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709567498; x=1710172298;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IUb/5Oupvxe0SuRsceM3xY4GgJJePH6d2omdHhOHGS8=;
        b=UkJku7ym0M+ufL5/vlFTSUdSZvI1vD8jCqwuzwpaFyZUIVzmHxj4Q+/DcMzTByeC9O
         kNvFEIvoV1Ytndu7RDPuRs0MPzc5EOYmvrkWI2tZqZdgbRNmxKMLaZ0lEWvnN21aFYRw
         CDLTNjvFi+8L5BKo04tU/CtElGW1FSKtFkZASfbvH6hsSdPMa7CcwztnAyRezRMxxgfd
         qYu/3I2jhekdDWYe20uGT2UhTQKIBEunvav/mnQWi+lbdWDn1ENbg3DM9nbFgBrrAAa7
         m4sHxo/nWZfv6zlXO2HpJ0Dyng1SYtJK+tLp0xa4MDbmjyuptPC6FsG22RGPElz8R7hl
         iWQA==
X-Forwarded-Encrypted: i=1; AJvYcCWmHoM46aWPeMJQrPJ1IVFlqXPm3fl4INqJncUOnMnyeexSnvg6SgodlVQNKw0IqImGUvVgx0bCRvOFmZ/58t23AlVR/ixkLpTg0Q==
X-Gm-Message-State: AOJu0YxPPVwN13xNKJWVNPNDQSiJhCmxCVEg1A7ocguPCfBUxeMIfSGS
	5PQwzro5Qv5QguIIdOODDeSj8DtlmesfKyS/pXC3FESFMfG+JLDPRHs25hwuy10=
X-Google-Smtp-Source: AGHT+IHqeWxijSP3Z1JMmmpZW/+BOmf4YxhMIFDWJw0VvSavoo6l4GTlTDqOtaWvfv49THeLaj4ykQ==
X-Received: by 2002:adf:ec43:0:b0:33e:3d75:b6bc with SMTP id w3-20020adfec43000000b0033e3d75b6bcmr2171129wrn.58.1709567498520;
        Mon, 04 Mar 2024 07:51:38 -0800 (PST)
Received: from [192.168.108.81] (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id m26-20020a05600c3b1a00b00412cbe4f41bsm10118812wms.4.2024.03.04.07.51.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Mar 2024 07:51:38 -0800 (PST)
Message-ID: <6d4b1381-c121-4cda-a8c9-9ccac56bd447@freebox.fr>
Date: Mon, 4 Mar 2024 16:51:37 +0100
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
From: Marc Gonzalez <mgonzalez@freebox.fr>
In-Reply-To: <87cyse8j9m.fsf@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240304_075141_636139_CCFF9DCE 
X-CRM114-Status: GOOD (  24.14  )
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

On 01/03/2024 09:10, Kalle Valo wrote:

> Marc Gonzalez wrote:
> 
>> Kalle Valo wrote:
>> 
>>> Here's one example where in ath10k we use a feature bit as a workaround:
>>>
>>> 	/* Don't trust error code from otp.bin */
>>> 	ATH10K_FW_FEATURE_IGNORE_OTP_RESULT = 7,
>>>
>>>         ....
>>>
>>> 	if (!(skip_otp || test_bit(ATH10K_FW_FEATURE_IGNORE_OTP_RESULT,
>>> 				   ar->running_fw->fw_file.fw_features)) &&
>>> 	    result != 0) {
>>> 		ath10k_err(ar, "otp calibration failed: %d", result);
>>> 		return -EINVAL;
>>> 	}
>>>
>>> BTW for modifying firmware-N.bin files we have a script here:
>>>
>>> https://github.com/qca/qca-swiss-army-knife/blob/master/tools/scripts/ath10k/ath10k-fwencoder
>>
>> If I understand correctly, you are saying that there is
>> (maybe... probably) a bug in the FW, so it makes sense to
>> tag that specific FW file with a special bit which the kernel
>> will interpret as "this FW is broken in a specific way;
>> and here's how to work around the issue."
>>
>> So this bit would serve the same purpose as my proposed
>> "qcom,no-msa-ready-indicator" bit (that bit existed instead
>> in my board's device tree).
>>
>> The problem I see is that the firmware files are signed.
>> Thus, changing a single bit breaks the verification...
>> UNLESS the FW format allows for a signed section ALONG-SIDE
>> an unsigned section?
> 
> firmware-N.bin is ath10k specific container file format and we (the
> Linux community) have full access to it using ath10k-fwencoder, there's
> no signing or anything like that. One of the major reasons why it was
> designed was to handle differences between firmware branches, just like
> in this case.
> 
> Of course plan A should be to fix the firmware but if that doesn't work
> out then plan B could be using the feature bit in firmware-N.bin.
> 
> BTW related to this Dmitry is extending firmware-N.bin handling for
> WCN3990, you will most likely need to use that:
> 
> https://patchwork.kernel.org/project/linux-wireless/cover/20240130-wcn3990-firmware-path-v1-0-826b93202964@linaro.org/


If I understand correctly (happy to have anyone correct any
misunderstandings), if the FW cannot be fixed (for any reason),
then we would have to do something like this:


diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index 0032f8aa892ff..c8778ebe922af 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -769,6 +769,7 @@ static const char *const ath10k_core_fw_feature_str[] = {
 	[ATH10K_FW_FEATURE_SINGLE_CHAN_INFO_PER_CHANNEL] = "single-chan-info-per-channel",
 	[ATH10K_FW_FEATURE_PEER_FIXED_RATE] = "peer-fixed-rate",
 	[ATH10K_FW_FEATURE_IRAM_RECOVERY] = "iram-recovery",
+	[ATH10K_FW_FEATURE_NO_MSA_READY] = "no-msa-ready-indicator",
 };
 
 static unsigned int ath10k_core_get_fw_feature_str(char *buf,
@@ -2941,6 +2942,9 @@ int ath10k_core_start(struct ath10k *ar, enum ath10k_firmware_mode mode,
 
 	ar->running_fw = fw;
 
+	if (test_bit(ATH10K_FW_FEATURE_NO_MSA_READY, fw->fw_file.fw_features))
+		ar->fake_msa_ready = true;
+
 	if (!test_bit(ATH10K_FW_FEATURE_NON_BMI,
 		      ar->running_fw->fw_file.fw_features)) {
 		ath10k_bmi_start(ar);
diff --git a/drivers/net/wireless/ath/ath10k/core.h b/drivers/net/wireless/ath/ath10k/core.h
index c110d15528bd0..ce71097b97a1d 100644
--- a/drivers/net/wireless/ath/ath10k/core.h
+++ b/drivers/net/wireless/ath/ath10k/core.h
@@ -835,6 +835,9 @@ enum ath10k_fw_features {
 	/* Firmware support IRAM recovery */
 	ATH10K_FW_FEATURE_IRAM_RECOVERY = 22,
 
+	/* Firware does not send MSA_READY indicator */
+	ATH10K_FW_FEATURE_NO_MSA_READY = 23,
+
 	/* keep last */
 	ATH10K_FW_FEATURE_COUNT,
 };
@@ -1151,6 +1154,9 @@ struct ath10k {
 	u8 cfg_tx_chainmask;
 	u8 cfg_rx_chainmask;
 
+	/* FW does not send MSA_READY indicator. Fake it */
+	bool fake_msa_ready; /* bool or u8? or s8? or bitfield? */
+
 	struct completion install_key_done;
 
 	int last_wmi_vdev_start_status;
diff --git a/drivers/net/wireless/ath/ath10k/qmi.c b/drivers/net/wireless/ath/ath10k/qmi.c
index 38e939f572a9e..0776e79b25f3a 100644
--- a/drivers/net/wireless/ath/ath10k/qmi.c
+++ b/drivers/net/wireless/ath/ath10k/qmi.c
@@ -1040,6 +1040,8 @@ static void ath10k_qmi_driver_event_work(struct work_struct *work)
 		switch (event->type) {
 		case ATH10K_QMI_EVENT_SERVER_ARRIVE:
 			ath10k_qmi_event_server_arrive(qmi);
+			if (ar->fake_msa_ready)
+				ath10k_qmi_event_msa_ready(qmi);
 			break;
 		case ATH10K_QMI_EVENT_SERVER_EXIT:
 			ath10k_qmi_event_server_exit(qmi);


-- 
Regards


