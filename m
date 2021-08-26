Return-Path: <SRS0=L2np=NR=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C2B0C432BE
	for <ath10k@archiver.kernel.org>; Thu, 26 Aug 2021 15:40:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CB20D60F4A
	for <ath10k@archiver.kernel.org>; Thu, 26 Aug 2021 15:40:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CB20D60F4A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yG5UfkXSV1a1SZC9HQk3qs68xPqE39dGK2sNvGmgi9M=; b=F7O9/6NM1G+DEa
	42+7VAqa5ewTgTerVz7oJsY+ak8SGn+a0Mb5BzE9uGhOKIyTxZR9WGCdw7HRExuVRR+/yHStYnp99
	JubhAj7rKpgNxihrN/EvinmipzpaWnTrIc12/j+m26w/aS2vHVp6UXSKHPZgTUy6N8G2N4Wb0Iwzl
	rOuxXo/TwqdJfVcDB99luFMlKsuvuiFxX0GUSlexxQXfOvqkOw0Lvy+W3ehClj9H9vPcfrM80BMtj
	bTWfz7oF4bJWqY27+sTKFEdE9HGaNoPYe9m+3jR3QKTO0Fu0Ds8CYnbg8l7l1Zkl7/DJTGIAnRka/
	tELOrbZApflaUZzKmC6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mJHU2-00AVKY-Eb; Thu, 26 Aug 2021 15:40:02 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mJHTx-00AVJC-MF
 for ath10k@lists.infradead.org; Thu, 26 Aug 2021 15:40:01 +0000
Received: by mail-pj1-x1031.google.com with SMTP id
 z24-20020a17090acb1800b0018e87a24300so2689306pjt.0
 for <ath10k@lists.infradead.org>; Thu, 26 Aug 2021 08:39:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:user-agent:in-reply-to:references
 :message-id:mime-version:content-transfer-encoding;
 bh=0x3JVYJjoPp3mCHZGSPU/br7LvYDmK0AvhxHSp9lei4=;
 b=BR2UH4Z+GTbgEsYwtzFTbhdGQ/ifkZOkcR9teV+AYwQ3uF+6UE2vX9k0M4WOgNrNWf
 raCkiFOMfrY6FzZdgajczRJJIDJCdW9kwHCG5G2CE9JrNoSypm+HxXGIIAQstL4hFcZ9
 m1iWfYepYFxbr1A5juP/ftBYb8BjyINYS3TVo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:user-agent:in-reply-to
 :references:message-id:mime-version:content-transfer-encoding;
 bh=0x3JVYJjoPp3mCHZGSPU/br7LvYDmK0AvhxHSp9lei4=;
 b=it55fHcwkhvivXsBx3G6DFbVW2kzRcCO35MGkeAcalvOpEsmhX6qC88jwr+1FPdD74
 h3jG/X3EW6lKbzOOvveSKHGP4ajnTxmvRlr2KqHYkgc+nsEEKDgfZe6m4oKqVbPB7ax6
 HVsYPbJvsQrY3OW7cNnHo1RRQjcbTqnB4H9LxBjVOcCN9i35jV2TOHQ/0WbhIE/dcXz1
 TPAm5BwaizBedCznMgyJDXUz2fSA1IJacxqAdUmCgqt3PthCRRXCr9chMVFP9SjHmgMj
 XA76jaKqqhgFDorP+ZsYvMbebCnNWUHVZdg6N2IJozuz9MFaNsGU+ca7b6lgin7ggXDp
 OAuQ==
X-Gm-Message-State: AOAM531vv9jsLu7z1PhGD+F70LcaUXO3LF1fwd2Ni403oLNeREbeStWA
 c1lQ2l0c0aDf2P8f9RugmAzywQ==
X-Google-Smtp-Source: ABdhPJyT1qPGkMrZWNyo9SQCMwAQb4rxdWH8bunPfFQd6Ss5tMxVMpPCzWceJSepz+bPci6A3ddt0g==
X-Received: by 2002:a17:90a:14e4:: with SMTP id
 k91mr17431519pja.3.1629992392852; 
 Thu, 26 Aug 2021 08:39:52 -0700 (PDT)
Received: from ?IPv6:::1? ([2600:6c55:4b00:c768:1835:a5a0:2702:1052])
 by smtp.gmail.com with ESMTPSA id z131sm3466093pfc.159.2021.08.26.08.39.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Aug 2021 08:39:52 -0700 (PDT)
Date: Thu, 26 Aug 2021 08:39:47 -0700
From: Kees Cook <keescook@chromium.org>
To: Vincent MAILHOL <mailhol.vincent@wanadoo.fr>
CC: open list <linux-kernel@vger.kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Ayush Sawal <ayush.sawal@chelsio.com>,
 Vinay Kumar Yadav <vinay.yadav@chelsio.com>,
 Rohit Maheshwari <rohitm@chelsio.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>, Kalle Valo <kvalo@codeaurora.org>,
 Jakub Kicinski <kuba@kernel.org>, Stanislaw Gruszka <stf_xl@wp.pl>,
 Luca Coelho <luciano.coelho@intel.com>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <kafai@fb.com>,
 Song Liu <songliubraving@fb.com>, Yonghong Song <yhs@fb.com>,
 John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>,
 Johannes Berg <johannes.berg@intel.com>,
 Mordechay Goodstein <mordechay.goodstein@intel.com>,
 Lee Jones <lee.jones@linaro.org>, Wolfgang Grandegger <wg@grandegger.com>,
 Marc Kleine-Budde <mkl@pengutronix.de>,
 Arunachalam Santhanam <arunachalam.santhanam@in.bosch.com>,
 Mikulas Patocka <mikulas@artax.karlin.mff.cuni.cz>,
 linux-crypto@vger.kernel.org, ath10k@lists.infradead.org,
 linux-wireless@vger.kernel.org, netdev <netdev@vger.kernel.org>,
 linux-scsi@vger.kernel.org, linux-can <linux-can@vger.kernel.org>,
 bpf@vger.kernel.org, Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Keith Packard <keithp@keithp.com>, Dan Williams <dan.j.williams@intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, clang-built-linux@googlegroups.com,
 linux-hardening@vger.kernel.org
Subject: Re: [PATCH v2 2/5] treewide: Replace open-coded flex arrays in unions
User-Agent: K-9 Mail for Android
In-Reply-To: <CAMZ6RqJMWaRCB3sZa-it804Sv6aFyZ9J3aQyAStMY-1GAwR1Jg@mail.gmail.com>
References: <20210826050458.1540622-1-keescook@chromium.org>
 <20210826050458.1540622-3-keescook@chromium.org>
 <CAMZ6RqJMWaRCB3sZa-it804Sv6aFyZ9J3aQyAStMY-1GAwR1Jg@mail.gmail.com>
Message-ID: <AD5C7E3B-6984-49D9-8666-B3BE90588F1F@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210826_083957_767597_51A14EEE 
X-CRM114-Status: UNSURE (   8.96  )
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



On August 26, 2021 12:36:27 AM PDT, Vincent MAILHOL <mailhol.vincent@wanadoo.fr> wrote:
>On Thu. 26 Aug 2021 at 14:04, Kees Cook <keescook@chromium.org> wrote:
>> In support of enabling -Warray-bounds and -Wzero-length-bounds and
>> correctly handling run-time memcpy() bounds checking, replace all
>> open-coded flexible arrays (i.e. 0-element arrays) in unions with the
>> flex_array() helper macro.
>
>Nitpick: the commit description says flex_array() but the code is
>actually DECLARE_FLEX_ARRAY() or __DECLARE_FLEX_ARRAY().

Ah yes, thanks! I had renamed the macro but missed these references. Now fixed!

-Kees

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
