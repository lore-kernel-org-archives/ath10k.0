Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E6CFC77B7C
	for <ath10k@archiver.kernel.org>; Fri,  5 May 2023 13:08:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NXobo/MlXKHixVIFySsMm4XXTZ6HrN7/EmGyDSrPv5w=; b=Xdbt5kF4LlzeFX
	dTAduUcfyKdXQ929+0fO257gZERhb5e8gVQ9CtST/fnZJf2p3dNXlU6vXH452TgkGonf+L23M4LHd
	UQpHA62G628o9x3uQuPtNH0iQgjUpalw6rsMXrF4XHilU1F0V1j18Zw1WqamGRLv7VbXWdoTnY1Lo
	9BbLcEJ3uBAdKVWYANMCtKKt+XpRzva4tz+SNrXk3Oz7TMmecp1S1BFmlnvzcuussbIAhomAY8say
	L0UAJ4T91oohBXkciqc75tzt/pTdM93RNHb8s2gr9KQxNTm5R4p+gE9CuqaA4Pj5Vd0vQvAwfKVbq
	DWaxOcgb4sEQVsSyhWHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1puvAE-00AxAF-1i;
	Fri, 05 May 2023 13:07:58 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1puvAB-00Ax9V-0g
	for ath10k@lists.infradead.org;
	Fri, 05 May 2023 13:07:56 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B0CF563E03;
	Fri,  5 May 2023 13:07:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B1E7C433D2;
	Fri,  5 May 2023 13:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683292074;
	bh=79GP8oXho+dfqQeJ9uzaGIMD8UOrca7fRPGnKMX7260=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=ZicXFbz5jZNyVMlORYCz7kdzL7JnEhsJD8hTUYsluy8Ja7g6QjmtmrtEtzTBhfWXw
	 1MKOD8EZGapobKYgPTi/t5pOw74CzsRHSQoD7vsn9Xi+QRRSy/mHpyemajBuVjWOTM
	 zfx+JyQOc2dl+rVq4LyVtCbmNippsL6CbGNM+0kiLfkWCI0BI4Hg9rfdo/bI8rvO1a
	 3EKzQJXd5ZM8GCxTJmo8KeBdfpWgy4yi/X+BKdKt5L6yMAyWMsmsG5QHTu2sAmJZru
	 ziIQ/oBWQajqkALiJp/UpygjmsDaicyIus2cLG9TJLuiDOBevUsWyRB6KQzb9sfu8L
	 KKn8JK8W9vnJw==
MIME-Version: 1.0
Subject: Re: [PATCH net-next] wifi: ath10k: Use list_count_nodes()
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To:  <e6ec525c0c5057e97e33a63f8a4aa482e5c2da7f.1682541872.git.christophe.jaillet@wanadoo.fr>
References:  <e6ec525c0c5057e97e33a63f8a4aa482e5c2da7f.1682541872.git.christophe.jaillet@wanadoo.fr>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 ath10k@lists.infradead.org, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <168329207040.10223.8921513791102227473.kvalo@kernel.org>
Date: Fri,  5 May 2023 13:07:52 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230505_060755_289348_F8B6D5E8 
X-CRM114-Status: UNSURE (   9.57  )
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

Christophe JAILLET <christophe.jaillet@wanadoo.fr> wrote:

> ath10k_wmi_fw_stats_num_peers() and ath10k_wmi_fw_stats_num_vdevs() really
> look the same as list_count_nodes(), so use the latter instead of hand
> writing it.
> 
> The first ones use list_for_each_entry() and the other list_for_each(), but
> they both count the number of nodes in the list.
> 
> Compile tested only.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> Reviewed-by: Simon Horman <simon.horman@corigine.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

fd7bc9d9d467 wifi: ath10k: Use list_count_nodes()

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/e6ec525c0c5057e97e33a63f8a4aa482e5c2da7f.1682541872.git.christophe.jaillet@wanadoo.fr/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
