Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B613C36010
	for <ath10k@archiver.kernel.org>; Tue,  8 Apr 2025 01:06:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W/pw3Cf0YcI/LQNvU3r1N+3wtaVcN1U5fMoqAQq4CBk=; b=uP5hGaCM+eU+BmBSXOAYR6FYwP
	yvw+vJJpKkwmU4KhcxMveVL6wwlpHwFsZueJir4cQnzTdxrGoPzXec9q+JNFt6R8Kh8Mhn/pENJoK
	aSC2vtadLJ8vy9ZBhJ6gJnXAyAqA6OviQqJVgBtgVfph5uWR5KYZw7+c/vLPHZnxwaPuT7PsdrNJu
	mYsRr9EYsj3V0O2UgDV6aER5UWNza6/WT9GJtdNJUWJqkGhmeICU6dwOq9U6OO+t6tI+B/BOJQ4i5
	JRfeM2B4rPf11mvcjW6NV28JpOunUysWOrguY+uKpacGMDLwA2BLRXG/4haR88Ryx9A+/IpG2XZDA
	dCFZ/L1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1xQO-00000002QQC-462Y;
	Tue, 08 Apr 2025 01:06:48 +0000
Received: from mx.treblig.org ([2a00:1098:5b::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1xQM-00000002QPp-15A6
	for ath10k@lists.infradead.org;
	Tue, 08 Apr 2025 01:06:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=Content-Type:MIME-Version:Message-ID:Subject:From:Date:From
	:Subject; bh=W/pw3Cf0YcI/LQNvU3r1N+3wtaVcN1U5fMoqAQq4CBk=; b=Sk6sXUwhdH1RozKG
	cztxbqs9TCd6eUVTUKL1jP3b4QdjtBE6BGNedtVIEH1OQ/rU+D+uKE5gZU/Z64mkdZOiqc24DYgTT
	NCOwuemUJ8WZiYCo5Esh9ld+rO6I9LHUadEMZmryv0akdfemMrU7l9SofdzaEjsdKaqlxPMpfvheh
	oNJpIGKYabzQmpnesSE+75MJYvP3bEOK3sO12aLm4dc6u2EPQKajeDulWy5v7MwB/sFW4UpSPZrha
	2W8VivA5MAwJV+4AMAxLZzU9s93HSo7DMU7IVZciBzlea0X6dVLBS7xN9V+q4VaHUUNnXAOipg96C
	N/JGgGrGqS+HOaK4Mw==;
Received: from dg by mx.treblig.org with local (Exim 4.96)
	(envelope-from <dg@treblig.org>)
	id 1u1xQ4-009hzA-2m;
	Tue, 08 Apr 2025 01:06:28 +0000
Date: Tue, 8 Apr 2025 01:06:28 +0000
From: "Dr. David Alan Gilbert" <linux@treblig.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
	Balamurugan S <quic_bselvara@quicinc.com>,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
	P Praneesh <quic_ppranees@quicinc.com>,
	Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>,
	Ath10k List <ath10k@lists.infradead.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the ath-next tree
Message-ID: <Z_R2lEVjqn2Y3_sP@gallifrey>
References: <20250408105146.459dfcf5@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20250408105146.459dfcf5@canb.auug.org.au>
X-Chocolate: 70 percent or better cocoa solids preferably
X-Operating-System: Linux/6.1.0-21-amd64 (x86_64)
X-Uptime: 01:05:37 up 334 days, 12:19,  1 user,  load average: 0.00, 0.01,
 0.00
User-Agent: Mutt/2.2.12 (2023-09-09)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_180646_514923_0224B745 
X-CRM114-Status: GOOD (  11.07  )
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

* Stephen Rothwell (sfr@canb.auug.org.au) wrote:
> Hi all,
> 
> After merging the ath-next tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> drivers/net/wireless/ath/ath12k/ahb.c: In function 'ath12k_ahb_stop':
> drivers/net/wireless/ath/ath12k/ahb.c:337:9: error: implicit declaration of function 'del_timer_sync'; did you mean 'dev_mc_sync'? [-Wimplicit-function-declaration]
>   337 |         del_timer_sync(&ab->rx_replenish_retry);
>       |         ^~~~~~~~~~~~~~
>       |         dev_mc_sync
> 
> Caused by commit
> 
>   6cee30f0da75 ("wifi: ath12k: add AHB driver support for IPQ5332")
> 
> I have used the ath-next tree from next-20250407 for today.

I guess a clash with the recent:
Fixes: 8fa7292fee5c ("treewide: Switch/rename to timer_delete[_sync]()")

Dave
> 
> -- 
> Cheers,
> Stephen Rothwell


-- 
 -----Open up your eyes, open up your mind, open up your code -------   
/ Dr. David Alan Gilbert    |       Running GNU/Linux       | Happy  \ 
\        dave @ treblig.org |                               | In Hex /
 \ _________________________|_____ http://www.treblig.org   |_______/

