Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25315D24462
	for <ath10k@archiver.kernel.org>; Fri, 11 Oct 2024 01:07:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oLtfco7CYTSkruhDHn9AtchkZ7x9E9bb03vUF9ZRl8c=; b=HJE3Qv+hsIsMluoWMdQ2O1yEOS
	MPdFLtq8YSgJVnW2OSQQ5YT7sENCBR7vAAZjcd6Xav8uwXXvcZPLXKB8LKltGUyHOLfNqhlaYa2jA
	mRQ9tJbHJVDh2uhawp2yrE1x1vKStBJq5TVWVZTpRq7u8oQggSrkPSmXiPjQQQRJn+/E+J2zs0t/1
	rcE4kSqn+B+saRbvNffP6YbTQUplsI+4sh9zA8TM+P2PHBHEdF72OgvhJU1/5CUsf5gg46SwYhM4F
	oAWttreo3z/7UA4gyTFnYTm1jR39Fl+3Q9wpm4OMcp0BUGa5qsjb5IHmsznk2R0pBriYwsBj23pxf
	uaaXDReA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sz47r-0000000EsU3-1e7t;
	Fri, 11 Oct 2024 01:07:27 +0000
Received: from mail-qv1-xf2b.google.com ([2607:f8b0:4864:20::f2b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sz47n-0000000EsTD-2PBa
	for ath10k@lists.infradead.org;
	Fri, 11 Oct 2024 01:07:24 +0000
Received: by mail-qv1-xf2b.google.com with SMTP id 6a1803df08f44-6cbe700dcc3so10227716d6.3
        for <ath10k@lists.infradead.org>; Thu, 10 Oct 2024 18:07:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728608836; x=1729213636; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=oLtfco7CYTSkruhDHn9AtchkZ7x9E9bb03vUF9ZRl8c=;
        b=P1Ej6/AHFGo6hro1YbORA6z2owcPOiwX9nHFfa2CmeLicPKP90xE1WBuIW51iY3a+K
         cXQ30OPyUbwDdVgMqV/7KX+ehLjbaoCeqVeytK7/jI08TbjrlH1Xv/m/chVJ1bg9K+5h
         dUh0sM1cuUszYLnrqfHUgE97GWKS7dQERTNXMcH5ZxlkZGVriRk0KDMVcIC+33SYGEHt
         oyNVzXrG1CXO4K7gxDTNs1tlxA4HLPHgUDPscT8SfiZpnKnuU/tHqnGzK8BLB94UMzwZ
         Z9UD2EHgJY5utC5lCWEhWoh+/LOL5W71aESq3hXZeWU69N5qS+m9TqP1iUOZyC7Fxo8o
         /AwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728608836; x=1729213636;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oLtfco7CYTSkruhDHn9AtchkZ7x9E9bb03vUF9ZRl8c=;
        b=mSVvpQbIUuHjAYV/CuZ9hkXaVoa0q1tqSp/dh59/sdN0hEqrkTmK1i4wYdPHeZPX7p
         PwYtlHZol2+MWwzg0zT7hJPGnpZ0aS/0Kx1YvxcAeHyI3v5DbusgLgvIV+jgnv64DPtT
         49NGahqdlnC1MWN97whhhSkqSuE+SfGuS/UEANShaBpYirL0LUfcZAUjKX2QxxCwf2On
         wkJrlRMbHPbLJPSTf5CPA6GPO7anc3Z+eHr5YtSG1Ivo+FEV7dDNe8956Ge+G9aelewa
         JbxDo1SwyHB5YZbyNPKAxZJU/YhhwhLgu/RXOvfrCNWO4tk1fXdz+Hi/gxWldfT8S4zC
         9A+Q==
X-Gm-Message-State: AOJu0Yzqh4FZ1zKVlm42DMkc5o9dym0q6nbD3oXh3Jz784j3bR3wsgyE
	x+4l+vhekij5aC+cV83mXZ3i6dVGjRfk7aoffboaA2CELefdCf3/X8jgORHu46syzffmRss6nkB
	tziuJd46QQvmUem7fheOaECBW3uVzMkCN0M6gMIe0ScD77kLzAw==
X-Google-Smtp-Source: AGHT+IG1IPgTRgTS0BIIfpBkCfsfGiVu8O8/Lby/bdx0N0082xjwhFiPhAr2iQsuMORy4Ja0+DTJ5k0TZRJKu03WKA8=
X-Received: by 2002:a05:6214:8f3:b0:6cb:e997:6717 with SMTP id
 6a1803df08f44-6cbf00139b7mr13861936d6.38.1728608836406; Thu, 10 Oct 2024
 18:07:16 -0700 (PDT)
MIME-Version: 1.0
References: <20241008022246.1010-1-quic_kangyang@quicinc.com>
In-Reply-To: <20241008022246.1010-1-quic_kangyang@quicinc.com>
From: David Ruth <druth@google.com>
Date: Thu, 10 Oct 2024 21:06:37 -0400
Message-ID: <CAKHmtrQVMLOo=UFamTFNK3ofLVuLdrfFAyfF1syFdA4+4w4Uog@mail.gmail.com>
Subject: Re: [PATCH] wifi: ath10k: avoid NULL pointer error during sdio remove
To: Kang Yang <quic_kangyang@quicinc.com>
Cc: ath10k@lists.infradead.org, linux-wireless@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241010_180723_630707_0C70124B 
X-CRM114-Status: UNSURE (   4.26  )
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
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

Tested-by: David Ruth <druth@chromium.org>
Reviewed-by: David Ruth <druth@chromium.org>

