Return-Path: <SRS0=Yrnq=KS=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CEA1C4707A
	for <ath10k@archiver.kernel.org>; Sun, 23 May 2021 17:53:23 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 25B146105A
	for <ath10k@archiver.kernel.org>; Sun, 23 May 2021 17:53:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 25B146105A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x3Hs3jBtqx8Dkz104ahGfmSaEZL1h9l7uwjhjP/CypI=; b=gwep7k3Z2iTyIX/veoFcY2DSoL
	GS2VxQKsYAyVJCSUDWf9wr1P+eP+qI95JS71weVtqUlwLgAi499QiStzmJV7A9xVJeJJlJgV98Axh
	kRK9KGib8OJBMJYlhqKX5xtwrKZnUdiSZa4MyfjyZ0UDxV3M2PpOG9IojUTgt4YCTSnpN//0PfSYp
	PtqORcfcc76Kz63plI/8zgvOyZVNxe19zIVRD1Gd8zkkrNSETn8RFEHTCOCEW81uyqwOZdn+9CdYA
	J33KUEdj0o+MN4ocY1LFu+XnxXcJSE2TWs1GjBWR8Fp+J8td+uYrS+WFjwGKxMvuLAEnz0VmGc1Rd
	dh45s2xg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lksHq-004hOh-CG; Sun, 23 May 2021 17:53:14 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lksHo-004hOW-K2
 for ath10k@desiato.infradead.org; Sun, 23 May 2021 17:53:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=n08nH9mW+/XP9IoanRpBN6dFqN8z6eqhRMoPfExNc7w=; b=4owSWA4ACqEBKADtWp7UAs9rPG
 j4mAeNUs8AHDZsVl+hrbyQAwpTa+lLskZ31IL4Zvoawok6UVtrhJtWQtEdtgbI3+Gvv7UyZbpF4j9
 5UaHJxVwJRucrytVWRkuhy9CT3kkiIYIaim8/oagZ78CSX0oATIWXHmX+fyOuJRdw7kxhMCbXVkBJ
 9QIBrpgd+yU7Y8EtYM8QLVH+OCrS+fy7JHueqDc4wE8OhxmDIR9amIhGIT+kl4gocdP/LVfAoZgqp
 7zFpITtNG+WD4zqk3mtMno9r3pQvhbWo7yw/XynOC/0Np3Mr7Bs/jgIIKseAi+YQ6piiWuaNFIdFl
 YFCgBLjQ==;
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lksHl-000Wlx-Nv
 for ath10k@lists.infradead.org; Sun, 23 May 2021 17:53:11 +0000
Received: by mail-wm1-x32c.google.com with SMTP id
 l18-20020a1c79120000b0290181c444b2d0so3210690wme.5
 for <ath10k@lists.infradead.org>; Sun, 23 May 2021 10:53:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=n08nH9mW+/XP9IoanRpBN6dFqN8z6eqhRMoPfExNc7w=;
 b=n0Fq9rulY+usc+1pbXK0kdu8K4W/nQ+YYK+oU67ben8c0P6FKcc7BRkl65pNA1dhDR
 JsWC31LCetD+JyeOMSB75k3vUwC3r17lXbYN7rtc+CYO8KXKjsCgHAtekU7zYPaOqPOg
 eWCmhS628zPJ3EYP57q4i7/iOLWu+vofmX2GMx8iibeSKxalLbLr2mPGu+d4uydcolJ5
 yCa4X4T8mztQgu8M/4ic+dU0ATFcXGKFjJNhIwmwcDnrn6H4+oZsabuZva+Nj+fSQlD5
 bpn1NDkzru1P+aU8wleV2ORK7nGcBNPLyd1hmjG4WC8LMr1nA3RniFFJiKFOll/764b0
 SiPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=n08nH9mW+/XP9IoanRpBN6dFqN8z6eqhRMoPfExNc7w=;
 b=DyaQCQDPwcybT6fhSQSeJzbvnPiM7Vi/hOin/u2oshHCpm4MeZpYmahy3ZWRSbwa1H
 EcIAeKbiCw2b8QO843R3/wXdAIN9ybD38gB/UBApf4yXoBNAoOLP2qjwnQPUDgHGbhLX
 i0217uGyqoV/+kZsBCFm3M3NCkQu1hBM8Kwlfgxy3RgMyhPpHu/WSHggH9o+g6FhYAAa
 PAg0H6xHvkhFjfmbnOXJYlumno6KNurc19g2FuUPuX6Dxd3L+Rf4Oa3BKXv9f3Dl/tK/
 qsg63RHlXz5L2oPgDim6bh+i/MyqxLwiX2zBSXGsUlvrNuk6lSEpPCBavfbHmVYleamH
 FJSQ==
X-Gm-Message-State: AOAM532ep3fgLEVqDKyv3rlPd9H/T9dmKtDAMqTFuBo3KV0VUB+0dB/S
 3MCrIqaYdkYpQmDT+EopapTc/g48uncuaw==
X-Google-Smtp-Source: ABdhPJyVZhvPjhuH4jU1EqtaMMMVvK5XMvVIuvyE8VB3mXV5Hv4+E9PoJha/otZGHWImIzNrzPAg9Q==
X-Received: by 2002:a1c:402:: with SMTP id 2mr16559714wme.7.1621792387796;
 Sun, 23 May 2021 10:53:07 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
 by smtp.gmail.com with ESMTPSA id
 y2sm9359900wrl.92.2021.05.23.10.53.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 23 May 2021 10:53:07 -0700 (PDT)
Subject: Re: [ath6kl:pending 16/26]
 drivers/net/wireless/ath/wcn36xx/main.c:1091:23: warning: no previous
 prototype for 'wcn36xx_get_first_vif'
To: Kalle Valo <kvalo@codeaurora.org>
Cc: kernel test robot <lkp@intel.com>, kbuild-all@lists.01.org,
 ath10k@lists.infradead.org
References: <202105232135.GqT7BiXu-lkp@intel.com>
 <f4ed523d-b2c6-556f-b9a0-ae14b431645f@linaro.org>
 <87im39gxtz.fsf@codeaurora.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Message-ID: <172f12f3-37ae-dc60-a9d8-359c5ea00998@linaro.org>
Date: Sun, 23 May 2021 18:54:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <87im39gxtz.fsf@codeaurora.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210523_105309_867989_78FEE6BD 
X-CRM114-Status: UNSURE (   8.99  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

On 23/05/2021 18:32, Kalle Valo wrote:
> Oops, your patches were not supposed to be in the pending branch yet as
> I saw some conflicts.

NP, I had some follow up work todo anyway so this prompt is useful

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
