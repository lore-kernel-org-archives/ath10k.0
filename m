Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C734C433F5
	for <ath10k@archiver.kernel.org>; Tue, 10 May 2022 15:41:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lcR+Bma7CXgwBIL/W28LOC2DsBFbW7+YdCudosrugBg=; b=Jb2IZEIdWYahxm
	2eFSsS1OnOM05tw0e3XEvmeWNNelf10CVePUYUxv8v1VHDdwkpchVSS/iqRqhM1iHJHWlL+y4i+Mr
	qhLmfZ+P3DyEbgmfnthRGeJt3Z8EtdIxJHc/FLQBdsOw4lCTLsYa2BFPNWmnFQlUl9Hk5tEZFq71s
	v5wrKM0jvKZuN1x4RN+LjJxLbm7gvmU1XrF8cr8028HEY0HGZOfNEe3fZuq5Kt/KnWb3GCsvstfFZ
	HYrhCab00JshYOJGvZqvIAMMpPD5shs14Um1dGblc+kmPE+uRLpNzqYQruIlGbd+ix4aMW4/4M3nN
	2TSEfaEGGy0zRFsnGYgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1noRz3-002nAy-9s; Tue, 10 May 2022 15:41:09 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1noRz0-002nAS-LU
 for ath10k@lists.infradead.org; Tue, 10 May 2022 15:41:08 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5933B60B12;
 Tue, 10 May 2022 15:41:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 800CCC385C2;
 Tue, 10 May 2022 15:41:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652197264;
 bh=gqCPYvwaXq1HHzFT7PPYDVj1xG98Nrh9/uLDsEF5+9g=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=TavP+gWuT+m1YnIchkwlb/z8f4b8mu3qKiWZoFXmdov2wBXdnRFmk65ZhpnQLF4W5
 h5UoSNzV2ujZClf9tfemHkpVjs1gi+EKnqhUMZvHT9WupRkioXFsK7Nd58/Sgknel4
 zyagdyQ6jbWuCuckiGl78MS/snesuMQVz7s41Gv11q3XnX+g1ZMsBDmfvjrlH4gz99
 g+FiRNOS5Gr7RoAhJc9Ji5AgF3jbqGMwS2bvGAMmhcrGAvexaZWUlsSW7t122nLJzU
 TJv1e2YQZQUlZT+MM4ymA3lfmMJvjz6xRU9A4qFi9SOZT7lLloyyUSIuREQwCyIB+S
 RWeSTHySN1V+g==
From: Kalle Valo <kvalo@kernel.org>
To: Abhishek Kumar <kuabhs@chromium.org>
Cc: netdev@vger.kernel.org, dianders@chromium.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 ath10k@lists.infradead.org, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH v3] ath10k: improve BDF search fallback strategy
References: <20220509022618.v3.1.Ibfd52b9f0890fffe87f276fa84deaf6f1fb0055c@changeid>
Date: Tue, 10 May 2022 18:41:00 +0300
In-Reply-To: <20220509022618.v3.1.Ibfd52b9f0890fffe87f276fa84deaf6f1fb0055c@changeid>
 (Abhishek Kumar's message of "Mon, 9 May 2022 02:26:36 +0000")
Message-ID: <87a6bp8kfn.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220510_084106_778514_B6527B7C 
X-CRM114-Status: GOOD (  19.02  )
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

> Board data files wrapped inside board-2.bin files are
> identified based on a combination of bus architecture,
> chip-id, board-id or variants. Here is one such example
> of a BDF entry in board-2.bin file:
> bus=snoc,qmi-board-id=67,qmi-chip-id=320,variant=GO_XXXX
> It is possible for few platforms none of the combinations
> of bus,qmi-board,chip-id or variants match, e.g. if
> board-id is not programmed and thus reads board-id=0xff,
> there won't be any matching BDF to be found. In such
> situations, the wlan will fail to enumerate.
>
> Currently, to search for BDF, there are two fallback
> boardnames creates to search for BDFs in case the full BDF
> is not found. It is still possible that even the fallback
> boardnames do not match.
>
> As an improvement, search for BDF with full BDF combination
> and perform the fallback searches by stripping down the last
> elements until a BDF entry is found or none is found for all
> possible BDF combinations.e.g.
> Search for initial BDF first then followed by reduced BDF
> names as follows:
> bus=snoc,qmi-board-id=67,qmi-chip-id=320,variant=GO_XXXX
> bus=snoc,qmi-board-id=67,qmi-chip-id=320
> bus=snoc,qmi-board-id=67
> bus=snoc
> <No BDF found>
>
> Tested-on: WCN3990/hw1.0 WLAN.HL.3.2.2.c10-00754-QCAHLSWMTPL-1
> Signed-off-by: Abhishek Kumar <kuabhs@chromium.org>

[...]

>  static int ath10k_core_fetch_board_data_api_n(struct ath10k *ar,
>  					      const char *boardname,
> -					      const char *fallback_boardname1,
> -					      const char *fallback_boardname2,
>  					      const char *filename)
>  {
> -	size_t len, magic_len;
> +	size_t len, magic_len, board_len;
>  	const u8 *data;
>  	int ret;
> +	char temp_boardname[100];
> +
> +	board_len = 100 * sizeof(temp_boardname[0]);

Why not:

board_len = sizeof(temp_board-name);

That way number 100 is used only once.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
