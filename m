Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB78DC0015E
	for <ath10k@archiver.kernel.org>; Fri, 11 Aug 2023 13:21:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:To:Subject:From:Message-ID:
	MIME-Version:Date:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1TZWMnVUa4BvEqlkWblm5igQZPplNdY+BvIQ8N6+Peg=; b=OjNVPrujQUpQQX
	GRdOm8iGj9fIeeW4NuucLtth5G7fTIwmq02gHwTOr8goZMdzfZXesoxki8x99M14kVNP6YrBOMoXN
	HUj+0cY66cpN6eRX93YoG2xsr8N11XwuWK2oPM8Hwhu3YPYKXRa2f529gEQ1xOrd/z+7pSD/rbQFa
	nn5pVCxqXxbr7iVKyAjSGVDJiJ5NAxrVyx/5ID0G0lmq/+bWXOjQM15k+E2oP8WVgI9YYYfc48MlY
	yY6Oghh7x3L22SHfDI+GmoV41PzErF8EUFGrFql4VduiMJfa6Mi/h+6CwSwhOsM7eJVgdXFIlvPlO
	v2WsKXq6jLTjLmaMqo9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qUS4b-00AiHI-0Q;
	Fri, 11 Aug 2023 13:21:01 +0000
Received: from easy.uni.de ([217.69.254.149])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qUS4X-00AiGS-2S
	for ath10k@lists.infradead.org;
	Fri, 11 Aug 2023 13:20:59 +0000
Received: from easy.uni.de (easy.uni.de [217.69.254.149])
	by easy.uni.de with ESMTP id 56B1639C
	for <ath10k@lists.infradead.org>; Fri, 11 Aug 2023 15:20:47 +0200 (CEST)
Date: Fri, 11 Aug 2023 15:20:47 +0200
MIME-Version: 1.0
Message-ID: <aae8de9e0ed964e202da1a917423834e@easy.uni.de>
X-Mailer: b1gMail/7.4.0
X-Sender-IP: 139.18.241.180
From: <tp2009@uni.de>
Subject: QCA6174 chrashes with eduroam
To: <ath10k@lists.infradead.org>
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230811_062057_972061_B4490355 
X-CRM114-Status: UNSURE (   1.42  )
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
Reply-To: tp2009@uni.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

Hello,

I am experiencing chip crashes (QCA6174 hw2.1, Kernel 5.10.10) when trying to connect to an eduroam cell.

Other (also encrypted) connections work well.

Is there a recommended procedure, given the fact that hw2.x firmware is not updated anymore?

Thomas



_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
