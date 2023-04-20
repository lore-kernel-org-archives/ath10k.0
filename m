Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7236C77B7C
	for <ath10k@archiver.kernel.org>; Thu, 20 Apr 2023 03:39:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=G0yPk7nXfeCbhZMzVpW9N1+97NQsX08E1FC4Wh5WRHg=; b=gCaE4j1eG8Jwp1
	YCcL0JcxNMMLEexpf5fB0zN27vm+L+Wg5aoMRw4eOG/Y3Dzx8bEERZpM4fBqBPRrU9q0kcOHZlD3+
	Le1aJvprrQduVy1sUo9uO/iAMzYMtAdduFS+Nv97829a7qSNu8NjDkMOHnWLNE6Aw/BrziEviPTVv
	oLMoqtWfQftRlZu38Dd/Uur3gsm/V2ru8EvUvOsfgEiO3FWGavIjGQLJNIToGl56eyRga1lOp/OwS
	EQ7bveXNJZdMdl+lhuudVnsgcqnhvcd5iG2V+o1sfYuhphB0v90xeU8CCOltJsBFg2x+MAreHUz8/
	P82EN8c71k0jt7hneuZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppL8j-006xxm-0T;
	Thu, 20 Apr 2023 03:39:21 +0000
Received: from mga09.intel.com ([134.134.136.24])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppL8h-006xx3-04
	for ath10k@lists.infradead.org;
	Thu, 20 Apr 2023 03:39:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681961958; x=1713497958;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=jsWR0JFrfCQBDoHEIV3X2+CdmMV34M+LWkfQ/kTPTqI=;
  b=c/u580Yq3aiKB5gxv78JIv05c1EJVbRwtYh78HvdKhbOUzO5doKuOWRO
   6q+M+ccanSz/KX3uBDix9sWjlhD5zMfJbRpqXTsIyMDpz5XVUQpFGYKp9
   VxSnXjkSqAvpeNOV2lXAPl2TML0fAdRw6oUbprTtyEQfvy9Wro5BpWBhq
   b3Qm+hxYmcRV7TOo4g7Jg0T2vH9rO+BMuamKJOfZzuzTHV32hpH57xHDE
   Q+zVSVDXpPjd5mYY04Q65qgyC7rwaZHg6yM4EWUHw0kxHOtuJfK8hEh33
   1ki8h60tR99HhoYYoMcL9xrfBsxiPXV+3ByFQ9J6wChot+0muwZrXt0Wl
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="347483928"
X-IronPort-AV: E=Sophos;i="5.99,211,1677571200"; 
   d="scan'208";a="347483928"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2023 20:39:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="835553988"
X-IronPort-AV: E=Sophos;i="5.99,211,1677571200"; 
   d="scan'208";a="835553988"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 19 Apr 2023 20:39:14 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ppL8b-000fQP-2o;
	Thu, 20 Apr 2023 03:39:13 +0000
Date: Thu, 20 Apr 2023 11:38:23 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master] BUILD SUCCESS
 12f167f02a1abe2c8817496a902de00758285b92
Message-ID: <6440b3af.QyBAywKSBhDPhXuR%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230419_203919_125406_236343F7 
X-CRM114-Status: UNSURE (   6.46  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git master
branch HEAD: 12f167f02a1abe2c8817496a902de00758285b92  Add localversion-wireless-testing-ath

elapsed time: 727m

configs tested: 43
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
x86_64                               rhel-8.3   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
