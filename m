Return-Path: <SRS0=hKpm=LM=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9141FC48BDF
	for <ath10k@archiver.kernel.org>; Fri, 18 Jun 2021 07:29:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4B6AB61351
	for <ath10k@archiver.kernel.org>; Fri, 18 Jun 2021 07:29:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4B6AB61351
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=607tLX2eYTIbKbdB3EF7rZ/1SKTKcX7jHMzRsVB91LE=; b=B+X
	GZfSAsCZzC3uyxETMoDYnDij19Agtw+FlUkUmbh7AIj3r9qxmfF0pAmBpTJMa3gGd9PhnkYs20EUI
	gKdKm+zQSpN6Ar5xvSCxbMo9jqXwFVVpGEztRkNvwjq926f0juprKfH6wlZwLr/9PYVUncHxhd4pc
	H84sd5gRlkWxtQ7LhajIJAe+FQpkJrzYyWoGzgt2NDat+W25oSPp52S0nncbIfFYb1uyRTzzmFEeF
	IAeFZitRBHCKrSJUlbAK9Qar3gFV9L4Xm0eRSZcnQVD96/1jPD3RflTOmr3iO9+H/fsHZBDjXRZRi
	oW3kA01aLFrqP1e7DcInPGIPZiINqFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lu8w9-00D3YZ-Dn; Fri, 18 Jun 2021 07:29:09 +0000
Received: from mail-oi1-x233.google.com ([2607:f8b0:4864:20::233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lu8w6-00D3XG-DI
 for ath10k@lists.infradead.org; Fri, 18 Jun 2021 07:29:07 +0000
Received: by mail-oi1-x233.google.com with SMTP id t40so9559729oiw.8
 for <ath10k@lists.infradead.org>; Fri, 18 Jun 2021 00:29:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=ff/qtfcJkkl+V2A56gehnMhfZjduufy4qkxjFtuAGZA=;
 b=p5EeckYJt9g5H2AECGR7cWo1DNHLrxk4Pzrr60LDi6KxwWzYAmxZx5DsNVZaJv1wjY
 maSm39/niLR8Phe1SPXuDfAetPJ8lDYBq9m05IHfKgkv3QL1usZ/MP+qbjEXET0K8S4S
 hA6Aj9JsbEOGxu3vxkETpMavW9YIMEuTI7RDi/v5jBfWLKd3/WYTkGXh2KIW2+ZnetRi
 ewJyG6A1Tdt8yyuNxvzg2j6P52WHaA2K9O0Iqz8lsi1rysEHvuSWYTEuG/5SFsSyXB1l
 407+LaRWGf9KewLl1r4cIBrbp+g6CIE2qunvDPO5NgBzqD91oapGgNxjFCwbGiWFdNd7
 vu5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=ff/qtfcJkkl+V2A56gehnMhfZjduufy4qkxjFtuAGZA=;
 b=lQ1cUbS12oGra972sqGbrmWYZKDhA/lu/h8G+avPVjKZi0BDMwAnAFWQ8VLzcwCMxr
 2OmwXl0whCptlblMiQGRVVPGj3xw294G3dvO7kJpckBY+jX5yHwV7YK8MPO3T9XSEAvL
 jXH2UDkiH6x2tpobVnUDzhgM97/MAzx/ihwmb26LTQuePrHLkTLp0MDVn//TKFzRiJcn
 aNjGbgCq8juVI7WxcBEze9kvhI56+MnR8eY/GGmh/RaBltn3ouQldih37ZPbiFiWj041
 sAKwUgGBSXMQAiEcF4Gg/nkPVDXHzdAWmFSv9RzbGeZq7+vMoS9zxbSMONMbVfdagCXl
 xP4g==
X-Gm-Message-State: AOAM532wEQsbVkQYqFlJkN9S3vBTBZPPR2LLRuQPO308p12lg8TB8xap
 cUKej4273zHxwyhoJJrdvXj9ofayzmeiGY1F2oPmYyZKp1u/jQ==
X-Google-Smtp-Source: ABdhPJxyZvo/h2+nyV3xFfX/1QBQNkh7N+ExIMjh6l+27ZxDGRxLY8ANzyFNO5PNtnGVnP95G2Y6XxEUJG+BtzDHPVk=
X-Received: by 2002:a05:6808:f04:: with SMTP id
 m4mr6254750oiw.122.1624001342805; 
 Fri, 18 Jun 2021 00:29:02 -0700 (PDT)
MIME-Version: 1.0
From: Francesco Magliocca <franciman12@gmail.com>
Date: Fri, 18 Jun 2021 09:28:51 +0200
Message-ID: <CAH4F6usFu8-A6k5Z7rU9__iENcSC6Zr-NtRhh_aypR74UvN1uQ@mail.gmail.com>
Subject: Bug in Memory Layout of rx_desc for QCA6174
To: ath10k@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210618_002906_507846_CFCC09A7 
X-CRM114-Status: GOOD (  18.57  )
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

Hello everyone,
I have a QCA6174 PCIe board, I am using linux kernel 5.12.10.
The firmware loaded is:
> [    4.483131] ath10k_pci 0000:02:00.0: qca6174 hw3.2 target 0x05030000 chip_id 0x00340aff sub 1a56:143a
> [    4.483136] ath10k_pci 0000:02:00.0: kconfig debug 0 debugfs 1 tracing 0 dfs 0 testmode 0
> [    4.483567] ath10k_pci 0000:02:00.0: firmware ver WLAN.RM.4.4.1-00157-QCARMSWPZ-1 api 6 features wowlan,ignore-otp,mfp crc32 90eebefb
> [    4.572730] ath10k_pci 0000:02:00.0: board_file api 2 bmi_id N/A crc32 318825bf
> [    4.665592] ath10k_pci 0000:02:00.0: htt-ver 3.60 wmi-op 4 htt-op 3 cal otp max-sta 32 raw 0 hwcrypto 1

around six months ago I reported a bug which is still haunting me:
When I am connected to my home's Wi-Fi network and my father's Huawei
smartphone is connected too
my Wi-Fi card hangs and gets stuck, I have to force restart of the device.

Note that this problem does not happen if my pc and the smartphone are
connected to different networks (for example
I tried connecting my pc to the 2.4GHz network and the smartphone to
the 5GHz network, and the bug does not appear).

Now, I tried bisecting driver changes, and I found the faulty one,
it is the commit: e3def6f7ddf88636febb12e1e3e86387a4ce5452

It adds some fields to structures like rx_msdu_start, rx_frag_info, etc..
The changes modify the size of these structures!

If I revert this commit changes, the bug does not happen
(I tested it for two weeks, while the bug happens at least once in 2-3 hours
from when the smartphone is connected to the wifi network).

Also, if I selectively remove some of the changes introduced by the
faulty commit,
the bug does not go away, so it looks like the problem is in the
change of size of the
data structures.

Now, I'd like to ask you what we can do to fix this problem...
Is there something I am doing wrong?
Or is there a bug in the firmware?

If the firmware can't be easily fixed, I was thinking that we can
abstract the htt_rx_desc
(in the same way we do with ops in other parts of the driver) to have
two versions:
one for 32-bit descriptors (like my QCA6174)
and one for 64-bit descriptors (i.e. WCN3990, which was the cause of
this change).

I'd be really happy to help, but I am not sure I fully understand what
is going on,
so what do you think is happening and what should we do?

Thanks in advance.
Greetings,
Francesco Magliocca

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
