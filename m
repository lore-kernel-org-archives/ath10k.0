Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E6BEC4332F
	for <ath10k@archiver.kernel.org>; Sat, 31 Dec 2022 06:51:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/jD+2HPxiJodmWON5sAc8lmXDW0YRaLtwR7iWYWVOSc=; b=LBnkWkbdTalv4QgJhRBrxlt/U1
	oq6Pfat1BJIwNf/WTxwGSTQe4Sc0I4ZTGgziMgrirhr9NvD3jfx9zrOrqMhO0V/PiSEChxPeNBszY
	IhBFTf1w+CPAd9NW1CG0+RR8Av4dC1g2Hrylkfoc1O7KyKUN8fLGKtjH+hxlUSfZiOuPPb27YhADZ
	Gp9ZbxDhEti89Zg/xMTO/HxffIhGBiq8P1xReZ1uldKGrw9gENvIdyrq/5KSUA2Xu1jb+/1hkFY4l
	ZPeFGVjU0r/tQggjwsBHQ8U292FwwPcWuKJjGN6zDZYjdWJcx1FwVbWMVyPtMNsuLeOhGPEZhwykG
	L9cknoTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pBViR-001Yum-GA; Sat, 31 Dec 2022 06:51:35 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pBViO-001Yst-JS
	for ath10k@lists.infradead.org; Sat, 31 Dec 2022 06:51:34 +0000
Received: by mail-pf1-x42d.google.com with SMTP id a184so4852195pfa.9
        for <ath10k@lists.infradead.org>; Fri, 30 Dec 2022 22:51:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5fqg8jdcdK2VEkyzegQq5I158JKQiyR98GfroQU/0WA=;
        b=AGthoRXxMkPJoLoeGe01j3CPyX/QyIzejY7Bq+wtV4uUQi/LkpIO8mp4nRGjdR7CE2
         dKrHwi3aJ+d8m+TfNLQgW2iGb3uSrvUei4nhGCJe53Qb22s8Q7Wf/h/ziqO2Chx4qDE6
         +BLOPC1Tn8vtBfLX2Y0aaeOAA4HnQp5rO0e5yzoZi2JYhQ2LfAeHmOdKNSW3eRR908Rk
         NGrX3urmjokPi9onmmbbicxhbbBr38rVl+dsu3gyh0T0Rg899I3wyaXQPv95L8r8Z32J
         u3a/iBFjzz71U4ShG57wHx9J2vkU9SugN+HSd98599+8Q1zxB2usN2CAmP4/nFUGov+v
         BE+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5fqg8jdcdK2VEkyzegQq5I158JKQiyR98GfroQU/0WA=;
        b=JqpdEHloteQ4FTqSkx+HfNh5cY7R6y0aJfVYlivm0z8L2I5XkPXB4pO3Tbx09vsnph
         DbAbpzdJdGQqAiwop9amVGxQNWB5Q8V8MkV5ph2obghccEsYykaoc5PfsONDf2x6C9l6
         9J99j7J1/mQI+tKZRKwnjvZDjPr4LWuQCQ1TTGVrwM8enDUIrdKcOaEn5EyBaD/CzxbT
         sXtQY4r2bO7wDYd5wLILOfRvSECLIjEKJ8I0zk+17dWEZp86xqYlOdEjLjtlpsD5er5c
         f6hlS7a9KPon5jwvatrWbG3O1RayFu5GY5JRPJulbL27OS7GukbEyUbOVT96DbjVJUWQ
         979Q==
X-Gm-Message-State: AFqh2kqBmnnHd1EEHLwgBZU4bUK23O7r1GMr1FwmXsNvDjdLfxG417pc
	/Y5jtMLJxHimbkQ/QRDozaGRbEJTOyI=
X-Google-Smtp-Source: AMrXdXsovpXM2ZdC8Q1TaAHn+nGc8hqzX7JpSl30xhonCeQ13lSpz7/F+PiEHekbG/bOmmibSK5Wrw==
X-Received: by 2002:aa7:99cf:0:b0:581:c741:f908 with SMTP id v15-20020aa799cf000000b00581c741f908mr9008102pfi.33.1672469490710;
        Fri, 30 Dec 2022 22:51:30 -0800 (PST)
Received: from localhost ([2600:1700:38c1:1d7f:f66d:4ff:fe3c:3ceb])
        by smtp.gmail.com with ESMTPSA id a70-20020a621a49000000b00576c4540b63sm5865821pfa.12.2022.12.30.22.51.29
        for <ath10k@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Dec 2022 22:51:30 -0800 (PST)
Date: Fri, 30 Dec 2022 22:51:28 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: ath10k@lists.infradead.org
Subject: ath10k-firmware: QCA988X hw2.0: Add TP-Link OnHub BDF
Message-ID: <Y6/b8G9CBSgRcyZR@localhost>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="A8bWH4ukQQTm435c"
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221230_225132_697389_93CADBE8 
X-CRM114-Status: GOOD (  10.03  )
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


--A8bWH4ukQQTm435c
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

In preparing OpenWrt support for the TP-Link OnHub, I've extracted its
BDF for inclusion in the mainline board-2.bin.

Per the wiki [1]:

 * description for what hardware this is

   - IPQ8064-based router, with three radios -- a 2.4 GHz, a 5 GHz, and
     an auxiliary (monitoring?) radio
   - There are two variants of the OnHub: one by TP-Link, and one by
     ASUS. The TP-Link version of the OnHub [2] was released first, and
     the ASUS variant (ASUS OnHub SRT-AC1900) seems to use the same BDF.
     I use the first product when choosing the variant name.

 * origin of the board file (did you create it yourself or where you
   downloaded)

   - Pulled from the factory device filesystem for TP-Link OnHub, and
     compared with the ASUS filesystem.

 * ids to be used with the board file (ATH10K_BD_IE_BOARD_NAME in ath10k) +
   md5sum of each new board file to add

   - QCA988X hw2.0

     BoardNames[0]: 'bus=pci,vendor=168c,device=003c,subsystem-vendor=0000,subsystem-device=0000,variant=tplink,onhub'
     BoardMD5[0]: ab36ef267d15cfc02317ceeb38e8f548

Attached filename matches the ID above, with a '.bin' suffix appended.

Regards,
Brian

[1] https://wireless.wiki.kernel.org/en/users/drivers/ath10k/boardfiles
[2] https://www.tp-link.com/us/home-networking/wifi-router/tgr1900/

--A8bWH4ukQQTm435c
Content-Type: application/octet-stream
Content-Disposition: attachment;
	filename*0="bus=pci,vendor=168c,device=003c,subsystem-vendor=0000,subsyst";
	filename*1="em-device=0000,variant=tplink,onhub.bin"
Content-Transfer-Encoding: base64

RAjfMAIEAAMHEjRWAABqAD9JAAhEDAgAAAAfAAAAMwAAAAAAAACIEQBNAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAABNAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAADwAgAgAAEREBAFAB
UAFQAQAAEAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAKASACAABVVQUA
AAAAAAAAAAARAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAM0AAEBwiaIADBCEAHkADBB8AHEAAAAAAAAAAPh4AAwQgQB2AAwQeQBvAAAAAAAAAAD4
eAAMEH8AcwAMEHYAbAAAAAAAAAAA+HgAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABwrHCJrABwiawAcImsACIiIiIiIiIi
IiIeHCIiHhwiIh4cFBQU7sxKRKxExEpEFBQU7sxKRKxExEpEFBQU7sxKRKxExEpEEhIS7sxq
AKwGwGoAEhIS7sxqAKwGwGoAEhIS7sxqAKwGwGoAERIVFxocQUJFR0pMMTI1Nzo8AABwdZ2i
cHWdonB1naJ6f5OYcHWdonp/k5hwday4cHWnrHB1p6x6f52icHWnrHp/naJwdaescHWnrHB1
p6x6f52icHWnrHp/naI8fDw8PHw8PDx8PDw8fDw8PHw8PDx8PDw8fDw8PHw8PDx8PDw8fDw8
PHw8PDx8PDw8fDw8PHw8PDx8PDw8fDw8PHw8PDx8PDwAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAExISEhMTFBIWExUTFgMVExQSExIRFRMSFhMTFBYTExQAAAAA
AAAAAAAAAAAAAAAAAABMWFxojLS9yQ4SaQBdAA4SbgBnAAAAAAAAAAD4eAAOEm0AYQAOEncA
cAAAAAAAAAAA+HgADhJuAGIADhJ5AHIAAAAAAAAAAPh4AA4ScQBmAA4SfAB1AAAAAAAAAAD4
eAAOEoIAewAOEmwAYgAAAAAAAAAA+HgADhJ4AGoADhJOAEAAAAAAAAAAAPh4AA4ScwBjAA4S
SAA6AAAAAAAAAAD4eAAOEmsAWAAOEkMANAAAAAAAAAAA+HgAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAExUaIyguUxU
aIyguUxUaIyguUxUaIyguR4cGhYeHBoWHhwaFh4cGhYeHBoWHhwaFhAQEMyqaACKBqBoABAQ
EMyqaACKBqBoABAQEMyqaACKBqBoABAQEMyqaACKBqBoABAQEMyqaACKBqBoABAQEMyqaACK
BqBoAAwMDO7urADOCuCsAAwMDO7urADOCuCsAAwMDO7urADOCuCsAAwMDO7urADOCuCsAAwM
DO7urADOCuCsAAwMDO7urADOCuCsAAwMDO7urADOCuCsAAwMDO7urADOCuCsAAwMDO7urADO
CuCsAAwMDO7urADOCuCsAAwMDO7urADOCuCsAAwMDO7urADOCuCsABAWGBkbHUBGSElLTTA2
ODk7PQAATFxgjLS4vc1MXGCMtLi9zU5eZo6utr/HUmKSorLD//9MXGCMtLi9zU5eZo6utr/H
TFhcaIyQsLRMWFxojJCwtE5WXmaOlqauUmKSov////9MWFxojJCwtE5WXmaOlqauTFxgjLS4
vc1MXGCMtLi9zU5eZo6utr/HUmKSorLD//9MXGCMtLi9zU5eZo6utr/HfDx8fDw8fDx8PHx8
PDx8PHw8PHw8PDw8PDw8PDw8PDx8PHx8PDx8PHw8PHw8PDw8fDx8PDx8PDx8PHw8PHw8PDw8
PDw8fDw8PDw8PDw8PDx8PHw8PHw8PDw8PDw8fDw8fDx8fDw8fDx8PHx8PDx8PHw8PHw8PDw8
PDw8PDw8PDx8PHx8PDx8PHw8PHw8PDw8AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABARExUUFBgaJCIiISQjIiIjJCEi
JiMhIiYiIyAcIR8fEBETFRQUGBokIiIhJCMiIiMkISImIyEiJiIjIBwhHx8AAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAA==

--A8bWH4ukQQTm435c
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

--A8bWH4ukQQTm435c--

