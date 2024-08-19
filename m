Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71701C5320E
	for <ath10k@archiver.kernel.org>; Mon, 19 Aug 2024 11:53:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D5d7cw/YWHZ4nKAN+vpIKJ2wO1nm4VwfTAFEM5eJD4Q=; b=nen6G0K+ry7IJloIayH+j0AN+J
	dcc3upW4E/2XR4hPLv3nAWqLcYmnOmPJjRBPmRzw2l0qgIayLqB6WenehZhCOcTnDKVItnYHs5Zuc
	QQn4lV+zlAod865tC/dRdxxrmWM4ksPlMaGIzaSD19Y3oxGG2LCkXmO9NLCK5J7tYbzR7bw0WWx1a
	tYCAicJirH7rBXBXoHboo6ENv9CbqZVUXFFIQeddHvfi0gUDMQRiSqpA7OXd5KampZcz83RPSh+OZ
	gWTZmDX8X4ueJi861pAzXSSAzKN8H7cb9fS2kNLllW9exyZsuQQ2VWMbGRP2rj9Wip6NZotyMya9I
	MseqC88Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sg0xG-00000001Ik5-14v7;
	Mon, 19 Aug 2024 11:53:46 +0000
Received: from mail-qt1-x82d.google.com ([2607:f8b0:4864:20::82d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sg0ra-00000001HDq-0THz
	for ath10k@lists.infradead.org;
	Mon, 19 Aug 2024 11:47:56 +0000
Received: by mail-qt1-x82d.google.com with SMTP id d75a77b69052e-44ff398cefcso21651291cf.0
        for <ath10k@lists.infradead.org>; Mon, 19 Aug 2024 04:47:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724068072; x=1724672872; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=D5d7cw/YWHZ4nKAN+vpIKJ2wO1nm4VwfTAFEM5eJD4Q=;
        b=UqDO27lpW9hkPrx1sIXoa6vOlsAkuZa+vtB9cr9fa3S7eq+5frnJgOZtliLP//5zqs
         N45DsxaEaYv0XcNyPWLjyWeAmaJKDbvLqwVHOApEFhUJJS2JvQYOeTIO9bnJvDHGm8d+
         xKYU+AQIr0ao06WWpJe8bMzItwus/W4SWbgPmmZzcCEmXasKKKTa9QqSK7Qjlptr6m3e
         ccR+A0IhirLBgzlU6w/Tib/eOg3EZESJm59K/Xa7OXwylYfQ5TpJ/Z1rBpL+tp/U2cnc
         gHEyIgGZFjiaZRvfBoKyqBlGS4Bi8xkip5lGbpLsiShQJlilqOU4e8JsRtzbn7Fp+Ac1
         OyFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724068072; x=1724672872;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D5d7cw/YWHZ4nKAN+vpIKJ2wO1nm4VwfTAFEM5eJD4Q=;
        b=nfzLzmIZ8HqCVrqydZL178b2Ky95Srim4QNwduJaye0tLTA6LgU/xaJPDqOBEbJYub
         KqZo1RRx98xGRSFX3m6YGVg9OlnB7uQm7eWC33BKEb/Y7ivanjfUlRr/OaKfJl2p5azH
         K6Yar4HYWEGYfELuQE4FnFXrj2cDEafv2FDHT8NAXAOE6XAkDFGv0+om5cFwqUTwXci0
         yqVKxVKsY2U5nMIqXwt/0jIBXk90lAOQ2O0ByOWmp/Wc+1ZUj+n99b6VOGTKPBBxZnRP
         giHfsuSre6Jea5TCW5UYKROiWtLr388TxFSfs2LM/b8KqgsaiO0zBLH6vLUG5Y0XKul0
         GDPg==
X-Forwarded-Encrypted: i=1; AJvYcCVqPXLhy3wy/LUmFdskIm5D+GLr90shvHgpAiv2UsB+oMskOt7ZqIczcv7Na2CnBeniygToooMUB4axBv7p1lrqJoZtUWVO1ztWUQ==
X-Gm-Message-State: AOJu0Yyb3MiAgxrdSLU7lfYi4zHHXkg1h0lZk5BkyI4fZ1dvgmnDJVlJ
	1RN6ig8pYnUsB5yIMtbrtFNYTJ0uMKKgx6ox+Xi53JdDHBbIN6rHZfOMbA==
X-Google-Smtp-Source: AGHT+IEwn4dvL8BKDykbdDKw/fXfIwMmGaf0fumMw/yF9FcviDfDSH6adsnhTCOGh+MUDuQ2pZBBUA==
X-Received: by 2002:a05:622a:590d:b0:450:9:a434 with SMTP id d75a77b69052e-45374207abdmr127292521cf.19.1724068072090;
        Mon, 19 Aug 2024 04:47:52 -0700 (PDT)
Received: from [10.100.121.195] ([152.193.78.90])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-45369fe6da1sm39618721cf.22.2024.08.19.04.47.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Aug 2024 04:47:51 -0700 (PDT)
Message-ID: <6e93a6c8-015f-4649-8c72-d21fa9f9fde9@gmail.com>
Date: Mon, 19 Aug 2024 04:47:49 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] wifi: ath10k: fix invalid VHT parameters
To: Baochen Qiang <quic_bqiang@quicinc.com>, ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20240711020344.98040-1-quic_bqiang@quicinc.com>
 <603104a7-a1ea-43c2-b0d5-fd4e46a27fe6@gmail.com>
 <64c8a9c6-9da7-4e25-9245-490c9e7e21d2@gmail.com>
 <e49b05be-7fdd-4007-9137-e46703812fa1@quicinc.com>
Content-Language: en-US
From: James Prestwood <prestwoj@gmail.com>
In-Reply-To: <e49b05be-7fdd-4007-9137-e46703812fa1@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240819_044754_242314_13D7807D 
X-CRM114-Status: GOOD (  14.86  )
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

Hi Baochen,

On 8/19/24 2:45 AM, Baochen Qiang wrote:
>
> On 8/14/2024 11:46 PM, James Prestwood wrote:
>> Hi Baochen,
>>
>> On 7/15/24 5:38 AM, James Prestwood wrote:
>>> Hi Baochen,
>>>
>>> I've compiled both changes and so far those messages are gone.
>>>
>>> Tested-By: James Prestwood <prestwoj@gmail.com> # on QCA6174 hw3.2
>> I just noticed another one actually:
>>
>> invalid vht params rate 585 100kbps nss 1 mcs 4
> Ah :(
>
> James, could you share some info about this? like hardware target, firmware version, AP model, and any specific steps to hit this.

This is running with your fixes in this patch set, which did fix the 
majority of the "invalid vht params" messages, but then recently I 
noticed some others.

The hardware:

kernel: ath10k_pci 0000:02:00.0: qca6174 hw3.2 target 0x05030000 chip_id 
0x00340aff sub 168c:3363
kernel: ath10k_pci 0000:02:00.0: firmware ver WLAN.RM.4.4.1-00288- api 6 
features wowlan,ignore-otp,mfp crc32 bf907c7c

And its actually a few more than I thought:

ath10k_pci 0000:02:00.0: invalid vht params rate 900 100kbps nss 3 mcs 4
ath10k_pci 0000:02:00.0: invalid vht params rate 867 100kbps nss 2 mcs 6
ath10k_pci 0000:02:00.0: invalid vht params rate 540 100kbps nss 3 mcs 3
ath10k_pci 0000:02:00.0: invalid vht params rate 1500 100kbps nss 3 mcs 7

I unfortunately don't have a way to reproduce it. We just see this now 
somewhat rarely, e.g. 13 of the above in the last 3 days. I assume its 
just when the MCS/NSS changes and we hit a rate that isn't mapped right 
like the few you fixed.

Thanks,

James


>
>> Thanks,
>>
>> James
>>
>>> On 7/10/24 7:03 PM, Baochen Qiang wrote:
>>>> supported_vht_mcs_rate_nss1 and supported_vht_mcs_rate_nss2 in host do not
>>>> align with firmware's definitions, resulting in some warnings. Fix them.
>>>>
>>>> Baochen Qiang (2):
>>>>     wifi: ath10k: fix invalid VHT parameters in
>>>>       supported_vht_mcs_rate_nss1
>>>>     wifi: ath10k: fix invalid VHT parameters in
>>>>       supported_vht_mcs_rate_nss2
>>>>
>>>>    drivers/net/wireless/ath/ath10k/mac.c | 4 ++--
>>>>    1 file changed, 2 insertions(+), 2 deletions(-)
>>>>
>>>>
>>>> base-commit: db1ce56e6e1d395dd42a3cd6332a871d9be59c45

