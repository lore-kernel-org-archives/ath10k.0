Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB981EE4993
	for <ath10k@archiver.kernel.org>; Tue, 22 Aug 2023 19:16:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Date:From:To:Subject:
	Content-Description:MIME-Version:Message-ID:Cc:Content-ID:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=omZ9Ez3yh7i8iAiZBmWJeR9A83Ax/FoOmrYD+TBqJLo=; b=b/z
	MHUeHfsGXF1gJUT+1Lk92/Y8WDQLgkDUdCpUwef94AAR/xLAHB3nMkqA2W508Z1IIwMuyHPONh9pe
	5bQp9bRiFuxjB8P51p8MAe7HwFd4/LpQtwi3+NdzpGIv1fIbUa5CvxGuSKWo3jDzVj1j9VO12ehvx
	tLNXbxsqKMy3rxj/j9kj++j+zwL+DeKnidF/cAU/NWAFezLuS0HXTmT5wpHxEfS0V6E2Pc0G4GS+V
	b6lvyhVmbClLF/tMTLOJhlT4ojlmJSiix8YugLl4J8eRrgoCHbpI0Qo4ZiUtLdZxJ2HBfKB5Xd+iK
	e51Ue1FY7YIq0eSPetdvR25oajUf19w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYWrz-00GhKj-1w;
	Tue, 22 Aug 2023 19:16:51 +0000
Received: from symantec4.comsats.net.pk ([203.124.41.30])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYWrw-00GhKQ-20
	for ath10k@lists.infradead.org;
	Tue, 22 Aug 2023 19:16:50 +0000
X-AuditID: cb7c291e-06dff70000002aeb-a7-64e4f4b8f373
Received: from iesco.comsatshosting.com (iesco.comsatshosting.com [210.56.28.11])
	(using TLS with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(Client did not present a certificate)
	by symantec4.comsats.net.pk (Symantec Messaging Gateway) with SMTP id 2A.05.10987.8B4F4E46; Tue, 22 Aug 2023 22:47:37 +0500 (PKT)
DomainKey-Signature: a=rsa-sha1; c=nofws; q=dns;
        d=iesco.com.pk; s=default;
        h=received:content-type:mime-version:content-transfer-encoding
          :content-description:subject:to:from:date:reply-to;
        b=jVyfaYgh67DO2liDmeOWVEM21cEgMbu48/tYjGBiHHPo/czJ5GqccHtSyR+ZJazJt
          OgE2QlEqNT1ETAgEJjT02s4/yzK0K8Dgp8dXWXwr0CTVExO2qWhuBcTKNIL7RRrcv
          ZiB0+DWM73UzpzH8MbPI6+iSKrLCy230Cg8FNMbgg=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=iesco.com.pk; s=default;
        h=reply-to:date:from:to:subject:content-description
          :content-transfer-encoding:mime-version:content-type;
        bh=GMzYzcyTxDsE6wX/XHG6MHqAdAiHrhqbmmLQ/TZ1QnQ=;
        b=JBrvkKIXiZuwPeD/JdghrEy5DegXm96iy+gqco2+jRekkc/SgIKSBou+pWs1YIpEk
          fiaH/Dz4Nm1vF+3XD5k2xoXht4kC+VtfcM/mkIrbWxX4Axlf9E0t+3dJehI7Em8zW
          YzIrXg/RhZvNFjopfBJqL5ZHQMkNhdNGMnPvVvswo=
Received: from [94.156.6.90] (UnknownHost [94.156.6.90]) by iesco.comsatshosting.com with SMTP;
   Tue, 22 Aug 2023 23:51:11 +0500
Message-ID: <2A.05.10987.8B4F4E46@symantec4.comsats.net.pk>
MIME-Version: 1.0
Content-Description: Mail message body
Subject: Re; Interest,
To: ath10k@lists.infradead.org
From: "Chen Yun" <pso.chairmanbod@iesco.com.pk>
Date: Tue, 22 Aug 2023 11:51:25 -0700
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrDLMWRmVeSWpSXmKPExsVyyUKGW3fnlycpBt1/WSweXTrG7MDosXlJ
	fQBjFJdNSmpOZllqkb5dAlfGknUXWAp2M1e09S9iaWB8zNTFyMkhIWAicaNjHpDNxSEksIdJ
	4uCXmawgDovAamaJ551PGSGch8wS//9fAmsREmhmlDi+TADE5hWwlrh08CQjiM0soCdxY+oU
	Noi4oMTJmU9YIOLaEssWvmbuYuQAstUkvnaVgISFBcQkPk1bxg5iiwjIScx4eosZxGYT0JdY
	8bUZbCSLgKrE6ut/oNZKSWy8sp5tAiP/LCTbZiHZNgvJtlkI2xYwsqxilCiuzE0EhlqyiV5y
	fm5xYkmxXl5qiV5B9iZGYBiertGU28G49FLiIUYBDkYlHt6f656kCLEmlgF1HWKU4GBWEuGV
	/v4wRYg3JbGyKrUoP76oNCe1+BCjNAeLkjivrdCzZCGB9MSS1OzU1ILUIpgsEwenVAPjfLFH
	qotO7rC3zmmKNlpirHph6xGRq++LissXbOApTom6kJq4jznz1vO8C7c1H31M/CE/rfnB7m7p
	Tr+W1G9RinddWIuZtnst79q3f1qK/pwf3/NWT6v4H1hTf/q6YOaRyxM4ctp+lx2xYrFkiON5
	YNK7JfT2pz6mTQyn2P2LKv7L7Q+KeTRbiaU4I9FQi7moOBEAaHg3pz8CAAA=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230822_121648_951881_3701CEA7 
X-CRM114-Status: UNSURE (  -0.15  )
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
Reply-To: chnyne@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

Re; Interest,

I am interested in discussing the Investment proposal as I explained
in my previous mail. May you let me know your interest and the
possibility of a cooperation aimed for mutual interest.

Looking forward to your mail for further discussion.

Regards

------
Chen Yun - Chairman of CREC
China Railway Engineering Corporation - CRECG
China Railway Plaza, No.69 Fuxing Road, Haidian District, Beijing, P.R.
China


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
