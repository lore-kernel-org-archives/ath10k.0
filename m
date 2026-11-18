Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93A3C606A33F
	for <ath10k@archiver.kernel.org>; Wed, 18 Nov 2026 21:56:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=W3cgswOz;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NeW0Pefp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ziTJP7HwMkyh3D0f36moJR65SHyfyGHbTUuUtQiBDOk=; b=W3cgswOz6/zGbRGuVOrImq6w0j
	nBjE4luVQttVKh3DX7PB0AP5mi+CINaeYiWmfAzvIoMnSZSLNhKMklw6H18dCmi0e4oxPrjDkyEAG
	mFwIveRoR25c7lJ+nBUYR83/rPZZE6iENDlk0TdWXIzcnFmNxO4G4vqBCbv99eANcZHsmYbXTR4Qq
	PHA9In1vHTgyDFZqlDL25xBVpDa9IBZrJO9Wq0UArUduim5XenBGOmnFCXmqOjITMbzZggW5LxjmE
	TLgjREmCx5ly3Er0hlCbNqeeudEzdYu1vPK8hNRVX7cYr9/U7T/MDGVn/c6nxnuDufhPelf1+z6wK
	GxjTiAcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTndw-0000000ANDf-3z2b;
	Wed, 18 Nov 2026 21:56:40 +0000
Received: from mail-dy1-x1331.google.com ([2607:f8b0:4864:20::1331])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTnds-0000000ANBD-2UI0
	for ath10k@lists.infradead.org;
	Wed, 18 Nov 2026 21:56:39 +0000
Received: by mail-dy1-x1331.google.com with SMTP id 5a478bee46e88-38318d69173so1582286eec.0
        for <ath10k@lists.infradead.org>; Wed, 18 Nov 2026 13:56:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795038996; cv=none;
        d=google.com; s=arc-20260327;
        b=c3IFn4F7Z5iuJLVU5ZaHtLHtttwfRYYn1PYrqymL0MI70HEggtvRALdW9COVflxllN
         Myvi+5YvIdj9j9yMTrD75HUqEyWRlA+lw48D+7tfZ0Z1BjrEw77ZG/yIT/D8FNe82oQq
         4M7t61JHgWWhkdcp1LNx8SpeheXIbFAG2sXqM2kTXWqTC4MLrKB1XfK7mCx02GILLeQ9
         WflM9OglVfPs0DhfJoDjG+5+U8juz7LF5KXsYfI695kSYxy+UB+WmhkwRz5PBEeKz2E3
         r+4vbXyqid3uEdmE2Yv5MxyVFyqncy7NvtqA1UYgKqTrrwc202Y4SHpyB+q5gDtW+152
         O/jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ziTJP7HwMkyh3D0f36moJR65SHyfyGHbTUuUtQiBDOk=;
        fh=aBmjdeJkWlwBV7Mkk3AV4aikIZ7/EwOlqrOkrIL8x2I=;
        b=rWiKPHKA2HVNyaN1Q9I579PHQJzpmiP10hgSHxuEK3uNbnxogLxItXd6hNq5hBNYQM
         qevA6mL765Rty4+q/5GyeS1gwHWGgDL1znVLAuXToZSLRWL6NFcDW6ZtUvFuK5JhjFpo
         BnBDMhw1OvEqafpzUHICTGZ8jly1hZkvTS3x2Em/+96oIcDYWVZDmrrSJpjw8UBYXv1H
         Df5ocNHRj6NPtSLiyg07+LiBjClVutNY6Fpg8XLTRQrvasodyiFmOGkY3AFnixU+3+OE
         92HbedX0T5+Z0ydI2JOuVlnXJJ8YBcKFXg2SejCCNt3LBVmKlOaZ6YN0MmwhYkgHkgDs
         N4gg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795038996; x=1795643796; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ziTJP7HwMkyh3D0f36moJR65SHyfyGHbTUuUtQiBDOk=;
        b=NeW0PefpJIdwdU+kalkhdEAOJxAo/Qm4HbXHIh4fZRKYtxgGC7R6tYm4Z8RI1XHatE
         aqe1+jgsScXcfYTPvwcM8xdk8AFk95YcHcVm3V4/B+Y4j5F+e1+irvThuOy8BKtSwaL6
         OEfQpGGscDRbPJO205x7c82Hxl9WrTqE6ZP9dU97OLSMPoRhIdIyxG0keUKPwVnqKQzm
         5o7J485dQ4BhcsFpHdE1+9WWQEWfS/TX62+XNVFmdfgMFlxuf6PQal0TAvir1F1tYw/8
         Yqyr0+uFSZE1zb7N8ZKMEcgYD3VTl6TQuRc+9o8ZtLA0qeSoT+IH4ZEsUI0gs2MhysFz
         s3iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795038996; x=1795643796;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ziTJP7HwMkyh3D0f36moJR65SHyfyGHbTUuUtQiBDOk=;
        b=Tn7DUwodipL4I2mpSVE6Tty7QuUcWo2lVQJHM5p9CarOc9gccr/v+EFO1Gt0WGtwGZ
         J93HuhKIvN5D71F7p5Uql04K8mNAJfV9kSPuKfucGeC/6i3RmJmJYJzRtF7MIvr7/Wv+
         X/VTYmU7U5lZiMsRWlY67tNECx0GQriqwjkCEOZ8a4X/c+iPfZ0nzIy+xbdxERaxfQjs
         VW/FcDzZ4xRw64WyJPev73mXAmxK3scS+iejFP1i7xlhBmfHtM86iOgEP8ZuZtv3QTpY
         cDNsdeQLX+qJHAL+QeiDonkB0b3XkUnXSoLE4kgbiu1yGozACMzx5kaIwku/MH/Gxaq6
         43Vg==
X-Forwarded-Encrypted: i=1; AL+hErFERYnGV3mBs+qVJqDItCH4sik6fh6Hm5bHFgLSMj+886g2PGtq5Wt3HnTDL+8pSKWDvCh/M10=@lists.infradead.org
X-Gm-Message-State: APuU4Z8LA3WUdqar96AHUJrtscm52/9S0Jac/uXef0VUKw2bMoOhjLRv
	+svzO0S4pX/WxNEU9aH5AQa8SbFh/9orwNlNlM7uwhbJRXVKUkqHnxWLsAKlTgHNePv0kb2/om8
	2h8anYWuth7x5hLIRLX/QrsCmROoFEQk=
X-Gm-Gg: AZFdTZedwneYWCi6Z10+K/6kSqEQD4M9BTwSGjsWOP/6fakze8RAM0qJxgEqR7mD0fz
	JEr30ILj8kQapBQtKYVeS/BDMo/JimAtdb0KEQzjqzfP9kOKS3upjbiduSvAOmjx2tAzeLk61re
	BDKUorxqQH7yHpc2wW2pjDkPxpSHZx4eP5Qju4Io+Etshb6TaPmGaXZMP9K+We9qYyepUziwX85
	ySOOKVen1wBIzEMcGJx9L1hwn9ZXIopytRBAEA4BMBrmmySqhViK0dQIyfp+S1L2+wTASOsNzYv
	t/yTP25iWl51Y54FjIobioh4SgWXb8JJeQoWIlJKGCAqisv2scL4EOjk6aIhZHcewvblCRhEnDg
	VUEn+KnY3b0kNocyVswEEQwRPnYlAFrfOdyv8nvsfuVGSpDuVDeiaabaC35mQ4UFlaRcHV6MqsR
	bOdFrVj8CVGGalJQ9n
X-Received: by 2002:a05:7300:dc05:b0:36a:7bb7:4609 with SMTP id
 5a478bee46e88-38281cf2d27mr4946077eec.34.1795038995589; Wed, 18 Nov 2026
 13:56:35 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261118052116.3901761-1-lcy8047@gmail.com> <CAFEp6-1h0iwXtPr0HXVMceSDdQ09KPYomt58Nme_AzXy+V043Q@mail.gmail.com>
In-Reply-To: <CAFEp6-1h0iwXtPr0HXVMceSDdQ09KPYomt58Nme_AzXy+V043Q@mail.gmail.com>
From: Changyul Lee <lcy8047@gmail.com>
Date: Wed, 18 Nov 2026 16:56:24 -0500
X-Gm-Features: Aa3M54paIcao6XUjgvQroGOuSTezaTatALtRBeHgZB-rqUe0NegT6OT5B_ER2ss
Message-ID: <CAKefsHuNpdkSG4m90qavkXD+80TyuX89gTVR-WhBsWX4m7-3Qg@mail.gmail.com>
Subject: Re: [PATCH ath-next] wifi: ath10k: free msdu_id and skb reference
 when HL TX fails
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Jeff Johnson <jjohnson@kernel.org>, Wentao Liang <vulab@iscas.ac.cn>, 
	linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_135637_851416_1D66612A 
X-CRM114-Status: GOOD (  12.07  )
X-Spam-Score: -1.9 (-)
X-BeenThere: ath10k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath10k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-2.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Loic,

Thanks for the review.

On Wed, Nov 18, 2026 at 9:53 AM Loic Poulain wrote:
> The above message looks too verbose and confusing for a somewhat
> simple issue. Maybe this should be split properly in two fixes.

I originally wanted to fix the msdu_id leak. ath10k_htt_tx_hl()
allocates an msdu_id in htt->pending_tx, but leaves the entry there
if ath10k_htc_send_hl() fails.

I also noticed that the same error path doesn't drop the extra skb
reference taken by skb_get(), so I included both fixes in v1. I think
I could have explained this more clearly when covering both fixes
together. Sorry for the confusion.

> If this is a fix you should not target 'ath-next'.
> Two fixes tag looks weird, what are you fixin exactly?

I Cc'd Wentao Liang because he had already posted a patch for the skb
reference leak [1], but I left that explanation out of v1. Would it be
okay if I sent a v2 that only fixes the msdu_id leak?

[1] https://lore.kernel.org/all/20260917120112.2150211-1-vulab@iscas.ac.cn/

Thanks,
Changyul

