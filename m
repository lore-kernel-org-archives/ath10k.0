Return-Path: <SRS0=8Cel=MZ=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4DEFC4338F
	for <ath10k@archiver.kernel.org>; Mon,  2 Aug 2021 11:01:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9168E60E76
	for <ath10k@archiver.kernel.org>; Mon,  2 Aug 2021 11:01:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9168E60E76
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=z0XQozhdPhhiqU0Ol3GKVwBi/8UJoF5XazrsnjYWjPg=; b=NNe
	C/z2JoBudqrxU6Ikz5cgArbF5ggZqrGjd2zqauMKMb1T7R0L/dykFAty/eQmefjg1ZgUCR7ryUPRq
	oqqZUVOMBS65GbtpxaFpCMyWU46p4FPnsRRwEBL92WegY8DwaHsM8YyU5YK4Te7TwxA6a102Nm6zl
	RCOdQfMjUUFvSgyT8/KXrNAsgeZ1DrMmcWrI0ELXXFIqWSt9Az8w1hRgA7tAOEwjK+IuuohJEy6rf
	U7iKw0I65khQvp441yzEstNa0U+TvklO1pEbzxYALIGV535St7zkr1aFiSOS5ovRThD0hDKbyGbqT
	ajWy7MF1BjUHttZMl4t9b27i36KqI3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mAVg3-00FqnW-PR; Mon, 02 Aug 2021 11:00:11 +0000
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mAVg1-00FqnA-IU
 for ath10k@lists.infradead.org; Mon, 02 Aug 2021 11:00:10 +0000
Received: by mail-oi1-x22f.google.com with SMTP id x15so23604641oic.9
 for <ath10k@lists.infradead.org>; Mon, 02 Aug 2021 04:00:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=MsWZKV/HFVHSTN8iSYfXxHC97T0y1ZC10NqgR1CiAy8=;
 b=ijV+nppZTH7oADBahsfNM7vd4nGGEUROFZfQ1VdNGRqxsYD3KHPOjSXRxpD7zmNOrl
 6hAYicARs8MO2hnKlBkQL/jeUkVoDRz/03zQlqDMkShrmtFoCTsq1rcPzcvqigve3EDk
 elUoXE+YS/y29Los0PaWg2VtZXlVXQ5DwQ2v/zetirY3UA8FE/sXaqyQo0+M7D1icOly
 4+7oCv7l8UC+z71CQThaVY+Ftop8ioVlPh2IHLl0KEFY0D83TMk4DuTWP6XrGZcAe1q8
 182T1Ihay0uDqKMIe5uI4/jgnyXwssl8GbIBkcl0XNT2ajM47PMjq7v4677XrLdPvLWo
 Jyzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=MsWZKV/HFVHSTN8iSYfXxHC97T0y1ZC10NqgR1CiAy8=;
 b=aMHleW4f5yGfbcN8NN5k9B5OCZGzJlxsWtHqVUpg9mIY98akSDSOZ2e1Iry8V/n1+n
 WRt0duRIRPXfT+KQiHI5ZdFrt9Ajcazob5QOU0xMci9maqNHKtjWL8gRLQErVajvXmUg
 3NKQtcQLWeKyhDH3MT1amddoql9/ZJOy4nS2atk0idnqvpemBsKfIaDFpFto9LYyuXjr
 NtNkLpjLnVkh11Y+lh3w7xDJf7hRVi4w0B3OeeJ7l6OAd2a8VN4JwvsyzaKC8dSr6ITc
 waOanRM/iSGkzmmYn6hhCR7AYhzyKGR77jWSoHV7lXfT8vU6lqjaBocI8JiA2BMJrPUl
 nDAg==
X-Gm-Message-State: AOAM531Y/KQh6KD+o4mD/WAnErf5GZFnnFRDk0jRNLEQ27olEMqANy32
 zd7hd8gfRDpatUPIV2F9sXqUP0ZpaGCCEWeMl1qkB0iCUdU5QByx
X-Google-Smtp-Source: ABdhPJwRExvvJHCHH7ToUQte55reSzcMOWrMI2uCCyBZtU+3ITTWjd7tokvWkH5GZWFb/paKHRhI7y286Nwpmk1UZ6g=
X-Received: by 2002:aca:4007:: with SMTP id n7mr10132478oia.58.1627902007499; 
 Mon, 02 Aug 2021 04:00:07 -0700 (PDT)
MIME-Version: 1.0
From: Govind Singh <govind.sk85@gmail.com>
Date: Mon, 2 Aug 2021 16:29:56 +0530
Message-ID: <CAO_MH4Y9zS=1cjH=1yofGqcj+cSsp6aMWHkb3U6RPW_phMiWkw@mail.gmail.com>
Subject: ath10k:IBSS-RSN not working with QCA6174.
To: ath10k@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210802_040009_679389_BB519EE0 
X-CRM114-Status: UNSURE (   4.90  )
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

IBSS-RSN not working with QCA6174(ath10k <--> ath10k).
Test Env: openwrt/ubuntu
FW: WLAN.RM.4.4.1.c3

Is there any specific OLD FW version that works with IBSS-RSN or any
WAR available?

Observation:

WPA Supplicant:
AUTH: 04:f0:21:48:bb:bb - sending 1/4 msg of 4-Way Handshake
AUTH: 04:f0:21:48:bb:bb - sending 1/4 msg of 4-Way Handshake
AUTH: 04:f0:21:48:bb:bb - sending 1/4 msg of 4-Way Handshake
AUTH: 04:f0:21:48:bb:bb - sending 1/4 msg of 4-Way Handshake
WPA: Use EAPOL-Key timeout of 1000 ms (retry counter 4)
AUTH: 04:f0:21:48:bb:bb - EAPOL-Key timeout

ath10k driver:
From the driver side WIPHY_FLAG_IBSS_RSN is set but EAPOL is getting
dropped by FW.
As per tx completion its DISCARD status from FW and FW is dropping EAPOL frame.

[ 9353.374056] ath10k_pci 0000:01:00.0: htt tx completion msdu_id 0 status 3
[ 9353.374062] ath10k_pci 0000:01:00.0: htt tx free msdu_id 0
[ 9353.374112] ath10k_pci 0000:01:00.0: htt tx completion msdu_id 1 status 3
[ 9353.374118] ath10k_pci 0000:01:00.0: htt tx free msdu_id 1
[ 9353.374133] ath10k_pci 0000:01:00.0: htt tx completion msdu_id 2 status 3
[ 9353.374138] ath10k_pci 0000:01:00.0: htt tx free msdu_id 2
[ 9353.374152] ath10k_pci 0000:01:00.0: htt tx completion msdu_id 3 status 3

BR,
Govind Singh

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
