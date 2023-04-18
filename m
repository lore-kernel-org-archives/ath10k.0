Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFA47C77B75
	for <ath10k@archiver.kernel.org>; Tue, 18 Apr 2023 01:32:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YSTLF3zrwIvHcuvGgChO0i9H7oJlawPFrtbeEbodJRM=; b=vrk3XtE6DHQyUf
	dfoqaNj3r/oHYxyvv7LF0VLm2qK6Pwv3C6OysC93xhf3yfVVB3Q9DGirp/B8T9/y+iOcekpPogGbc
	Dn0z/qD2LcPp2L/GhRYaVWL4PCsGWMhPl3E5QuVaNCBCtifXhWuhr/vB7+93MCTDbAErrpvcpiIiU
	Z9dh6zNsZXjVg79vqB1ncFMlbskti14A8qqzB9eL//C9+KiyWdjfA1TcURHvqQ+kJEGSvR7f55Pj+
	IOndkexLSBF583hDeLaszi26gfByvvl1034XVBjCEKRVxNtgx3dewJLxYh2EaGGkcTE7G3ODGDzt1
	9HGAcm5DKrCWXEB45yLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1poaCf-000b02-2S;
	Tue, 18 Apr 2023 01:32:17 +0000
Received: from mga03.intel.com ([134.134.136.65])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1poaCd-000azQ-0q
	for ath10k@lists.infradead.org;
	Tue, 18 Apr 2023 01:32:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681781535; x=1713317535;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=mqxq8RXyzn7YFtNPQdHbbubYs5CAHAb50Sn/RMl1hKQ=;
  b=XHEBFXxWJzRo/hiuen0AqeAli1CeR0c6sesPRBPtAHKlEJQq4xV6052t
   pZEvLsaKSkHYLlebkohunvbbfxUHWW1TWUweiir6rxfI4P3Q3hg8N0JoQ
   i0jMEGpl5EU3RRs8gOCLofMiajv0zCbghisFfLv/pG3mi8svKVt8uo5LT
   Z+XmfYnL/a/SIP1ysvnYwML/Q6/kLzJPNnKrD9EwYo3z7/iGJZyNCPk6L
   vKJtXtrla0aVPxWMeyanvsF/OcD1xnpE/TKARFSXiBlwo5MKRu1UDVBw/
   CbIPj5N5IfmTIt1jsDB4UUQD6IqrDK9de14X7VLj1xiXkrGtjKbPceUW8
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10683"; a="347795967"
X-IronPort-AV: E=Sophos;i="5.99,205,1677571200"; 
   d="scan'208";a="347795967"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2023 18:32:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10683"; a="865198507"
X-IronPort-AV: E=Sophos;i="5.99,205,1677571200"; 
   d="scan'208";a="865198507"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 17 Apr 2023 18:32:11 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1poaCY-000coj-2y;
	Tue, 18 Apr 2023 01:32:10 +0000
Date: Tue, 18 Apr 2023 09:32:04 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:pending] BUILD SUCCESS
 6a4bcf8b53f6f6f88ab800d44018d5b85ef918c6
Message-ID: <643df314.mUdo8Xipi7ZJwFHt%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230417_183215_390411_03B96745 
X-CRM114-Status: UNSURE (   4.61  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git pending
branch HEAD: 6a4bcf8b53f6f6f88ab800d44018d5b85ef918c6  wifi: ath12k: add wait operation for tx management packets for flush from mac80211

elapsed time: 734m

configs tested: 55
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
csky                                defconfig   gcc  
i386                             allyesconfig   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-a001-20230417   gcc  
i386                 randconfig-a002-20230417   gcc  
i386                 randconfig-a003-20230417   gcc  
i386                 randconfig-a004-20230417   gcc  
i386                 randconfig-a005-20230417   gcc  
i386                 randconfig-a006-20230417   gcc  
ia64                             allmodconfig   gcc  
ia64                                defconfig   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
m68k                             allmodconfig   gcc  
m68k                                defconfig   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
nios2                               defconfig   gcc  
parisc                              defconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                               defconfig   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
sh                               allmodconfig   gcc  
sparc                               defconfig   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-a001-20230417   gcc  
x86_64               randconfig-a002-20230417   gcc  
x86_64               randconfig-a003-20230417   gcc  
x86_64               randconfig-a004-20230417   gcc  
x86_64               randconfig-a005-20230417   gcc  
x86_64               randconfig-a006-20230417   gcc  
x86_64                               rhel-8.3   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
