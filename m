Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A12AC00140
	for <ath10k@archiver.kernel.org>; Tue, 26 Jul 2022 20:26:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=dsAlP0A9FE06Xz2wO5OxnUGLCz/zXz+Cl4v1qH8dUJo=; b=4DL87BE7TA8cAY
	vnPlw6hBfY93/RWgxyUZgoq2Lv+jgKvTbs6INQHxLQylgjPOuV34RpTtw5kn+W2UF68i1K43BJwCp
	4+K9JBwTevJLWVifl25E+vxxwRVPmnBx/EPYlgQYeo44f5AlULR4A1wwJsYfzFFw7UCYQ5OK0EQQL
	4YS68BW2E2NAMslalVRySCGViQyyr5pLdOtd7WWghe4O68X/lALV/go9UTUTKCdxlEY4I0J01aOP2
	OPOv4VFp8yWFeXA166+ZCrl4x3BNjLOrglpOnkM+kAiWldCsQ3ACTqLMO6n8XjzuTvLZSvrvoHSNs
	LPj4O31KPwoEpEWIbdng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGR8B-003Eax-4g; Tue, 26 Jul 2022 20:26:15 +0000
Received: from mga03.intel.com ([134.134.136.65])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGR89-003EXd-0u
	for ath10k@lists.infradead.org; Tue, 26 Jul 2022 20:26:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1658867173; x=1690403173;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=de11TtWujolA1XlsDMFp0hWwT0xxylnf09+PwOOvsno=;
  b=FJG9yd4AKHKWwj6G/ttSRcfeYqAVbsnv6LtHsfVAWQLzVojaW7Jb6coa
   NNz0eDSZaNb6K/is7DJAHFq/4OwFrpqC9ZvGe7b+JKtNJslP7CNk0uocj
   vkMH6z8rcWWjkN6/m/OwHJ3dcN80PQwZXL6vl+BUVTmbxaTXypj0LolFt
   cKk53ash/r/lcYCnXsMAxx3k3UM2hfUx/c3GSN0haJPEpo8WQfiQ5b1bn
   Sf4LBqnqkiX/+DksAh6FkQg+EuEdEfVxkKBIniIBGR+TDsuDOE3nnsS/I
   AZ8ewagu0k+sar0JlKDOLnvwkxHMNttvGzKuZftDFqy3WFwq8SaGeZmKK
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10420"; a="289241707"
X-IronPort-AV: E=Sophos;i="5.93,194,1654585200"; 
   d="scan'208";a="289241707"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2022 13:26:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,194,1654585200"; 
   d="scan'208";a="575645674"
Received: from lkp-server01.sh.intel.com (HELO e0eace57cfef) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 26 Jul 2022 13:26:09 -0700
Received: from kbuild by e0eace57cfef with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oGR84-0007ha-2Y;
	Tue, 26 Jul 2022 20:26:08 +0000
Date: Wed, 27 Jul 2022 04:25:15 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-qca] BUILD SUCCESS
 a838b8b8c293c5d44d5a4fe425e9161603d0bdaa
Message-ID: <62e04dab.gblojdNfFS+mhO3e%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220726_132613_136563_A5A0FB60 
X-CRM114-Status: UNSURE (   4.94  )
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
branch HEAD: a838b8b8c293c5d44d5a4fe425e9161603d0bdaa  Merge branch 'ath-next' into ath-qca

elapsed time: 725m

configs tested: 62
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm                              allyesconfig
ia64                             allmodconfig
arc                               allnoconfig
alpha                             allnoconfig
riscv                             allnoconfig
csky                              allnoconfig
m68k                             allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
powerpc                          allmodconfig
mips                             allyesconfig
powerpc                           allnoconfig
sh                               allmodconfig
i386                                defconfig
i386                             allyesconfig
x86_64                        randconfig-a004
x86_64                        randconfig-a002
x86_64                        randconfig-a006
i386                          randconfig-a001
i386                          randconfig-a003
i386                          randconfig-a005
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64                        randconfig-a015
i386                          randconfig-a014
i386                          randconfig-a012
i386                          randconfig-a016
arc                  randconfig-r043-20220724
riscv                randconfig-r042-20220724
s390                 randconfig-r044-20220724
arc                  randconfig-r043-20220726
s390                 randconfig-r044-20220726
riscv                randconfig-r042-20220726
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
x86_64                           rhel-8.3-syz

clang tested configs:
x86_64                        randconfig-a005
x86_64                        randconfig-a001
x86_64                        randconfig-a003
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a016
x86_64                        randconfig-a012
x86_64                        randconfig-a014
i386                          randconfig-a013
i386                          randconfig-a011
i386                          randconfig-a015
hexagon              randconfig-r041-20220724
hexagon              randconfig-r045-20220724
hexagon              randconfig-r045-20220726
hexagon              randconfig-r041-20220726

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
