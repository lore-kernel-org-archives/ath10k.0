Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4D20C433FE
	for <ath10k@archiver.kernel.org>; Tue, 30 Nov 2021 06:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=trkHaa1TAZbT0jhzkXBMSMMpVcmApUj3AnpE8BQtD/s=; b=Uh3df4v9A2EPM6
	wX3rdbRCEP0Xihvnv+6gFVkQIdsrsZ+Nj9mr/c5VShanm2vom+WNHISxVlON0OBPQZNGlhsr/sFId
	bFv8qNiakncQ+vSRfgopk7cqpr14v/xWSjZHCWw71bI9dLzfv2DLtrL8sT+aJlO4q65r6dZYtXjrD
	XV1JiEfGqU6I+z4gHpb1Bb1tQtBHt8oOaoCi7NFxa6xOj1CXTSlVY48je5QQbVwi6yvnOXo6A0Qli
	+rQzTyViFpBabIRt4w2G8b3uASX3xJ7i25P/AVNedJgj9WTcGRr+H9OJNFXrs+W5zfQvyr7haethn
	yxVpEG3arxTroXYomNRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mrwkO-003oca-4e; Tue, 30 Nov 2021 06:36:12 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mrwkK-003obp-Vn
 for ath10k@lists.infradead.org; Tue, 30 Nov 2021 06:36:10 +0000
Received: (Authenticated sender: tbm@cyrius.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 15AA6FF80A;
 Tue, 30 Nov 2021 06:36:03 +0000 (UTC)
Received: by jirafa.cyrius.com (Postfix, from userid 1000)
 id 98C0D1A6E00; Tue, 30 Nov 2021 14:35:59 +0800 (PST)
Date: Tue, 30 Nov 2021 14:35:59 +0800
From: Martin Michlmayr <tbm@cyrius.com>
To: Kalle Valo <kvalo@codeaurora.org>, ath10k@lists.infradead.org
Subject: Re: Intermittent issues with Atheros QCA6174 on XPS 13 9380
Message-ID: <YaXGT0TkKiR6J796@jirafa.cyrius.com>
References: <YZzZ9jxaNd5DP9Rg@jirafa.cyrius.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YZzZ9jxaNd5DP9Rg@jirafa.cyrius.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211129_223609_204772_5D086B9B 
X-CRM114-Status: UNSURE (   8.81  )
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
