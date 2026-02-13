Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51102EDF15B
	for <ath10k@archiver.kernel.org>; Fri, 13 Feb 2026 14:01:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1owc5fSNao93rCPFWkK7NA9JKqo3uiZe2XxwFF/zRyk=; b=SFF4fFv/7l9X/p/H9d8My/6tRh
	sph8nyOZl7h7QHC6x6iCGiXGsv8KnqZvS1UiazPaXn4x3DaEKtL6XC0B2e+OlfM3B13c5iqRsGYnW
	lNnuULyrDBRf3gHLQPyDlFgDZhVu47XPMz2RvlBi3yE0La3vHq/LVM40TQlnzzmnfZTkLzVpCw0H9
	wU1hMZ9d9WZscY1jKfjm2kkbBbNG9Sc5AbGHo4efUi6fv9HzEsRfJ8DyX5HzRugtXEgK77J8MbFYe
	amkVTCwXyQpGNioC7q5fFmNjaqr3zkvoFXyEwF3ttnJFdJcykrMWaecJvTZNCcYLXdolbJWFKKi8E
	jduYIFTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqtjJ-00000003VxI-1dxw;
	Fri, 13 Feb 2026 14:01:09 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqtjG-00000003VwX-3TFy
	for ath10k@lists.infradead.org;
	Fri, 13 Feb 2026 14:01:08 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2aaed195901so4816395ad.0
        for <ath10k@lists.infradead.org>; Fri, 13 Feb 2026 06:01:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770991265; x=1771596065; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1owc5fSNao93rCPFWkK7NA9JKqo3uiZe2XxwFF/zRyk=;
        b=hQ1EAxmJf3MGO/hm792RfyPPHuQPS/rKgrqvm+G4VHT4pTInUDQIse83Y1bLpgJbNG
         ycOnEA58CxgemvWXOAwEJ6qEn944hskJqv46QDHU7GahXJTN+vpEKHFBX9FKPXXr4g5o
         Gh4RBnGKohNzXZsBaGFulHa/w2EFtICMH8RjGTxMo0ruBIVS8foJabh2XrGO5J79s7Z0
         0IAD1f2OWOADKXE2yso2fc4vJAgtc4xH8/YMCUR/txm7WXfkaNogW15zKodQk9zRJLXM
         pYJggDHJ8hrTCH4og/vtvu0S2EE0BOl1qZPVm+KaP5qi1Pe4Ac4bSa1X/fe3IgI1ghfq
         0bdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770991265; x=1771596065;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1owc5fSNao93rCPFWkK7NA9JKqo3uiZe2XxwFF/zRyk=;
        b=jgrhALSe6ZtTs2b6W77rT2u1VZwqCCuVJvvsWciYsaiv8YRtTOdDAKS6bBmTSpCD+5
         Cf4uSIVgBjYV0HBlkgZm08RLo7M/2nFok5hJrai7HJAgCmV9aXQ9e6Yvf9dvwfoh/ZeS
         aDFXIcQvr/T4BJL+4P4pqzKuwFzrLIqNVk9Dz2OnwyoOItnRBWm4wF2CwDGmT4pR69iu
         cEHth+xzXSyN5fPiDug2J1iIbLedqpoIhAZSt7JTlxM+70S4yYSKEaze7FFDRAlIO/A5
         gVp3dx7lba74GVJ2KpX1ubSKzn3fSdCtvyYxe/DWmfCPkgzKZmXKvKEivafxvVlZD+34
         OnQg==
X-Forwarded-Encrypted: i=1; AJvYcCU7RWMsQ6Js4WCUaKB1ckkv4S7Wio2B0F7ADXwz6UemajUNOjihEjsbzH7wwhxZXOXUJqaJdk8=@lists.infradead.org
X-Gm-Message-State: AOJu0YzN191Rf3ppttRRa9G8OIp6yljbAp3Jdvs21+N4YhmnDEU0vTpe
	PF4Kbwr04zELL/ZjE7Y2WVe1UZ6/lL+uwuSiRXFUj87hARTUH9vARk5m
X-Gm-Gg: AZuq6aKiD08PBMbBR5c977FGe6P4w3nHh8+9xIuYbDyvLxSVwDhpssA1dBHJsrO2nLR
	p3js3ECzKdoTijS3FI3/GLQHqUvwI9MupsXwGMe8ZBR404ZBqO8Ixp2cTd0czVhjsb/vcFYL5br
	4nRokL7Q0q6GTAWX0yWws3X7JmUgWq0sLpmA8/zlMeg1mCfiPp6FagKnn9JoT0zs36giHxiQsGW
	bSIzSbDsUD0u0tgZflhvIU62IIlUpO5nhxutszpTyg9HJkfX2kyRr62bVM1QqfNX8BamEDcYCCL
	L2JkidWDUDFoc69RUmFGdYIapfyPQE8vkQI2oCGszmd8jL+2C0PiAtObqS9Duv6xHWik+s3rkOw
	88FBORBqrkYZWvVX1nFLW9ciahg3RFTHcY8eOn3Rz8nt74QYBHowgzh7C13yxMchDfBb3i796oo
	u9LXyBrLCzcgGZX6rD+Xw+Ewf/5+HDmm7KTDeMVuYmBbzbYJd6RmzLzCdo
X-Received: by 2002:a17:903:1904:b0:2a9:30d4:2b0c with SMTP id d9443c01a7336-2ab5060d2b9mr18764565ad.46.1770991263619;
        Fri, 13 Feb 2026 06:01:03 -0800 (PST)
Received: from [10.100.120.15] ([152.193.78.90])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ab29998eeasm88343145ad.87.2026.02.13.06.01.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Feb 2026 06:01:02 -0800 (PST)
Message-ID: <1c6a4aaa-b450-4843-8c44-930a8c3f6d66@gmail.com>
Date: Fri, 13 Feb 2026 06:00:59 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/2] wifi: ath10k: only wait for response to SET_KEY
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
 Richard Acayan <mailingradian@gmail.com>, linux-wireless@vger.kernel.org,
 ath10k@lists.infradead.org, Baochen Qiang <baochen.qiang@oss.qualcomm.com>
References: <20260210021249.12132-1-mailingradian@gmail.com>
 <20260210021249.12132-3-mailingradian@gmail.com>
 <dd019903-f8d9-4bd3-a90d-b4d505f489f3@gmail.com>
 <3e1274fd-fe95-420c-94e3-ac34f497b7ae@oss.qualcomm.com>
Content-Language: en-US
From: James Prestwood <prestwoj@gmail.com>
In-Reply-To: <3e1274fd-fe95-420c-94e3-ac34f497b7ae@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260213_060106_900112_ABADAAA2 
X-CRM114-Status: GOOD (  13.61  )
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

Hi Jeff/Baochen,

On 2/12/26 9:56 AM, Jeff Johnson wrote:
> On 2/11/2026 6:11 PM, James Prestwood wrote:
>> On 2/9/26 6:12 PM, Richard Acayan wrote:
>>> When sending DELETE_KEY, the driver times out waiting for a response
>>> that doesn't come. Only wait for a response when sending SET_KEY.
>> We've run into the exact same thing on the QCA6174 and have been
>> carrying an identical patch to this for at least a year.
>>
>> https://lore.kernel.org/linux-wireless/b2838a23-ea30-4dee-b513-f5471d486af2@gmail.com/
> Baochen,
> Were we ever able to reproduce this?
> Do we normally always get a response to DELETE_KEY but in some instances it
> comes very late (or not at all)?
> If we remove the wait, is there any concern that a late arriving DELETE_KEY
> response might be processed as a response to a subsequent SET_KEY command?

For some added color, we only see this oddly with some vendors of APs, 
primarily "classic" Cisco Aeronet equipment (not Meraki).

Its still a mystery why certain AP vendors are able to trigger this 
given its deleting a key locally on the device. The major issue here is 
on roams when deleting the key from the prior BSS where we time out, 
thereby delaying the roam for 3 seconds. This then causes downstream 
effects like the reassociation timeout expiring on the AP which causes a 
disassociation. With some customers using Cisco its actually happens 
near 100% of the time, killing roaming entirely.

Thanks,

James

>
> /jeff

