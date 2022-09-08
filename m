Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 202E6C38145
	for <ath10k@archiver.kernel.org>; Thu,  8 Sep 2022 03:16:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=rpl4YVqlmUQwmBMJxQf8Gnt6dzlfppVDQnVsNqous4Q=; b=k3JMuLdpJgumJ5
	yOvO3rp1A8xP3kx4GU8SHF0/3Y6cpu4hc5rSkuVNzBv/uwb9BWnVMZOioGwQT5NVblRTTkIS9uGwe
	BByTksq1gTizebaZUa1seKmJMl+6UNYBstqSAFK9vEYo3V3Bf5aiRKQcYAz0lhzIwuoZDUusSfNBl
	Wu5zf+djnxEhyvHjYMlVahvT/BAmbJ5AbN/Inc/NCc+490LV0JhG5vLcvKVe+LPv1+sP4hU5/JuRY
	PIMkslg3iNwfCu8ubh4qgDJ3sVGlVlfxJedOzPYTtO+xhsubOLsy8kH6lqoDBy6b9aaZE+PHSw3qP
	K2xqSJW/ge6loVi2ycGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oW81K-00F2id-5R; Thu, 08 Sep 2022 03:16:02 +0000
Received: from mga11.intel.com ([192.55.52.93])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oW81H-00F2gD-Nq
	for ath10k@lists.infradead.org; Thu, 08 Sep 2022 03:16:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662606959; x=1694142959;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=ht4dQAq7qMtuUP/Wr//RW5HJIlud2VBehjSMoDf9mU8=;
  b=dfx0b2AwY0prFpfKNgVS1hWRu7r/L95ujliQb9ZUvi50H9XBgXW/ZxNE
   yAsZ5plAx2Ukz1jTARQ9qHDgAN7wJH5piMFsgsddlpT/Z/4yEkD7xRLkc
   gz93GNeUGn5AVUKRDqTguJzhRxQ7+vBDnCqFFOWLPTZpU9YOu3wriX4C3
   Mfoa3ddY9VddPt8IhiBHVqfGj/3haxo0rR2DlrJGK8UlaCLxrDcImW6Ok
   QLjEX3jCOVEoL41XjAAvwZ5RvoUbrve/ojLdmIXQetfqV0x3Efl+5tpVt
   74GLBZz7/L5dH79aK3wuOc7d1KQwkgbGsGP4RVgVCWrGeiG2M5JIm2+cA
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10463"; a="294636022"
X-IronPort-AV: E=Sophos;i="5.93,298,1654585200"; 
   d="scan'208";a="294636022"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2022 20:15:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,298,1654585200"; 
   d="scan'208";a="565770444"
Received: from lkp-server02.sh.intel.com (HELO 95dfd251caa2) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 07 Sep 2022 20:15:49 -0700
Received: from kbuild by 95dfd251caa2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oW816-0007JJ-1I;
	Thu, 08 Sep 2022 03:15:48 +0000
Date: Thu, 08 Sep 2022 11:14:48 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master-pending] BUILD SUCCESS
 1a7c73a669f7b039760087723d176cd54dc40c48
Message-ID: <63195e28.bL0wB2OX2Reb1quP%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220907_201559_842680_F51C579A 
X-CRM114-Status: UNSURE (   6.82  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git master-pending
branch HEAD: 1a7c73a669f7b039760087723d176cd54dc40c48  Merge branch 'pending' into master-pending

elapsed time: 1085m

configs tested: 52
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
arc                  randconfig-r043-20220906
riscv                randconfig-r042-20220906
s390                 randconfig-r044-20220906
arc                              allyesconfig
powerpc                           allnoconfig
alpha                            allyesconfig
powerpc                          allmodconfig
mips                             allyesconfig
x86_64                              defconfig
m68k                             allmodconfig
sh                               allmodconfig
m68k                             allyesconfig
x86_64                               rhel-8.3
x86_64                           allyesconfig
i386                                defconfig
i386                             allyesconfig
x86_64                        randconfig-a004
x86_64                        randconfig-a002
x86_64                        randconfig-a006
x86_64                           rhel-8.3-syz
i386                          randconfig-a005
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
arm64                            allyesconfig
arm                                 defconfig
arm                              allyesconfig
x86_64                           rhel-8.3-kvm
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
x86_64                         rhel-8.3-kunit
ia64                             allmodconfig

clang tested configs:
hexagon              randconfig-r041-20220906
hexagon              randconfig-r045-20220906
x86_64                        randconfig-a001
x86_64                        randconfig-a016
i386                          randconfig-a006
riscv                randconfig-r042-20220907
hexagon              randconfig-r041-20220907
hexagon              randconfig-r045-20220907
s390                 randconfig-r044-20220907
x86_64                        randconfig-a012
x86_64                        randconfig-a014
i386                          randconfig-a002
i386                          randconfig-a004
x86_64                        randconfig-a005
x86_64                        randconfig-a003
i386                          randconfig-a011
i386                          randconfig-a013
i386                          randconfig-a015

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
