Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E047EC61D9B
	for <ath10k@archiver.kernel.org>; Wed, 22 Nov 2023 18:23:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RnjjR27oNu1UAqMJlIQiCfrszIa2OiQQ1P3bXaSUKCc=; b=n7kyApMIBvIirW
	AwRIighJRTouZa3JTB9zrsXgJ2eE9WAEc+1BzjSVhZwsB0ZmIFQyWPyzXx8s81wl0OBJNIKomHRqs
	HZA2U4Et+/kF5bl+k7mVu6kJPldkH4X9iRiHU8ROn0EA3HV5UuSfnH1w6kAXRwQ6ZL600Yd7tHPvM
	zzjdbfktdd62aDE3XfcIQqeuTMTswJk4msYHC8Zvc08ui6Ahe/JtcB0+2EGSCFfSVWzNSeojrZQ3H
	hnJajeYU6QhE6ClnzGtvsZlthYBPiohXEehvcfZMpo4bs2o/7/dxxSYdoYOids1MwFCFTBkLuMOS8
	ThlMBsLm4dZDiFBLDumw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5rsj-002oGV-32;
	Wed, 22 Nov 2023 18:23:25 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5rsh-002oFk-0I
	for ath10k@lists.infradead.org;
	Wed, 22 Nov 2023 18:23:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 0771ACE1049;
	Wed, 22 Nov 2023 18:23:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C4AAC433C7;
	Wed, 22 Nov 2023 18:23:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700677400;
	bh=rsm/2nRii3HbKt0aA439i27NiMC571tbBfMbl0xkr98=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=ZqALDBOpZeAJOS33W+umAg2VxzMDVHcq4ryuaSj4ZcBAK4k5LAZqDxMxR9+G4rsW5
	 CjS6qmm9zenFVCSMdL9AlFb3wK64w2uuSvxsWE6Zgiswk4l6ElH1lz4nAZq81ZW9vz
	 bDBTZFbNBbgWVbuF08HCYP5IjR9/diucGmoHjjC0F0zwT3FYUFtrNbNE9ubnCPTfrT
	 HjdM144cfV4CXQsCpmXCzc76LJy0MRxuRxLNJ0gZsDYNgsCR06AATLNbYOu6YxWjJ9
	 FRTt+F8xpuIXH6X3lCbTiTm4wJ9f4FDyDRedvDxHHTk1jY+8IWrT4TwW8Mf3DPYe3t
	 /XrFyoyIjq1fw==
MIME-Version: 1.0
Subject: Re: [PATCH] wifi: ath10k: Remove unused struct ath10k_htc_frame
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20231103-ath10k_htc_frame-v1-1-ff00b38a9630@quicinc.com>
References: <20231103-ath10k_htc_frame-v1-1-ff00b38a9630@quicinc.com>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: <ath10k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, Jeff Johnson <quic_jjohnson@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <170067739699.158537.769046394140345550.kvalo@kernel.org>
Date: Wed, 22 Nov 2023 18:23:18 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231122_102323_366780_4A8FCD69 
X-CRM114-Status: UNSURE (   5.48  )
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

Jeff Johnson <quic_jjohnson@quicinc.com> wrote:

> struct ath10k_htc_frame is unused, and since it illogically contains
> two consecutive flexible arrays, it could never be used, so remove it.
> 
> No functional changes, compile tested only.
> 
> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

2bc76fef1a9a wifi: ath10k: Remove unused struct ath10k_htc_frame

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20231103-ath10k_htc_frame-v1-1-ff00b38a9630@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
