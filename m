Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F1B1C6FA81
	for <ath10k@archiver.kernel.org>; Fri,  2 Sep 2022 05:49:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZrsDPn10wYQhotzFEe9UV7MQQaiJ0NlMMrNb5aKI7u0=; b=pERkjx8Vn8euZW
	RTf4wYld2yKxpD2715CWPOCEo4idpGe2BO3w5mT17p8JkqkeSbKrKu+6zRyl/w94tY8HW8hvsdfAw
	AoeNCFJW6R3WFKJyayxpa2Em7mNe78u1F+mxYALTRHUw21aVIXpdQoj+AvpRIw4epEzVQp9MEa3nK
	2yCtXH6Xm/CFnxnt8+CndKEsovaS0+CHAzJgJ4X55toaGTz/Zo4pGV29Mp+o5dNTSw9f00kmk5mPY
	tlZvRYqijXMeMSIPuX7kHZo2w5x5gjpIqh1fYz8l6O+ZjLpLVr+rMtOi6Aeleu3E1eklAmwRfvU+O
	pmgebd5rEdMwEa7lMv/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTzYQ-000dAD-JB; Fri, 02 Sep 2022 05:49:22 +0000
Received: from mga02.intel.com ([134.134.136.20])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTzYN-000d7b-5g
	for ath10k@lists.infradead.org; Fri, 02 Sep 2022 05:49:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662097759; x=1693633759;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=5OMyQf1mm0GpPcBDdvAahkQPOAfUk+2tcRhKIGyW55c=;
  b=EjXmtzb7qS5f99y5p4pCm/6jHONvWL2hXBCGbsOx4NR7rK0s0lomSejZ
   TtwFXbaGdsHRkj8o+bXuM1LkY9JiYe7YlZlwMa46nQHwXcN0gcmueyljx
   XbQ24leOSrcC7bzEllD8a93B/R9Zuplw7DUTAuxj8X8IXt8a/Jqmd5N0V
   CLJ7nhmeT1wLTqm2GpOEc/cx216MMvjtHlRjm4ea8N9he6TuAR3C6BxR3
   3IQ8TUMppugEKzzu1viNeHb9jMiFYMkWHg5aGjk6Ni9CvnsEpEdUVhosH
   O8N55W0IWtHB76I+41Y4wRq6yVsn9POGdVGW+3jfxA+sWN0xD+7zOq3on
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10457"; a="282886917"
X-IronPort-AV: E=Sophos;i="5.93,283,1654585200"; 
   d="scan'208";a="282886917"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2022 22:49:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,283,1654585200"; 
   d="scan'208";a="642771245"
Received: from lkp-server02.sh.intel.com (HELO fccc941c3034) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 01 Sep 2022 22:49:03 -0700
Received: from kbuild by fccc941c3034 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oTzY6-0000D9-31;
	Fri, 02 Sep 2022 05:49:02 +0000
Date: Fri, 02 Sep 2022 13:48:57 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-qca] BUILD SUCCESS
 61deb083e3410cad927dc8a3cfb400e531057a15
Message-ID: <63119949.5YSEeWlzW0TB+vES%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220901_224919_285115_B0D1CE58 
X-CRM114-Status: UNSURE (   6.57  )
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
branch HEAD: 61deb083e3410cad927dc8a3cfb400e531057a15  Merge branch 'ath-next' into ath-qca

elapsed time: 779m

configs tested: 53
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                              defconfig
arc                  randconfig-r043-20220901
powerpc                          allmodconfig
mips                             allyesconfig
x86_64                               rhel-8.3
x86_64                        randconfig-a013
powerpc                           allnoconfig
x86_64                        randconfig-a011
i386                          randconfig-a001
sh                               allmodconfig
i386                          randconfig-a003
x86_64                           allyesconfig
i386                                defconfig
i386                          randconfig-a014
x86_64                        randconfig-a015
i386                          randconfig-a005
i386                          randconfig-a012
i386                          randconfig-a016
x86_64                        randconfig-a004
x86_64                        randconfig-a002
i386                             allyesconfig
x86_64                        randconfig-a006
alpha                            allyesconfig
x86_64                          rhel-8.3-func
arc                              allyesconfig
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
x86_64                    rhel-8.3-kselftests
x86_64                           rhel-8.3-syz
m68k                             allyesconfig
m68k                             allmodconfig
arm                                 defconfig
arm                              allyesconfig
arm64                            allyesconfig
ia64                             allmodconfig

clang tested configs:
hexagon              randconfig-r041-20220901
hexagon              randconfig-r045-20220901
riscv                randconfig-r042-20220901
s390                 randconfig-r044-20220901
x86_64                        randconfig-a014
i386                          randconfig-a013
x86_64                        randconfig-a016
i386                          randconfig-a002
x86_64                        randconfig-a012
i386                          randconfig-a011
i386                          randconfig-a006
i386                          randconfig-a004
i386                          randconfig-a015
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a005

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
