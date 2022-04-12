Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4A37C433EF
	for <ath10k@archiver.kernel.org>; Tue, 12 Apr 2022 10:51:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZPgua38vY/6Ni6r/455LGzzfvJkxu42Az21k/3Kg9ug=; b=EvEfaIidVaYv8e
	3WLtoclUPGklmtEFi+v4o2CHtn3hRxAoYG+BrvCfdZp7IrsZOARYQyxjzxlb1e3LzZEmmpxU6cIAp
	BzGFL+eHiHQPv53DIQ7yy5BDdoM4syj03vRhA4gsRBt6iFCPPKx3oi2O7rqw+5QMBcY9TRFMRDI5K
	17HbLaJNjBBkNjIB+1k17qHXxmqn5VSI0cjjvQlsyAy8ngEkPBoGqUM6/yOx0SFnqhlyONU1StluK
	3NoUQ1Oky0XuKMHt1CCtTyT/r2wjvigwW91SldxQNido5hiaol820Tctx/3GQ11LIen0FP6UOV7qq
	A2aub3hprXHMdII9BFQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1neE6m-00DRKn-Hf; Tue, 12 Apr 2022 10:50:52 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1neE38-00DPqt-VU
 for ath10k@lists.infradead.org; Tue, 12 Apr 2022 10:47:08 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6192861953;
 Tue, 12 Apr 2022 10:47:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C90C5C385A1;
 Tue, 12 Apr 2022 10:47:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649760424;
 bh=8nrqqM3IkuVaMYtRsABBZlIcS5QBrVTQAj/P3+5fYYI=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=IFJ0f4ZD3Llfeaj09qoCE9fqavR0fqRwZhrOfd+ghn84ggQnDQE8GFnbmO08hqc8c
 JU2zcJpWxRU9xlS2+iOAJVmdlpFlYPlfjMaZ+TgCK19Tk0XJ4Xehrzzr0XlQGF9/Mm
 d/U1TWLuYMyucl59ci/bEKB6t+9Zu5cmuypNYgNrNXp/8dTfQd1FYIUgiJ/j5MoDyR
 D0llTsWIxesJzjKOrQy6NdDLgGXJE8RK2eUESE9sWSpQVCZ9xXaQDO/hyUmOQ8YWjo
 T/KN8c4LpQexG+qvay1ZBzDW2gRysRhGBVsJjK6plN+gbY/I5FgCgpoxQIt9r01whD
 mtGRjmuH7zPXg==
From: Kalle Valo <kvalo@kernel.org>
To: Abhishek Kumar <kuabhs@chromium.org>
Cc: Doug Anderson <dianders@chromium.org>,
 Rakesh Pillai <pillair@codeaurora.org>, LKML <linux-kernel@vger.kernel.org>,
 linux-wireless <linux-wireless@vger.kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 ath10k <ath10k@lists.infradead.org>, netdev <netdev@vger.kernel.org>
Subject: Re: [PATCH 1/2] ath10k: search for default BDF name provided in DT
References: <20220107200417.1.Ie4dcc45b0bf365077303c596891d460d716bb4c5@changeid>
 <CAD=FV=W5fHP8K-PcoYWxYHiDWnPUVQQzOzw=REbuJSSqGeVVfg@mail.gmail.com>
 <87sfrqqfzy.fsf@kernel.org>
 <CAD=FV=U0Qw-OnKJg8SWk9=e=B0qgqnaTHpuR0cRA0WCmSHSJYQ@mail.gmail.com>
 <CACTWRwtpYBokTehRE0_zSdSjio6Ga1yqdCfj1TNck7SqOT8o_Q@mail.gmail.com>
Date: Tue, 12 Apr 2022 13:46:55 +0300
In-Reply-To: <CACTWRwtpYBokTehRE0_zSdSjio6Ga1yqdCfj1TNck7SqOT8o_Q@mail.gmail.com>
 (Abhishek Kumar's message of "Mon, 11 Apr 2022 16:25:10 -0700")
Message-ID: <87fsmio9y8.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220412_034707_150267_156F301B 
X-CRM114-Status: GOOD (  20.76  )
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

> Hi All,
>
> Apologies for the late reply, too many things at the same time.

Trust me, I know the feeling :)

> Just a quick note, Qcomm provided a new BDF file with support for
> 'bus=snoc,qmi-board-id=ff' as well, so even without this patch, the
> non-programmed devices(with board-id=0xff) would work. However, for
> optimization of the BDF search strategy, the above mentioned strategy
> would still not work: - The stripping of full Board name would not
> work if board-id itself is not programmed i.e. =0xff e.g. for
> 'bus=snoc,qmi-board-id=ff,qmi-chip-id=320,variant=GO_LAZOR' => no
> match 'bus=snoc,qmi-board-id=ff,qmi-chip-id=320' => no match
> 'bus=snoc,qmi-board-id=ff' => no match 'bus=snoc' => no match because
> all the BDFs contains board-id=67

Sorry, not fully following your here. Are you saying that the problem is
that WCN3990/hw1.0/board-2.bin is missing board file for 'bus=snoc'?
That's easy to add, each board file within board-2.bin has multiple
names so we can easily select one board file for which we add
'bus=snoc'.

> So with this DT patch specifically for case 'bus=snoc,qmi-board-id=ff'
> => no match, we fallback to default case ( the one provided in DT)
> i.e. 'bus=snoc,qmi-board-id=67' => match . I do not see how exactly
> the driver can know that it should check for a board-id of 67.

Sorry, not following you here either. Why would the driver need to use
board-id 67?

> However, to still remove dependency on the DT, we can make the
> board-id as no-op if it is not programmed i.e. if the board-id=ff then
> we would pick any BDF that match 'bus=snoc,qmi-board-id=<XX>' where XX
> can be any arbitrary number. Thoughts ?

To me using just 'bus=snoc' is more logical than picking up an arbitrary
number. But I might be missing something here.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
