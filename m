Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F49CCCD185
	for <ath10k@archiver.kernel.org>; Fri, 10 Oct 2025 13:13:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ndLPdLs1opX/HmTGT9uGbMqEdTCknmpqnPM67Cur6qg=; b=y0ySbBmP/4FweLtfsNQbUmpf9D
	+c1KFqwQOib6cyzL/ZTnJdLuKQ+EZZcLRwtfq9/GGJOtpDs3uyADcPFq9jvT4klLWVMQ8drGcCuuf
	Ie8k6somHMg3syufXjrHnj/K0+2Sg94aGk/d7lhwlI4RtQ2oOHl9RK0slXzt5Xms36UVu+S/tzOd3
	Ke/s5R7l28wi5Lsc8tE+Vkm/GZDFgnTqMshqBggDtcfd4qwD5ovu4Ee+qH88qDtwbNSfonVahQr5w
	1zaWNdvG8Y1cQgYRRzWGJWEn9NEOCUiKA0+tm4m6F73u6Wohc52rVLu8y/XN16fRN8ZzFs2JR5745
	SQnV5+kA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7Cvw-00000008XXl-3f5n;
	Fri, 10 Oct 2025 13:13:20 +0000
Received: from mx3.molgen.mpg.de ([141.14.17.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7Cvt-00000008XV0-3njb
	for ath10k@lists.infradead.org;
	Fri, 10 Oct 2025 13:13:19 +0000
Received: from [141.14.220.42] (g42.guest.molgen.mpg.de [141.14.220.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id AC6066028F35A;
	Fri, 10 Oct 2025 15:12:50 +0200 (CEST)
Message-ID: <e02b3b8b-78a3-41c7-864e-caba6f1a8c0b@molgen.mpg.de>
Date: Fri, 10 Oct 2025 15:12:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Paul Menzel <pmenzel@molgen.mpg.de>
Subject: Re: qca6174 hw3.2 target 0x05030000 chip_id 0x00340aff: firmware
 crashed!
To: Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
 Jeff Johnson <jjohnson@kernel.org>
Cc: ath10k@lists.infradead.org, LKML <linux-kernel@vger.kernel.org>,
 jamie@stimulussoft.com
References: <5aa2dae4-94ba-45cb-b138-bb40c89a85eb@molgen.mpg.de>
 <486e9f27-3b03-4317-a1fc-1bd92235db1c@molgen.mpg.de>
 <90a764d0-c230-43bb-b7e5-189544839f8d@quicinc.com>
 <e2e58098-4589-4ae4-bc38-6b009823b071@molgen.mpg.de>
 <82b9e966-5e12-4a13-98d4-0ffa88505f97@molgen.mpg.de>
 <d8145c41-1e61-454f-a343-be0a7239e36e@molgen.mpg.de>
 <8354f613-692e-4f6b-933c-3434a5ae90b2@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <8354f613-692e-4f6b-933c-3434a5ae90b2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251010_061318_409362_352CDF19 
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

Dear Baochen,


Am 21.07.25 um 05:21 schrieb Baochen Qiang:

> On 7/20/2025 4:43 PM, Paul Menzel wrote:

>> Am 14.05.25 um 10:08 schrieb Paul Menzel:

[…]

>>> Were you or the firmware team able to pinpoint the problem, and
>>> come up with a fix? Is there any logging I can enable to help
>>> with debugging?
>> 
>> It also happens with a Telekom Speedport Smart 3 (Arcadyan
>> Corporation) router. The firmware crashed five more times since
>> June. A reliable Wi-Fi connection would be really appreciated.
>> Could you send me a debug firmware, so the firmware developers
>> have it easier to fix it?
> 
> Paul, we are working on getting legal approval on collecting
> necessary information, such as firmware dump etc, from community.
> Once done we will share guides to collect them to debug further.

I just wanted to know, if there was a conclusion yet.


Kind regards,

Paul


PS: I set debug_mask to 0xffffffff a while back, and it logged so much, 
that my old boot logs are gone from the systemd journal now. ;-)

     echo 0xffffffff | sudo tee 
/sys/module/ath10k_core/parameters/debug_mask

Any hint on what to set, when the crashes happen?

