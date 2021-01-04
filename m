Return-Path: <SRS0=WYzE=GH=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	PDS_TONAME_EQ_TOLOCAL_SHORT,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF011C433E0
	for <ath10k@archiver.kernel.org>; Mon,  4 Jan 2021 16:19:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6D93920578
	for <ath10k@archiver.kernel.org>; Mon,  4 Jan 2021 16:19:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6D93920578
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=candelatech.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:Subject:From:To:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1lG6N9jVcuRn7SSxyfF7isEIUP5vEprCliZTNuS8Gsk=; b=igd+Jue2yeNF2J
	t+XS1jSoqvZtVNzWlZrY2z4pgR8GiMGZKJ0iEgOr1IUXVeXBToHpHwz9wnvhvW5YGPUb2YHT+pnof
	Fv+Z8+wVJ/kONd+qdHpigjDOgAcNABApOzTsGIUAppP8QQX/NdlWXpBiHgvAbSMv1I3bii5Cu/zx6
	eOrujPrtiY/K/ifeOj8negPiAtn2S+/twlPdN+6HBom8pKbXVtghsJGmexd4rqYPn+mFVwldzbdgV
	W3dYw9gSRFem6Gflh4mvFV2PprdWqemBCKocOx1glp7TZJcVbsK86GYo1pEaD5H8+alZ0jr+kL561
	72j0su6AxVyN2hfkB+gQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kwSZk-0007P7-UN; Mon, 04 Jan 2021 16:19:20 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kwSZj-0007Oy-F7
 for ath10k@merlin.infradead.org; Mon, 04 Jan 2021 16:19:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:Date:Message-ID:Subject:From:To:Sender:Reply-To:Cc:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=nabYNI0Sh/GvJpP+RlEbLVCygX2y05AqMEsduR2DOYY=; b=X8mC2G8/isPNj3zzay/RtGxHbR
 VKnB9YyuC9SEfzIH99jkjI52ZiJoSSaOith3fmog1IM5WZm7A+01+wj93JQcZ721o5+m+QTFNmaYr
 /BwhTJPqclTfvB+1BGCi8Z0gwkICUOkaOX0WQ9WH1wn8Zw/SVm8bUFUmOsgu/eptQPUP/mfAfn9yC
 pJam8GpLe3Xmn3+J0v5FX4ThQ6mcNkhkXkZhvWBgqkY5Aq33uNr/6hl31TH6/xnE1bkhlo8ec9GUL
 +9HGQz05PApOGnJX7FW6bBJ0plHkT4IxZKJV+ilRCDBBl/s22F1/rjT4XemUk/ORLfp38cyQmNQ4E
 SpyK4nXQ==;
Received: from mail2.candelatech.com ([208.74.158.173]
 helo=mail3.candelatech.com)
 by casper.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
 id 1kwSYw-000HxK-7H
 for ath10k@lists.infradead.org; Mon, 04 Jan 2021 16:18:38 +0000
Received: from [192.168.254.6] (unknown [50.46.152.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail3.candelatech.com (Postfix) with ESMTPSA id EB96713C2B0
 for <ath10k@lists.infradead.org>; Mon,  4 Jan 2021 08:18:24 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail3.candelatech.com EB96713C2B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=candelatech.com;
 s=default; t=1609777105;
 bh=AdUi0IJLTg5nGOMok8yyWtWHilMSEclliE6RtYWBfSI=;
 h=To:From:Subject:Date:From;
 b=sub4RaluvNMcV1m5a+gIVWQ4wDKy4ZqiRImGujJtMtFhTgqSw6xZblt/P55bFZpsp
 SE9+zPJINvD/KQqGqO6NIoN3DR+43MnO9zTeOJqgfnMtUh5sNvvC19j0far/mJh2On
 JAOOhxFSyLI0OZbQp/b+ahpfw5iy4anymh+DnKMg=
To: ath10k <ath10k@lists.infradead.org>
From: Ben Greear <greearb@candelatech.com>
Subject: RX rate is wrong in 5.10?
Organization: Candela Technologies
Message-ID: <584816e2-ed18-3d5e-651e-293637222148@candelatech.com>
Date: Mon, 4 Jan 2021 08:18:24 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
Content-Language: en-MW
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210104_161838_905591_33217DCF 
X-CRM114-Status: UNSURE (   8.50  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

Hello,

I noticed that RX rate is always 6Mbps when I use -ct firmware and -ct driver in
5.10, and on stock 5.10.0 driver and stock firmware, rx-rate does not show up at
all in 'iw dev wlan1 station dump'.

I'm using 9984 NIC...

Anyone else see this?

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
