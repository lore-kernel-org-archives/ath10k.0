Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAF5CC77B73
	for <ath10k@archiver.kernel.org>; Tue, 30 May 2023 11:51:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jXPFqRLx9ASsOmLOY0ezqfx3Y/lf3COf6vWjIePOt5I=; b=rIWRx54C5TLRwN
	NSBcEYyQGyu7uBVH7ujbwnabXEeEg1Lc+g3hlIIg0g+gvmcYL0tup+DYUCmQj08XMqQ/TwWEgDHpe
	swwmm2uoyAv+LbbkUoKlJn9WtvwoiumlOlWr3asQv6BKsA+KIPgAAxFKlYNNvpiqhXodHKUkJ2TQ5
	D2ywm/+Wilmk5FPeU5A0ASJbXG++SyPSIgLvK0u8i5DPFtkFOo0E06ekSWaLvyidxFFUB1cIeaFOi
	STAtFBrwyHQIBndEINz0QNDzdQkxPfIomKR4obisJoE7GpJQ2cC/VRGWABusg4ZVFcJNYAJ8XCFoM
	Wh03ozapKE9JpDt9GBPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3xsb-00DinU-2U;
	Tue, 30 May 2023 11:51:09 +0000
Received: from mga17.intel.com ([192.55.52.151])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3xsT-00Dika-1b
	for ath10k@lists.infradead.org;
	Tue, 30 May 2023 11:51:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685447461; x=1716983461;
  h=date:from:to:cc:subject:message-id;
  bh=woSHhDyj6N0vK89szacxWHrwrjlU9M7orDCdhdt4R2w=;
  b=R4SPYUzESQaVlP2sNMrpBjhPBHMrPR9JIYJfzPkJUaCQ5eaV+fI80i+3
   aL52to5aNjdwOyQRpLIwGAlSj5SWchoatgv+dAVve9BfwZ8rpR7dzHTre
   4m2+oQBu23pPIjLYd2AReQgC7HA2CyCRE2FTJJf6EdLHVGJYbDGYitLS8
   29kOGUP8ya+6M/8aO7pOPTOV0BoYyiIpEVZYzPmQn/CNoO9QX82DMTQwk
   aib3kp/rKZxt0j14mWYkVNOS6kuq8NkIDEr4AqkRXU1vivme8F8OslXJQ
   U6x8oS3fCdqdrcRKw5hhMhOWdu31KvuCxR4njJ8g5ZvNT/lAXE9f22abA
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="335239169"
X-IronPort-AV: E=Sophos;i="6.00,204,1681196400"; 
   d="scan'208";a="335239169"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2023 04:51:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="656824215"
X-IronPort-AV: E=Sophos;i="6.00,204,1681196400"; 
   d="scan'208";a="656824215"
Received: from lkp-server01.sh.intel.com (HELO fb1ced2c09fb) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 30 May 2023 04:50:59 -0700
Received: from kbuild by fb1ced2c09fb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q3xsR-0000Ge-11;
	Tue, 30 May 2023 11:50:59 +0000
Date: Tue, 30 May 2023 19:50:39 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master] BUILD SUCCESS
 4ab7f08db5310ded48a5c1f3ec3f2e177ba6b1c2
Message-ID: <20230530115039.LmwZV%lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230530_045101_596152_98965DEE 
X-CRM114-Status: UNSURE (   5.23  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git master
branch HEAD: 4ab7f08db5310ded48a5c1f3ec3f2e177ba6b1c2  Add localversion-wireless-testing-ath

elapsed time: 5881m

configs tested: 41
configs skipped: 2

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
https://github.com/intel/lkp-tests/wiki

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
