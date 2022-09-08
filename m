Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C902ECAAD5
	for <ath10k@archiver.kernel.org>; Thu,  8 Sep 2022 04:13:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=p/Q1FglYBjv/z/FIgGfqSHaNQg/UlQSlV+fgV6bzaG8=; b=dcKX4POlkt/2UW
	kLAh4Lg3XyVhwOLQ3wZDImhUmdANGNRyuSKWBdgosrqxDX2A6c/PCQq4kzlGXIYVqas9IMSlO1qAn
	Ok6aNLK6zjrKOyakXjSsljq2UvkJjZTsMtMes81aKhxi8/s3xyZeX3GXcpdFT1cpJx0wtGjzBPptQ
	x/GDc8wAZ/W5PYp3d3j3mZeEr9GBEsuBNlX21w70DKbmt1FEULoEnfFTQZ+fAlbVx25qFeEvOf3BH
	me5LUgmCpkaFOdhN4p072e8+QkHtWqRlCL02UrdteKLzucOcHilWrdTzE1BO+Tc7llAZDvhdK4NdG
	JhlD+2ydRslkUBAilldw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oW8uX-00Fs13-Fr; Thu, 08 Sep 2022 04:13:05 +0000
Received: from mga01.intel.com ([192.55.52.88])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oW8uU-00FrXJ-Cl
	for ath10k@lists.infradead.org; Thu, 08 Sep 2022 04:13:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662610382; x=1694146382;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=wo0Q23z1KIVWPBlT839ByR+JU0s7cHsmYh4+KUcMFig=;
  b=O8Tn8dI0omn2spQSthDxQVzo8YM3xUGd4FK92d/UcEYPtzfI6xSruto5
   cdje88TZQEkpUVWjq6lyfo+F4hNTdN4jlgex46HeguCVbl2AKchyevN1S
   E5ZID6tmKhmHwtAAcoYHU1f2oAclxjjuJi8TSovgOeCimHgD5LkYi5rg5
   4OwwV5MbXAwz+Wz07/E6P3NdaoFaPo9XBnZMTOQ+wV19Efpce0Qc6p85M
   QVlGf5iHFT/yCJY2ZCtFbd1J8OrQMv+/7sGTQAF/2r3xI1IyNK7BMnhS+
   S2m7MuRaPOycTg18pC4rPV78WEelLbSM/gUl420YjvdSfhH7g1uNJofI0
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10463"; a="323252699"
X-IronPort-AV: E=Sophos;i="5.93,299,1654585200"; 
   d="scan'208";a="323252699"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2022 21:12:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,299,1654585200"; 
   d="scan'208";a="703858723"
Received: from lkp-server02.sh.intel.com (HELO 95dfd251caa2) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 07 Sep 2022 21:12:50 -0700
Received: from kbuild by 95dfd251caa2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oW8uI-0007Lf-0i;
	Thu, 08 Sep 2022 04:12:50 +0000
Date: Thu, 08 Sep 2022 12:12:36 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master] BUILD SUCCESS
 c811f0964c949904f5ecdcfb43ab4ae6f43eb8e9
Message-ID: <63196bb4.rOpM0RI1+il6PtUX%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220907_211302_502778_A8A7F2ED 
X-CRM114-Status: UNSURE (   7.24  )
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
branch HEAD: c811f0964c949904f5ecdcfb43ab4ae6f43eb8e9  Revert "bus: mhi: host: Move IRQ allocation to controller registration phase"

elapsed time: 1172m

configs tested: 57
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arc                  randconfig-r043-20220906
um                             i386_defconfig
riscv                randconfig-r042-20220906
um                           x86_64_defconfig
s390                 randconfig-r044-20220906
i386                                defconfig
x86_64                              defconfig
arm                                 defconfig
x86_64                               rhel-8.3
arm                              allyesconfig
m68k                             allyesconfig
x86_64                        randconfig-a013
x86_64                    rhel-8.3-kselftests
m68k                             allmodconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
arm64                            allyesconfig
i386                          randconfig-a001
x86_64                          rhel-8.3-func
i386                             allyesconfig
mips                             allyesconfig
i386                          randconfig-a003
x86_64                        randconfig-a011
sh                               allmodconfig
arc                              allyesconfig
x86_64                           allyesconfig
x86_64                         rhel-8.3-kunit
alpha                            allyesconfig
i386                          randconfig-a005
x86_64                           rhel-8.3-kvm
x86_64                        randconfig-a015
x86_64                           rhel-8.3-syz
i386                          randconfig-a016
i386                          randconfig-a012
i386                          randconfig-a014
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
ia64                             allmodconfig

clang tested configs:
hexagon              randconfig-r041-20220906
hexagon              randconfig-r045-20220906
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a002
x86_64                        randconfig-a012
i386                          randconfig-a006
i386                          randconfig-a004
i386                          randconfig-a015
riscv                randconfig-r042-20220907
hexagon              randconfig-r041-20220907
hexagon              randconfig-r045-20220907
s390                 randconfig-r044-20220907
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001
i386                          randconfig-a011
i386                          randconfig-a013

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
