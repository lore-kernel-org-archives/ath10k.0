Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BF9CC30653
	for <ath10k@archiver.kernel.org>; Tue, 25 Jun 2024 06:56:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pnr36tkcPz00uTgSssgvDomriyiuTn9GM/L93N4EtOU=; b=yTE7CVSZ4cmBPjjFFcZqsiHa2Z
	TnEvRAK8jT3ft0Lzp7nOZx1XeBzGA0QtMgKqZmuvTymnTpY6kjnHmHnoa6WF98AnVA+PBVL6/t0Ys
	h0j4CAB85SvxaNqRozonD95/thtOb6jRqtnYGoHf9ttIh5vO6XusR3E/R9hMiupxDGNvcqy5BlwF1
	Z8uFCEjMk/V4Kn94o7taKFD02tck1YZfBd6R9chtJ6kflvM7VDUXSCRLAMImiuhjk9nqyDm9HA7tC
	G6XwTXjxks7Y3Y8AZg24wPEB3DYh1RUIYdHgBWihMMd7+nrdv+p4Br4la7+HR0CODT+Fh6Hqyd8M9
	rvUETrhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sM06f-00000001qz8-3Fc0;
	Tue, 25 Jun 2024 06:56:45 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sM06c-00000001qyT-04p9
	for ath10k@lists.infradead.org;
	Tue, 25 Jun 2024 06:56:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 2E016CE18BA;
	Tue, 25 Jun 2024 06:56:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28222C32781;
	Tue, 25 Jun 2024 06:56:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719298599;
	bh=zNj07+1fdLb+Kkx4sM2QIhA4tF5aq2auTeOEjXT/xsU=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=obLPoGLIauEarta+M0u2bjskALZAJd0r/KaYiMhPmk4EeiBAQPRv59fkiSzK7yXsS
	 voZ2jD7KE7a5IMV/MetpZyrBGtU3Dv25bjnk+P5vzmbSwfVDi4kSKYdp/4oFerLZvR
	 pK493UrhJSjcDn8tesLMfqUl52GCgEif9pi9ARZEGjVVZoRep2w0AxE/KNMHjmYG2s
	 pKVDnSJYqFv6LivMZpLd+TyvIuLCtYGi/XU+P1O6Iih76WGjBivBG2xupBhCrKttFW
	 Dn4T5+Ctsg1/9PBeYL9QvwEiip5NrN4RhUF+uqpW9ip/mK1S3JZ/SzUH6HJmr6x9Oh
	 /uiwllM89N7Xw==
From: Kalle Valo <kvalo@kernel.org>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Koen Vandeputte <koen.vandeputte@citymesh.com>,
  <ath10k@lists.infradead.org>,  linux-wireless
 <linux-wireless@vger.kernel.org>,  "David S. Miller"
 <davem@davemloft.net>,  Eric Dumazet <edumazet@google.com>,  Jakub
 Kicinski <kuba@kernel.org>,  Paolo Abeni <pabeni@redhat.com>,
  <netdev@vger.kernel.org>,  Johannes Berg <johannes@sipsolutions.net>,
  Kees Cook <keescook@chromium.org>
Subject: Re: ieee80211.h virtual_map splat
References: <CAPh3n83zb1PwFBFijJKChBqY95zzpYh=2iPf8tmh=YTS6e3xPw@mail.gmail.com>
	<c470e4ff-3f70-40f6-844a-f9614286509f@quicinc.com>
Date: Tue, 25 Jun 2024 09:56:35 +0300
In-Reply-To: <c470e4ff-3f70-40f6-844a-f9614286509f@quicinc.com> (Jeff
	Johnson's message of "Mon, 24 Jun 2024 20:44:11 -0700")
Message-ID: <87o77pik7w.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240624_235642_447280_C914150C 
X-CRM114-Status: GOOD (  20.36  )
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

Jeff Johnson <quic_jjohnson@quicinc.com> writes:

> On 6/21/2024 1:04 AM, Koen Vandeputte wrote:
>
>> Hi all,
>> 
>> Within OpenWRT, we switched to kernel 6.6 some time ago.
>> 
>> During testing on a WiFi WDS setup (ath10k), I noticed an old standing
>> bug which now prints a lot more data due to the kernel upgrade:
>> 
>> - All WDS stations are connected
>> - The splat occurs
>> - All WDS station seem to go in timeout and disconnect
>> - The behavior is fixed after a reboot
>> 
>> Yes, we use ath10k-ct over here, but this part of the code is
>> identical to upstream ath10k.
>> 
>> The main issue:
>> 
>> memcpy: detected field-spanning write (size 64) of single field
>> "tim->virtual_map" at
>> ../ath10k-ct-smallbuffers/ath10k-ct-2024.03.02~eb3f488a/ath10k-6.7/wmi.c:4043
>> (size 1)
>> 
>> 
>> looks like virtual_map is defined as  "u8 virtual_map[1]", triggering
>> that error within "include/linux/ieee80211.h"
>> 
>> /**
>>  * struct ieee80211_tim_ie - Traffic Indication Map information element
>>  * @dtim_count: DTIM Count
>>  * @dtim_period: DTIM Period
>>  * @bitmap_ctrl: Bitmap Control
>>  * @virtual_map: Partial Virtual Bitmap
>>  *
>>  * This structure represents the payload of the "TIM element" as
>>  * described in IEEE Std 802.11-2020 section 9.4.2.5.
>>  */
>> struct ieee80211_tim_ie {
>>         u8 dtim_count;
>>         u8 dtim_period;
>>         u8 bitmap_ctrl;
>>         /* variable size: 1 - 251 bytes */
>>         u8 virtual_map[1];
>> } __packed;
>> 
>> 
>> According to this page, defining it this way is actually deprecated:
>> https://www.kernel.org/doc/html/latest/process/deprecated.html
>> 
>> What is the correct way to fix this?
>> Converting it to "u8 virtual_map[];"  ?
>
> Adding netdev to the initial message in the thread.
> https://lore.kernel.org/all/CAPh3n83zb1PwFBFijJKChBqY95zzpYh=2iPf8tmh=YTS6e3xPw@mail.gmail.com/
>
> There was some discussion in the thread, with the observation that the splat 
> is fixed by:
> 2ae5c9248e06 ("wifi: mac80211: Use flexible array in struct ieee80211_tim_ie")
>
> Followed by discussion if this should be backported.
>
> Kees said that "netdev [...] maintainers have asked that contributors not 
> include "Cc: stable" tags, as they want to evaluate for themselves whether 
> patches should go to stable or not"

BTW this rule doesn't apply to wireless subsystem. For wireless patches
it's ok to "Cc: stable" in patches or anyone can send a request to
stable maintainers to pick a patch.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

