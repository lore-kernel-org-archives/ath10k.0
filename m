Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3432C10F15
	for <ath10k@archiver.kernel.org>; Thu, 25 Apr 2024 09:51:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nLK/2+Gmz94LwlDbbOCw2o1CZf4xvFlqEIiChOLFLF0=; b=Xz7+oCPnDRfhXwtLL8waR1SZW6
	Xq7dm3b5LjDviYT2YftkwQLMRuH+e3qa8sz9JfuNzMTOgMREOs9esfzblyALWdbrUYYxgMtnUOiLz
	mg3EOguDe+qvJSZmxA0K27GLP6Jk3zXqoOVUCOB0oy4Tt63f8qR6I5z7ALqMuXnFg1vYj7AgIYECP
	tlnxOl3jwZsNNjgYc2yxAnmiKlBNM2I2BjHUC9/liAxKcmZS2/ry0v27awbIcmQB0iyyoVwP1IMdv
	AGM70tyZ72T96th0ik/N0A4qX3ryIP9nr5Gep9tWc3m+hA62VaC//xS1cbyPTn87yn1EjYbK1SiL0
	Zdjy+lSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzvlF-00000007hUl-3UCZ;
	Thu, 25 Apr 2024 09:51:25 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzvlB-00000007hSA-1EvO
	for ath10k@lists.infradead.org;
	Thu, 25 Apr 2024 09:51:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 49BF0CE19BF;
	Thu, 25 Apr 2024 09:51:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D60D0C2BD10;
	Thu, 25 Apr 2024 09:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714038678;
	bh=7k8XI8sG2cxfVAaMbdGKMo9UdNnXFtOZQJWS1fzuJHI=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=d1U2hIcfM1rX666Lx6CsRalFsqiQTh3s+jCzhzIhAbXlkD807teSiUXdZHEwZzJM5
	 bBN9jdQLVSpODGMftvB+6bKNXHGyBPvpBgPgHSdCiDHPUKa7qNe4YgELUSKmHI/lWP
	 oqtBABATs1zhn/TwXeOJfBAcuZOtLnFi7XGeHAoPaGj22tElyZ5Oj1auFy/5OzU4Of
	 mytyZr8K1CBFpntl0DPDgOEwUe6VI9J8f82/xRrZRy8OOVFC1YQFX6hW0BRZpDg8/C
	 rfilVvqhCnF7jE61rIc11Sax2KYuGAWrYbU6OinjymWRWoJO65AZN/tkBh2bX4gUn+
	 TnJs29ruBi+8w==
From: Kalle Valo <kvalo@kernel.org>
To: Eric Park <me@ericswpark.com>
Cc: ath10k@lists.infradead.org
Subject: Re: QCA6174 showing terrible performance when connecting via WPA3-SAE
References: <2b4e20fa-3c76-4800-b872-f5d20b0cfe95@ericswpark.com>
	<87r0ghf4rw.fsf@kernel.org>
	<a1231edb5e12283f6f5fbbf9e0ba7af8@ericswpark.com>
Date: Thu, 25 Apr 2024 12:51:15 +0300
In-Reply-To: <a1231edb5e12283f6f5fbbf9e0ba7af8@ericswpark.com> (Eric Park's
	message of "Thu, 21 Mar 2024 05:05:34 +0100")
Message-ID: <87wmolsrcc.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240425_025121_532464_9DE2985C 
X-CRM114-Status: GOOD (  21.13  )
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

Eric Park <me@ericswpark.com> writes:

> Resending as I forgot to CC the mailing list, sorry! I've added some
> more info since the last email.

Thanks. Let's keep the discussion on the list so that others can join.

> On 2024-03-11 11:21, Kalle Valo wrote:
>> But with modern CPUs I would have still expected software encryption to
>> be faster than 20 Mbps so the chances are it can be something else as
>> well.
>
> I just checked and the laptop has an i5-5200U, but I'm not sure if
> it's the bottleneck. I ran a speedtest while monitoring the load and
> the CPU usage never went past 20-50% or so.

This depends how you measured CPU usage so I would not make any
conclusions from this yet. I also don't know what's the best way to
measure CPU usage from kernel driver point of view.

>> That's a user space decision and depends on what connection manager you
>> use.
>
> That's the weird part, for some reason I can't get it to force-connect
> via WPA2-PSK. I've tried KDE's network configuration and `nmtui`, but
> when I connect to the network it seems like it tries to negotiate with
> WPA2-PSK first and then "upgrades" to WPA3-SAE. Or at least that's how
> it appears in the network details dropdown if I click on the chevron
> next to the Wi-Fi SSID.

I do not use Network Manager or other connection managers when testing.
It's much more reliable to use wpasupplicant directly and you get full
control. I usually create a custom config file and then start the
supplicant manually. Some pointers:

https://wiki.archlinux.org/title/wpa_supplicant

https://w1.fi/cgit/hostap/plain/wpa_supplicant/README

https://w1.fi/cgit/hostap/tree/wpa_supplicant/wpa_supplicant.conf

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

