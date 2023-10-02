Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64293E784AB
	for <ath10k@archiver.kernel.org>; Mon,  2 Oct 2023 16:55:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m7aHR+UPgWY91wJ9NXNH/JSYQHag5PBJlX/v6hY8wCc=; b=WIAnegDKa8XAtl
	DJwL2j6sDpMKvyHRbsFgClF1/XFof++rZsAZQDTdCi3LGoq5OMfqm0wrvKRsXEfgcrpeYDARizzE7
	8dA0fYjiRM/Px6/Q7DFrW1pIbh6Rg6+7HY4UlOFbAe143yDB4xFWCrM4EotTeTVEZp+b3Au3VjOk0
	F0z4oFbLfTogAIx5MCoCPgBqFvG7eHc3jjuU+xVTskqHZhC0T32AVG1og9a5mucd+nJ/YZZxcIbnW
	Ac5vDgajZfR78NQlEPT8DJFI1TH+w9x9qAm7uHQ+eLCJSH9XFTQEJflNXwH8pIOh3CWSgUgSocOcP
	1RnqCdPCkMb3Lg8+w8Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnMCH-00D6ZG-1O;
	Mon, 02 Oct 2023 16:55:05 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnMCD-00D6Yb-2n
	for ath10k@lists.infradead.org;
	Mon, 02 Oct 2023 16:55:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 930CCB810AC;
	Mon,  2 Oct 2023 16:55:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC2ECC433C7;
	Mon,  2 Oct 2023 16:54:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696265700;
	bh=l6R77HZ01blh2QJJ24Cf8mBZfE1MZp3Lc/qYTwT536s=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=jRvCBWhEH/v0VmYwUbKMeNiLN2Tq7o6bVijkTG4OFg7UTj42F3CWe4mNSOwD5V8Zp
	 9e4gSch7PWP0Jy6BaCHEpgECLQQIcj8gRhi6s2G+Ew5HFpIipcxLPTceb7S09VXWQN
	 VsgXeUAu2YCvIvjbjw95gzRBSgEo+5mb8lKBmxnPtAMsAgSDiH7eNlqAwxXTbgMxJC
	 OkLj/26JkK4xh7cwmYrb1satETBvSr/jaFUnmpN2Lo2F1uX8eWdgjylLkmMblg9kOn
	 mlgd0wng8BTrzU43p4CrruKIIIDYpN9VWe+xLRHr6cV3MpAmhJLnMqJ8nMKeXMF98m
	 CZQnB0kmpnuDg==
MIME-Version: 1.0
Subject: Re: [PATCH] [v2] wifi: ath10k: consistently use kstrtoX_from_user()
 functions
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20230920154018.48314-1-dmantipov@yandex.ru>
References: <20230920154018.48314-1-dmantipov@yandex.ru>
To: Dmitry Antipov <dmantipov@yandex.ru>
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>, ath10k@lists.infradead.org,
 linux-wireless@vger.kernel.org, Dmitry Antipov <dmantipov@yandex.ru>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <169626569660.3936351.15391287849518283977.kvalo@kernel.org>
Date: Mon,  2 Oct 2023 16:54:58 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231002_095502_059056_7E60DD48 
X-CRM114-Status: UNSURE (   5.65  )
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

Dmitry Antipov <dmantipov@yandex.ru> wrote:

> Use 'kstrtoul_from_user()', 'kstrtobool_from_user()' and
> 'kstrtoint_from_user()' where appropriate and thus avoid
> some code duplication.
> 
> Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

3fcb81420aca wifi: ath10k: consistently use kstrtoX_from_user() functions

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20230920154018.48314-1-dmantipov@yandex.ru/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
