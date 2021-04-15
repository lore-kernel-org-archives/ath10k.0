Return-Path: <SRS0=6Xds=JM=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.2 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HK_RANDOM_FROM,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77CFEC433ED
	for <ath10k@archiver.kernel.org>; Thu, 15 Apr 2021 03:26:18 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D7D6F611B0
	for <ath10k@archiver.kernel.org>; Thu, 15 Apr 2021 03:26:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D7D6F611B0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:Subject:From:To:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VXu7j1euoge2new56B4mouiztCsZ8iNNnRw1GF+AaSQ=; b=DKiVC3L86Wt0Jz
	1F0g0vzIwqBQx6TweJa0ycMdh0cgK2lFleNi5Lob9nZ3a/TdLKiO4R+LMxqocVuuFV50xZ3dYUMNE
	E41ZU94yx/DaqqjGx1qWeeI4K0yx3+HaeEkJ/0BTOfkoE7D/PXm96qvx17TO7ft92mkAriYFLTlr0
	+KOtrBBPAl6nEqz+v5i6JsKJX2v4N6IY0sPxy+5SpSKFI+89exAhIWY8vHCUdWda1jOjXuxG54lLL
	Z41zTfiMj0nAi3FXB4QxDECvRCipSavxKQ9n6cGcxKYUoWXBDgOCc6LFvvgrgi2gRw0aemprXnYfD
	TOExEvnvm7gZRuhwr0UQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lWscw-00EdSy-S0; Thu, 15 Apr 2021 03:25:11 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWsce-00EdQ5-6T
 for ath10k@desiato.infradead.org; Thu, 15 Apr 2021 03:24:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:Date:Message-ID:Subject:From:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=1ReMVPEW10FXQDVc+YZSZK9glv++o+WqTUlEAeYunaM=; b=wIyePTJ4QDCFyLNO/kiF6glTVX
 NUTgzCKl21xevNKE9FqV6Fcif0KgnALDXBDAZxCjjZS+zhtO6c3tlRS59EVfmV9+JqhzIor/RvI8Z
 v7gLtFgX2Kjj5C4QgmUAwm2DD1nAfKeaA9ry5Xb9Xzw18boqrWnM0DKHPJAhRoAWo1SQw5EoIdTwF
 5+vvvddAHicZ6ap2H1KC4ilFujMy4xSYbIWdKOyG2U5S1Yef+e+llgmNptzp9Hm8mZObFKcliEKM6
 gL98mzeFh2VxVFMbYvypzSPRxn1UxoqlFV1y/H0bGUGHmi8N61VVsQcmLIjUw/+fXiLUUXYFp24QC
 fNyakQMQ==;
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWscb-008Eaq-RG
 for ath10k@lists.infradead.org; Thu, 15 Apr 2021 03:24:51 +0000
Received: by mail-pf1-x429.google.com with SMTP id 10so6247955pfl.1
 for <ath10k@lists.infradead.org>; Wed, 14 Apr 2021 20:24:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=to:from:subject:message-id:date:user-agent:mime-version
 :content-transfer-encoding:content-language;
 bh=1ReMVPEW10FXQDVc+YZSZK9glv++o+WqTUlEAeYunaM=;
 b=MztXmuHdjtGrlCD12voEIoG2T9KxTtL0qkQCnODw4vxxwR1RpiOzzrZw0kXNRdtWD7
 /qP5m5Ftv/dnDjW6G0LhdcxLMoUG57CF6gc5FDUFiNPtD8A9JlVFRD1UqbsGtfVpB++v
 2EusnKQR0kF8xrRyoBz8OOV1F6VSycazj58PVqUTZ1dMpvQ1YIJGpHMGvzgc0CqfXt0E
 Sv2H63ZLs+hyHK0t7DmB0FungQ7k1x3jhvh3OyxP58LGYjvuqOsdFNQFFgoFdCs8Mlha
 Ic+8/OJqHmqZuy5aPnWCE9dOQU51sEFYV2nexuBdfa8Llzx8fpuBUPtLcUz5qIOl0g+Q
 PudA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:from:subject:message-id:date:user-agent
 :mime-version:content-transfer-encoding:content-language;
 bh=1ReMVPEW10FXQDVc+YZSZK9glv++o+WqTUlEAeYunaM=;
 b=fLi9zG+vknHjL3rlBwKwvlaFB8QSSsFuxzz849cySZzWEZEHH/EEewItxCzEPy1yLP
 75Btcp5XwHLasGfd4kninewnjB6H92z+XMJi1CRMK00S/VpimcjWotGgjJdp+4iYyFso
 xtOPnNDWpOJi+YYVD4Yw1sWAp0NSvKoEa4JA2/A+VJ738RDgpG9nnFp5oNzAt/wlNLa7
 qpuCqaf+kQtAhXcQyLGR+MOU8G6mh3hd4zDMTvb/PLe4r6ctJbjUYW3uvSmplDmLpcEF
 ss6ZYr50yEksCqyQUItLlKkYPCzVmZ5dvieImT+6LKXn5eNJWD6VQNYvTkoSzaXaiROs
 0+FA==
X-Gm-Message-State: AOAM530r+51ooGPsdeXgu4PdECBYoXpX5jLy9nhvhx/647YFJNDacsOI
 BHtoPJkXWk4enRGZQ9nW5Yy55bkBQV0=
X-Google-Smtp-Source: ABdhPJzqnsxU5mH+rUoB9MITQjtiQ+92QeIclmNqa1QBaw4deH35XuOFnumbsGQsUyXe5h6Jg/RzIw==
X-Received: by 2002:a63:1125:: with SMTP id g37mr1519149pgl.56.1618457088622; 
 Wed, 14 Apr 2021 20:24:48 -0700 (PDT)
Received: from [192.168.1.2] ([27.4.150.172])
 by smtp.gmail.com with ESMTPSA id d20sm621625pfl.155.2021.04.14.20.24.47
 for <ath10k@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Apr 2021 20:24:48 -0700 (PDT)
To: ath10k@lists.infradead.org
From: Arvind <arvindprksh1@gmail.com>
Subject: Reading default values of Roaming parameters with wmi commands
Message-ID: <5525e305-6f59-1e8f-952f-99bc8d1f1d1b@gmail.com>
Date: Thu, 15 Apr 2021 08:54:46 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210414_202449_897627_A72BB104 
X-CRM114-Status: GOOD (  10.05  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

SGkgQWxsLAogwqDCoMKgwqDCoMKgwqDCoCBJIGhhdmUgYmVlbiB1c2luZyBhdGgxMGsgZHJpdmVy
IGZvciBhIHF1YWxjb21tIGNoaXAgUUNBOTM3NyAKYmFzZWQgbW9kdWxlIHVzZWQgaW4gYSBjdXN0
b20gYm9hcmQgYW5kIEkgd2FzIGxvb2tpbmcgYXQgdGhlIGNvZGUgdG8gc2VlIAppZiB0aGVyZSBp
cyBhIHdheSB0byByZWFkIHRoZSB2YWx1ZXMgb2YgdGhlIGZvbGxvd2luZyBSb2FtaW5nIHBhcmFt
ZXRlcnMgCmZyb20gZmlybXdhcmUgdG8gZmluZCBpdHMgZGVmYXVsdCB2YWx1ZS4KCldNSV9ST0FN
X1NDQU5fTU9ERQpXTUlfUk9BTV9TQ0FOX1JTU0lfVEhSRVNIT0xECldNSV9ST0FNX1NDQU5fUEVS
SU9ECldNSV9ST0FNX1NDQU5fUlNTSV9DSEFOR0VfVEhSRVNIT0xECldNSV9ST0FNX0FQX1BST0ZJ
TEUKCklzIHRoZXJlIGFueSB3YXkgdG8gb2J0YWluIHRoZXNlIHZhbHVlcyB1c2luZyBhdGgxMGsg
ZHJpdmVyPwoKUmVnYXJkcyAmIFRoYW5rcywKQXJ2aW5kIFJhbSBQcmFrYXNoCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphdGgxMGsgbWFpbGluZyBsaXN0
CmF0aDEwa0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vYXRoMTBrCg==
