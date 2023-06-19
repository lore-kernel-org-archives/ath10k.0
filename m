Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAEA9EB64DA
	for <ath10k@archiver.kernel.org>; Mon, 19 Jun 2023 12:37:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:Mime-Version:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=UD7Wf2X87Le+MAzkqHvt+qDe6KGT8sZhC6veJY/VHIc=; b=S7c88RNrt1Mxnu
	Mwt/uxpRIa0oFeAl3r5dpH2WRnTdiYeGmqEKGGRIU8o2jUECTxx/m2ZptO6Ep95bVW6tsVtsAp8db
	oLKxqwHEMEEfVGGjXNKd9/p/H6kEtR+GmYFoEHK7vWXOZd0x2331nLKhOfiOOY2C1w68eHfD+Z0/U
	ctmMtqR+DvdM0wlmGowKy57z+VD2NO0RBVsyMnMkaWy5Vjig2TQF0ANkJKI1gccOLzOMHxhU5tZeO
	5kgFL/LurATPKle3LdyWZU+rRyRxIOqfqDB6xxXFJ/s9c/3/Natol1821rI0ZQ4gyJexo7SjknhGj
	CpyuFigTMnFBHx+Zz2vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBE8m-008Ugy-12;
	Mon, 19 Jun 2023 12:37:52 +0000
Received: from out203-205-221-235.mail.qq.com ([203.205.221.235])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBE8i-008UgF-1t
	for ath10k@lists.infradead.org;
	Mon, 19 Jun 2023 12:37:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1687178265; bh=KAKJZBwj3dBAoZ56iUiJ+6ZCQdC+31COqKODxd1R00c=;
	h=From:To:Subject:Date;
	b=zbt8/r69u9bde1or6ykuOqR9suRW4B6KKQmoajLHX7r/V7kEHcGkwtX4k36pRl+NU
	 WVacilyQvs7/w1KDoPsrrpEoT9gHYs8nD3tiInwI3M5SHhXN6kKDuhyCHB4WugGS55
	 orYesOkdbIyydlUsoFZLvHkqeJirOy+V3N83nSyE=
X-QQ-FEAT: c2tmyB/8aFEHOAX5rvVpBoMhOJcTGul0
X-QQ-SSF: 0000000000000060000000000000
X-QQ-XMRINFO: Mu10XATLq/IERfXGovp1cJndKWH8Kl+aSQ==
X-QQ-XMAILINFO: MIXgiQbWEMeEDveciq72D7q6yxA1BwgEUDk6T0u9kBlEscORpzqkCP6gKIA8sP
	 4++TSUoRQzlgn4aShNKL2Qnh+dAddtF28shPJId3KJ/aWsokf5CFv5iVoOjk+aewL0qHxsFE5wuLW
	 cNNcIKIh4fLjLKX6Fr5/q6N8A+9tOmmFNehXQkK1A5j6sNpRdpcvBvt5dv2OgDI119zLM36TiKJ10
	 wsnJ2zvzQtBNbP1et2T64h6rwI9k+xXpBejb3i1mSLwwIbOA3pDgm+VBeYAy24C0nT9eB2tRBD7RW
	 zX5T7HJbqK9HgZBckNRVuVkgVjwf9dlY+kfOq3o+0xr1W5wfwP/bJQm0CccNAKyH6V9zT/cGBnTIW
	 D99tBAaQahsh4QZrOOwDDis13UOB+mxcFRf5BzWZC4psaTHPjg0CIJKujSApSpecXWDCPECQWJRPe
	 ST/xFtpdQr17kMF/PQZyHdjXHpKlN9RhE4JyxPBF8PnB7+0wjaAF43uO13sxx8PEdOyrrs9g+5/I0
	 LTXibUg0fCNGUqV3J8MtCV9CaSFdO5Qv5g7fQMEz/4bdwRBENCD6uMfkO5Uync4+9rqDx/454QUjt
	 a9jGram8LLibHixGYgPODm7x8tS1KZf54RxPafVB/zAi64W/cIZ114LKlAM9uD5EKSfbFgPnNxv4/
	 vgodDHH4A88kK/hwQGh8rBRY4MlyuPMEZdvTdU8oXqBLjkc2EfI12nC3LqEzJrpbxs5WDPW33sR5e
	 HDmANDabTEEBj6G9iYxFW8DhYmBUYd19VY94CqnULox59ZD7BGez8Z+jKNKTOAiw+4AV/+PmIirkl
	 vsB73X9NYJ1iUmJsNimFT568Wus5WPRfXxQdK7EHT0Jgre8VMItQ4i22KO+iPKTR1s20JiEJRw3Ia
	 QDTst8O45ynt0p4P/0FxmTU4nBwDsryZjEc3N2cNrdsAyYQ+OxpeActNqBrK3wEBr7jDsQ/XlU=
X-HAS-ATTACH: no
X-QQ-BUSINESS-ORIGIN: 2
X-Originating-IP: 111.175.44.191
X-QQ-STYLE: 
X-QQ-mid: webmail365t1687178264t2389381
From: "=?gb18030?B?1cXF9A==?=" <1805692831@qq.com>
To: "=?gb18030?B?YXRoMTBr?=" <ath10k@lists.infradead.org>
Subject: ath10k ipq40xx distance
Mime-Version: 1.0
Date: Mon, 19 Jun 2023 20:37:44 +0800
X-Priority: 3
Message-ID: <tencent_11475AF1C24C1B647F0888C1CFEBE516E508@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230619_053748_934900_5CFAAB22 
X-CRM114-Status: UNSURE (   8.43  )
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

Hi,

When I tested IPQ4019, I found that the maximum distance can only reach 5km, no matter how large the distance configuration is, 

it is more than 5km old can not communicate. 

Please ask if the AT10K IPQ4019 supports the distance setting or can configure ack_timeout/cts_timeout/slot_time ?
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
