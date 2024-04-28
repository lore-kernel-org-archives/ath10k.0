Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 298CFC4345F
	for <ath10k@archiver.kernel.org>; Sun, 28 Apr 2024 03:04:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=INiTAPtSQ5NRWwUSKrkM+2Hl+9rrJz802g5WHQLeGQA=; b=Ahw4QSJlWd0uL3dMmmIqJdzSf4
	otVdbmRKV497HPCKIiIAcSavmPNvD/WgATJzSSnCpecA06Z7Yy7+r+vdxc2KLIdubqkYEb2kCCdwO
	sfqRnrxgn2KRpsxykRdRi4ULktoOdenrWqABgNlLVx6ug3Y7CC69I6Rj2UHYASa6uIt1Zpp/mxAmP
	lHpyMniDaUrr9hLX2CYgc6+RVQyizcALwx6l94g6kW842KNLg7LLQ6YCxnDU+iA5g2j093JVT1xEq
	x0smjDZn/o4zTpTU+6hxQTnTNfxzgsXVrM68KZcrEJBnXG95mFsY8Fwq+S1hsekghSgcZlUb98VYv
	igTGeMiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0uq6-0000000Gh5t-39Aj;
	Sun, 28 Apr 2024 03:04:30 +0000
Received: from mail-108-mta57.mxroute.com ([136.175.108.57])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0uq2-0000000Gh4z-1HQb
	for ath10k@lists.infradead.org;
	Sun, 28 Apr 2024 03:04:28 +0000
Received: from filter006.mxroute.com ([136.175.111.2] filter006.mxroute.com)
 (Authenticated sender: mN4UYu2MZsgR)
 by mail-108-mta57.mxroute.com (ZoneMTA) with ESMTPSA id 18f22a91b0c0008ca2.002
 for <ath10k@lists.infradead.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sun, 28 Apr 2024 03:04:18 +0000
X-Zone-Loop: 86e8f8715d3fc7024aca394b8cd176a22457ebaac4d9
X-Originating-IP: [136.175.111.2]
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ericswpark.com; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	References:Cc:To:Subject:From:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=INiTAPtSQ5NRWwUSKrkM+2Hl+9rrJz802g5WHQLeGQA=; b=CRCAqhoYat9FunxLLXLm5xzLJ7
	N6qHb5R9+W/+//QXOWIQJGlcLpCFkzga+j9AF38I2Wh3eOlkxwWwFOg1of1vfJBfOO1sARnFLr7eJ
	tlGxQEAk1IEvnSCrTuXW0QhBgXxnsdhhwQkHMHj9+YLvvNSt7FWPf+emPTxZep7RIsEJkk2lpMgkt
	BTZbFoj1QZlmuL6KD/ZooMNyb2LaAW4vMrJqIT/eTQAYHjTHEUx+L+ySpYfCIGMrMLfrifVk0ybNj
	IokLMHJbimxs6kwDgX4lOqC6Efvf+PYcbVBPTRb8f5GFRQjj2DTmgVCSTbRum1C+50Xmi7RjO+0fx
	7FhoOlAQ==;
Message-ID: <eb86c5b7-b1b6-4515-afdf-cf3e78a79df2@ericswpark.com>
Date: Sat, 27 Apr 2024 23:04:16 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Eric Park <me@ericswpark.com>
Subject: Re: QCA6174 showing terrible performance when connecting via WPA3-SAE
To: Kalle Valo <kvalo@kernel.org>
Cc: ath10k@lists.infradead.org
References: <2b4e20fa-3c76-4800-b872-f5d20b0cfe95@ericswpark.com>
 <87r0ghf4rw.fsf@kernel.org> <a1231edb5e12283f6f5fbbf9e0ba7af8@ericswpark.com>
 <87wmolsrcc.fsf@kernel.org>
Content-Language: en-US
In-Reply-To: <87wmolsrcc.fsf@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authenticated-Id: me@ericswpark.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240427_200426_471769_65D34A8F 
X-CRM114-Status: GOOD (  12.42  )
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

On 4/25/24 5:51 AM, Kalle Valo wrote:

> I do not use Network Manager or other connection managers when testing.
> It's much more reliable to use wpasupplicant directly and you get full
> control. I usually create a custom config file and then start the
> supplicant manually. Some pointers:
>
> (...)

I had some time today to test this, but unfortunately I couldn't figure 
out if wpa_supplicant was using WPA2 or WPA3. Trying to connect via 
`key_mgmt=SAE` caused `dhcpcd` to time out looking for carriers, so I 
guess it was connecting via WPA2. In any case the speed results were the 
same as disabling WPA3 on the router-side.

The reason I'm sending this email despite not making much progress above 
is because it turns out I was chasing a red herring. The real problem 
behind the degraded throughput was 802.11w. The router was advertising 
support for it (802.11w capable but optional), but was not forcing 
clients that didn't have the capability (required mode).

In Optional mode, I was experiencing the degraded performance. But after 
I disabled 802.11w on the router side, the speeds recovered to normal 
levels on both 2.4 GHz and 5 GHz bands, even connected over WPA3.

So I'm guessing something on the driver's side is signaling that it 
supports 802.11w, when in reality it doesn't or some bug with the 
implementation causes the speed to drop. Or maybe there's an overhead 
I'm unaware of when 802.11w is enabled? My limited understanding of 
802.11w is that the management frames are protected to prevent deauth 
attacks.

I'm not sure where to begin troubleshooting this, but in the interim can 
I disable the capability advertising on the driver-level? I don't want 
to disable 802.11w on my entire network, if possible.

- Eric


