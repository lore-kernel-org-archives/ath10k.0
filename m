Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2C3FC07E9D
	for <ath10k@archiver.kernel.org>; Sun, 25 Sep 2022 03:01:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5Zq2BuOZhvDwu+V/PpFgnJHLjmZgsYc/0sH/LGgzcpk=; b=iwkoNOKWnWG0te
	hpzfKt1MA0ii1LOuhh5ihfNuajOKMJYWaCGkbVzXCAMNKEnUl4n86MVym1e6VrRcDs4uXbxfgsYDQ
	3d+ND37vJFERHBKPfEb92ocluI6QsPDiHVl7scZzo2tTRAgYFHcl52Rdw7ksxwOKrrYJJiA91rHyJ
	HYvAiwY9v8e5pc0PVDTrdzVD6GQfVfdsntwiPRSXhw56vOkmF7mrFW8bRkRU4iI3i7t9iwcVvZS5b
	epH4jzMq552WrVhFiXEYGbXtAVOzigDMRZXhVKj+oCoEXpnU5y5TTgS0ZEP7mE7+beVKwlXLBblai
	Liz/g+bxVxgA3MNKBzGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ocHta-00AZ6D-N0; Sun, 25 Sep 2022 03:01:30 +0000
Received: from mga03.intel.com ([134.134.136.65])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ocHtY-00AZ53-6J
	for ath10k@lists.infradead.org; Sun, 25 Sep 2022 03:01:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1664074888; x=1695610888;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=72LNf35jyiKMHoSEMmEmmAxlkhqe5FGgkiv971w33F8=;
  b=Ii1omyvZ18kz2dZIsygN7X0YEKeZk38l8t5Ue9B7bNJpdI/ACfJccH7Z
   ASCmgyIc1ZZbdvqmyUaGgv2hcRLqLK5JIJRYd9/H3PFta57rewhmbh92n
   YGWwfTVSrJz4MB/vDsjMHe9oDGC2M11JC7ygtu8pBxNc3Cp+fJqX4mUDZ
   XR/psCPryW1uubcP+Kzwn33Jl5R7qc+csY8+uCVbpnO+FaJOdITdXMus5
   Zwbg+tH1WuygVClfSPvFDNPEKYOOKuqduGat/8Yhz8x02RRryUEvyePTC
   DbJPKemkwqHMF9Syc1xL+AXUeRI5qdJJpsokbG5gUmTsXSE+1ymsiyCyi
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10480"; a="302285301"
X-IronPort-AV: E=Sophos;i="5.93,343,1654585200"; 
   d="scan'208";a="302285301"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2022 20:01:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,343,1654585200"; 
   d="scan'208";a="865724086"
Received: from lkp-server01.sh.intel.com (HELO c0a60f19fe7e) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 24 Sep 2022 20:01:24 -0700
Received: from kbuild by c0a60f19fe7e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ocHtT-0007JG-1T;
	Sun, 25 Sep 2022 03:01:23 +0000
Date: Sun, 25 Sep 2022 11:01:12 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:pending] BUILD SUCCESS
 1743f8f696425316200daf29e64cfaceb97e91eb
Message-ID: <632fc478.0zjrDERuQrMv18WZ%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220924_200128_303710_5FAC063B 
X-CRM114-Status: UNSURE (   4.54  )
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
branch HEAD: 1743f8f696425316200daf29e64cfaceb97e91eb  wifi: ath11k: Fix deadlock during WoWLAN suspend

elapsed time: 762m

configs tested: 63
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                              defconfig
x86_64                               rhel-8.3
i386                                defconfig
arc                                 defconfig
s390                             allmodconfig
x86_64                           allyesconfig
x86_64                          rhel-8.3-func
arc                  randconfig-r043-20220923
alpha                               defconfig
s390                 randconfig-r044-20220923
s390                                defconfig
riscv                randconfig-r042-20220923
x86_64                    rhel-8.3-kselftests
arm                                 defconfig
s390                             allyesconfig
i386                             allyesconfig
x86_64                        randconfig-a004
x86_64                        randconfig-a002
x86_64                        randconfig-a006
x86_64                        randconfig-a013
m68k                             allmodconfig
arm64                            allyesconfig
arc                              allyesconfig
x86_64                        randconfig-a011
i386                          randconfig-a001
arm                              allyesconfig
alpha                            allyesconfig
i386                          randconfig-a003
powerpc                           allnoconfig
m68k                             allyesconfig
x86_64                        randconfig-a015
powerpc                          allmodconfig
i386                          randconfig-a014
mips                             allyesconfig
i386                          randconfig-a005
i386                          randconfig-a012
sh                               allmodconfig
i386                          randconfig-a016
ia64                             allmodconfig
arc                  randconfig-r043-20220925
riscv                randconfig-r042-20220925
s390                 randconfig-r044-20220925
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm

clang tested configs:
hexagon              randconfig-r041-20220923
hexagon              randconfig-r045-20220923
x86_64                        randconfig-a005
x86_64                        randconfig-a014
x86_64                        randconfig-a001
x86_64                        randconfig-a003
i386                          randconfig-a013
x86_64                        randconfig-a016
x86_64                        randconfig-a012
i386                          randconfig-a002
i386                          randconfig-a011
i386                          randconfig-a006
i386                          randconfig-a004
i386                          randconfig-a015
hexagon              randconfig-r045-20220925
hexagon              randconfig-r041-20220925

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
