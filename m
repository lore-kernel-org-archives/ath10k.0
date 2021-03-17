Return-Path: <SRS0=O66p=IP=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B551BC433E0
	for <ath10k@archiver.kernel.org>; Wed, 17 Mar 2021 02:14:43 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3176E64F8F
	for <ath10k@archiver.kernel.org>; Wed, 17 Mar 2021 02:14:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3176E64F8F
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=minhng99.cloud
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Subject:Message-ID:To:From:Date:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=BMU0NEzqPlo0yLTAJhKeekkGtfb7Jz6808h08vr8VMo=; b=dvUcRkt021eOE2
	oiB/3hDU3bYL20c9lZPULC6vE0aHJz8xrk9/rs7FKHB2iAuVfUCinia0otLhf8/Wqlw2WA33EQAjm
	mX2aPulg98nSSUGOuiC90UTRSMdpc6tcdc5MhKXkqiwvarfBbLbWlN/2+nMFOM9ThTKTJodFt2/5I
	YySNb2EqeSb6cBAEipu43hYrWW8apUCSb6mXjLeBlDcHNh0gUwd6hJug2uOzyywsgWtvQ1NZSlWNd
	XeUaSGfR+6Tjv5yStBxYwd7jhPkdjOD6NZLt/1mYitPPBfjH72IEQDWt5pJch3DpmLhQEH5iGNS1Z
	6+Od23lPIPv3K0zYX4TA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lMLh0-002HNW-KO; Wed, 17 Mar 2021 02:13:50 +0000
Received: from w4.tutanota.de ([81.3.6.165])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lMLgs-002HN8-Ss
 for ath10k@lists.infradead.org; Wed, 17 Mar 2021 02:13:47 +0000
Received: from w3.tutanota.de (unknown [192.168.1.164])
 by w4.tutanota.de (Postfix) with ESMTP id 58D2310601FE
 for <ath10k@lists.infradead.org>; Wed, 17 Mar 2021 02:13:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1615947222; 
 s=s1; d=minhng99.cloud;
 h=From:From:To:To:Subject:Subject:Content-Description:Content-ID:Content-Type:Content-Type:Content-Transfer-Encoding:Content-Transfer-Encoding:Cc:Date:Date:In-Reply-To:MIME-Version:MIME-Version:Message-ID:Message-ID:Reply-To:References:Sender;
 bh=Mi7OgwzJY/N+TO39sGYWydU14TcaViZhTFO11OgvEvE=;
 b=T2km0fKvBuSv4rR7THJASmWFPX601Aji/FYy11oGhoYE0upYLV13+/xAmlKA4cfM
 2VLGR5K1m6ehT/QsqLurJ9nqjgA69afAjrmb+WHsSXct4+qASnlf2P7jTQuCf83Jui6
 u9O/q86Q/pi2PY1pcMzR9BmvSZ99fcv/3ioQCS5N/6s+J7IX3WPo4J1zv3HHzyRKTyI
 QmTa+6Qx+qqub+NmtC6lKjzoQyOTP5Kwn458Kbp3Xpb5nau9A4kNB4t3hxWhiOi+auH
 iKhgx+USnNfwttF2uzNWA343TeR6533LP7BvckSAJrUfbGdJHevPtBibCDCyua7RnCW
 9tbe9blpXg==
Date: Wed, 17 Mar 2021 03:13:42 +0100 (CET)
From: Nguyen Quang Minh <hello@minhng99.cloud>
To: Ath10k <ath10k@lists.infradead.org>
Message-ID: <MVxxR_s--3-2@minhng99.cloud>
Subject: ATH10K_CSI_BUFFER explaination
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210317_021345_598190_6472D259 
X-CRM114-Status: UNSURE (   2.45  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

Hi, 

I'm wondering what's containing in the ATH10K_CSI_BUFFER that got spilled out while using the CT firmware? There's absolutely no documentation about this whatsoever, does anyone knows what's contained in it?


I've found some CSI-related research that using the ath9k but their sample format doesn't look like the one on ath10k.
--
Regards,
Nguyen Quang Minh

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
