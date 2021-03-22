Return-Path: <SRS0=Q/R1=IU=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 743CBC433DB
	for <ath10k@archiver.kernel.org>; Mon, 22 Mar 2021 23:58:34 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1BD8B619A4
	for <ath10k@archiver.kernel.org>; Mon, 22 Mar 2021 23:58:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1BD8B619A4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=candelatech.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=iKy3ioVFuC7gQieSku+xb2cMvxrtBVsviPYqnJInAek=; b=mJvmp8teBkM0vx8/mzNU/TvNY
	6zNTmKhoeQDlEBRRMzbFKYZC+hYKkHhBLRBjDmQHf/IoXji0AjbVnfgJv/GBk+h6CAPOO9VtjeBER
	SqmOTt65OixqqUBow0C3kBtxqbWM2Uv8b45iWXwRb4BVeGnf4gVlmQ3Bxc20WI/ReyDYwnKr5g6Zk
	YDCPv4GtFG3tPBOAE+W0f421pXgRJuWuxYi6n3CnMh31huN/R2SPdxD02cXt5Hp+wz3bDiaOkFTcc
	DOOCbwsg0nCS8JKHvvVCOgcayHoJqv4+1NQcanf9kY+Fcogqx3R9R1O7QRkjP+FkrISUuzIJTs/Ey
	xRoCvBBSQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lOUR5-00Cwxs-Cd; Mon, 22 Mar 2021 23:58:15 +0000
Received: from mail2.candelatech.com ([208.74.158.173]
 helo=mail3.candelatech.com)
 by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
 id 1lOUR0-00CwwS-OI
 for ath10k@lists.infradead.org; Mon, 22 Mar 2021 23:58:13 +0000
Received: from [192.168.254.6] (unknown [50.34.172.155])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail3.candelatech.com (Postfix) with ESMTPSA id 8796B13C2B0;
 Mon, 22 Mar 2021 16:58:02 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail3.candelatech.com 8796B13C2B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=candelatech.com;
 s=default; t=1616457487;
 bh=F2kPVH+YIfx7glKDCME0BM3ell9Hw27xQXR6vGdxgdY=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=fOOBW2PSG4xEkmwBzm4IzgVLucWvw5nQhuliy60WR4uzgwp46Ej5sJenIgPKdJFoI
 nqcjvzVwnFr167lW3hlRvHMC8K9unVjPKCHFngHMF7b2SRcJptMBn+knKl6evs/5cb
 /z8wCxp6sjXfWdZ9a62yd8DMR3C1yPt8lmJItto0=
Subject: Re: [RFC 2/7] ath10k: Add support to process rx packet in thread
To: Felix Fietkau <nbd@nbd.name>, Johannes Berg <johannes@sipsolutions.net>,
 Rajkumar Manoharan <rmanohar@codeaurora.org>,
 Rakesh Pillai <pillair@codeaurora.org>
Cc: ath10k@lists.infradead.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, kvalo@codeaurora.org, davem@davemloft.net,
 kuba@kernel.org, netdev@vger.kernel.org, dianders@chromium.org,
 evgreen@chromium.org
References: <1595351666-28193-1-git-send-email-pillair@codeaurora.org>
 <1595351666-28193-3-git-send-email-pillair@codeaurora.org>
 <13573549c277b34d4c87c471ff1a7060@codeaurora.org>
 <d79ae05e-e75a-de2f-f2e3-bc73637e1501@nbd.name>
 <04d7301d5ad7555a0377c7df530ad8522fc00f77.camel@sipsolutions.net>
 <1f2726ff-8ba9-5278-0ec6-b80be475ea98@nbd.name>
From: Ben Greear <greearb@candelatech.com>
Organization: Candela Technologies
Message-ID: <06a4f84b-a0d4-3f90-40bb-f02f365460ec@candelatech.com>
Date: Mon, 22 Mar 2021 16:57:59 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <1f2726ff-8ba9-5278-0ec6-b80be475ea98@nbd.name>
Content-Language: en-MW
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210322_235811_115867_69BEA908 
X-CRM114-Status: GOOD (  13.80  )
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

On 7/22/20 6:00 AM, Felix Fietkau wrote:
> On 2020-07-22 14:55, Johannes Berg wrote:
>> On Wed, 2020-07-22 at 14:27 +0200, Felix Fietkau wrote:
>>
>>> I'm considering testing a different approach (with mt76 initially):
>>> - Add a mac80211 rx function that puts processed skbs into a list
>>> instead of handing them to the network stack directly.
>>
>> Would this be *after* all the mac80211 processing, i.e. in place of the
>> rx-up-to-stack?
> Yes, it would run all the rx handlers normally and then put the
> resulting skbs into a list instead of calling netif_receive_skb or
> napi_gro_frags.

Whatever came of this?  I realized I'm running Felix's patch since his mt76
driver needs it.  Any chance it will go upstream?

Thanks,
Ben

> 
> - Felix
> 


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
