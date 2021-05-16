Return-Path: <SRS0=Iuql=KL=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66521C433ED
	for <ath10k@archiver.kernel.org>; Sun, 16 May 2021 03:53:53 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EE5E0610A7
	for <ath10k@archiver.kernel.org>; Sun, 16 May 2021 03:53:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EE5E0610A7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:MIME-Version:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5GNq9icbybLgeAyZMND4THy3KQ3tn847778tqpfCves=; b=aCNsy17tLNfFSw
	jtXmhf4L36RRCoTF4azU9EBmNCWbVIqYTnDqIFBrW3Khyx7MdVFLIDk82fCaMiFZneHzDOoXsYYua
	pyEoSEJmakHdW8lUj9rDpnLvfG4pDF7zy0aRYLe/xpktPYKHPH8pBLvRh3jc2kfndN5JAnDp1b7Gk
	gXilrU7gDBlsXz9rLLHB7x2Zo44oirRrG0kE3vUf95REmqM5mkBYvy7wDRpUX5h39/PV+rW4X1d6I
	gtbisWlWG+0q1IH0vWa7uUTUbcvpO9/mlPnHZ24DOPL04ZMiJScIREkJrc0ovaKaQO9JpIP/FhYuR
	pWyFnIZWka41gZ9qMS5Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1li7ol-00BVAd-MQ; Sun, 16 May 2021 03:51:51 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1li7oj-00BV9o-SC
 for ath10k@desiato.infradead.org; Sun, 16 May 2021 03:51:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:To:Subject:Message-ID:
 Date:From:MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=F6CTeH7eJVH+24Fgjdk0EdtsseSaknI2TPHWEkI9lyk=; b=W/FjcpRpw17X3ElrQ2HOCt0zz9
 8ZISMSLYPozixu8Cy8aUUf3yqRBujTwZxKjlKDSCqWLjWJpg+GMkLc5pyH75lyq5ayq7qfuuebVvn
 hqfu4xsfUgVQMpLKfl6871ZK0xrxTiOtxMjOU0TbFEAcQDOSU9FjwmyDO534AOSHXXk8yZIbVU7aR
 pqIirs/7+1WPzR22XNjwNbzlaehwVQufcA0cGYqhmj6NlHGzSlKawt6KDq1yW/2TFeBTWNyevR4tV
 TNNGTWsQiYOYdG61LhHfNv/WYcP9Stw8E+1PTdvC/99kyvBW7EAMI9s9vghf6GQK77sMnhy5XjzlU
 UW/1kvsQ==;
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1li7oh-00Cl7a-92
 for ath10k@lists.infradead.org; Sun, 16 May 2021 03:51:48 +0000
Received: by mail-pj1-x1032.google.com with SMTP id q6so1961092pjj.2
 for <ath10k@lists.infradead.org>; Sat, 15 May 2021 20:51:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=F6CTeH7eJVH+24Fgjdk0EdtsseSaknI2TPHWEkI9lyk=;
 b=CSqdONHj/AuOfE9iu42pLNo5OnK1OGD1DWNGNpEtePHUgqhQNaP+zOWSl7/MI49coF
 f96gyt4YyyKxSTXy4BfOQiffrfNBkliRph83lmOQ/ob6MSF9OEnD/PG5PdZwp4dCfbuS
 scz1y2vTXaV3exUrkQcTQwhu7dLVzqm+iTD8oLnB2fnmi10UTNUUQyzbYSH2Jlo+5ov7
 l34QM6wfO9e8ckwOsfPjcai8SPXGZhYuUuXNWjcjCK+okPoBe+bW9x1oE8oG6oGRVEKa
 uRwDrCO9/tCY2TMRIudk85OXZcpPP9pGcMF3HxW6N3ZXONbTnNBzZXJ2gjIPX/PkEuX/
 lt7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=F6CTeH7eJVH+24Fgjdk0EdtsseSaknI2TPHWEkI9lyk=;
 b=B2RSi8QBJniH7PpA4XBsN/bGJoMfPbertX5VSz2DSKOsLj2SqTiE741pp0WskQlQ8b
 4Ohy0PoiCPgeQcyg1vf92IdtQkNikNIy8hU1jh++eiMpzSHKzR7x0DwCQ1AHPa3CVvbi
 JnphDGXeRkAV4o93BcPZKmSWX2yQJrkU+ad5Zuki/fCpLabY7logv2c+tHv9jgI+OTcC
 pFqOrlNH7r2fFBFNEf1foRYQeVZwQ31FGVMNCkZemrHBK03xJJ5pzMssodfuGUMc/z4U
 mKzpDoIuZp43ixf2Ls0knjPzHa2GDOimL1LUz0kjMoILgw5D+d1/bI9SvillaHNqQY5b
 zrnQ==
X-Gm-Message-State: AOAM530Ooc1YFDOCWDqBj6QgV4V3kbdRZRv+ee8DkZYUpKhOopETx08H
 gqA0O1Dqq50j1Qtl+43UeqYXQ2E4jKkyOPA765Oh6XuhFwvV9Q==
X-Google-Smtp-Source: ABdhPJzMx8phFeFlFdxJqZEvJM1CPBO5W4o/04WYMdwUQLyMmKMU0P3GYqL+CttqpDUggbCLWhu0pWRf5xhQsQrOaUI=
X-Received: by 2002:a17:90b:3b4d:: with SMTP id
 ot13mr5194653pjb.143.1621137103904; 
 Sat, 15 May 2021 20:51:43 -0700 (PDT)
MIME-Version: 1.0
From: Axel Rasmussen <axel.rasmussen1@gmail.com>
Date: Sat, 15 May 2021 20:51:33 -0700
Message-ID: <CACC2YF2M9o4ZCY7Dj2C0xUagZkB+ymZZ9bGmzr0cKyON-KTVXA@mail.gmail.com>
Subject: target IRAM recovery feature breaks QCA9984?
To: ath10k@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210515_205147_360357_99D5BD59 
X-CRM114-Status: UNSURE (   6.15  )
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

I have a QCA9984 (Compex WLE1216V5-20), which used to work on 5.10,
but starting with 5.11, and in particular this commit:

9af7c32ceca8 ath10k: add target IRAM recovery feature support

The firmware fails to load, and so the device is unusable. dmesg shows
the following:

# dmesg | grep ath
[ 12.144796] ath10k_pci 0000:04:00.0: pci irq msi oper_irq_mode 2
irq_mode 0 reset_mode 0
[ 12.272303] ath10k_pci 0000:04:00.0: qca9984/qca9994 hw1.0 target
0x01000000 chip_id 0x00000000 sub 168c:cafe
[ 12.272329] ath10k_pci 0000:04:00.0: kconfig debug 1 debugfs 1
tracing 1 dfs 1 testmode 0
[ 12.274100] ath10k_pci 0000:04:00.0: firmware ver 10.4-3.9.0.2-00131
api 5 features no-p2p,mfp,peer-flow-ctrl,btcoex-param,allows-mesh-bcast,no-ps,peer-fixed-rate,iram-recovery
crc32 23bd9e43
[ 13.505923] ath10k_pci 0000:04:00.0: board_file api 2 bmi_id 0:31
crc32 85498734
[ 16.085259] ath10k_pci 0000:04:00.0: failed to copy target iram contents: -12
[ 16.192849] ath10k_pci 0000:04:00.0: could not init core (-12)
[ 16.193253] ath10k_pci 0000:04:00.0: could not probe fw (-12)

I'm happy to provide my kconfig or whatever else would be useful for
debugging further, or to test patches. I'd offer to write a patch, but
my knowledge of the wireless stack and ath10k in particular is rather
limited...

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
