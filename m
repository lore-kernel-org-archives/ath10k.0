Return-Path: <SRS0=CwSx=HE=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC64AC433DB
	for <ath10k@archiver.kernel.org>; Tue,  2 Feb 2021 13:27:46 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9AFE964EC5
	for <ath10k@archiver.kernel.org>; Tue,  2 Feb 2021 13:27:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9AFE964EC5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=candelatech.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=n/xfyk7vkLN0Pvj9wUUmAsZbB7zXd+8bi8gtDMMPNzc=; b=OEtwRr38DVpjSwXrwwmvsNi9h
	b9lebO2W7Nj7LlawQ84FLppn0UKrAgltHMDofKfjDo22jV1T9ai6lYbr8BCF2lNkSb0tPpoNyCp/T
	yK3EMnGVJMK5AkeRr+uGz7tAQk3cRXR2jqaz1gr1Zz8lkB0vo2kccQxRvxI+S6JTlGqoql5CTFIJ6
	vzI90gWLtRdbpJqBtj+v6x5zgQ1pqkbHX4phdnafYkuS/gL2cZKPpOy/wZubk3W3yxMMyPX9+qVr2
	mpccoFUn1MMZDEjPNtEq8SR1UpS23V6lVhN1dDNbxjXd3y9hjoA52SBGT1S2344PkJxBpjTJOOPno
	Upg+XoAfQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l6vhy-0008N2-2G; Tue, 02 Feb 2021 13:27:06 +0000
Received: from mail2.candelatech.com ([208.74.158.173]
 helo=mail3.candelatech.com)
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l6vhv-0008MR-Ay
 for ath10k@lists.infradead.org; Tue, 02 Feb 2021 13:27:04 +0000
Received: from [192.168.254.6] (unknown [50.34.172.155])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail3.candelatech.com (Postfix) with ESMTPSA id 9C42C13C2B0;
 Tue,  2 Feb 2021 05:27:01 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail3.candelatech.com 9C42C13C2B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=candelatech.com;
 s=default; t=1612272421;
 bh=WXlaUbVPxlL6r/IFNp/t8WZ+jXwjvjlL177w8o2Srcc=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=otADhQ5KTJ4eys5vuCtNKQVGJEO7LjKgaShV4tDZ/CiRWBAVnXS/i+7DbNJLlL7pV
 4kZTxRPfr8YUlsY3UcjviWFjeHFup1T0Cphu9uwhElH2FgvyQiwW09eisTFVS16kW4
 M9tmDCSQrwmnrFYVVM2HwGs4HKOGa1uE+RMtz6ls=
Subject: Re: EAP AP/VLAN: multicast not send to client
To: Sven Eckelmann <sven@narfation.org>, ath10k@lists.infradead.org,
 Sebastian Gottschall <s.gottschall@dd-wrt.com>
References: <268706864.fOQeQAt3TZ@ripper> <2354947.QRssEMCmQP@ripper>
 <a54d233a-7677-80d4-32e9-3cec6744e8c7@dd-wrt.com> <2784478.zUthXOmo2V@ripper>
From: Ben Greear <greearb@candelatech.com>
Organization: Candela Technologies
Message-ID: <d1f6720d-020f-c5d2-dbff-326ffff95d96@candelatech.com>
Date: Tue, 2 Feb 2021 05:27:01 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <2784478.zUthXOmo2V@ripper>
Content-Language: en-MW
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210202_082703_550035_23A01539 
X-CRM114-Status: GOOD (  16.58  )
X-BeenThere: ath10k@lists.infradead.org
X-Mailman-Version: 2.1.29
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

On 2/2/21 2:12 AM, Sven Eckelmann wrote:
> On Tuesday, 2 February 2021 10:12:45 CET Sebastian Gottschall wrote:
>> mmh. l have a idea
>>
>> try the following (this a patch in my tree) and check also the wmi
>> services for this service flag which might be a difference between these
>> firmwares
>>
>> --- a/drivers/net/wireless/ath/ath10k/mac.c
>> +++ b/drivers/net/wireless/ath/ath10k/mac.c
>> @@ -9003,10 +9003,10 @@ int ath10k_mac_register(struct ath10k *ar)
> [...]
> 
> Thanks, for the idea. But this has no effect on the problem. I have also
> attached the services and feature information (from ath10k-ct's perspective to
> have hopefully a more complete look at the differences). And it seems both
> have WMI_SERVICE_PER_PACKET_SW_ENCRYPT and Ben's firmware also
> ATH10K_FW_FEATURE_CONSUME_BLOCK_ACK_CT (which would also have "enabled" this
> code section).
> 
> The biggest difference (which would affect also the non-ct ath10k) would be in
> wmi_services. Ben Greears firmware doesnt support:
> 
> * WMI_SERVICE_PEER_CACHING
> * WMI_SERVICE_HTT_MGMT_TX_COMP_VALID_FLAGS
> * WMI_SERVICE_HOST_DFS_CHECK_SUPPORT
> * WMI_SERVICE_TPC_STATS_FINAL
Sven, I can build you a series of firmware if you have interest in bisecting to see if
this is a regression?

I'll get started on the builds, looks like last time I did a full build of 4019
commits was a while back...

Thanks,
Ben

> 
> Kind regards,
> 	Sven
> 


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
