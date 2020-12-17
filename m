Return-Path: <SRS0=w3s1=FV=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,FSL_HELO_FAKE,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30106C4361B
	for <ath10k@archiver.kernel.org>; Thu, 17 Dec 2020 22:31:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DFC172376F
	for <ath10k@archiver.kernel.org>; Thu, 17 Dec 2020 22:31:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DFC172376F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=1NkfcZTDyxGgQ8ealA/QL45e6zednBK01/EltLSOAhU=; b=bY0H4Wr0fcgRf+nyVF0ODPG80
	EUluNQyExI3yvHxLZUN6+y7SXTj7+BCEHRcnAvIMlO3YWpBveueycD4xuYiXZTOlDWtAB1Pq6uDI2
	VBL6EZyX+/7s3vjvERLpGxMskL92c9WcdxePYqDJphpN6camjmJcT0tF6FOADI6CakrgeCWG4jAb0
	UhFJZbM7bLTr4xYSmxI4gVnhL5goKcK5t2fOpNl01CZQn7NazCjM3OiiCeL5ta0ie1xqklSSTCTW3
	MIjSSm7Xmc4BtlyAM5rw5dAySrO1UeRaT5EGkt5KNpK1Rjrx/OHIHxQPwUONNmMtm+HY5eib61TS5
	OfScitfgQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kq1my-00036j-Sf; Thu, 17 Dec 2020 22:30:24 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kq1mp-00031s-JF
 for ath10k@lists.infradead.org; Thu, 17 Dec 2020 22:30:22 +0000
Received: by mail-pj1-x102b.google.com with SMTP id hk16so211490pjb.4
 for <ath10k@lists.infradead.org>; Thu, 17 Dec 2020 14:30:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Pf9ckCEVaJ6zRPQluKNLBc+gFVAc92xCjtYHcq1JC/A=;
 b=mric7Hjj4cDYfT8pldW/fafGOVPxVs+mQFbytAiEFHYJTaxQpPs5WGeRJdQr7BzdVX
 ihAg41fvq0zIyvX5aFC2MqMexW25taT4H6J7QvZ5mkEdMop5x6mlkPcFpIqq/IlNbkI0
 0uIDEzpn4n4iOfw61QNDzjOWwaGBAtx2WH5M0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Pf9ckCEVaJ6zRPQluKNLBc+gFVAc92xCjtYHcq1JC/A=;
 b=oDoiZofAHB82/cjjo2VAIOayn2cZp+tkPVgIFfeeYzfr4gWu85hWv1NatugSrTz49k
 xow5w0bSaD4tSpE8seyNdrI2SxY4iUH5xs6q4JB9yx+zRmPZr2V5DAVWMPmip62417au
 e8hEWhP/P0fwHUzvdnLhjsVpbooM1u6cUOIxTJ2/M3wTpN1xG15Ok/ykV9A08RH5k4lX
 LsFiGwb+VDFKn7ElowZ98/wnqKmWTlJQwM+CYl2qkt4s31YOHXr+JnFl2IYmUgzw8nPP
 g+dVJ3VJ/C+Z6eDVFQAfxtFX77bzlArl+RAEcrA6s7kBwDqFuBjYdDA0go+DHVFs6IFZ
 sKPQ==
X-Gm-Message-State: AOAM530s6+FtB1eQz6lMpPxWxgifDrwJSmw42nmN+Pfc2mguJPunbToa
 w1p/VP9q8xEj44ageoIhF9tQsw==
X-Google-Smtp-Source: ABdhPJx2cbX0FBjlN0OqPmNj516SIg9lvraV+rd1J5A+Cm3zOrLoueWLJm2ajUoRLZxZZeF3sxFHWA==
X-Received: by 2002:a17:90a:f311:: with SMTP id
 ca17mr1312552pjb.180.1608244213043; 
 Thu, 17 Dec 2020 14:30:13 -0800 (PST)
Received: from google.com ([2620:15c:202:201:8edc:d4ff:fe53:350d])
 by smtp.gmail.com with ESMTPSA id c62sm6779936pfa.116.2020.12.17.14.30.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Dec 2020 14:30:12 -0800 (PST)
Date: Thu, 17 Dec 2020 14:30:09 -0800
From: Brian Norris <briannorris@chromium.org>
To: Youghandhar Chintala <youghand@codeaurora.org>
Subject: Re: [PATCH 0/3] mac80211: Trigger disconnect for STA during recovery
Message-ID: <X9vb8TQvjElEtscA@google.com>
References: <20201215172113.5038-1-youghand@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201215172113.5038-1-youghand@codeaurora.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201217_173015_694029_A5119635 
X-CRM114-Status: UNSURE (   9.75  )
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
Cc: kuabhs@chromium.org, netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, ath10k@lists.infradead.org,
 dianders@chromium.org, pillair@codeaurora.org, kuba@kernel.org,
 johannes@sipsolutions.net, davem@davemloft.net, kvalo@codeaurora.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

On Tue, Dec 15, 2020 at 10:51:13PM +0530, Youghandhar Chintala wrote:
> From: Rakesh Pillai <pillair@codeaurora.org>

I meant to mention in my other reply: the threading on this series is
broken (as in, it doesn't exist). It looks like you're using
git-send-email (good!), but somehow it doesn't have any In-Reply-To or
References (bad!). Did you send all your mail in one invocation, or did
you send them as separate git-send-email commands? Anyway, please
investigate what when wrong so you can get this right in the future.

For one, this affects Patchwork's ability to group patch series (not to
mention everybody who uses a decent mail reader, with proper threading).
See for example the lore archive, which only is threading replies to
this cover letter:

https://lore.kernel.org/linux-wireless/20201215172113.5038-1-youghand@codeaurora.org/

Regards,
Brian

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
