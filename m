Return-Path: <SRS0=1Jc9=PQ=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18EBCC433EF
	for <ath10k@archiver.kernel.org>; Thu, 28 Oct 2021 20:36:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DAAE760F0F
	for <ath10k@archiver.kernel.org>; Thu, 28 Oct 2021 20:36:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DAAE760F0F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=candelatech.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8Y/mFVCYgXnuYl1exCb4lE3Et2ji0p7rxaQoDtEUPHQ=; b=SiKQDalZELpNRtvmBRrOs/2kOE
	FAifGsHGKRKh1o0sPbJjT3YP1NGuJcqixzzJzcjKAgaIDqRnttR10UPQwgkzymFt3fUpqwUWEBBWz
	JY6OvOCuLyrbOncBpU+3Cbq4AKCRaF/LayCdvFee0OsGjWyULBqBnNVQk36ZcwGvVjxXuI45f8Cxu
	cP/ifzhkb1r3oVvM6gdvdVFiyTlmlnP95aSzcqnA1b1BxCy9v458gRgeZZA8C8faRL8ydJvVNnouU
	fq3OYhpaGuKqFxyMcaZcmgTjzH9URrxaetwKNVkGmRugV1gZqye106wLdu/OCKHfL22ligIC0xzmv
	LzYWtoMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mgC7r-0093DE-KJ; Thu, 28 Oct 2021 20:35:51 +0000
Received: from dispatch1-us1.ppe-hosted.com ([67.231.154.183])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mgC7o-0093Cr-HD
 for ath10k@lists.infradead.org; Thu, 28 Oct 2021 20:35:50 +0000
X-Virus-Scanned: Proofpoint Essentials engine
Received: from mx1-us1.ppe-hosted.com (unknown [10.110.51.179])
 by mx1-us1.ppe-hosted.com (PPE Hosted ESMTP Server) with ESMTPS id 0B5432A0064;
 Thu, 28 Oct 2021 20:35:45 +0000 (UTC)
Received: from mail3.candelatech.com (mail2.candelatech.com [208.74.158.173])
 by mx1-us1.ppe-hosted.com (PPE Hosted ESMTP Server) with ESMTP id
 8F6D2AC0104; Thu, 28 Oct 2021 20:35:44 +0000 (UTC)
Received: from [192.168.100.195] (50-251-239-81-static.hfc.comcastbusiness.net
 [50.251.239.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail3.candelatech.com (Postfix) with ESMTPSA id DB28C13C2B1;
 Thu, 28 Oct 2021 13:35:43 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail3.candelatech.com DB28C13C2B1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=candelatech.com;
 s=default; t=1635453344;
 bh=3wDN7YU3xvWl5RF2dX/juEVHlHc4Hb786bT6tcV/HmQ=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=nmRnxWJfmEu1MFU6QJkHV4VP1TeA4rQOAeY+lhxV3+DtMo3UJX9eURawtWiUgv8AW
 2g6K8UmUPa0pcDT8//BkizpQYv1P2wlamId8VB+RdBkbEJbrfVa+8tDFnsdl7LtSD0
 DEICdlvgy04IFPCAuVHoxJhn5PbkcqXA0dY5Dd58=
Subject: Re: new "[1/2] ath10k: Try to get mac-address from dts"
To: Christian Lamparter <chunkeey@gmail.com>,
 Ansuel Smith <ansuelsmth@gmail.com>
Cc: Kalle Valo <kvalo@codeaurora.org>, linux-wireless@vger.kernel.org,
 ath10k@lists.infradead.org
References: <20211016234609.1568317-1-chunkeey@gmail.com>
 <87ee855xwa.fsf@codeaurora.org>
 <3a8840ea-1499-950b-fb44-7546a32c586f@gmail.com>
 <875yth5pt3.fsf@codeaurora.org>
 <3aebb711-dc45-3cbf-43cb-12f59909baf0@gmail.com>
 <CA+_ehUxFDUE6BU3TbngKOA-VKCBkTnpOv7ibTjtpur37KrQ4Jw@mail.gmail.com>
 <e6936f55-6ca7-209c-8c3f-5eeae879c9dc@gmail.com>
From: Ben Greear <greearb@candelatech.com>
Organization: Candela Technologies
Message-ID: <5a2bc68a-603c-9a8a-0e7c-eb69b3045dc7@candelatech.com>
Date: Thu, 28 Oct 2021 13:35:43 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <e6936f55-6ca7-209c-8c3f-5eeae879c9dc@gmail.com>
Content-Language: en-US
X-MDID: 1635453345-ZIwNKbTqYTkI
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211028_133549_191679_A43A8575 
X-CRM114-Status: GOOD (  19.33  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

On 10/28/21 1:29 PM, Christian Lamparter wrote:
> On 28/10/2021 20:57, Ansuel Smith wrote:
>>>
>>> The "[1/2] ath10k: Try to get mac-address from dts" patch
>>> will need a respin, so it can apply cleanly.
>>>
>>> Is Anyone interested? If not, I can take a shot at it on Saturday.
>>>
>>
>> A refreshed patch is applied to atk10k-ct repo so it would be good to
>> have the same patch on normal ath10k. Many router would benefit
>> from that.
> 
> Found it!
> 
> https://github.com/greearb/ath10k-ct/commit/e6a7d5b5b834737cd12e357b5efdc2e42d923bf6.patch
> 
> Hmm, Author is now "Ben" and the whole commit message is gone.
> Now, adding the commit message back from your original patch
> is not a problem, but the missing "Signed-off-by" from him and
> you might be.
> ...
> 
> But then, do we need it? Because there might be the option to extend
> device_get_mac_address() instead?! ...

I applied this since owrt was using it and it decreased out-of-tree patches,
and it does not break my (non-owrt) use case.  Other than that, I don't know much
about this patch...

If it is decided this patch should go away, please let me know so I can adjust
ath10k-ct accordingly.

Thanks
Ben


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
