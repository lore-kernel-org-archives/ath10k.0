Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70DB1CFD376
	for <ath10k@archiver.kernel.org>; Tue,  2 Dec 2025 04:59:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:Subject:To:From:Date:MIME-Version:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Z1iAOB/c/xsU+Qz+0O2Cf+5+H431ajiOVJgeWqsHoz8=; b=h0BqEQWkrvVb/7Ag9HBgn6u+46
	9tgGAn61Q/FKQB2bop2p3fioOknCbFd6BHmFiUP909RoTTOHWtlayf9WmVeYmHJpgjPeBTzUlSsqt
	O5BWhvlhrenjQ9tTkAgHIN4Ne2MGnSPDwbqTwEabJLQ3+lIjsKv0sQRI0YrhwNyNL2/wKT8rWcY49
	6sAzvQy1WIp+YyWLdlQ9/kEfzn+hrk39d1KnAcrvM0uGc+sEeTWAMXhMC+HbI3t2seYqWnGxgddtY
	10AC7p4PwFF3Xa29MrWhIeVI42l7p72MklnUy8OdLspDaTptRYCUqkvhllbLFZYf0o9yvqVeDQ9oO
	Z6dOLKdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQITy-00000004oCg-0EB6;
	Tue, 02 Dec 2025 04:59:22 +0000
Received: from mail.mainlining.org ([5.75.144.95])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQITv-00000004oCE-3uZC
	for ath10k@lists.infradead.org;
	Tue, 02 Dec 2025 04:59:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1764651554; bh=Z1iAOB/c/xsU+Qz+0O2Cf+5
	+H431ajiOVJgeWqsHoz8=; b=Qv3jU2yfuWO7tqTD2G26dUuPiKr5yUuXIK/kla3Lyno0bUDXk1
	Lbb5MpHQiHP8co54cBNZuPDsQGRloOqQ0lwjK6G6WeV7ByThguBXXx2PAA0APHeefYeUWMC+ssH
	GLBMiAxJ8tcsfdVEIz7y/7VwlIn9DFnLDnY9RwYR3BNh/zKBcqSdK2KghBB8hWy2ZuiJEXSP3Zf
	QtCo52buFrJv7ddJ6j3rJvgYmpJHktvkUdutvO2u0JNtuE0VUDGjs9Zh/MF8HY1twKsAXsDzLvB
	A/GvauHv9i0xQCkI+pag6hFVoX8fWqrBBkjXWBwBNNWy/7ZLGeJSx/8y9QFMoK8XtiQ==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1764651554; bh=Z1iAOB/c/xsU+Qz+0O2Cf+5
	+H431ajiOVJgeWqsHoz8=; b=/VJCS08EVeaEuRme0FkX1rovOgF+g/yZ8PFIhg0Z7AKl8HNeOQ
	PzZgzKF2N8GSEiP6nGZMMvAD20IWlxHNEQAw==;
MIME-Version: 1.0
Date: Tue, 02 Dec 2025 05:59:14 +0100
From: David Wronek <david.wronek@mainlining.org>
To: ath10k@lists.infradead.org
Subject: SPF Test (ignore me)
Message-ID: <b0b82c603d1af0ef9f0d5a7ff9d4c57a@mainlining.org>
X-Sender: david.wronek@mainlining.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251201_205920_138374_A8E09B6A 
X-CRM114-Status: UNSURE (   1.19  )
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

Hello,

just testing if mainlining.org can reach this mailing list.

-- 
Best regards,
David Wronek <david.wronek@mainlining.org>

