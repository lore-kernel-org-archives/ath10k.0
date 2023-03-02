Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADE9CC678D4
	for <ath10k@archiver.kernel.org>; Thu,  2 Mar 2023 02:39:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=l4ShlRBRfoAoDlpyQW8gZcdnYhsUqxbDy9CFBTqQgZU=; b=4ChKG5dj5ys+RF
	hGDwBErw9p94aQNLyCeGncVxRpiImrFRQvSbRitOUrLi4vMJa1rgUPESBnXe/H3Zh00WUzZOaBAhh
	5CGOKOA4TSlFc/QqvtBJRdbsFJrw29YXkVE0/nmcq9PmL2adoGblYzGRFDXPTdk/s6MDszDqh8Oab
	3lHA76AwfoqnsT+aSxNTXhOuUYDezxT7FWyKd4hqfMVeOdAc6WxtGOr9jLc8qTRZ46OQntL1tsUiG
	mduuQDS5eHW72XmrZK8z9HtrF32sofwS71RrY2fw07lUv+I3RR5Vkt5GtJJccrZKzTPQ0DfKVLlcf
	/E9dlm/iuQUnxiNxDX1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXYqa-000ZyZ-NG; Thu, 02 Mar 2023 02:39:08 +0000
Received: from mga11.intel.com ([192.55.52.93])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXYqW-000ZwF-Qq
	for ath10k@lists.infradead.org; Thu, 02 Mar 2023 02:39:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677724744; x=1709260744;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=9iXR3jOJ0+jY6Hc53eRrMWhxWo0PMnmW4p2iOStQtd0=;
  b=Q+6PjoSChefTfKc38SxLCGsu7UNU4cUcn40Bnl0h3O+ddVNCw0OM+Si0
   h5xgg+QwGmWy5/7MAgW2aa/KhF4MO8TB81G/qSjAJSTdi3nJ78+VyK8D3
   X9nOH0LLQKCjxOSvdM99ty7i5kzIW0Te7xTJdRKx02XjjQZEQkEERgNVi
   zNbEiY7Sn2yO1MQswu7ZLKEUdkpkQmIX+jWQHLS43pt/6cyaQUemzZaEU
   qpL3Qo746+1TgkouvvPpaimggXI/96pBWLb0FIq/3pU7ZmaGdiBvhImdT
   Yj5Hm1s7PIs6uOfYJwh9ouzd8ICLtm/w2tmSyiuVDmH7h3nRX/njEhXqD
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="332075698"
X-IronPort-AV: E=Sophos;i="5.98,226,1673942400"; 
   d="scan'208";a="332075698"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2023 18:38:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="817811694"
X-IronPort-AV: E=Sophos;i="5.98,226,1673942400"; 
   d="scan'208";a="817811694"
Received: from lkp-server01.sh.intel.com (HELO 776573491cc5) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 01 Mar 2023 18:38:56 -0800
Received: from kbuild by 776573491cc5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pXYqO-00005s-01;
	Thu, 02 Mar 2023 02:38:56 +0000
Date: Thu, 02 Mar 2023 10:38:43 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master] BUILD SUCCESS
 1a304987a22c9f383f163f93beb47e89080d1cee
Message-ID: <64000c33.IgNSSvZ5IEOzJzgx%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230301_183904_918576_DC256E8E 
X-CRM114-Status: UNSURE (   7.55  )
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
branch HEAD: 1a304987a22c9f383f163f93beb47e89080d1cee  Add localversion-wireless-testing-ath

elapsed time: 727m

configs tested: 103
configs skipped: 7

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r002-20230302   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r001-20230302   gcc  
arc                  randconfig-r043-20230302   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                  randconfig-r003-20230302   clang
arm                  randconfig-r025-20230302   gcc  
arm                  randconfig-r046-20230302   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r006-20230302   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r006-20230226   gcc  
csky                 randconfig-r016-20230302   gcc  
hexagon              randconfig-r011-20230302   clang
hexagon              randconfig-r036-20230302   clang
hexagon              randconfig-r041-20230302   clang
hexagon              randconfig-r045-20230302   clang
i386                             allyesconfig   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                          randconfig-a001   gcc  
i386                          randconfig-a002   clang
i386                          randconfig-a003   gcc  
i386                          randconfig-a004   clang
i386                          randconfig-a005   gcc  
i386                          randconfig-a006   clang
i386                          randconfig-a011   clang
i386                          randconfig-a012   gcc  
i386                          randconfig-a013   clang
i386                          randconfig-a014   gcc  
i386                          randconfig-a015   clang
i386                          randconfig-a016   gcc  
ia64                             allmodconfig   gcc  
ia64                                defconfig   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch    buildonly-randconfig-r005-20230302   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r004-20230302   gcc  
m68k                             allmodconfig   gcc  
m68k         buildonly-randconfig-r001-20230302   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r012-20230302   gcc  
microblaze           randconfig-r023-20230302   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r014-20230302   gcc  
nios2                randconfig-r026-20230302   gcc  
openrisc             randconfig-r005-20230226   gcc  
openrisc             randconfig-r033-20230302   gcc  
openrisc             randconfig-r034-20230302   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r002-20230226   gcc  
parisc               randconfig-r015-20230302   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc              randconfig-r003-20230227   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv        buildonly-randconfig-r003-20230302   clang
riscv                               defconfig   gcc  
riscv                randconfig-r013-20230302   clang
riscv                randconfig-r042-20230302   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r044-20230302   clang
sh                               allmodconfig   gcc  
sparc        buildonly-randconfig-r002-20230302   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r005-20230302   gcc  
sparc                randconfig-r021-20230302   gcc  
sparc64      buildonly-randconfig-r006-20230302   gcc  
sparc64              randconfig-r022-20230302   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64                        randconfig-a001   clang
x86_64                        randconfig-a002   gcc  
x86_64                        randconfig-a003   clang
x86_64                        randconfig-a004   gcc  
x86_64                        randconfig-a005   clang
x86_64                        randconfig-a006   gcc  
x86_64                        randconfig-a011   gcc  
x86_64                        randconfig-a012   clang
x86_64                        randconfig-a013   gcc  
x86_64                        randconfig-a014   clang
x86_64                        randconfig-a015   gcc  
x86_64                        randconfig-a016   clang
x86_64                               rhel-8.3   gcc  
xtensa               randconfig-r031-20230302   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
