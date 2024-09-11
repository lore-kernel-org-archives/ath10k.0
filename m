Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D48CEE0215
	for <ath10k@archiver.kernel.org>; Wed, 11 Sep 2024 07:54:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:To:From:Date:Message-ID:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uGTmdNfeKWYppKfROrYtp0X+RK7/pRJQsBUrarqToyk=; b=uU1UNhsKV4tqNeUnOgZ99DBBQr
	uvf8SPonlL3VC8grEtb0LLIegm9XGcsKH5T8+ZgCUQrO5xO9eudwxLMhx4brNl+pH109+MY+7widK
	GbA39/jLSC6MwF2htXOHByZH41hII2L7ndcFH3H1Yu4zWS7ym8RnivRTFM4bufzJ/vWEJseX8v41C
	jcrcKr2wDdECrmqybC2Cn/r73wC1hd8MicElI74tlFES30S6bgFTz4CALWJzat+wyS2w8s4ki2/Jy
	cffGSAl3576zB7zE7nnkSGwgJU1ZObykUOjUBU7/AF2iyy7S9BpsZgySPyFdfeVTge3yV/ytKUQT5
	dMCXbm2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soIB1-00000008X9r-1Z3p;
	Wed, 11 Sep 2024 07:54:11 +0000
Received: from mail.envisioncraftsman.com ([162.19.67.48])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soIAh-00000008X1I-0w48
	for ath10k@lists.infradead.org;
	Wed, 11 Sep 2024 07:53:53 +0000
Received: by mail.envisioncraftsman.com (Postfix, from userid 1002)
	id 02B3524A19; Wed, 11 Sep 2024 09:51:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=envisioncraftsman.com; s=mail; t=1726041096;
	bh=uGTmdNfeKWYppKfROrYtp0X+RK7/pRJQsBUrarqToyk=;
	h=Date:From:To:Subject:From;
	b=C5NP5kNV/Xu8xgsPQjG4L/Sh+VFMeSSC9AlgnXOj5TuuZzEIWrAReKQgyyLvQE29t
	 t6mQGWnSOrNfyBHWGdaP0p87E8PvZjLwT3jjSx1fvUW/QalEzMgUqN+kdCHdyjQbeo
	 O8dmOmDuxQghRsOQpwn9+fQYNHcerOAOzayaV8KDoYNrbwGp8mQ4k8PBmbF5fd6J5x
	 oa7KoV6/L/Sitih4dY0TqRSYTpVrdr8f0N2dZfeLasP3M8OO30Ri+6RxFCcyK/5kzO
	 pcv9PyM4Qy2+oeRk0SxpsUDQuT0SBv2DSh8hBe3rEb0WzJ1tlNxON9+x/ost/xaIxF
	 OcQT27oTZOytA==
Received: by mail.envisioncraftsman.com for <ath10k@lists.infradead.org>; Wed, 11 Sep 2024 07:51:16 GMT
Message-ID: <20240911084500-0.1.4y.107z0.0.ohef2f3p6b@envisioncraftsman.com>
Date: Wed, 11 Sep 2024 07:51:16 GMT
From: =?UTF-8?Q?"Jan_Pol=C3=A1=C5=A1ek"?= <jan.polasek@envisioncraftsman.com>
To: <ath10k@lists.infradead.org>
Subject: Quick Question About Collaboration
X-Mailer: mail.envisioncraftsman.com
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240911_005351_966828_651FC6F0 
X-CRM114-Status: UNSURE (   2.11  )
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

Hello!

I am very impressed with the products and services you offer.

I thought we could help you reach a larger audience with your offerings. =
Would you be interested in collaborating with us in an affiliate marketin=
g campaign?

For example, our program for a company in the e-commerce sector resulted =
in an increase in revenue from 8% to an impressive 19% (on average per qu=
arter).

We achieve up to 13% turnover in GA4, while standard affiliate networks g=
enerate only 3-6%.

Would you have time for a short conversation in the next few days?


Best regards
Jan Pol=C3=A1=C5=A1ek

