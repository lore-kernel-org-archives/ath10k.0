Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B86C7C54798
	for <ath10k@archiver.kernel.org>; Sat,  9 Mar 2024 15:08:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:From:To:MIME-Version:Date:Message-ID:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=V/e3qto2HSLY4xIuukvZBf3OiJKu+xQWXeL1N/YPVas=; b=PrLHRXjihktgbu7LGQ2EZ9AMUX
	xOQVbLIa6HEeXZ08TaQQVMyxlSQ+lWVh0/txHVvUFEaR2GO7pcQJBerfhEARUJt9a2rtkxp7rprdX
	xZvE3zXXVc3BGz2RUK8pColGwuUOaWBDlBoro5KS2OkUnBNfod/TUhhWmmD7BX/weQbTVT2WbdjPN
	4p50lAjoFhltBwAqYBvlypuAyzC4V8er66yJb492AElRUTHN0767c1sZmak0vCKZWrTtRp0RS79g0
	kSHht02BSQ9ccj/vmc3sQVQZsqzJQnqW4fF7eawWzqI1/kk7Qn59ZhslMjYmZ4BeOoon744n7Fz6L
	SD3yYR0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riyJX-0000000Db1m-18wP;
	Sat, 09 Mar 2024 15:08:43 +0000
Received: from mail-108-mta218.mxroute.com ([136.175.108.218])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riyJT-0000000Db0M-49Rg
	for ath10k@lists.infradead.org;
	Sat, 09 Mar 2024 15:08:41 +0000
Received: from filter006.mxroute.com ([136.175.111.2] filter006.mxroute.com)
 (Authenticated sender: mN4UYu2MZsgR)
 by mail-108-mta218.mxroute.com (ZoneMTA) with ESMTPSA id 18e23c22f990003bea.001
 for <ath10k@lists.infradead.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sat, 09 Mar 2024 15:08:32 +0000
X-Zone-Loop: fc658cd1566b564c7412b99941f59a2ec7ffdffcd34c
X-Originating-IP: [136.175.111.2]
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ericswpark.com; s=x; h=Content-Transfer-Encoding:Content-Type:Subject:From:
	To:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=V/e3qto2HSLY4xIuukvZBf3OiJKu+xQWXeL1N/YPVas=; b=P3Uclg7yDY/wuHKtc9v389h3Wz
	7wrfUgXT2F/topJojSOoPRIJtVV0rL+1OUWuuAFhM54buJv/B3PsnOfYRr+0BiKryOd/PDPWJeB+0
	Mhbb/Pj/Y3Sbxcz2moflOooeYRhkQ956Uw9dbsmT9CmcJvu7C6GLyIemMgN2mRi9/yBWRGYRQRkJZ
	gyzwY+Wb9MMdXV0YzGVjQeMc7JN1Y2jYvfnsvQxGfFoB8wLbHTNB6iEGjIHTjPZqoTbOq/JAlELlv
	jmh8vKXHSHEUNtZe4qqL0J1WcKLn6FRARMlvjSzL2TFfga7lfhp8MfLAVjiqjKLZw+ine5XNbWGpt
	5MAWtAUQ==;
Message-ID: <2b4e20fa-3c76-4800-b872-f5d20b0cfe95@ericswpark.com>
Date: Sat, 9 Mar 2024 10:08:28 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: ath10k@lists.infradead.org
Content-Language: en-CA
From: Eric Park <me@ericswpark.com>
Subject: QCA6174 showing terrible performance when connecting via WPA3-SAE
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authenticated-Id: me@ericswpark.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240309_070840_273663_3A9903AB 
X-CRM114-Status: UNSURE (   5.93  )
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

Hello! I have a Samsung NT500R5H-Y53L with the QCA6174 card, and I 
noticed I was getting terrible performance (around 20-30 Mbps) compared 
to other devices on the network (600-700 Mbps), when running a speedtest.

I tried modifying some settings and discovered that I can get around 
500-600 Mbps on the speedtest if I limited the router settings to 
WPA2-PSK, but once I set the setting to allow for both WPA2 and WPA3, 
the card connects using WPA3-SAE but then has terrible performance as a 
result.

Is this a driver bug, or a limitation of the hardware? Is there a way to 
force the card to connect over WPA2-PSK?

- Eric

