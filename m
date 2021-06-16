Return-Path: <SRS0=aUz4=LK=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HK_NAME_FM_MR_MRS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75362C48BE5
	for <ath10k@archiver.kernel.org>; Wed, 16 Jun 2021 17:00:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 250B16044F
	for <ath10k@archiver.kernel.org>; Wed, 16 Jun 2021 17:00:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 250B16044F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Message-ID:Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Date:From:To:Subject:
	Content-Description:MIME-Version:Cc:Content-ID:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=JJsuU/CNLrcv5HU7O0f4zl61BtjtVtssqXIHcAI18Bs=; b=0HAbwLfWfbfYNj
	b5S9DA38P9d2+zxa01HdEDVhhWByBAZKbgxgbSMLQsetIVP5DIVmHon5X/Tah3J89A0YqotLDeJL4
	mFxphIOJbcfd0Q6+gD2T/bFcfmHtoBAHPjpstcQGVRlw7vJqxT13uHeq+R/38cjKbboj/RWJ42edc
	cUfbabRam4yHbfAfBpQqrmWbK6dBnQnrT/9ggfsGJBPnIfGKn4SyxAXt3ZbvrJw1Zsin8GrDyk5cZ
	Zegbq0pzVPOvWeKKPoCRZLGmQG/bTahw2c3YlS5Wr5u7wMvcb0+CqQKqKPFCoopJKVgs+uyVoq6p9
	KQUFQ+ascYW67p/9XhvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltYsf-007EwV-62; Wed, 16 Jun 2021 16:59:09 +0000
Received: from mta0.pactgr0up.com ([142.11.245.49] helo=pactgr0up.com)
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ltYsc-007Ew2-5K
 for ath10k@lists.infradead.org; Wed, 16 Jun 2021 16:59:07 +0000
Received: from IP-9-117.dataclub.eu (unknown [185.29.9.117])
 (Authenticated sender: inquiry)
 by pactgr0up.com (Postfix) with ESMTPA id 150C45096BD
 for <ath10k@lists.infradead.org>; Wed, 16 Jun 2021 10:16:51 -0500 (CDT)
MIME-Version: 1.0
Content-Description: Mail message body
Subject: Re: Project Funding/ Soft Loan offer 
To: ath10k@lists.infradead.org
From: "Mr. Khaled Omar" <hummar04@gmail.com>
Date: Wed, 16 Jun 2021 17:16:07 +0200
X-Bad-Reply: 'Re:' in Subject but no References or In-Reply-To headers
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210616_095906_284199_8EBBF89A 
X-CRM114-Status: SPAM  (  -6.80  )
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
Reply-To: khaled.omar@mail.ee
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Message-ID: <E1ltYsf-007EwV-62@bombadil.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

Greetings,
 
I represent an International finance & investment company, and we are currently expanding our business interests abroad.
 
We offer a wide range of financial services to interested companies, enterprises or individuals who are looking for soft loans to finance their PROJECT, our services are due at a very low & minimum rate of 3% to suit your needs.
 
We specialize in both start up projects and existing businesses needing funding for expansion. It takes fewer than 21 days to release funds if you have an existing business.
 
Please email us your Project summary or Business plan for review and possible approval for funding.
 
Feel free to ask your questions.
 
Best Regards,
Khaled Omar

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
