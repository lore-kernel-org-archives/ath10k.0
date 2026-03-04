Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84005EB7ED7
	for <ath10k@archiver.kernel.org>; Wed,  4 Mar 2026 11:40:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1/dJHXXgjM7U4jEWhHd012hEcHO+KAcGD84rJ67TfR8=; b=L7vL/5DFEfrs9iVxqTU6xwdtOv
	f6hXEuF4nKWigvS29chx6lwCbokEWZToEAouQUDltUoZWDwW1gWhpMQha5i23I184wOZQMe59EyNx
	fObxoBuA05WPsI5DqndQ+WBnhy6Q9czRFamMjp6PaEoMEL2odoJIS2iY/AAf50Jozvno/eFtQH2tL
	RHr565g2GOvQI6kW8943xz2L3fGqhptFiqAKJRDUW78SFNPZv54QVpvs5CBgR1TSf0nq97JFarLvE
	LLj3YhVgR5RuVhictJVem6z5/vwYku/hCN+3h+BzMszI0yPF1Mg0PycRwF0NkfWJWH26UJMf2x3OH
	vz3z/nOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxkam-0000000H7VK-0qdz;
	Wed, 04 Mar 2026 11:40:40 +0000
Received: from mx3.molgen.mpg.de ([141.14.17.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxkai-0000000H7Tp-3bQw
	for ath10k@lists.infradead.org;
	Wed, 04 Mar 2026 11:40:38 +0000
Received: from [141.14.220.42] (g42.guest.molgen.mpg.de [141.14.220.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id 433664C2C37D6E;
	Wed, 04 Mar 2026 12:40:23 +0100 (CET)
Message-ID: <e1a7dc91-e1c3-42e5-afd8-1e8dc4ff23c6@molgen.mpg.de>
Date: Wed, 4 Mar 2026 12:40:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: New warning `ath10k_pci 0000:3a:00.0: not found station for peer
 stats`
To: Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
 Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org
References: <57671b89-ec9f-4e6c-992c-45eb8e75929c@molgen.mpg.de>
 <6a83fd12-edd8-4559-b7ba-75b074fa889f@molgen.mpg.de>
 <5c152304-853d-4142-8553-55cd8907f271@oss.qualcomm.com>
 <2c722676-98c6-4162-96cb-9bea06672153@molgen.mpg.de>
 <badaf39e-6ab7-4be7-944a-cfc9d6757db2@oss.qualcomm.com>
 <e71b2039-0478-4775-b221-753dc25647d5@molgen.mpg.de>
 <80231e1b-fc6f-488f-97f7-92e792954022@oss.qualcomm.com>
Content-Language: en-US
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <80231e1b-fc6f-488f-97f7-92e792954022@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_034037_059149_AAA64F16 
X-CRM114-Status: UNSURE (   9.33  )
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


Dear Baochen,


Thank you for your quick reply.


Am 04.03.26 um 02:47 schrieb Baochen Qiang:
> On 3/4/2026 4:01 AM, Paul Menzel wrote:
>> Am 11.02.26 um 06:43 schrieb Baochen Qiang:
>>> On 2/10/2026 6:31 AM, Paul Menzel wrote:
>>>> Am 09.02.26 um 03:44 schrieb Baochen Qiang:
>>>>> On 2/7/2026 1:55 PM, Paul Menzel wrote:
>>>>>> Am 19.01.26 um 17:41 schrieb Paul Menzel:
>>>>>>
>>>>>>> Since January 10th, I have started seeing the warning below in
>>>>>>> my Linux logs, that reach back to September 24th, 2025:
>>>>>>>
>>>>>>>         [   37.108902] ath10k_pci 0000:3a:00.0: not found station for peer stats
>>>>>>>         [   37.108906] ath10k_pci 0000:3a:00.0: failed to parse stats info tlv: -22
[…]

>>> I managed to reproduce this issue locally. Will submit a patch
>>> fixing it.
>>
>> Sorry for being impatient, but as Linux 7.0-rc2 was tagged, were
>> you able to come up with a patch, or should the commit be reverted
>> for now to have more time to analyze this?
> 
> The patch is under internal review now, will submit once it is
> approved.
Awesome. I am looking forward to it. It’d be great, if you Cc’ed me on 
the patch.


Kind regards,

Paul

