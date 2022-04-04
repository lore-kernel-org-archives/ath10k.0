Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 645DFC433F5
	for <ath10k@archiver.kernel.org>; Mon,  4 Apr 2022 07:34:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=msKd4G894uVtp7cCeg0WyGuz1Uq5IWx8TWsNJWyXwQA=; b=RhRgC2BK+iDYHJ
	sNsZRbxNHQUnU7WSTMxapYLSudOSqHZ0y+LUcqiDybR4hDh8WmS0y9GU0moJj68rFw5CkYpC1ghR8
	DJ/GQcGppvtXy9hK47qnfGsOsKAIZ8g60TgCVTqoPCFYaGAWHcSwIxUvLYbak8zU0jETqKkrMLu9O
	LgDcSIyhBS53q5u0a5XG119a+bJqmSDQto21A5ltWmQnoUpJgh2/50v17DZfeY8P7qHvHAkh2kZWc
	u/QmdR8H38IBAp7fMcsSEPGfcGE3fiNT5MolEhLuLpiWtdzuXMcUDaBCA8jMXkE1pwDLLy5V0XoHf
	lhhHVqrIZW72Z/HVx8/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nbHE8-00DdZd-IR; Mon, 04 Apr 2022 07:34:16 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbHE5-00DdYf-Np
 for ath10k@lists.infradead.org; Mon, 04 Apr 2022 07:34:15 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1594E61249;
 Mon,  4 Apr 2022 07:34:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46162C2BBE4;
 Mon,  4 Apr 2022 07:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649057651;
 bh=DRB0++tqTDhskFcVzUSEtFyWL4XUeJhJrBjub9UnpQM=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=CsD8S3Ha7CZzn6E89v05GGRBveeSgaFlTj2OohTRtIIAtJHeXA5ecD4cWV8/RQeVY
 B2A0YAvjXxMSDNuWA3WIIaW4lCxgzLk+ReMP+rPTC9N6iJrVhWp/0eEqSDx1M3kd0Z
 QX8QhZsArVdAs7A0mRf3sBnpT4uiIOBHuULQEX3pjvtd0c4yvsKYTCu+Q3dADhD2Ef
 WBLavPR3+r9SLYS8tNQX7bEGzFE4gWef22JbzIGkEinCHeahgLY5bbMoTSrtCEpkgY
 JelLnbSJ/P2CbFujZ1qtpkqSyYDOxzAqEVQjFIS05wGvk7V8FiSlEfFHoUj/VtYqID
 f7+OcGQwq2Dyw==
From: Kalle Valo <kvalo@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, linux-arm-msm@vger.kernel.org,
 ath10k@lists.infradead.org
Subject: Re: [PATCH] arm64: dts: qcom: sdm845-db845c: add wifi variant property
References: <20220403105711.1173161-1-dmitry.baryshkov@linaro.org>
 <87r16ds4ge.fsf@kernel.org>
Date: Mon, 04 Apr 2022 10:34:04 +0300
In-Reply-To: <87r16ds4ge.fsf@kernel.org> (Kalle Valo's message of "Mon, 04 Apr
 2022 10:17:05 +0300")
Message-ID: <87mth1s3o3.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220404_003413_858961_AD99922A 
X-CRM114-Status: GOOD (  16.71  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

Kalle Valo <kvalo@kernel.org> writes:

> Dmitry Baryshkov <dmitry.baryshkov@linaro.org> writes:
>
>> Dragonboard845c doesn't have board-specific board-id programmed, it uses
>> generic 0xff. Thus add the property with the 'variant' of the
>> calibration data.
>>
>> Note: the driver will check for the calibration data for the following
>> IDs, so older board-2.bin files that were distributed as a part of
>> Linaro releases will continue to work.
>>
>> - 'bus=snoc,qmi-board-id=ff,qmi-chip-id=30214,variant=Thundercomm_DB845C'
>> - 'bus=snoc,qmi-board-id=ff,qmi-chip-id=30214'
>> - 'bus=snoc,qmi-board-id=ff'
>>
>> For the reference, the board is identified by the driver in the
>> following way:
>>
>> ath10k_snoc 18800000.wifi: qmi chip_id 0x30214 chip_family 0x4001 board_id 0xff soc_id 0x40030001
>> ath10k_snoc 18800000.wifi: qmi fw_version 0x2009856b fw_build_timestamp 2018-07-19 12:28 fw_build_id QC_IMAGE_VERSION_STRING=WLAN.HL.2.0-01387-QCAHLSWMTPLZ-1
>>
>> Fixes: 3f72e2d3e682 ("arm64: dts: qcom: Add Dragonboard 845c")
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>  arch/arm64/boot/dts/qcom/sdm845-db845c.dts | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
>> index 13f80a0b6faa..f49de3913dd5 100644
>> --- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
>> +++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
>> @@ -1047,6 +1047,7 @@ &wifi {
>>  	vdd-3.3-ch0-supply = <&vreg_l25a_3p3>;
>>  
>>  	qcom,snoc-host-cap-8bit-quirk;
>> +	qcom,ath10k-calibration-variant = "Thundercomm_DB845C";
>
> I don't think I have documented it anywhere, but to keep things simple I
> would prefer to have the variant all lower case.

But, after thinking more, I guess that's water under the bridge now. So
please ignore my comment.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
