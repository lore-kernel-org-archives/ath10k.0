Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F302EC4332F
	for <ath10k@archiver.kernel.org>; Sat, 15 Oct 2022 16:11:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=24PHc0c32PWtYH7hbG7nK4gSUy/m3NihCjPD+lmTGmo=; b=pvW
	rX1vkGeSQnZNTLr8UA9zf7TpQethtchKxhKMDOAFHFjLsVRHBMl/T5NbZ1COKelQakaXahLRUsn+d
	Q6McD8NzBNJwkuOwuzdaCA0bJzhyMMI0nFGO4ehLeZIijkdPDMJmS/lZMEl1RaP4PSAc6b2/ODSkP
	uhgIMX3l4t0RNHWf3gZPXf9BVqS3YS9AVsAZhQ9Y/nAgYgCbFWpQkCciRnaKBew/W0SM9vVh1DYBy
	YstyGWJWbxu3XQsH73BudNNiF6ovKwyMvx/w6XmVr5+tnPDo3+Qe6IQzAV3oQzBzfCqx+SET7p/Tf
	G7oeI/hXjE5AZn2cjoPIs8RuCGq0khg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ojjkD-00HDcG-3z; Sat, 15 Oct 2022 16:10:37 +0000
Received: from mail-io1-xd29.google.com ([2607:f8b0:4864:20::d29])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ojjkA-00HDb8-ML
	for ath10k@lists.infradead.org; Sat, 15 Oct 2022 16:10:35 +0000
Received: by mail-io1-xd29.google.com with SMTP id l127so6108678iof.12
        for <ath10k@lists.infradead.org>; Sat, 15 Oct 2022 09:10:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=sckBXyGI3QyBk0NtHvXevTiTU/dxpLlifZRIopdnK6U=;
        b=dworQHWXEyjcNJVHSLp6d4OUmQvw+XvHBL9cp057xiutNO+qIZR/iJourkydDy1rnv
         /+wvgAlQXsN4IWZGFmux4sghwaPBVEhY3hbiqgIjM+dYMxrPR0TZHz590nyIsi4NBbif
         TERSX1hH23tyn06gI5DaHQq3g5mkv9mLkx0aeCAQ9txN9C6TKF6Yr6q2o2bKDEcW7KPW
         kAzNIFyvkxs689FtM4NI8jw1PJTP7zL2CpzfvMGkmRnKBU8Golcd229fjFLT6lzxaU/J
         aZuqjOkoGN7vl179jmTCr7Bql9GIxqywqtkmBr0Ynji2ZZ3IkWxikGLBqrrtw27Po+LG
         8ygg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sckBXyGI3QyBk0NtHvXevTiTU/dxpLlifZRIopdnK6U=;
        b=NjNwjs9nVsng7l+nRCzaM7csVl0qZ7Uk2xP2Kt2Wy8H/7v/hP7Gj5a1W/TFRxGx6/p
         Yusr0OMtuhWsMiQoWq7XOtQ+C6/oHpvVZQyEQDSc6/cTrFS3GSeOS4u8ElG4g6fjbuYi
         GIYaiiTUDGHo05KV55B81hmrOthnVmz4fKbiJqbWzhLKxJTYiFRjyOA8TITtF48M//cS
         FWfko9MkPknoL2Qux5m1Sh3Z51e2e01noG4o98QzcNMdDRepX0GmWVIQd0/uy7qKre4P
         h4xKfx4J0Di3LeLAZxBt2FuXsTM59n/12N+5Wrv0H95ZS4LC4MHOqvGgUkBCYevoRYUp
         vPTQ==
X-Gm-Message-State: ACrzQf1yYgGmpqdDwa3U+YiEN7WqZ7qx0UlDP5cvW/pScfpMvdzfmtiA
	O7EirgsC3S7UK3SQmoUR0zrms+tTqlIfDgOJLWS7SkLEmgkX3w==
X-Google-Smtp-Source: AMsMyM6PTDrobJb2WScp7K3Fo7NNezDmo6LD3zdBKlsR/A7kFWJb0MZgrW5mYeWrnH05ucUEmOiT1Ko7uDW/l9P+zxM=
X-Received: by 2002:a05:6602:2dc7:b0:6a5:14e5:d709 with SMTP id
 l7-20020a0566022dc700b006a514e5d709mr1372072iow.54.1665850233904; Sat, 15 Oct
 2022 09:10:33 -0700 (PDT)
MIME-Version: 1.0
From: =?UTF-8?B?QmHFn2FyIEcu?= <basargirginer@gmail.com>
Date: Sat, 15 Oct 2022 19:10:23 +0300
Message-ID: <CAMz3DNn5K+8wOe6g6F3RNLo4V6-iM4EL+yQHSyKECbyHSe8xhA@mail.gmail.com>
Subject: QCA9377 Slows wifi speed when bluetooth is active
To: ath10k@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221015_091034_747625_0C8E84C9 
X-CRM114-Status: UNSURE (   2.23  )
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

Hello i am using qca9377 network card

Wifi slows when bluetooth streaming the audio

For ex:
No BT: 900kb/s
BT is active: 50kb/s

Tried solve methods:
- Disable powersave
- CNSS WLAN1.0 WLAN2.0 different firmware versions loaded
- ath10k_core otp and swcrypto settings changed

But the methods not fix the problem, i am request please fix in short time

Device Inf:
Dell Inspiron 3580
Qualcomm Atheros QCA9377 802.11ac Wireless Network Adapter
Opensuse tumbleweed snapshot 20221013
Linux Kernel 6.0.0

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
