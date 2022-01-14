Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02F18C433F5
	for <ath10k@archiver.kernel.org>; Fri, 14 Jan 2022 14:47:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F/XWzpFr/U84lYZyowrV6+YXN+nxlbiaCFmMEgJ1FqE=; b=H1YxWLRWrgDJiE
	f+I+iu9j6SsFoWJtbtUGYeJafINzwH08e7Srln3aSgWh9AlWhamGdSYVQpV6LR8VxpwrragSFpJ8y
	qh0s3R03W/K/PspImRFzbAVI6tRJuS2/N2wY0362C0SUl0K4QWhKFYMPYeYBKVpqwwNO0APhqtx0j
	0S88XtMXjJJOW8cYHeopy5dyzOnkIUIHW7pBxG9lpA49rf4iPmhpU0KJOU0TdnGv/fE8uIx45wc0R
	40HuI1DchMbXd4QVmD607jGKihjfWdk39ipLl97VBffrTnVyS2PuZy+oPvVZ1wmcDFMjNHYkPXzX0
	pCyRHDjtt0hKvY91z2cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n8Nql-009Qbt-IP; Fri, 14 Jan 2022 14:46:43 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n8Nqj-009Qak-9F
 for ath10k@lists.infradead.org; Fri, 14 Jan 2022 14:46:42 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 440E4B821BA;
 Fri, 14 Jan 2022 14:46:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92087C36AEA;
 Fri, 14 Jan 2022 14:46:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642171597;
 bh=CkdMvZCwQYDA8ZJ4QcAkC/rvfnqM2RFL97I2ZNXR9oE=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=FwN5NvX99Ai2YFk9WMXWg4Al4ov5HkRmkwehtaWAMYg97AylSYtjypJFsjf5RmkhI
 CUZL0GfLgf7v3mZ1ldBryhzv6JsqXMrak1GKRUzRpLSuKLgvYPTiTBiHs5TfrONNY6
 e64RAzEgaWcXI55YejlcghnWVNKAnDTR4Rc7px4M/SnYJHjMWSSNLtj1Dzz05i1ZlH
 UEb8wE8iUU1c2D5hpOzL+tvIRlMMglAr+0MLcxGB+KEuhlkxyEuhOedCGUiQBlpf+U
 6O13K9klAyIj4hOEvcXBXzxv/RhF0G0E133m1g0NfM0JGWQtilsg19i2/U3QsTza4t
 ZQh5w19/3WYyw==
From: Kalle Valo <kvalo@kernel.org>
To: Abhishek Kumar <kuabhs@chromium.org>
Cc: kernel test robot <lkp@intel.com>, ath10k@lists.infradead.org,
 kbuild-all@lists.01.org, pillair@codeaurora.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 dianders@chromium.org, Jakub Kicinski <kuba@kernel.org>,
 netdev@vger.kernel.org
Subject: Re: [PATCH v2 1/2] ath10k: search for default BDF name provided in DT
References: <20220110231255.v2.1.Ie4dcc45b0bf365077303c596891d460d716bb4c5@changeid>
 <202201110851.5qAxfQJj-lkp@intel.com>
 <CACTWRwtCjXbpxkixAyRrmK5gRjWW7fMv5==9j=YcsdN-mnYhJw@mail.gmail.com>
Date: Fri, 14 Jan 2022 16:46:30 +0200
In-Reply-To: <CACTWRwtCjXbpxkixAyRrmK5gRjWW7fMv5==9j=YcsdN-mnYhJw@mail.gmail.com>
 (Abhishek Kumar's message of "Thu, 13 Jan 2022 22:47:31 -0800")
Message-ID: <87y23is7cp.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220114_064641_504209_73832019 
X-CRM114-Status: UNSURE (   8.82  )
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

Abhishek Kumar <kuabhs@chromium.org> writes:

> On this patch I have a kernel bot warning, which I intend to fix along
> with all the comments and discussion and push out V3. So, any
> comments/next steps are appreciated.

Please wait my comments before sending v3, I think this is something
which is also needed in ath11k and I need to look at it in detail.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
