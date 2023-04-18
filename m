Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAFD3C77B71
	for <ath10k@archiver.kernel.org>; Tue, 18 Apr 2023 09:07:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=W1AOVt1BElSPAsHlwX0p5YRmyakQs82wdeN4r82tLQc=; b=eDLPO1TVoLPWI6
	LCqXlJI7qM69o8TtjoY6FUsFIY3MHzJd6/dSNCPt5q4WpZAUhcmU8EBWjbQCqhtMwtLPbc+2m/0LE
	nrL8nmGV1cQo4kzdbCAoS1D7Q6aNip6QCtvZ9jJCAmh7sae9r0lUsRkevi8950YgAaqtGtgYpU+T7
	WPL+vbTARabA5v20wmUeL1yGMcMjOOZFlZj7c/mhPk1q8snD4tmJlIgnJqikgx0ImCcZmXkoZE/RD
	rPEGbx2+Osg2v/Ut4md9rimvVCEEEW8lVD5qrPDa12lUYDz4DZ45oP8CryeFqOS+mtd9sGyVn9lvP
	y/c7EGF9nW3uDxH779yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pohJK-001Pap-1S;
	Tue, 18 Apr 2023 09:07:38 +0000
Received: from mga03.intel.com ([134.134.136.65])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pohJI-001PZz-01
	for ath10k@lists.infradead.org;
	Tue, 18 Apr 2023 09:07:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681808856; x=1713344856;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=pZJyg+WAAVLW2SWd2BEMBdN1ILdbbAJBSGt+wT0Kv1A=;
  b=Y1QPkj9H5U53sM3Z9CqJ+XmUcKWVyysq2t40/fEmaCFEYM3u3AfvWGj/
   8l8hjqp7kabq97iQeRG7XHjeXHyqTy/f6m8zJ/fcp4hN5Z6ralBxmVnwL
   IiE4OH6M+VPOfc1mgDihfJhfv5idy4NGhRG/9oViNNUYP11YlEfsROtvP
   ZrM0qPTc4vEGK1WspL5LSKt0i17oCZpcoCb2ffwJGGhcV88DTDB8m/+MH
   bNNgM68Ial2e+eKP1D1FfnKA8D/Kf2SZzYesO5g39WuNycnkOGScGW3A9
   41Fc0iiATR9aIJ4r7tRx3+fGdW7zmXDi+zQ4dS54nGIpwE7MAvyGfJsg3
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10683"; a="347868941"
X-IronPort-AV: E=Sophos;i="5.99,206,1677571200"; 
   d="scan'208";a="347868941"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2023 02:07:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10683"; a="1020738767"
X-IronPort-AV: E=Sophos;i="5.99,206,1677571200"; 
   d="scan'208";a="1020738767"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 18 Apr 2023 02:07:31 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pohJC-000dCY-2S;
	Tue, 18 Apr 2023 09:07:30 +0000
Date: Tue, 18 Apr 2023 17:07:03 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master] BUILD SUCCESS
 27177f16884125650b04ab4ac3641ee1df0e3362
Message-ID: <643e5db7.hB15Hb1cCXz0xGMq%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230418_020736_086324_E6E87AA6 
X-CRM114-Status: UNSURE (   4.59  )
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
branch HEAD: 27177f16884125650b04ab4ac3641ee1df0e3362  Add localversion-wireless-testing-ath

elapsed time: 1324m

configs tested: 42
configs skipped: 3

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
ia64                             allmodconfig   gcc  
ia64                                defconfig   gcc  
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
x86_64                           allyesconfig   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64                               rhel-8.3   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
