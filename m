Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDC8DCDB46E
	for <ath10k@archiver.kernel.org>; Thu, 12 Oct 2023 10:34:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yFuukx2qu2OXCnUDu13JDGrYhoAaG9L4vtPcjr9bMJE=; b=iLL5GAKw6IOAfo
	8qSXjfDJr7I0YvdJR70YNsKUX12Ve2RtEFtle9quc6drXAoh5pFgwJrPRTR3DgIQaGpBg2SfW3+uV
	npKURmrigN2iuCdGqyrhQY9TqQY8jq1IULQLEutAz/+er2uoqyN2mqJ0cya7kKPRFAqBUAAa/Mmtx
	AEiyjOqhaygj7KA9q+/3odvpICUylr1Zmbpe+irlfT85IjyUW7P5QHmwWUkogMwBXb2x245OMOIPk
	WYILSNE2Y7esf9WI+O3amjjVBXbcbQ/aAUMpdtYAqkxEBed10mSyx0j47BQ9T4Fvlq/O7yTEMTFjd
	aSkUzGjMdJxKhBJv48YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqt1J-000fwY-23;
	Thu, 12 Oct 2023 10:34:21 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqt1F-000fvR-0g
	for ath10k@lists.infradead.org;
	Thu, 12 Oct 2023 10:34:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3D54261DB8;
	Thu, 12 Oct 2023 10:34:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 703EDC433C7;
	Thu, 12 Oct 2023 10:34:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697106856;
	bh=6J79pLScE17Mf/0kCZhd+fh0ru3BV447wowDqIP8+5Q=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=TddkFTgLllj4yN57Nf3n2suZmc33EHHjxPQDWvJckJb5jEARs7nPEl7e6caTBxuVc
	 DJLbrCAVo4fnwiJ+ZTX0dU1tw/en5dquvN9VrXEFvvCfNN5jjV0zGDTJn7e4ycZDay
	 h/96FKsNJFI/sM+OPC1GBxL/AOSN5ZfBpNXLb/AM6b7r9z6tzsYtxmma+R1Uev/huz
	 AnpkXKZPve9b3mC1YoXyqTEIT/2IGH1wScwj23fLOUPxHEo54lyDqyx7MOsg6MYPRz
	 M6y+wChy6nSORH4vTLsSlnzkHE/+TyaWJRxNoYWjgutgzh4udrDxEvAu0adXh3UypI
	 anPg3MIyCmoSg==
From: Kalle Valo <kvalo@kernel.org>
To: "Luca Weiss" <luca.weiss@fairphone.com>
Cc: <ath10k@lists.infradead.org>
Subject: Re: chan info: invalid frequency 0 (idx 41 out of bounds)
References: <CT83B4WXR0TL.3OREBDGKBT2IM@otso>
	<CW5HOU3XBPS7.1KO9C3VGQCX12@fairphone.com>
Date: Thu, 12 Oct 2023 13:34:13 +0300
In-Reply-To: <CW5HOU3XBPS7.1KO9C3VGQCX12@fairphone.com> (Luca Weiss's message
	of "Wed, 11 Oct 2023 11:07:01 +0200")
Message-ID: <87wmvs2kpm.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231012_033417_291914_FCBEEFB3 
X-CRM114-Status: UNSURE (   6.99  )
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

"Luca Weiss" <luca.weiss@fairphone.com> writes:

> Anybody have an idea about the issue I sent a few months ago?

I don't recall anyone reporting anything similar before. As the ath10k
firmware can be different on devices it is a possibility that's
something specific with your firmware version. Unfortunately I don't
have any tips how to try solve this.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
