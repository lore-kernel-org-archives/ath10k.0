Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39914C021AA
	for <ath10k@archiver.kernel.org>; Wed, 19 Feb 2025 21:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mEMz/oYmR1MBObTIPs1ICzk7y4X8xDorZEGNoBgFUik=; b=TFjZ1Dw26j7p8GCnid3PuL9sKL
	qZSwHWp6ol7M06+1BN5gR7R9gTjZBms32Ti8cBHSNcUBuckFDOEYtGsTAEljLOER6jNWpur0LBGop
	EB5xei/xnvuNOjVhEh6L65nTkkbHSKipooq3o5eQpR/OJlE0aZrP1o292au3HhFkinQ4ijJUok/HS
	Cbge1aEMCo1SPyHxjIx4xP6aa76qrvQbWR9q53jOlt7+bEi3yfXR9Tlss+T//ftqPkbrH2HXRr63I
	QdqpzxbIsVKdKUcTTWNjV5g+cI6NQ/oHTPwygfyH7l5pD0XKe58zho53CswZ+Xp+7gbTVP2uogB0E
	qHijlEpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkrd5-0000000FCNZ-2qkl;
	Wed, 19 Feb 2025 21:29:15 +0000
Received: from ns2.wdyn.eu ([5.252.227.236])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkrbx-0000000FBuJ-0S4P
	for ath10k@lists.infradead.org;
	Wed, 19 Feb 2025 21:28:07 +0000
Message-ID: <6586339a-d9c5-4787-95e4-202368341541@wetzel-home.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=wetzel-home.de;
	s=wetzel-home; t=1740000475;
	bh=3JalU3tGz2pk5RuHTjKELmx2o9pzjU/qxgXgUtLWllA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=N9G7Ij17j9mZfcV8pCN+6bsRg2Gm0wFkC8StRKHxbNf+uLnCLVzF1wuOMdiKQFWhp
	 DunH4DmaZqQKgMBY+7xVGojQ/f6tdDV0hDG/wSvgiFHSySilaaOgOf6q+3+vsHXOPa
	 qQhcTW1Jf+Zeoe1g0euMoVjZvvtfkxKpgOjSZE74=
Date: Wed, 19 Feb 2025 22:27:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/10] Convert mac80211 to TXQs only
To: James Prestwood <prestwoj@gmail.com>, linux-wireless@vger.kernel.org
Cc: Johannes Berg <johannes@sipsolutions.net>, ath10k@lists.infradead.org,
 Remi Pommarel <repk@triplefau.lt>
References: <20250217081721.45110-1-Alexander@wetzel-home.de>
 <548270b0-8267-4a94-85ab-597ade0f5082@gmail.com>
Content-Language: en-US, de-DE
From: Alexander Wetzel <alexander@wetzel-home.de>
In-Reply-To: <548270b0-8267-4a94-85ab-597ade0f5082@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_132805_594548_45847D1D 
X-CRM114-Status: GOOD (  11.75  )
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

On 19.02.25 20:19, James Prestwood wrote:
...
>>
> Trying to get some clarity if this might fix a regression [1] with 
> ath10k where upon roaming the TX queue hangs on flush for ~4-10 seconds. 
> I was hopeful for another set [2] but it looks like this only effected 
> AP mode and with that applied I still notice the behavior.
> 
> In the worse case we see two failures, which add up to about 10 seconds 
> of delays, more often its just the single "failed to flush transmit queue"
> 
> Feb 19 14:15:59 kernel: ath10k_pci 0000:02:00.0: failed to flush sta txq 
> (sta 6a:3a:0e:22:45:08 skip 0 ar-state 1): 0
> Feb 19 14:16:04 kernel: ath10k_pci 0000:02:00.0: failed to flush 
> transmit queue (skip 0 ar-state 1): 0
> 
> Crossing my fingers this set will have some positive effect here
> 

I had a quick look at ath10k driver and the error message you have. The 
patch series here will probably not help with that. From driver 
perspective nothing relevant should be different...


> [1] https://lore.kernel.org/all/ 
> CA+Xfe4FjUmzM5mvPxGbpJsF3SvSdE5_wgxvgFJ0bsdrKODVXCQ@mail.gmail.com/
> [2] https://lore.kernel.org/linux-wireless/ 
> cover.1732293922.git.repk@triplefau.lt/
> 
> Thanks,
> 
> James
> 


