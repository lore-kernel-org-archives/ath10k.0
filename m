Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E418C3DA79
	for <ath10k@archiver.kernel.org>; Mon, 15 Jan 2024 08:49:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:To:From:Date:Message-ID:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vDlezXcLpYFrR5uCXE65tBnPyAaMWemlLOaCVHLLXHk=; b=seBwBToCAuoyKgS3AeRS0OSG/1
	fQ1mHs36AjUE+D3M/Y0O8AWI5JW5IH5CTswccsIiwLqgY9dDE9lziSHx0CWilXJZqHFSYa6owrihL
	01fH8DFM8cVwNiSnYb5t28OVfqVDNWafbOuRpj9oFuc+8SN88Q8BEuF5uilLKdMbbb+ykasZqIBJE
	5GQLzjQQwkraOyi4EdnKoIpayDsB23JgDhuVUygz85jeZyevm0xU5SO7VtwNZLZe138ZF/S6zQlfA
	YWfDceYIA4BFb8e3g88ZdySer9l4I/7LIbban0f4ICCXwMgjf9gnjqTaRyKPybCbJ8sfABN8sKHVg
	dqTFeIkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rPIfL-008JJc-0T;
	Mon, 15 Jan 2024 08:49:55 +0000
Received: from mail.nexusstride.com ([54.38.156.137])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rPIfI-008JIf-0M
	for ath10k@lists.infradead.org;
	Mon, 15 Jan 2024 08:49:53 +0000
Received: by mail.nexusstride.com (Postfix, from userid 1002)
	id 62B832149F; Mon, 15 Jan 2024 08:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nexusstride.com;
	s=mail; t=1705308059;
	bh=vDlezXcLpYFrR5uCXE65tBnPyAaMWemlLOaCVHLLXHk=;
	h=Date:From:To:Subject:From;
	b=Y3aN8mUJBvClNTONY9hPvRVhfAQF97s3t4XGWSgnhOCYkk0gZmEQTTLR8k5qn53EI
	 QXd86si25q+SpM+uCbU006NrtOUJgPsZFdEYOd1SsCuqCu9BKpTk9/is2DmRPm1HmP
	 aVWW2g59lksDJCPPqP2EekXw2P/IB7I1Lhj22hiw2nKv3cUgz8PtqbNMWCRFhHUzOj
	 Ygu6q6DLxlSKKRRp/vy6G8aeqStyiKK+9AKyAstvSBcwzIQ0jxygBMYdCt6u93Lyqh
	 i/ul4hYfL8E6Yb+RrhGrFwQmc+VedybMy4RYfa1oZlAk4j+ynqhwvNG5tkUAHrtfxn
	 /+lVfar10qNuQ==
Received: by mail.nexusstride.com for <ath10k@lists.infradead.org>; Mon, 15 Jan 2024 08:40:57 GMT
Message-ID: <20240115074500-0.1.a.ax0.0.kmbbxmhtmn@nexusstride.com>
Date: Mon, 15 Jan 2024 08:40:57 GMT
From: "Harry Russell" <harry.russell@nexusstride.com>
To: <ath10k@lists.infradead.org>
Subject: Order for springs
X-Mailer: mail.nexusstride.com
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240115_004952_300940_C822367E 
X-CRM114-Status: UNSURE (   1.03  )
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

Good morning,

Do you currently have a need for springs?

We make all types of springs from patented wire in the wire diameter rang=
e of 0.2=C3=B7 16.0 mm, from stainless spring wires, from elastic bands a=
nd other materials - depending on your needs.

We offer a wide range of products, competitive terms of cooperation leadi=
ng to cost optimization and quick execution of production orders.

Would you like to know our offer?


Best regards
Harry Russell

