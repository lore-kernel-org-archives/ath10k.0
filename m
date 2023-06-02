Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ED41C77B7A
	for <ath10k@archiver.kernel.org>; Fri,  2 Jun 2023 03:26:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9jGe4IP2mhiqx83rETl1kEyqxz5vleMf8NlOHTY8YpM=; b=Vn3rnmzMn/HFla
	KT+Auf4PYQtugIMX/PECtCMQlfXw0DanbVbiLyagQdAAJDwjnIcrfm+U8HddqIhssCk5l4VOJjGb4
	bpZH0L4I+XYkpCiNY9QsQ88Lp+Bpb6AL8YFeH0QyLDL1EJXAJz9m9t2b9pASyPpwL7JAp4rs+fTP7
	Xlll3S3aiVs6vk9aSRCDrRsndRWbsYl1fHGxxVWSZwtptJghZx7hEUVcZZ3W3xK+erTupGysVTDvz
	AdWBIR1RjLH7HUcgDpivlLPBsLWQIjgHN9puZmTzwkbDwg+84574/w5OPWUUt2+oJbFhL7fnhQOUL
	osQIkZ/6y0QajK8TTVGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4vQZ-005awI-0v;
	Fri, 02 Jun 2023 03:26:11 +0000
Received: from mga02.intel.com ([134.134.136.20])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4vQW-005avq-2E
	for ath10k@lists.infradead.org;
	Fri, 02 Jun 2023 03:26:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685676368; x=1717212368;
  h=date:from:to:cc:subject:message-id;
  bh=z+H5xxG5oQ2OUsEgriLKG6iNiaDe/4r3DGa9S+wWlgY=;
  b=MAPk/Whh64TeeEeqhNp16MyMtFDdECzDKARISpFdMH9xkEP7GgAjHVue
   Akov87m3V5g6haIK7vuEWjEHv4MJbiWBAJofhB89jjWKApvBoO8WAONji
   CrudZbYZGLLIN5H1lmqFdEcxBoe/jL+BxALZEyOraD7YDg/3ArIUxzLLa
   XCBJX2yMORT+pZd6QgKHfJ0KlWeGVxaMjZrpUGTT9K+QuZqIn45o4Ak5G
   2DI+ZlMWU0sij5XZtZJDkBwv6C40GRAGrOiOgsv0QNyCv4YI9BJt8EarJ
   hwH4bWxhudTmGHXgR/vPYFj1UbYaBowjWxAqG3Q7pfcW+oTiexjkEoUJN
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="345328664"
X-IronPort-AV: E=Sophos;i="6.00,211,1681196400"; 
   d="scan'208";a="345328664"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2023 20:26:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="820096623"
X-IronPort-AV: E=Sophos;i="6.00,211,1681196400"; 
   d="scan'208";a="820096623"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 01 Jun 2023 20:26:04 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q4vQR-00001I-24;
	Fri, 02 Jun 2023 03:26:03 +0000
Date: Fri, 02 Jun 2023 11:25:59 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-qca] BUILD SUCCESS
 52704346f4f8c7a9cd45d9b84232a31ff1a2cae6
Message-ID: <20230602032559.NL9MO%lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230601_202608_772167_CCFEB15C 
X-CRM114-Status: UNSURE (   7.23  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git ath-qca
branch HEAD: 52704346f4f8c7a9cd45d9b84232a31ff1a2cae6  Merge branch 'ath-next' into ath-qca

elapsed time: 907m

configs tested: 95
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r021-20230531   gcc  
arc                  randconfig-r043-20230531   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                  randconfig-r046-20230531   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r036-20230531   gcc  
hexagon              randconfig-r031-20230531   clang
hexagon              randconfig-r041-20230531   clang
hexagon              randconfig-r045-20230531   clang
i386                             allyesconfig   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-i001-20230531   gcc  
i386                 randconfig-i002-20230531   gcc  
i386                 randconfig-i003-20230531   gcc  
i386                 randconfig-i004-20230531   gcc  
i386                 randconfig-i005-20230531   gcc  
i386                 randconfig-i006-20230531   gcc  
i386                 randconfig-i051-20230531   gcc  
i386                 randconfig-i052-20230531   gcc  
i386                 randconfig-i053-20230531   gcc  
i386                 randconfig-i054-20230531   gcc  
i386                 randconfig-i055-20230531   gcc  
i386                 randconfig-i056-20230531   gcc  
i386                 randconfig-i061-20230531   gcc  
i386                 randconfig-i062-20230531   gcc  
i386                 randconfig-i063-20230531   gcc  
i386                 randconfig-i064-20230531   gcc  
i386                 randconfig-i065-20230531   gcc  
i386                 randconfig-i066-20230531   gcc  
i386                 randconfig-r005-20230531   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r024-20230531   gcc  
m68k                             allmodconfig   gcc  
m68k         buildonly-randconfig-r004-20230531   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r013-20230601   gcc  
microblaze           randconfig-r035-20230531   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
nios2        buildonly-randconfig-r006-20230531   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r012-20230601   gcc  
openrisc             randconfig-r025-20230531   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r001-20230531   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc              randconfig-r003-20230531   gcc  
powerpc              randconfig-r014-20230601   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv        buildonly-randconfig-r002-20230531   clang
riscv                               defconfig   gcc  
riscv                randconfig-r042-20230531   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r033-20230531   gcc  
s390                 randconfig-r044-20230531   clang
sh                               allmodconfig   gcc  
sh                   randconfig-r004-20230531   gcc  
sh                   randconfig-r016-20230601   gcc  
sparc        buildonly-randconfig-r003-20230531   gcc  
sparc                               defconfig   gcc  
sparc64              randconfig-r006-20230531   gcc  
sparc64              randconfig-r032-20230531   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-a001-20230531   gcc  
x86_64               randconfig-a002-20230531   gcc  
x86_64               randconfig-a003-20230531   gcc  
x86_64               randconfig-a004-20230531   gcc  
x86_64               randconfig-a005-20230531   gcc  
x86_64               randconfig-a006-20230531   gcc  
x86_64                               rhel-8.3   gcc  
xtensa       buildonly-randconfig-r005-20230531   gcc  
xtensa               randconfig-r002-20230531   gcc  
xtensa               randconfig-r023-20230531   gcc  
xtensa               randconfig-r034-20230531   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
