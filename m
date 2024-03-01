Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F4A9C5478C
	for <ath10k@archiver.kernel.org>; Fri,  1 Mar 2024 14:44:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e6klA8BA/OmzSHSgkOhFG3aplfNwuTlW6Huig6QFISg=; b=ICl7mHUJuSQy3FuYSATdwUWmlM
	/ONXYXz4w4V0Oz2KxVOcrduVJSVyDvSxfRxWCHHLDCJ50VZLM8XNkpGp5CQZlr/4dnQ9ew3eykwuY
	3d38rWo59abyp17we0aCmXOFqexrGIbr5TrcwoOmk8RGrRjRAM4VFipnodW6T2DBCUG8snXD1LY1/
	hfKd7aHtuMXf9c2Q5pDaba8QnirV9naAWSw3UIiVibJXw0P11DzWboe9nymBQxO8NNPijuuAB7IqF
	CsBY8CiAajycj9jdGdTf+jmPW9GEcufQ+XULlP2/fyWATVUZSELAMaiqxX5RvMdz28UrJJC6ZOw5Z
	QXcnSZbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rg47t-00000000lVS-2qpz;
	Fri, 01 Mar 2024 14:44:41 +0000
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rg47h-00000000lIh-2otU
	for ath10k@lists.infradead.org;
	Fri, 01 Mar 2024 14:44:32 +0000
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-6098b9ed2a3so1422287b3.0
        for <ath10k@lists.infradead.org>; Fri, 01 Mar 2024 06:44:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709304267; x=1709909067; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=e6klA8BA/OmzSHSgkOhFG3aplfNwuTlW6Huig6QFISg=;
        b=ds4LSOM241YqJSytWSRIfLRl6gOWMM3nmUe7mRC3LpxbuZAANtJCJoAyR0H0261g8B
         n1Fxpm+/fyZRZn4w4rhJ0W9pIBcooIaJWkb2sM8NmTUaaVw0cxt/EPOZeh198ZZVFB6u
         YXK6djPH3phyUVObjQoRGDVxX1NukLWz6yPTEt51WkznlKXG7YxG8lq17H96z6XLxhqB
         ZcHjiOxGrHQj6L3PF3nfLoyCmbJJhSrDW0vAU8yAWSKh/74OExxEr4cRn561pnQUuBEZ
         ISVEqUX6Vu+j8GAE7YE3JtUFYAT82Pwsqxk1X99nC8oQwIl24r+8XAZ6gii6dlCudp8R
         e2Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709304267; x=1709909067;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=e6klA8BA/OmzSHSgkOhFG3aplfNwuTlW6Huig6QFISg=;
        b=ODJhhZ7AeuNIFpb/Wg4sXzL5irzT1sFp/Mq5QOcku3CrXS5GRexxlI5r90ehjRPmNB
         +4mTf5htaNfTQCnTcD0TY/WrtKSUUHgPxxzw0cfyH40H89SSJ/d3jjRQiPGVmBCPrJI6
         k5EEX/2u8LBzo+u+hdPJln2J7eX539REecIhQyGXaBouPFI2y1IUZHDUOhN8kUJW4mcK
         Qrs1dJc4AnrYZtM5DS5Ib6vcrgLZu98FZpZsLpuB3w4UGatApQ6GmqiBIbS6uKWN11Kv
         8BmzJmQz10fatW/Vw8L7btqPWgHUCwMGcYZGc1cNx02h1VrN2xU8Fb8IH6X66nJg4ff7
         oLUg==
X-Gm-Message-State: AOJu0YxRzaZaD5K8CVYTooDIlyzBSWBnD0Kh6LkIs86QXdEG9ALLTUTH
	vHYM2royz4Gj2et03DrkpxlX9NE3/QnJJZ11zAP9QJ8qAWDl+ajST9/6sghW
X-Google-Smtp-Source: AGHT+IFu6//nzYmK4BaMXm+A8VfbPO1jC9ll4agCgx5T6cmsIRh08mhO6N1gfs9TBCCRTMgoMMsnYQ==
X-Received: by 2002:a81:5b8a:0:b0:608:cda9:b735 with SMTP id p132-20020a815b8a000000b00608cda9b735mr2069572ywb.39.1709304267560;
        Fri, 01 Mar 2024 06:44:27 -0800 (PST)
Received: from [10.102.4.159] ([208.195.13.130])
        by smtp.gmail.com with ESMTPSA id dn9-20020a05622a470900b0042eb68d81ffsm1753635qtb.53.2024.03.01.06.44.26
        for <ath10k@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Mar 2024 06:44:27 -0800 (PST)
Message-ID: <45b4127c-14de-4fc7-8fbe-9d735f0f6669@gmail.com>
Date: Fri, 1 Mar 2024 06:44:25 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ath10k driver crashing occasionally on dell xps laptop with
 QCA6174 802.11ac adapter
To: ath10k@lists.infradead.org
References: <74898fb4-9332-416d-9d92-7812416a0116@stimulussoft.com>
Content-Language: en-US
From: James Prestwood <prestwoj@gmail.com>
In-Reply-To: <74898fb4-9332-416d-9d92-7812416a0116@stimulussoft.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240301_064429_932582_749630EE 
X-CRM114-Status: UNSURE (   8.38  )
X-CRM114-Notice: Please train this message.
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

Purely circumstantial but I've had great luck with firmware:

firmware-6.bin_WLAN.RM.4.4.1-00288-QCARMSWPZ-1

I've tried the latest firmware you are using and noticed no problems but 
we have many devices running the above FW, kernel 6.2 and things are 
quite stable on the 6174.

On 2/29/24 6:00 AM, Jamie wrote:
> Hello
>
> The ath10k wifi driver crashes occasionallyon Fedora 39 (latest 
> version with all updates applied) on a Dell XPS 9570 laptop with 
> QCA6174 802.11ac Wireless Network Adapter.  The machine needs to be 
> rebooted to access the network again.
>
> See attached debug info & hw info.
>
> Thanks in advance
>
> Jamie

