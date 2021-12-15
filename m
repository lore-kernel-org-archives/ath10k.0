Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B182BC433F5
	for <ath10k@archiver.kernel.org>; Wed, 15 Dec 2021 02:29:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FSkWNeTX/NGNDrcH2qdBiTOIO4ezABNdvzQrMHFcO4M=; b=oVvKuwriN47u4k
	laD31/4XfTDYbOrj+/IiDCGlJB8g4NLGVHn9xhlcfcN/iDLqhp7El+ClAwIHycDUbJsRydfsA0wqC
	RTlYIxRFNC6AUsQ3h7o0HRIBVPoLNluz/sIE74J5IRdvIS8XU7Kv8juRsyIrNn0CvT25clPvS4/0A
	nyaRrGvjGrlNF7ftEaSAEGo6uJr06wjMq8tGQ3Tz/E4Mw5W01TyoSU50qMnA/4wkefBDzpO73zc3D
	z0L9c4TKDPbNZW6eGuyyauTcYBYNhNGk0Qg6/IKpZKnhCGmOuEyEzKoCaHxITRHyS+AEGHyUtqG/I
	QvzYfby+tuOHdcasJKrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mxK2O-00GQoL-3m; Wed, 15 Dec 2021 02:29:00 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxK2L-00GQn7-6z
 for ath10k@lists.infradead.org; Wed, 15 Dec 2021 02:28:58 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 6009AB81D2F;
 Wed, 15 Dec 2021 02:28:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C317CC34601;
 Wed, 15 Dec 2021 02:28:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639535334;
 bh=4xECLiwNF6RfSg/fD9+GkSYYgP5ENXEYZA4FCnBxU48=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=T0ie4K1o9H9176ExdBqc4TWMYWdcaL9/qKCaQEvhZ1tnWUMCv38QP5BR04su7Pje5
 zmpEcvxAbEOhAAlf+OruLtIArOHE4xTjNOkPCBrsUWQplaRWe2JY4q3ygyxcTwES7P
 mPHhXYo2J1IRPVZ7YcscFrrI8MtUh+8FLU6M93lO5hwzX5s++dS+vjJlRXJC8vhAg8
 lK7CS/f3Hqy+25BAaauKl209NM3rECefgUlE8Cp/4IJXET+pMvUT5hvJaLefqT6/Us
 lDfh3z+ZpOZdc0ikGxWY+WPoZzTyPrpYDwqawMQHYCo8/CxfbMcymiM5IoKyZYQXjG
 yJo2OSCE/MHSA==
Date: Tue, 14 Dec 2021 18:28:52 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Abhishek Kumar <kuabhs@chromium.org>
Cc: kvalo@codeaurora.org, briannorris@chromium.org,
 linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
 dianders@chromium.org, pillair@codeaurora.org, "David S. Miller"
 <davem@davemloft.net>, ath10k@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH] ath10k: enable threaded napi on ath10k driver
Message-ID: <20211214182852.6ebafb24@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <20211214223901.1.I777939e0ef1e89872d4ab65340f3fd756615a047@changeid>
References: <20211214223901.1.I777939e0ef1e89872d4ab65340f3fd756615a047@changeid>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211214_182857_446769_8881F7D4 
X-CRM114-Status: UNSURE (   9.10  )
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

On Tue, 14 Dec 2021 22:39:36 +0000 Abhishek Kumar wrote:
> NAPI poll can be done in threaded context along with soft irq
> context. Threaded context can be scheduled efficiently, thus
> creating less of bottleneck during Rx processing. This patch is
> to enable threaded NAPI on ath10k driver.

You need to explain in more detail what you mean by "can be scheduled
efficiently". mt76 had an issue where Rx and Tx would use the same IRQ 
and threaded NAPI allowed them to be run on separate cores. What's the
challenge for ath10k HW?

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
