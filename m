Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2545C64ED8
	for <ath10k@archiver.kernel.org>; Fri, 24 Feb 2023 23:00:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/KxUEwZMBeUCGtjJElrOlItra4sLXQEeOFMqQ4WUXjk=; b=gSGytrKHTXfGi/
	vMybpruU4V5oWmxha7hQ6a4UK5P9kUjc6a5Ck8fcOg09fDPp04S0zj2E5d5Rkb3bgkyUh3uSTnnTT
	Kh1n4dVcXHkAstBlQ+qbWda49VMj7FL5MzcjqwRClPoC59fqYGMob6F9cxAjdEfFqbtsWSDJ8vmwE
	8BQI7n4qjqf+8vLUCsUUCySR7gc16Uc6mJn893UuwAH2LH9yw62LH/ZDaWKd3s76OgvP5pcgtyxeM
	Q9y32OnJmg+Y6DftHY+NPyFtcQFmwZBT8g/3e0dOfaBx30ilwzXWvUCf+Se8NtI7IgBs2m9qDuo1q
	hjFnUS2P7MGYBlUtyrcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVh3M-004Em8-9P; Fri, 24 Feb 2023 23:00:36 +0000
Received: from mga17.intel.com ([192.55.52.151])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVh3J-004EkW-MT
	for ath10k@lists.infradead.org; Fri, 24 Feb 2023 23:00:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677279633; x=1708815633;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=/hHWJb7wiguTw29KVbez9mK5kBhDX7XcuTWmYbGzxjA=;
  b=Pf/kOZdXmmu69QTcm73VxI31V6Z3GxOpzJhsaKxoLFuREvna7UxXgnA1
   vpuHPtdvZhq79ax35uOXmJSErsd9GT2mljAe3ci5f77z9vTezC3+/PAWW
   qEeHN/jPdB9niLPaCoLGOFYrpW+MtdZ6tuWDjz5FESChyPVoZqfJVq1xn
   TSssGRiUKDISg+r/7u04ud3cNiw8q2OOZ+0GTGvkwsUabfLbfFjRgmwJP
   RmdKvdspp7k4oKk/m097gMGz1r5nWY27gXXJyQv4dx8TWyTDsrDbxO1o8
   g4S4img7rlb/x/wW85SWaKdZ749mFhF9GBzzGweiYk8y7PoGwgA2ymeyc
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="313987540"
X-IronPort-AV: E=Sophos;i="5.97,326,1669104000"; 
   d="scan'208";a="313987540"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2023 15:00:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="705435714"
X-IronPort-AV: E=Sophos;i="5.97,326,1669104000"; 
   d="scan'208";a="705435714"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 24 Feb 2023 15:00:10 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pVh2v-0002mj-2u;
	Fri, 24 Feb 2023 23:00:09 +0000
Date: Sat, 25 Feb 2023 06:59:17 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-qca] BUILD SUCCESS
 589b979a93d86c322c9a009b402b3c46ef254537
Message-ID: <63f94145.YxuPH+ae3XBeNF6V%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230224_150033_806811_B6D372A4 
X-CRM114-Status: UNSURE (   5.54  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git ath-qca
branch HEAD: 589b979a93d86c322c9a009b402b3c46ef254537  Merge branch 'ath-next' into ath-qca

elapsed time: 730m

configs tested: 24
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                               defconfig   gcc  
arc                                 defconfig   gcc  
arm                                 defconfig   gcc  
arm64                               defconfig   gcc  
csky                                defconfig   gcc  
i386                                defconfig   gcc  
ia64                                defconfig   gcc  
loongarch                           defconfig   gcc  
m68k                         amcore_defconfig   gcc  
m68k                                defconfig   gcc  
microblaze                          defconfig   gcc  
mips                        bcm47xx_defconfig   gcc  
mips                           mtx1_defconfig   clang
nios2                               defconfig   gcc  
parisc                              defconfig   gcc  
parisc64                            defconfig   gcc  
riscv                               defconfig   gcc  
riscv                          rv32_defconfig   gcc  
s390                                defconfig   gcc  
sh                           se7343_defconfig   gcc  
sparc                               defconfig   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                              defconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
