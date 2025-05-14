Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7FFCC3ABDA
	for <ath10k@archiver.kernel.org>; Wed, 14 May 2025 09:01:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lUnqYrcPIUENWbM53Uqz11X9IRfpOWA9dxEduxkNaVM=; b=NblDVbKRlK2vy1K/jUkmShkUk2
	kAcP5fKXH3Q4vWnKBF7b454n77KfNdtte/BxuxchZOPf6uNpWq5v0X5hvtG5HGWzrKMPN4VjFBtdB
	hQ/xYp5QaFuROkI2K3KmGGhOqXf7N/M8oBBbcw1/0RDs1k/zAUOc/VSsFojx18ge0kgwENaN37Ia1
	DJCIWXQpzPmI0V+0MLGKEELaRpd9r7DtPLKXYrpbm+g+XBo8SJ7PxYaqgLqhQkm4RQon5pnd2oYjA
	2OQoPkdaPnqJGw/h6Rw5zN5kplsZ3ksNPUt3K8W1j1V1qiI45WzakEfvoIgEyRNcxNBXQs2CAYiZu
	5AfKhoig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uF7zK-0000000Eb8m-1tY9;
	Wed, 14 May 2025 09:01:18 +0000
Received: from mx3.molgen.mpg.de ([141.14.17.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uF7P7-0000000EUSb-413h
	for ath10k@lists.infradead.org;
	Wed, 14 May 2025 08:23:55 +0000
Received: from [192.168.0.192] (ip5f5af522.dynamic.kabel-deutschland.de [95.90.245.34])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id B9FB061E6479A;
	Wed, 14 May 2025 10:23:45 +0200 (CEST)
Message-ID: <12cc81d5-f134-4460-9139-754a69821f12@molgen.mpg.de>
Date: Wed, 14 May 2025 10:23:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: qca6174 hw3.2 target 0x05030000 chip_id 0x00340aff: firmware
 crashed!
To: Jamie <jamie@stimulussoft.com>
Cc: Baochen Qiang <quic_bqiang@quicinc.com>,
 Jeff Johnson <jjohnson@kernel.org>, ath10k@lists.infradead.org,
 LKML <linux-kernel@vger.kernel.org>
References: <5aa2dae4-94ba-45cb-b138-bb40c89a85eb@molgen.mpg.de>
 <486e9f27-3b03-4317-a1fc-1bd92235db1c@molgen.mpg.de>
 <90a764d0-c230-43bb-b7e5-189544839f8d@quicinc.com>
 <e2e58098-4589-4ae4-bc38-6b009823b071@molgen.mpg.de>
 <82b9e966-5e12-4a13-98d4-0ffa88505f97@molgen.mpg.de>
 <1909038a-bde9-4def-bcb8-0f67bff5c62d@stimulussoft.com>
Content-Language: en-US
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <1909038a-bde9-4def-bcb8-0f67bff5c62d@stimulussoft.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_012354_139812_0F4983E6 
X-CRM114-Status: UNSURE (   4.39  )
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

Dear Jamie,


Am 14.05.25 um 10:19 schrieb Jamie:
> Check your voltages. In my case, my voltage settings were wrong.

Where did you do this? In the system firmware?

> After adjusting them, the drivers started working again.
Then it’s a different problem. I am using a Dell XPS 13 9360 laptop, and 
I didn’t fiddle with any voltages. Even if Linux’ power management 
behavior changed, it’s hard to pinpoint a possible regression, as I have 
no reproducer.


Kind regards,

Paul

