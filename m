Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52921D3176B
	for <ath10k@archiver.kernel.org>; Tue,  5 Nov 2024 17:30:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:In-Reply-To:References:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wZax6wDVB33j78pkU185h9AtdhUKr+dMnlqwMKn3C8A=; b=a6ebSiwdkcrsh0oPyy1tnttM/G
	jORu8AxE43cHFu75hy7welgffjmhgDMJEQ0GJbMsohWYHbgx/0HA5ZPX5T9wM5iRrwJ90+Mtj0hCE
	zvxPeDrVBHEvF5jvny+gQ+hP39u4FqaQWRH4VKiO0MLLx+04jKuidV39qelPem9Djmsp7f/BbhPRM
	Fyjezihzrm2t1g783BjkQXk/DjOH2Za5wLxlJqXdVF2E8lsIQvIM+Fa1pLZ4Bjq384A8Ts7bNDDGR
	Q9QbOEkBZhzsXCvxdsEk6EdzSDvPFW5WKyfcvekDQ/CpmL9eVoXxmeW/HGOO5SeT3M0at4NB8eNgt
	BMtJlYVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8NNv-00000000D1Y-40F3;
	Tue, 05 Nov 2024 17:30:31 +0000
Received: from mxc-2-992.seznam.cz ([2a02:598:64:8a00::1000:992])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8Mr2-000000007qY-20SA
	for ath10k@lists.infradead.org;
	Tue, 05 Nov 2024 16:56:35 +0000
Received: from email.seznam.cz
	by smtpc-mxc-689449f9b4-g828d
	(smtpc-mxc-689449f9b4-g828d [2a02:598:64:8a00::1000:992])
	id 1968b187e79c032d19e63f9f;
	Tue, 05 Nov 2024 17:55:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cz;
	s=szn20221014; t=1730825756;
	bh=wZax6wDVB33j78pkU185h9AtdhUKr+dMnlqwMKn3C8A=;
	h=From:To:Cc:Subject:Date:Message-Id:Mime-Version:Content-Type:
	 Content-Transfer-Encoding;
	b=ChkLv6TQvYSObcoT5cNrLkh2ynXd5kgW9Unh7IaXZg8uMhhFmhSCczrBnXarzwHgA
	 oTtVQ3WrSPI7n1bMGSw4rmCWkA9jFKpRBIwGndbV+S3b7g2R5pPDVMvnTPzv0FyAiB
	 WxDgDHpU9N6rn/V2jpipyu+7KrEponaQZzjovcAYSKJhR9SbmvRIMtrAvp7HQGjp1h
	 ORCwN/hvPXH6cKrfuLolYwGrT8wt49lEfKOs1NRm19WPv9wlTsFJ37hvYSnvEsE+bd
	 Je4mITW4uUGfzr7lvbxinkESsiY3cafgIy51I0PXu5xA1BKjRSp+3lFL48V44A7Mlk
	 Xx958mJi4F+kQ==
Received: from 184-143.ktuo.cz (184-143.ktuo.cz [82.144.143.184])
	by email.seznam.cz (szn-ebox-5.0.191) with HTTP;
	Tue, 05 Nov 2024 17:55:53 +0100 (CET)
From: "Tomas Paukrt" <tomaspaukrt@email.cz>
To: "Felix Kaechele" <felix@kaechele.ca>
Cc: <linux-wireless@vger.kernel.org>,
	<ath10k@lists.infradead.org>,
	"Kalle Valo" <kvalo@kernel.org>,
	"Jeff Johnson" <quic_jjohnson@quicinc.com>
Subject: Re: [PATCH v2 2/2] wifi: ath10k: add support for QCA9379 hw1.0 SDIO
Date: Tue, 05 Nov 2024 17:55:53 +0100 (CET)
Message-Id: <7P.ZxiX.7YuMJP8eRMw.1dAauP@seznam.cz>
References: <20240908013244.496382-1-felix@kaechele.ca>
	<20240908013244.496382-3-felix@kaechele.ca>
	<c1385aa1-0d41-4ed7-a00c-e40c69bafeaa@kaechele.ca>
In-Reply-To: <c1385aa1-0d41-4ed7-a00c-e40c69bafeaa@kaechele.ca>
Mime-Version: 1.0 (szn-mime-2.1.61)
X-Mailer: szn-ebox-5.0.191
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_085633_306675_F1480A69 
X-CRM114-Status: UNSURE (   3.17  )
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

I would like to support the adoption of changes like this one, as they ess=
entially cannot break support for other devices.

I submitted simple and non-conflicting patches that added QCA9377-7 suppor=
t few months ago, but they were also deferred.

Best regards

Tomas

