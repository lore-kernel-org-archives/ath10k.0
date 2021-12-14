Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80650C433F5
	for <ath10k@archiver.kernel.org>; Tue, 14 Dec 2021 10:50:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=trkHaa1TAZbT0jhzkXBMSMMpVcmApUj3AnpE8BQtD/s=; b=dtqCgxMAIauuln
	7drDcQQONneXJlmU9bsdZiYJ3C9H9sU/kJhyV79yS/IMJmJurYBXDzN+i9L8Ya7lRgJAKXBMQd5ap
	m5YnZ7fFAl4c85WMntcZIbi8QJPsMGPdHU3CnwW3iyVs5qElYcQvkro0Ew/FXwB+vq4ZdR3Vg7eVZ
	/Q26o8YRAj31Zc05vJEk/J00a0X85UhiKfILUNlowv3/mjaY/7k1O7EAzKjeBey3aafhvd/L5maBa
	KWJphbLInVLJt8Xz6u2gUWJ1oJN2Sdwd+k4BlitZ8jfCpHp1hYCg+6HeKlSp0PBR2jP6iTwLSj923
	x7e4P+euE0SOxgZLlyNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mx5O3-00DXw2-JG; Tue, 14 Dec 2021 10:50:23 +0000
Received: from relay10.mail.gandi.net ([217.70.178.230])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mx5O1-00DXuh-8z
 for ath10k@lists.infradead.org; Tue, 14 Dec 2021 10:50:22 +0000
Received: (Authenticated sender: tbm@cyrius.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id 2626E24000C;
 Tue, 14 Dec 2021 10:50:15 +0000 (UTC)
Received: by jirafa.cyrius.com (Postfix, from userid 1000)
 id 458921A26A5; Tue, 14 Dec 2021 18:50:12 +0800 (PST)
Date: Tue, 14 Dec 2021 18:50:12 +0800
From: Martin Michlmayr <tbm@cyrius.com>
To: Kalle Valo <kvalo@codeaurora.org>, ath10k@lists.infradead.org
Subject: Re: Intermittent issues with Atheros QCA6174 on XPS 13 9380
Message-ID: <Ybh25IVdZlRlSVtF@jirafa.cyrius.com>
References: <YZzZ9jxaNd5DP9Rg@jirafa.cyrius.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YZzZ9jxaNd5DP9Rg@jirafa.cyrius.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211214_025021_499287_ACA1A07A 
X-CRM114-Status: UNSURE (   8.27  )
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

* Martin Michlmayr <tbm@cyrius.com> [2021-11-23 20:09]:
> I'm experiencing intermittent wifi issues with an Atheros QCA6174 on
> an XPS 13 9380 notebook.  I started pinging my AP and noticed that
> ping times go from <10ms to >10,000ms when this happens.
> 
> 64 bytes from 192.168.0.1: icmp_seq=1154 ttl=64 time=3.18 ms
> 64 bytes from 192.168.0.1: icmp_seq=1160 ttl=64 time=8572 ms

Does anyone have any idea about this issue or what further information to
provide so you can look into it?

(I've used a USB wifi dongle the last few days and haven't experienced
this issue, so it's definitely a problem with my Atheros chip and not
with my AP.)

-- 
Martin Michlmayr
https://www.cyrius.com/

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
