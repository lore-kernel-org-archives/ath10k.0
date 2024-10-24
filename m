Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD4B4CE8E8A
	for <ath10k@archiver.kernel.org>; Thu, 24 Oct 2024 15:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:From:Date:Subject:To:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Hg1S1F/X6rJYq8vibvOy1U32pzEM2Ge1AD6vMCX25tY=; b=omKdiWpoCyIWz5
	tXdEVFV5uhH0w6vHAehqH9QRrgbZYBCoYq1CAssiVHdeTtbcry/Jgp0dG6IaICTRcViLFAMi1Vtcy
	o+gWv8ms+2QclYp5bPmdBnSrtuWNegcO0lfaO6xbgBqWFNdsE6a+xiAHnyj4d903AgblkbHXBWIvI
	DIX9mCRMNRsT2kElwJT4gnb3RZgV4Cf1JGw1iyLl3ev6QGitWEDGucQKhuDqONzPG8eRyGmto5sHt
	CiyzXL380ijxT8hCFPseHepOTOSh2saUM23jPrYlw7EFA0ZLIOPGvQTyT8oK/tFMEwifeUh17NJRJ
	PbxdkZBotNIiT5YwdMeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3zzV-00000000xqw-1QnS;
	Thu, 24 Oct 2024 15:43:13 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3ziH-00000000u3A-4BRE
	for ath10k@bombadil.infradead.org;
	Thu, 24 Oct 2024 15:25:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:Message-ID:From:Date:Subject:To:Sender:Reply-To:Cc:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=Hg1S1F/X6rJYq8vibvOy1U32pzEM2Ge1AD6vMCX25tY=; b=g1qVXOJTgVFnz3FuZj2dOvjQd5
	9Xt5vLdC2XB3AJ/6N8lg3Ahy5xJ0KthhYog2yGwoYESjfk3WvZLyrr78kjMxGkcbgT01/iprFt9Ue
	222R8KX7lIteu1f50NIzg3MI65k+VK50bNlBsacaCSN1P7cOP9kqvER1K2FDhbmdC8OAE24GB/ypc
	m8OvhHmoznMTBHZ/G9w+FvmSNhubYNrmmp2Hmq1jaEd50ZwnmsWLO7RGIJ8+M0lMKlbMFabyOinuL
	V3SxJ8gyzVuLZqRC/reXtPaw2kZEKVVUMFREpN/yenhIAO9fQdC1xZ/SbR8yQTYZ6IFmEe5292Z9V
	NpR7TnSA==;
Received: from www1607.sakura.ne.jp ([219.94.192.17])
	by casper.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3ziC-00000004KLH-2THE
	for ath10k@lists.infradead.org;
	Thu, 24 Oct 2024 15:25:24 +0000
Received: from www1607.sakura.ne.jp (localhost [127.0.0.1])
	by www1607.sakura.ne.jp (8.16.1/8.16.1) with ESMTP id 49OFMmFE046564
	for <ath10k@lists.infradead.org>; Fri, 25 Oct 2024 00:22:48 +0900 (JST)
	(envelope-from terra-force@www1607.sakura.ne.jp)
Received: (from terra-force@localhost)
	by www1607.sakura.ne.jp (8.16.1/8.16.1/Submit) id 49OFMmMH046563;
	Fri, 25 Oct 2024 00:22:48 +0900 (JST)
	(envelope-from terra-force)
To: ath10k@lists.infradead.org
Subject: =?ISO-2022-JP?B?GyRCJCpMZDlnJDskcj41JGokXiQ3JD8bKEI=?=
Date: Thu, 24 Oct 2024 15:22:48 +0000
From: TERRA FORCE <info@dear-motor-sports.com>
Message-ID: <8472ca5249f7dd46fcc3b717a7993860@www.terra-force.jp>
X-Priority: 3
X-Mailer: PHPMailer 5.2.4 (http://code.google.com/a/apache-extras.org/p/phpmailer/)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=ISO-2022-JP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_162521_798730_B5AD8100 
X-CRM114-Status: UNSURE (  -0.01  )
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

TERRA　FORCEへお問い合わせありがとうございます。
以下の内容をお問い合せいただきました。

Your account has been inactive for 364 days. To avoid deletion and claim your balance, please log in and request a payout within 24 hours. For assistance, connect with us on our Telegram group: https://t.me/s/attention678672

数日中にご返信致します。

=============================================
TERRA FORCE
〒 819-0164
福岡県福岡市西区今宿町425-16

TEL 092-807-3690
FAX 092-807-3559
お問合せ info@dear-motor-sports.com
http://www.terra-force.jp/
=============================================


