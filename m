Return-Path: <SRS0=xh5s=H4=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85A45C433E0
	for <ath10k@archiver.kernel.org>; Fri, 26 Feb 2021 18:04:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3D98364F03
	for <ath10k@archiver.kernel.org>; Fri, 26 Feb 2021 18:04:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3D98364F03
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sipsolutions.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=wdoV75jwsJcV0skhMWTUYoSXgUi0zU5aw7iE7TuvRH8=; b=cCjE+msA54RvT4fJXI3K0caOO
	gx7Yy/VcDyc1RFs6T97NKc9B5SBzLGqmqRSPm6QtdT6HkhAZPCK07DTpGi2KnxA7iPTryyB7jngAt
	VODwB/6ZZwAT8Vwh9YmCAfH9uFjCIHUXdfs/HccGXlOBaG6bnKz54CrJ8sTMccRehRStdYDl7PKk4
	ojaTwe8qt0BHJLRMw2FeJzAX/0TXj3NyAdKr+8iPs+hOgh/Ywjxjxq4Egh0mNzqwe1ykFGNl8XW1t
	9KQXyveX0iGBVW/U2a2d4c3I+oIA8fdE23QfqWf4YcYOEr/LqoaKjaGu+M2ZEt1sP4mjB+aimgqN+
	xlctGpuFA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lFhT5-0001ur-Gb; Fri, 26 Feb 2021 18:03:59 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lFhT2-0001uE-S9
 for ath10k@lists.infradead.org; Fri, 26 Feb 2021 18:03:57 +0000
Received: by sipsolutions.net with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.94) (envelope-from <johannes@sipsolutions.net>)
 id 1lFhSn-0091en-Ra; Fri, 26 Feb 2021 19:03:42 +0100
Message-ID: <4a997ea7b6625428c21dc3e423e96ee54d6785e2.camel@sipsolutions.net>
Subject: Re: [PATCH v2 2/3] lockdep: add lockdep lock state defines
From: Johannes Berg <johannes@sipsolutions.net>
To: Shuah Khan <skhan@linuxfoundation.org>, peterz@infradead.org, 
 mingo@redhat.com, will@kernel.org, kvalo@codeaurora.org,
 davem@davemloft.net,  kuba@kernel.org
Date: Fri, 26 Feb 2021 19:03:40 +0100
In-Reply-To: <af1511df953fe49f95953cbc23d86fb7cdaff58d.1614355914.git.skhan@linuxfoundation.org>
 (sfid-20210226_185441_806149_D5A42553)
References: <cover.1614355914.git.skhan@linuxfoundation.org>
 <af1511df953fe49f95953cbc23d86fb7cdaff58d.1614355914.git.skhan@linuxfoundation.org>
 (sfid-20210226_185441_806149_D5A42553)
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210226_130356_967330_4562C72E 
X-CRM114-Status: UNSURE (   7.49  )
X-CRM114-Notice: Please train this message.
X-BeenThere: ath10k@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, ath10k@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org


> @@ -5475,7 +5476,7 @@ noinstr int lock_is_held_type(const struct lockdep_map *lock, int read)
>  		/* avoid false negative lockdep_assert_not_held()
>  		 * and lockdep_assert_held()
>  		 */
> -		return -1;
> +		return LOCK_STATE_UNKNOWN;

I'd argue that then the other two return places here should also be
changed.

johannes


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
