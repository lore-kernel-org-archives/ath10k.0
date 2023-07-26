Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EB94C0015E
	for <ath10k@archiver.kernel.org>; Wed, 26 Jul 2023 20:29:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7lZYdsSKVqcJSez5+65XENbrMOK6pBXauXkYrHU38ho=; b=aoGKQO/xMpgHwR
	h7PyBPuHSFa2a64LDb6UuU+jbyeFUucLVIFDqWPChgUVYyLzUd9qQuTTrNte/wJV5B6EQ/YVNORXV
	LEioC430CU0tqPXHqBn02CZwGnWxPgcpTErnOLncrF92bD5Xz60pEBXwPtW7zHyZvwsNYFfcy0smp
	1SbGtV6Wz4q1ir7EYEmrgWTNbTCMrODPJKAVFza1NAYl78x+941GYPfeRlwl+OcmZY9oHZxbSn2gx
	964MV7xaiV92QL3hprYLhco5tRFoz1Dj9pNrL9j3YfiHR3BTIAPKHfZVk3jSCYjbGmpmlxs0ol7pr
	wFnE5OvulsDEX/DFefJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOl7n-00BTwC-0y;
	Wed, 26 Jul 2023 20:28:47 +0000
Received: from mga06b.intel.com ([134.134.136.31] helo=mga06.intel.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOl7k-00BTvh-0G
	for ath10k@lists.infradead.org;
	Wed, 26 Jul 2023 20:28:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690403324; x=1721939324;
  h=date:from:to:cc:subject:message-id;
  bh=C8uUMayElZka8JUUi8Duxif67m0yH0PLXYQ2DDaWONo=;
  b=Ug7lmQYHuurecZW7jhBpywWkeNuXaWOMcSkcgNr9S3JRN93O6GWr+dYt
   u78mqA0RtrQf321HT2I1/a7G6JCTaefTUPwyRP6Sx885ZVopmAFy4+dt0
   IpSjC3LNa22CGrAX6dqSum99CrpaGaNLQDchOlkH/zfqdRO45cJf1FxTd
   Ewgim0sLDZ1VINueKtX6qcxACj/r/eHswNWNEVP3woZDqiC8ZNnYtW7yi
   i2hMZZv1EUtIYH4SnXvZSIB0WYXcqKWwX40CF0jT5pKGvsoYqmwrYPSVO
   rq3unwVRpxQ4ttKK2bbZIx22EMaH2pn+c1DKf67c7dTC6NK1NQsNif6xw
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="431922787"
X-IronPort-AV: E=Sophos;i="6.01,232,1684825200"; 
   d="scan'208";a="431922787"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2023 13:28:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="676842240"
X-IronPort-AV: E=Sophos;i="6.01,232,1684825200"; 
   d="scan'208";a="676842240"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 26 Jul 2023 13:28:32 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qOl7Y-0001JV-0q;
	Wed, 26 Jul 2023 20:28:32 +0000
Date: Thu, 27 Jul 2023 04:27:40 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath11k-hibernation-support] BUILD REGRESSION
 2f0b0c54cf91e991ecddcdce331a741f7c55559f
Message-ID: <202307270437.mWNfwSqZ-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230726_132844_188580_D97EAD30 
X-CRM114-Status: UNSURE (   4.84  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git ath11k-hibernation-support
branch HEAD: 2f0b0c54cf91e991ecddcdce331a741f7c55559f  wifi: ath11k: remove MHI LOOPBACK channels

Error/Warning reports:

https://lore.kernel.org/oe-kbuild-all/202307261804.lOEj99hg-lkp@intel.com

Error/Warning: (recently discovered and may have been fixed)

drivers/accel/qaic/mhi_controller.c:545:35: error: too few arguments to function call, expected 3, have 2
drivers/accel/qaic/mhi_controller.c:545:9: error: too few arguments to function 'mhi_power_down'

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
|-- arc-allyesconfig
|   `-- drivers-accel-qaic-mhi_controller.c:error:too-few-arguments-to-function-mhi_power_down
|-- arm-allmodconfig
|   `-- drivers-accel-qaic-mhi_controller.c:error:too-few-arguments-to-function-mhi_power_down
|-- arm-allyesconfig
|   `-- drivers-accel-qaic-mhi_controller.c:error:too-few-arguments-to-function-mhi_power_down
|-- arm-randconfig-r046-20230726
|   `-- drivers-accel-qaic-mhi_controller.c:error:too-few-arguments-to-function-mhi_power_down
|-- arm64-allyesconfig
|   `-- drivers-accel-qaic-mhi_controller.c:error:too-few-arguments-to-function-mhi_power_down
|-- mips-allmodconfig
|   `-- drivers-accel-qaic-mhi_controller.c:error:too-few-arguments-to-function-mhi_power_down
|-- openrisc-randconfig-r001-20230726
|   `-- drivers-accel-qaic-mhi_controller.c:error:too-few-arguments-to-function-mhi_power_down
|-- powerpc-allmodconfig
|   `-- drivers-accel-qaic-mhi_controller.c:error:too-few-arguments-to-function-mhi_power_down
|-- riscv-allmodconfig
|   `-- drivers-accel-qaic-mhi_controller.c:error:too-few-arguments-to-function-mhi_power_down
|-- riscv-allyesconfig
|   `-- drivers-accel-qaic-mhi_controller.c:error:too-few-arguments-to-function-mhi_power_down
|-- s390-allyesconfig
|   `-- drivers-accel-qaic-mhi_controller.c:error:too-few-arguments-to-function-mhi_power_down
|-- sparc-allyesconfig
|   `-- drivers-accel-qaic-mhi_controller.c:error:too-few-arguments-to-function-mhi_power_down
`-- x86_64-allyesconfig
    `-- drivers-accel-qaic-mhi_controller.c:error:too-few-arguments-to-function-mhi_power_down
clang_recent_errors
`-- i386-randconfig-i014-20230726
    `-- drivers-accel-qaic-mhi_controller.c:error:too-few-arguments-to-function-call-expected-have

elapsed time: 727m

configs tested: 107
configs skipped: 4

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r003-20230726   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r021-20230726   gcc  
arc                  randconfig-r034-20230726   gcc  
arc                  randconfig-r043-20230726   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                  randconfig-r046-20230726   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r022-20230726   clang
csky                                defconfig   gcc  
csky                 randconfig-r005-20230726   gcc  
csky                 randconfig-r023-20230726   gcc  
hexagon              randconfig-r041-20230726   clang
hexagon              randconfig-r045-20230726   clang
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-r004-20230726   gcc  
i386         buildonly-randconfig-r005-20230726   gcc  
i386         buildonly-randconfig-r006-20230726   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-i001-20230726   gcc  
i386                 randconfig-i002-20230726   gcc  
i386                 randconfig-i003-20230726   gcc  
i386                 randconfig-i004-20230726   gcc  
i386                 randconfig-i005-20230726   gcc  
i386                 randconfig-i006-20230726   gcc  
i386                 randconfig-i011-20230726   clang
i386                 randconfig-i012-20230726   clang
i386                 randconfig-i013-20230726   clang
i386                 randconfig-i014-20230726   clang
i386                 randconfig-i015-20230726   clang
i386                 randconfig-i016-20230726   clang
i386                 randconfig-r013-20230726   clang
i386                 randconfig-r014-20230726   clang
i386                 randconfig-r036-20230726   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
m68k                             allmodconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                 randconfig-r004-20230726   clang
mips                 randconfig-r012-20230726   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r024-20230726   gcc  
openrisc             randconfig-r001-20230726   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc              randconfig-r032-20230726   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r033-20230726   gcc  
riscv                randconfig-r042-20230726   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r044-20230726   clang
sh                               allmodconfig   gcc  
sh                   randconfig-r025-20230726   gcc  
sh                   randconfig-r031-20230726   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r016-20230726   gcc  
sparc                randconfig-r035-20230726   gcc  
sparc64              randconfig-r006-20230726   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                   randconfig-r026-20230726   gcc  
um                           x86_64_defconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-r001-20230726   gcc  
x86_64       buildonly-randconfig-r002-20230726   gcc  
x86_64       buildonly-randconfig-r003-20230726   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-r002-20230726   gcc  
x86_64               randconfig-x001-20230726   clang
x86_64               randconfig-x002-20230726   clang
x86_64               randconfig-x003-20230726   clang
x86_64               randconfig-x004-20230726   clang
x86_64               randconfig-x005-20230726   clang
x86_64               randconfig-x006-20230726   clang
x86_64               randconfig-x011-20230726   gcc  
x86_64               randconfig-x012-20230726   gcc  
x86_64               randconfig-x013-20230726   gcc  
x86_64               randconfig-x014-20230726   gcc  
x86_64               randconfig-x015-20230726   gcc  
x86_64               randconfig-x016-20230726   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
