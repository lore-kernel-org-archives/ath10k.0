Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC43EC6FD1C
	for <ath10k@archiver.kernel.org>; Fri, 24 Mar 2023 14:53:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l5La9FAihYBiJ5e53iraUHIToj6qdLEB3AB7Frx6yss=; b=CYuMH6K/KrNUwZ
	RmFEmjCclEWWW/PwXjz2Ge/kpNbSbSNSM2oVOjPzRYVFhlZMkvr11GC9iP86Da+2fRr7MCnITq6vG
	VuVvgnVYUEtuMpY8BQov3ebqNFx605T4l85WKS0avEEp/uMAjqWIWd4/ddoxwbRHxlhtBZN2zt8qp
	aR61uT7euGrOWgcu2Ec1VGsnBm1D9jOkL3kkb8e80IfwaLNjuvmfXgxDL6Y5vuwMGXELAuTZMl8HT
	gqNUio6XwdwX5SWTioB24/Kehm9cQwf9HNAmmuhMCh0ZnKwQh1C8xPeScuww1tA9pMK3f+IsF0T6C
	pIvHMxJDAkDcXN5Sp3Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfin4-004imf-1L;
	Fri, 24 Mar 2023 14:53:14 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfin1-004imB-1y
	for ath10k@lists.infradead.org;
	Fri, 24 Mar 2023 14:53:12 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1285762B46;
	Fri, 24 Mar 2023 14:53:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE4DBC433EF;
	Fri, 24 Mar 2023 14:53:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679669590;
	bh=9Bzy8ntyyYlzsjNmc78UfhexZSZPRHrJSAQutSdB5D8=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=tfkXgJpaG5VCC/Jf8RDQRSZg7Yiq04dsHBrN4FVubuiMfby8e3MORukt5N28Az1Zv
	 U//O96cq547CPg5LppNQFcUfxoHtYfPHQu7aVbpqykYd2m1d1z5p1HGwT52A2jUNOi
	 4ULJB8zU645n7Nu/bGuq1gU4SXG/LJfFYzyJAdJzlKKYODinyhX1PBRPwKNSR+WaxT
	 YtbtKAFHJuejoWh+3rXDv9brQU1lxbf0yKkeV9sW+huOawP3IbAL72hlznajQoIBJ4
	 SKYeD6hcgaBELO62PLdrRqJaGSDkA7Cr37oRkWrIw2t/mnvh0keGm5QIk9hmu6aArS
	 mhiho7aAPGkkA==
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: remove unused ath10k_get_ring_byte function
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20230322122855.2570417-1-trix@redhat.com>
References: <20230322122855.2570417-1-trix@redhat.com>
To: Tom Rix <trix@redhat.com>
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, nathan@kernel.org, ndesaulniers@google.com,
 ath10k@lists.infradead.org, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
 Tom Rix <trix@redhat.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <167966958590.27260.15660698872917271448.kvalo@kernel.org>
Date: Fri, 24 Mar 2023 14:53:07 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230324_075311_684673_76F6F177 
X-CRM114-Status: UNSURE (   7.54  )
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

Tom Rix <trix@redhat.com> wrote:

> clang with W=1 reports:
> 
> drivers/net/wireless/ath/ath10k/ce.c:88:1: error:
>   unused function 'ath10k_get_ring_byte' [-Werror,-Wunused-function]
> ath10k_get_ring_byte(unsigned int offset,
> ^
> This function is not used so remove it.
> 
> Signed-off-by: Tom Rix <trix@redhat.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

9fc093b756f6 wifi: ath10k: remove unused ath10k_get_ring_byte function

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20230322122855.2570417-1-trix@redhat.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
