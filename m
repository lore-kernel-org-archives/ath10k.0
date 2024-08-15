Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD7D2C52D7C
	for <ath10k@archiver.kernel.org>; Thu, 15 Aug 2024 14:05:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zpNnPIHLfjbE+TXZblPdNKsxOgbKVVNuwyUGS/XR2GE=; b=ISUJtKg2g/KSkIBh8ffEvTeo2l
	Z7prr4noUeUb2rRWGH4qltdDZCsYjA6MTMbRZt3u6vu2iVakCjnrYPTciDxcd5vptiB46UhOsP7iL
	tOK6ddxGhlCvl2FMGb0mofvHE6Gf+UbS32KUeEfwKn3Lt/bBftrhtEcJC/OQGtKaIHcCi+EheFSLh
	DLgRfirmyB3+1cBQsbmnp4j43iqJAPnW9+xNPtgaPiDnsmqbVeikiGguX+LhOlccpBDDwYjuv+ysk
	v8ReFayKJiJgt2u7jjsYgQmksicoVImF1jpM3fv6O1OVPTDZVKjyQlo9X5fZGvOiV+NA1OzOjeJKk
	XvE46L4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seb64-0000000A8xh-3HLA;
	Thu, 15 Aug 2024 14:05:00 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seb62-0000000A8xG-1jAW
	for ath10k@lists.infradead.org;
	Thu, 15 Aug 2024 14:05:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id C3A4ECE1C96;
	Thu, 15 Aug 2024 14:04:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB790C4AF0C;
	Thu, 15 Aug 2024 14:04:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723730695;
	bh=hsIRhn+LY4Ti41CZQ1o9YBVR7CGgFLQpY2GyG4Gwj2w=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=apfbk/hUNZ2TsrJyVKKu71e8PEzOCRdAQ40+Krq7oy7t03OJSfheU+Ub7vAt4+fty
	 kyW7K9fp3CwvosWsK9PgJKILzQDSXf9wjqiRNfKBGjeIKjj94yCMZB8HT1frKoeeug
	 cNxjj5fXsDzuUCjE+z67Wcpkia3Wg20k9T1qrPBAynOl5Y2S1L8XN9mdRvFkNgBTIk
	 EOrrcujsnCqiK9Bvy199jpMJXY7q+2ico2PlxTiTIo13UtSfxnKH6LXF4ntWskg0Fj
	 q+3a5POZVI5wHFJumapD0sy8DkEGsYSWf6Q3DVP4bLB1RofwcOP31yUMl3dHvEGgFd
	 hJp8tYmcsNumQ==
From: Kalle Valo <kvalo@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Jeff Johnson <jjohnson@kernel.org>,  Johannes Berg
 <johannes@sipsolutions.net>,  Ath10k List <ath10k@lists.infradead.org>,
  Aditya Kumar Singh <quic_adisi@quicinc.com>,  Baochen Qiang
 <quic_bqiang@quicinc.com>,  Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>,  Linux Next Mailing List
 <linux-next@vger.kernel.org>,  Wireless <linux-wireless@vger.kernel.org>
Subject: Re: linux-next: manual merge of the ath-next tree with the ath tree
References: <20240808104348.6846e064@canb.auug.org.au>
	<20240814110019.6be39d14@canb.auug.org.au>
Date: Thu, 15 Aug 2024 17:04:52 +0300
In-Reply-To: <20240814110019.6be39d14@canb.auug.org.au> (Stephen Rothwell's
	message of "Wed, 14 Aug 2024 11:00:19 +1000")
Message-ID: <87msldyj97.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240815_070458_648548_DCB5B442 
X-CRM114-Status: GOOD (  19.88  )
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

Stephen Rothwell <sfr@canb.auug.org.au> writes:

> Hi all,
>
> On Thu, 8 Aug 2024 10:43:48 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>>
>> Today's linux-next merge of the ath-next tree got a conflict in:
>> 
>>   drivers/net/wireless/ath/ath12k/hw.c
>> 
>> between commit:
>> 
>>   38055789d151 ("wifi: ath12k: use 128 bytes aligned iova in transmit path for WCN7850")
>> 
>> from the ath tree and commit:
>> 
>>   8be12629b428 ("wifi: ath12k: restore ASPM for supported hardwares only")
>> 
>> from the ath-next tree.
>> 
>> I fixed it up (see below) and can carry the fix as necessary. This
>> is now fixed as far as linux-next is concerned, but any non trivial
>> conflicts should be mentioned to your upstream maintainer when your tree
>> is submitted for merging.  You may also want to consider cooperating
>> with the maintainer of the conflicting tree to minimise any particularly
>> complex conflicts.
>> 
>> diff --cc drivers/net/wireless/ath/ath12k/hw.c
>> index 7b0b6a7f4701,76c0e07a88de..000000000000
>> --- a/drivers/net/wireless/ath/ath12k/hw.c
>> +++ b/drivers/net/wireless/ath/ath12k/hw.c
>> @@@ -925,7 -925,7 +925,9 @@@ static const struct ath12k_hw_params at
>>   		.acpi_guid = NULL,
>>   		.supports_dynamic_smps_6ghz = true,
>>   
>>  +		.iova_mask = 0,
>> ++
>> + 		.supports_aspm = false,
>>   	},
>>   	{
>>   		.name = "wcn7850 hw2.0",
>> @@@ -1003,7 -1003,7 +1005,9 @@@
>>   		.acpi_guid = &wcn7850_uuid,
>>   		.supports_dynamic_smps_6ghz = false,
>>   
>>  +		.iova_mask = ATH12K_PCIE_MAX_PAYLOAD_SIZE - 1,
>> ++
>> + 		.supports_aspm = true,
>>   	},
>>   	{
>>   		.name = "qcn9274 hw2.0",
>> @@@ -1077,7 -1077,7 +1081,9 @@@
>>   		.acpi_guid = NULL,
>>   		.supports_dynamic_smps_6ghz = true,
>>   
>>  +		.iova_mask = 0,
>> ++
>> + 		.supports_aspm = false,
>>   	},
>>   };
>>   
>
> This is now a conflict between the wireless-next tree and the ath tree.

Thanks. The plan is that the network maintainers will fix this once the
commits "meet" in net-next. We are trying to avoid unnessary merges.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

